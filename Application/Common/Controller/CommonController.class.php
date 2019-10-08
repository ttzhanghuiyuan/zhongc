<?php

namespace Common\Controller;

use Think\Controller;
/*use Common\Library\Word\word;*/

class CommonController extends Controller{

	public function getModel($model = null) {
		$model || $model = $_REQUEST ['_addons'];
		$model || $model = $_REQUEST ['model'];
		$model || $this->error ( '模型名标识必须！' );


		if (is_numeric ( $model )) {
			$model = M ( 'Model' )->find ( $model );
		} else {
			$model = M ( 'Model' )->getByName ( $model );
		}
		
		$this->assign ( 'model', $model );
		return $model;
	}

	public function common_lists($model = null, $page = 0, $templateFile = '', $order='id desc') {
		// 获取模型信息
		is_array ( $model ) || $model = $this->getModel ( $model );
		
		$list_data = $this->_get_model_list ( $model, $page, $order );
		$this->assign ( $list_data );
		
		$this->meta_title = $model ['title'].' '.'列表';
		$templateFile || $templateFile = $model ['template_list'] ? $model ['template_list'] : '';
		$this->display ( $templateFile );
	}

	public function common_del($model = null,$ids = null,$children =null,$isdel=true,$return=false ) {
		is_array ( $model ) || $model = $this->getModel ( $model );

		! empty ( $ids ) || $ids = I ( 'id' );
		! empty ( $ids ) || $ids = I ( 'ids' );
		! empty ( $ids ) || $this->error ( '请选择操作的数据');

		$Model = M ( $model['name'] );/*get_table_name ( $model ['id'] )*/
		$map ['id'] = array (
				'in',
				$ids 
		);

		$result= $isdel ? $Model->where ( $map )->delete () : $Model->where($map)->setField('isdel',1);
		
		if ($result) {

			if(!empty($model['lang_support'])){

				delete_translate($model['lang_flag']);
			}
			

			if(!empty($children)){

				$where[$model['name'].'_id']=array('in',$ids);

				M($children)->where($where)->delete();
			}
			
			if($return){
				return array(
					'status'	=>	true
					);
			}
			else{
				$this->success ( '删除成功' );
			}
		} 
		else {
			if($return){
				return array(
					'status'	=>	false
					);
			}
			else{
				$this->error ( '删除失败' );
			}
		}
	}

	public function common_edit($model = null, $id = 0, $templateFile = '',$jumpUrl = '', $return = false) {
		is_array ( $model ) || $model = $this->getModel ( $model );
		$id || $id = I ( 'id' );

		if (IS_POST) {
			$Model = D ( parse_name ( $model['name'], 1 ) );/*get_table_name ( $model ['id'] )*/
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );

			$jump = U ( 'lists?model=' . $model ['name'] );
			if($jumpUrl != '')
				$jump = $jumpUrl;

			if ($Model->create () && $Model->save () !== false) {
				if($return){
					return array(
						'status'	=>	true,
						'data'		=>	$id
					);
				}else{
					$this->success ( '保存' . ' ' . $model ['title'] . ' ' . '成功', $jump );
				}
			} else {
				if($return){
					return array(
						'status'	=>	false,
						'data'		=>	$Model->getError ()
					);
				}else{
					
					$this->error ( $Model->getError () );
				}
			}
		} else {

			$fix=C('DB_PREFIX');

			$fields = get_model_attribute ( $model ['id'] );
			
			// 获取数据
			$data = M ( $model['name'] )->find ( $id );/*get_table_name ( $model ['id'] )*/
			$data || $this->error ( L('data_not_found') );

			foreach ($fields as &$vo) {
				foreach ($vo as &$_vo) {
					if($_vo['type'] == 'listselect'){
						$_id = $data[$_vo['name']];
						$_tb = $_vo['extra'];

						if($_id && $_tb){
							$extra_data = M($_tb)->find($_id);
							$_vo['extra_data'] = $extra_data;					
						}
					}elseif ($_vo['type']=='pictures') {
						$_vo['pictures'] =  empty($data[$_vo['name']]) ? null : M()->query('select id,path,ext from '.$fix.'picture where id in ('.$data[$_vo['name']].') order by field(id,'.$data[$_vo['name']].')') ;
					}
				}
			}

			if(!empty($model['lang_support'])){

				$lang_assign = edit_lang_assign($model['lang_flag']);

				!empty($lang_assign) && $this->assign('translate',$lang_assign);

			}
			
		
			$this->assign ( 'fields', $fields );
			$this->assign ( 'data', $data );
			$this->meta_title = '编辑' . ' ' . $model ['title'];
			
			$templateFile || $templateFile = $model ['template_edit'] ? $model ['template_edit'] : '';
			$this->display ( $templateFile );
		}
	}

	public function common_add($model = null, $templateFile = '',$jumpUrl = '', $return = false) {
		is_array ( $model ) || $model = $this->getModel ( $model );

		if (IS_POST) {


			$Model = D ( parse_name ( $model['name'], 1 ) );/*get_table_name ( $model ['id'] )*/
			// 获取模型的字段信息
			$Model = $this->checkAttr ( $Model, $model ['id'] );
			if ($Model->create () && $id = $Model->add ()) {

				if(!empty($model['lang_support'])){

					add_translate( array('status'=>	true,'data'=>$id), $model['lang_flag'] );
				}

				if($return){
					return array(
						'status'	=>	true,
						'data'		=>	$id
					);
				}else{
					$jump = U ( 'lists?model=' . $model ['name'] );
					if($jumpUrl != '')
						$jump = $jumpUrl;

					$this->success ( '新增' . ' ' . $model ['title'] . ' ' .'成功', $jump );
				}
			} else {
				if($return){
					return array(
						'status'	=>	false,
						'data'		=>	$Model->getError ()
					);
				}else{
					$this->error ( $Model->getError () );
				}
			}
		} else {
			$fields = get_model_attribute ( $model ['id'] );
			
			$this->assign ( 'fields', $fields );
			$this->meta_title = '新增'. ' ' . $model ['title'];
			
			/*$lang_assign = add_lang_assign($model['lang_flag']);

			!empty($lang_assign) && !empty($model['lang_support']) && $this->assign('translate',$lang_assign);*/

			if(!empty($model['lang_support'])){

				$lang_assign = add_lang_assign($model['lang_flag']);

				!empty($lang_assign) && $this->assign('translate',$lang_assign);

			}


			$templateFile || $templateFile = $model ['template_add'] ? $model ['template_add'] : '';
			$this->display ( $templateFile );
		}
	}

	// 获取模型列表数据
	public function _get_model_list($model = null, $page = 0, $order='id desc',$map = null,$isdel=false) {
		$page || $page = I ( 'p', 1, 'intval' ); // 默认显示第一页数据
		$row = I('row');
		                                         
		// 解析列表规则
		$list_data = $this->_list_grid ( $model );
		$grids = $list_data ['list_grids'];
		$fields = $list_data ['fields'];

		
		// 搜索条件
		if(!$map)
			$map = $this->_search_map ( $model, $fields );

		if($isdel){
			$map['isdel']=0;
		}
		
		if(!$row)
			$row = empty ( $model ['list_row'] ) ? 20 : $model ['list_row'];
		
		// 读取模型数据列表
		if ($model ['extend']) {
			$name = get_table_name ( $model ['id'] );
			$parent = get_table_name ( $model ['extend'] );
			$fix = C ( "DB_PREFIX" );
			
			$key = array_search ( 'id', $fields );
			if (false === $key) {
				array_push ( $fields, "{$fix}{$parent}.id as id" );
			} else {
				$fields [$key] = "{$fix}{$parent}.id as id";
			}
			
			/* 查询记录数 */
			$count = M ( $parent )->join ( "INNER JOIN {$fix}{$name} ON {$fix}{$parent}.id = {$fix}{$name}.id" )->where ( $map )->count ();
			
			// 查询数据
			$data = M ( $parent )->join ( "INNER JOIN {$fix}{$name} ON {$fix}{$parent}.id = {$fix}{$name}.id" )->field ( empty ( $fields ) ? true : $fields )->where ( $map )->order ( "{$fix}{$parent}.{$order}" )->page ( $page, $row )->select ();
			$sql = M ( $parent )->getLastSql();
		} else {
			empty ( $fields ) || in_array ( 'id', $fields ) || array_push ( $fields, 'id' );
			$name = parse_name ($model['name'] , true );/*get_table_name ( $model ['id'] )*/
			$data = M ( $name )->field ( empty ( $fields ) ? true : $fields )->where ( $map )->order ( $order )->page ( $page, $row )->select ();

			/* 查询记录总数 */
			$count = M ( $name )->where ( $map )->count ();
		}
		$list_data ['list_data'] = $data;

		
		// 分页
		if ($count > $row) {
			$page = new \Think\Page ( $count, $row );
			$page->setConfig ( 'theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%' );
			$list_data ['_page'] = $page->show ();
		}
		
		$list_data['count'] = $count;

		return $list_data;
	}

	// 解析列表规则
	public function _list_grid($model) {
		$fields = array ();
		$grids = preg_split ( '/[;\r\n]+/s', htmlspecialchars_decode ( $model ['list_grid'] ) );
		foreach ( $grids as &$value ) {
			// 字段:标题:链接
			$val = explode ( ':', $value );
			// 支持多个字段显示
			$field = explode ( ',', $val [0] );
			$value = array (
					'field' => $field,
					'title' => $val [1] 
			);
			if (preg_match ( '/^([0-9]*)%/', $val [1], $matches )) {
				$value ['title'] = str_replace ( $matches [0], '', $value ['title'] );
				$value ['width'] = $matches [1];
			}
			if (isset ( $val [2] )) {
				// 链接信息
				$value ['href'] = $val [2];
				// 搜索链接信息中的字段信息
				preg_replace_callback ( '/\[([a-z_]+)\]/', function ($match) use(&$fields) {
					$fields [] = $match [1];
				}, $value ['href'] );
			}
			if (strpos ( $val [1], '|' )) {
				// 显示格式定义
				list ( $value ['title'], $value ['format'] ) = explode ( '|', $val [1] );
			}
			foreach ( $field as $val ) {
				$array = explode ( '|', $val );
				$fields [] = $array [0];
			}
		}
		// 过滤重复和错误字段信息
		/*$model_fields = M ( 'attribute' )->where ( 'model_id=' . $model ['id'] )->field ( 'name' )->select ();
		$model_fields = getSubByKey ( $model_fields, 'name' );
		in_array ( 'id', $model_fields ) || array_push ( $model_fields, 'id' );
		$fields = array_intersect ( $fields, $model_fields );*/
		$res ['fields'] = array_unique ( $fields );
		
		$res ['list_grids'] = $grids;
		return $res;
	}

	//联合列表数据
	public function union_list($model = null, $page = 0, $order='id desc',$map = null,$isdel=false){
		
		$page || $page = I ( 'p', 1, 'intval' ); // 默认显示第一页数据
		$row = I('row');
		$fix=C('DB_PREFIX');

		$list_data = $this->union_grid($model);

		$fields=$list_data['fields'];
		
		$name=$model['name'];
				
		// 搜索条件
		if(!$map)
			$map = $this->_search_map ( $model, $fields );

		if($isdel){
			$map['isdel']=0;
		}
        
        if(!empty($model ['union_tables']))
        	$parents_arr = preg_split ( '/[;\r\n]+/s', htmlspecialchars_decode ( $model ['union_tables'] ) );

        if(!empty($parents_arr))
			foreach ($parents_arr as $vo) {
				$parents_arrs[] = $vo;
			}
		
		if(!$row)
			$row = empty ( $model ['list_row'] ) ? 20 : $model ['list_row'];		
	
		/* 查询记录数 */

        $count =M($name)->join ($parents_arrs)->where ( $map )->count ();

        empty ( $fields )  || array_push ( $fields, $fix.$name.'.id' );

        !in_array ( 'id', $fields ) || $key=array_search('id',$fields); unset($fields[$key]);

       
		
		// 查询数据
        $data =M($name)->join ( $parents_arrs)->field ( empty ( $fields ) ? true : $fields )->where ( $map )->order ( "{$fix}{$name}.{$order}" )->page ( $page, $row )->select ();
		$sql = M($name)->getLastSql();
		$list_data['list_data'] = $data;

		// 分页
		if ($count > $row) {
			$page = new \Think\Page ( $count, $row );
			$page->setConfig ( 'theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%' );
			$list_data ['_page'] = $page->show ();
		}

		//dump(M($name)->getlastsql());

		$list_data['count'] = $count;

		return $list_data;
	}

	//解析联合列表规则
	public function union_grid($model) {
		$fields = array ();
		$grids = preg_split ( '/[;\r\n]+/s', htmlspecialchars_decode ( $model ['union_grid'] ) );
		foreach ( $grids as &$value ) {
			// 字段:标题:链接
			$val = explode ( ':', $value );
			// 支持多个字段显示
			$field = explode ( ',', $val [0] );
			$value = array (
					'field' => $field,
					'title' => $val [1] 
			);
			if (preg_match ( '/^([0-9]*)%/', $val [1], $matches )) {
				$value ['title'] = str_replace ( $matches [0], '', $value ['title'] );
				$value ['width'] = $matches [1];
			}
			if (isset ( $val [2] )) {
				// 链接信息
				$value ['href'] = $val [2];
				// 搜索链接信息中的字段信息
				preg_replace_callback ( '/\[([a-z_]+)\]/', function ($match) use(&$fields) {
					$fields [] = $match [1];
				}, $value ['href'] );
			}
			if (strpos ( $val [1], '|' )) {
				// 显示格式定义
				list ( $value ['title'], $value ['format'] ) = explode ( '|', $val [1] );
			}
			foreach ( $field as $val ) {
				$array = explode ( '|', $val );
				$fields [] = $array [0];
			}
		}
		// 过滤重复和错误字段信息
		/*$model_fields = M ( 'attribute' )->where ( 'model_id=' . $model ['id'] )->field ( 'name' )->select ();
		$model_fields = getSubByKey ( $model_fields, 'name' );
		in_array ( 'id', $model_fields ) || array_push ( $model_fields, 'id' );
		$fields = array_intersect ( $fields, $model_fields );*/
		$res ['fields'] = array_unique ( $fields );
		
		$res ['list_grids'] = $grids;
		return $res;
	}

	

	public function _search_map($model, $fields) {
		$map = array ();
		
		// 自定义的条件搜索
		$conditon = session ( 'common_condition' );
		if (! empty ( $conditon )) {
			$map = array_merge ( $map, $conditon );
		}
		session ( 'common_condition', null );
		
		// 关键字搜索 $search_key_arr? $search_key_arr[0]:'title';
		$search_key_arr=explode(':',$model['search_key']);

		//$key = $model ['search_key'] ? $model ['search_key'] : 'title';
		$key = $search_key_arr? $search_key_arr[0]:'title';

		if (isset ( $_REQUEST [$key] ) && !isset($map[$key])) {
			$map [$key] = array (
					'like',
					'%' . htmlspecialchars ( $_REQUEST [$key] ) . '%' 
			);
			unset ( $_REQUEST [$key] );
		}

		if(!empty($model['lang_support'])){

			$map['translate_type'] = $model['lang_flag'];
		}
		
		// 条件搜索
		foreach ( $_REQUEST as $name => $val ) {
			if ( !isset($map[$name]) && in_array ( $name, $fields )) {
				$map [$name] = $val;
			}
		}
		
		return $map;
	}

	protected function checkAttr($Model, $model_id) {
		$fields = get_model_attribute ( $model_id, false );
		$validate = $auto = array ();
		foreach ( $fields as $key => $attr ) {
			if ($attr ['is_must']) { // 必填字段
				$validate [] = array (
						$attr ['name'],
						'require',
						$attr ['title'] . ' ' . '必填'
				);
			}
			// 自动验证规则
			if (! empty ( $attr ['validate_rule'] ) || $attr['validate_type']=='unique') {
				$validate [] = array (
						$attr ['name'],
						$attr ['validate_rule'],
						$attr ['error_info'] ? $attr ['error_info'] : $attr ['title'] . '验证错误',
						0,
						$attr ['validate_type'],
						$attr ['validate_time'] 
				);
			}
			// 自动完成规则
			if (! empty ( $attr ['auto_rule'] )) {
				$auto [] = array (
						$attr ['name'],
						$attr ['auto_rule'],
						$attr ['auto_time'],
						$attr ['auto_type'] 
				);
			} elseif ('checkbox' == $attr ['type']) { // 多选型
				$auto [] = array (
						$attr ['name'],
						'arr2str',
						3,
						'function' 
				);
			} elseif ('datetime' == $attr ['type']) { // 日期型
				$auto [] = array (
						$attr ['name'],
						'strtotime',
						3,
						'function' 
				);
			}elseif ('pictures' == $attr ['type'] ) {
				$auto [] = array (
						$attr ['name'],
						'arr2str',
						3,
						'function' 
				);
			}
		}
		return $Model->validate ( $validate )->auto ( $auto );
	}

	public function toword($orderid,$folder,$filename){

		$modesname='order';
		$sumtotal=0;
		$fix=C('DB_PREFIX');

		$list=M($modesname)
		->join(array(
			'left join '.$fix.'good on '.$fix.'good.id = '.$fix.$modesname.'.good_id',
			'left join '.$fix.'goodcates on '.$fix.'goodcates.id = '.$fix.'good.goodcates_id'
			))
		->field(
			array(
				$fix.$modesname.'.good_name',
				$fix.$modesname.'.package',
				$fix.$modesname.'.good_nums',
				$fix.$modesname.'.weight',
				$fix.$modesname.'.unit_price',
				$fix.$modesname.'.total_price',
				$fix.$modesname.'.priceterm_remark',
				$fix.'goodcates.name as catename',
				)
			)
		->where(array('order_no'=>$orderid))
		->select();

		foreach ($list as &$vo) {
			$vo['good_nums']=intval($vo['good_nums']);
			$vo['weight']=number_format($vo['weight'],2);
			$vo['unit_price']=number_format($vo['unit_price'],2);
			$sumtotal+=floatval($vo['total_price']);
			$vo['total_price']=number_format($vo['total_price'],2);
		}
		unset($vo);

		$order_no=$orderid;
		$priceterm_remark=$list[0]['priceterm_remark'];
		$sumtotal=number_format($sumtotal,2);

		$html=null;
		$company = get_company();
		$src=get_cover($company["seal"],'path');

		$company_name= $company['name'];

		!empty($src) && $src='http://'.$_SERVER ['HTTP_HOST'].__ROOT__.$src;

		foreach ($list as $vo) {
			$html.='<tr>';
			$html.='<td style="padding:8px;border:1px solid #151212;">'.$vo['catename'].'</td>';
			$html.='<td style="padding:8px;border:1px solid #151212;">'.$vo['good_name'].'</td>';
			$html.='<td style="padding:8px;border:1px solid #151212;">'.$vo['package'].'</td>';
			$html.='<td style="padding:8px;border:1px solid #151212;">'.$vo['good_nums'].'</td>';
			$html.='<td style="padding:8px;border:1px solid #151212;">'.$vo['weight'].'</td>';
			$html.='<td style="padding:8px;border:1px solid #151212;">'.$vo['unit_price'].'</td>';
			$html.='<td style="padding:8px;border:1px solid #151212;">'.$vo['total_price'].'</td>';
			$html.='</tr>';
		}

		$eof=<<<EOT
		<body>
		<div style='background:url($src) no-repeat 130px bottom;'>
		<div style=' text-align: center;font-size: 25px;margin-bottom: 5px;'>起点化工有限公司购销合同及送货凭证</div>
		<div style='text-align:right;font-size:18px;font-weight:bold;margin:12px auto;'>NO.<span style='color:#F00;'>$order_no</span></div>
		<div style='text-indent:25px;margin:15px 0px;line-height:28px;'>购货单位（乙方）___________________________________
		向供货单位（甲方）起点化工有限公司购进如下产（商）品，共同遵守如下责任条款。</div>
		<table style='border:1px solid #151212;border-collapse:collapse;width:100%;margin:0 auto;font-size:16px;'>
		<tbody>
		<tr>
		<td style='padding:8px;border:1px solid #151212;'>产品类型</td>
		<td style='padding:8px;border:1px solid #151212;'>产品名称</td>
		<td style='padding:8px;border:1px solid #151212;'>包装规格(kg/桶)</td>
		<td style='padding:8px;border:1px solid #151212;'>数量(桶)</td>
		<td style='padding:8px;border:1px solid #151212;'>重量</td>
		<td style='padding:8px;border:1px solid #151212;'>单价(元/kg)</td>
		<td style='padding:8px;border:1px solid #151212;'>合计(元)</td>
		</tr>
		$html
		<tr>
		<td style='padding:8px;border:1px solid #151212;'>金额合计</td>
		<td colspan='6' style='padding:8px;border:1px solid #151212;text-align:right;'>¥<span style="border-bottom:1px solid #545454;margin-right:25px;">$sumtotal</span></td>
		</tr>
		<tr>
		<td style='padding:8px;border:1px solid #151212;'>收货日期</td>
		<td style='padding:8px;border:1px solid #151212;'></td>
		<td style='padding:8px;border:1px solid #151212;'>付款方式</td>
		<td style='padding:8px;border:1px solid #151212;'></td>
		<td style='padding:8px;border:1px solid #151212;'>付款期限</td>
		<td colspan='2' style='padding:8px;border:1px solid #151212;'>$priceterm_remark</td>
		</tr>
		<tr>
		<td style='padding:8px;border:1px solid #151212;'>备注</td>
		<td colspan='6' style='line-height:28px;padding:8px;border:1px solid #151212;'>
		1、乙方购进甲方以上产（商）品保证在付款期限内付清所购货款项。逾期不付清该货款，甲方有权将逾期金额按日万分之七计收违约金并向乙方收取欠款。<br/>
		2、甲方所供上列产（商）品均是合格产品，乙方如有异议应在收货后七天内提出书面异议。逾期不提出的，视为质量合格。甲乙双方对产品质量约定与条款约定有抵触的，以本条款为准。<br/>
		3、以上合同经甲、乙代表签订生效，必须按期付清货款。如果有争议或纠纷，由甲方所在地人民法院受理起诉。<br/>
		4、供方保留由于原材料价格的波动而调整价格的权利，并在调价前5天通知需方。<br/>
		5、本合同经双方签字后具有法律效力，并作违约诉讼依据。本合同并作收货依据、送货凭证。
		<table style='text-align:center;border:none;margin:0;margin-top:15px;line-height:28px;'>
		<tr>
		<td style='border:none;padding-left:50px;'>甲方（盖章）<br/>供货代表：$company_name                              
		</td>
		<td style='border:none;padding-left:70px;'>乙方（盖章）<br/>收货代表：</td>                              
		</tr>                       
		</table>
		</td>
		</tr>
		</tbody>
		</table>
		<div style='margin:15px auto;'>
		①甲方业务存查(白)②甲方财务存查(红)③乙方财务存查(绿)④随货同行(黄)
		</div>
		</div>
		</body>
EOT;
		/*$word = new word();
		$word->start();
		echo $eof;
		$word->save($folder.$filename);
		header('Content-type: application/word');
		header('Content-Disposition: attachment; filename='.$filename);
		readfile($folder.$filename);
		ob_flush();
		flush();
		exit();*/

		
		Vendor("MPdf.mpdf");
        //实例化mpdf
		$mpdf = new \mPDF('zh-CN/utf-8','A4','','宋体',5,5,15,0); 

        //设置字体,解决中文乱码
		$mpdf->useAdobeCJK = true;

		$mpdf->list_indent_first_level = 0;

		$mpdf->SetDisplayMode('fullpage');

		$mpdf->WriteHTML($eof);

		$mpdf->Output($folder.$filename);

		header('Content-type:application/pdf');
		header('Content-Disposition: attachment; filename='.$filename);
		readfile($folder.$filename);

		exit;
	}


	//批量修改提交
	public function saveAll($saveWhere,&$saveData,$tableName){
		if($saveWhere==null||$tableName==null)
			return false;
        //获取更新的主键id名称
		$key = array_keys($saveWhere)[0];
        //获取更新列表的长度
		$len = count($saveWhere[$key]);
		$flag=true;
		$model = isset($model)?$model:M($tableName);
        //开启事务处理机制
		$model->startTrans();
        //记录更新失败ID
		$error=[];
		for($i=0;$i<$len;$i++){
            //预处理sql语句
			$isRight=$model->where($key.'='.$saveWhere[$key][$i])->setField($saveData[$i]);
			if($isRight==0){
                //将更新失败的记录下来
				$error[]=$i;
				$flag=false;
			}
		}
		if($flag ){

			$model->commit();
			return $saveWhere;
		}elseif(count($error)>0&count($error)<$len){
			$model->rollback();
			for($i=0;$i<count($error);$i++){

                //删除更新失败的ID和Data
				unset($saveWhere[$key][$error[$i]]);
				unset($saveData[$error[$i]]);

			}
            //重新将数组下标进行排序
			$saveWhere[$key]=array_merge($saveWhere[$key]);
			$saveData=array_merge($saveData);

			$this->saveAll($saveWhere,$saveData,$tableName);
			return $saveWhere;
		}
		else{
			$model->rollback();
			return false;
		}
	}

	public function _sql_list($model =null,$page=0, $group=null, $order='id desc',$map=null,$join_arr=null,$field_arr=null){

		$page || $page = I ( 'p', 1, 'intval' ); // 默认显示第一页数据
		$row = I('row');

		$fix=C('DB_PREFIX');
		//$list_data = $list_data = $this->union_grid($model);
		$list_data = $this->union_grid($model);

		$fields=$list_data['fields'];

		if(!$map)
			$map = $this->_search_map ( $model, $fields );

		if(!$row)
			$row = empty ( $model ['list_row'] ) ? 20 : $model ['list_row'];

		//empty ( $fields ) || in_array ( 'id', $fields ) || array_push ( $fields, 'id' );
		empty ( $field_arr )  || array_push ( $field_arr, $fix.$name.'.id' );

        !in_array ( 'id', $field_arr ) || $key=array_search('id',$field_arr); unset($field_arr[$key]);

		$name = parse_name ($model['name'] , true );

		$data = M ( $name )->join ($join_arr)->field ( empty ( $field_arr ) ? true : $field_arr )->where ( $map )->group( empty ( $group ) ? null : $group)->order ( $order )->page ( $page, $row )->select ();

		//dump(M($name)->getlastsql());
		/* 查询记录总数 */
		//$count = M ( $name )->where ( $map )->count ();

		if(!empty($group)){

			$count = M ( $name )->join ($join_arr)->field (array($group,'count(*)'))->where ( $map )->group( empty ( $group ) ? null : $group) ->select ();
        
        	$count = count($count);
		}else{

			$count = M($name) -> where($map) ->count();
		}
		

		$list_data ['list_data'] = $data;

		// 分页
		/*if ($count > $row) {
			$page = new \Think\Page ( $count, $row );
			$page->setConfig ( 'theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%' );
			$list_data ['_page'] = $page->show ();
		}*/
		
		$list_data['count'] = $count;

		//dump($count);

		return $list_data;
	}

	public function _sql_select($model =null,$page=0,$row =10, $group=null, $order='id desc',$map=null,$join_arr=null,$field_arr=null,$func,$ispage=true,$pagetheme='%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%'){

		$page || $page = I ( 'p', 1, 'intval' ); // 默认显示第一页数据
		$row = I('row');

		$fix=C('DB_PREFIX');


		if(!$row)
			$row = empty ( $row ) ? 10 : $row;


		$name = parse_name ($model['name'] , true );

		if(!empty($func)){

			$field_arr = $this->$func($model);

			$field_arr = $field_arr ['fields'];

			// if(!$map)
			// 	$map = $this->_search_map ( $model, $field_arr );
		}
		$data = M ( $name )->join ($join_arr)->field ( empty ( $field_arr ) ? true : $field_arr )->where ( $map )->group( empty ( $group ) ? null : $group)->order ( $order )->page ( $page, $row )->select ();

		/* 查询记录总数 */
		//$count = M ( $name )->where ( $map )->count ();

		if($ispage)
		{
			if(!empty($group)){

				$count = M ( $name )->join ($join_arr)->field (array($group,'count(*)'))->where ( $map )->group( empty ( $group ) ? null : $group) ->select ();
	        
	        	$count = count($count);
	        	
			}else{

				$count = M($name) -> where($map) ->count();
			}
		}

		$list_data ['list_data'] = $data;

		// 分页
		if($ispage){
			if ($count > $row) {
				$page = new \Think\Page ( $count, $row );
				$page->setConfig ( 'theme', $pagetheme );
				$list_data ['_page'] = $page->show ();
			}
		}
		
		
		$list_data['count'] = $count;

		//dump($count);

		return $list_data;
	}


	/*************************************弹出框列表数据**************************/
	public function _get_pop_list($model = null, $page = 0, $order='id desc',$map = null,$isdel=false) {

		$page || $page = I ( 'p', 1, 'intval' ); // 默认显示第一页数据
		$row = I('row');
		$fix=C('DB_PREFIX');

		$list_data = $this->_pop_list_grid($model);

		$fields=$list_data['fields'];
		
		$name=$model['name'];
				
		// 搜索条件
		if(!$map)
			$map = $this->_search_map ( $model, $fields );

		if($isdel){
			$map['isdel']=0;
		}
        
        if(!empty($model ['pop_list_tables']))
        	$parents_arr = preg_split ( '/[;\r\n]+/s', htmlspecialchars_decode ( $model ['pop_list_tables'] ) );
        
        //dump($parents_arr);

        if(!empty($parents_arr))
			foreach ($parents_arr as $vo) {
				$parents_arrs[] = $vo;
			}
		/*$parents_arrs = array_unique($parents_arrs);
		dump($parents_arrs);*/
		if(!$row)
			$row = empty ( $model ['list_row'] ) ? 20 : $model ['list_row'];		
	
		/* 查询记录数 */

        $count =M($name)->join ($parents_arrs)->where ( $map )->count ();

        empty ( $fields )  || array_push ( $fields, $fix.$name.'.id' );

        !in_array ( 'id', $fields ) || $key=array_search('id',$fields); unset($fields[$key]);

        //dump($fields);
		//dump($parents_arrs);
		// 查询数据
        $data =M($name)->join ( $parents_arrs)->field ( empty ( $fields ) ? true : $fields )->where ( $map )->order ( "{$fix}{$name}.{$order}" )->page ( $page, $row )->select ();
		
		//dump(M($name)->getlastsql());

		$list_data['list_data'] = $data;

		// 分页
		if ($count > $row) {
			$page = new \Think\Page ( $count, $row );
			$page->setConfig ( 'theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%' );
			$list_data ['_page'] = $page->show ();
		}

		//dump(M($name)->getlastsql());

		$list_data['count'] = $count;

		return $list_data;
	}

	// 解析列表规则
	public function _pop_list_grid($model) {
		$fields = array ();
		$grids = preg_split ( '/[;\r\n]+/s', htmlspecialchars_decode ( $model ['pop_list_grid'] ) );
		foreach ( $grids as &$value ) {
			// 字段:标题:链接
			$val = explode ( ':', $value );
			// 支持多个字段显示
			$field = explode ( ',', $val [0] );
			$value = array (
					'field' => $field,
					'title' => $val [1] 
			);
			if (preg_match ( '/^([0-9]*)%/', $val [1], $matches )) {
				$value ['title'] = str_replace ( $matches [0], '', $value ['title'] );
				$value ['width'] = $matches [1];
			}
			if (isset ( $val [2] )) {
				// 链接信息
				$value ['href'] = $val [2];
				// 搜索链接信息中的字段信息
				preg_replace_callback ( '/\[([a-z_]+)\]/', function ($match) use(&$fields) {
					$fields [] = $match [1];
				}, $value ['href'] );
			}
			if (strpos ( $val [1], '|' )) {
				// 显示格式定义
				list ( $value ['title'], $value ['format'] ) = explode ( '|', $val [1] );
			}
			foreach ( $field as $val ) {
				$array = explode ( '|', $val );
				$fields [] = $array [0];
			}
		}
		// 过滤重复和错误字段信息
		/*$model_fields = M ( 'attribute' )->where ( 'model_id=' . $model ['id'] )->field ( 'name' )->select ();
		$model_fields = getSubByKey ( $model_fields, 'name' );
		in_array ( 'id', $model_fields ) || array_push ( $model_fields, 'id' );
		$fields = array_intersect ( $fields, $model_fields );*/
		$res ['fields'] = array_unique ( $fields );
		
		$res ['list_grids'] = $grids;
		return $res;
	}

	//联合列表数据
	public function _pop_union_list($model = null, $page = 0, $order='id desc',$map = null,$isdel=false){
		
		$page || $page = I ( 'p', 1, 'intval' ); // 默认显示第一页数据
		$row = I('row');
		$fix=C('DB_PREFIX');

		$list_data = $this->_pop_union_grid($model);

		$fields=$list_data['fields'];
		
		$name=$model['name'];
				
		// 搜索条件
		if(!$map)
			$map = $this->_search_map ( $model, $fields );

		if($isdel){
			$map['isdel']=0;
		}
        
        if(!empty($model ['pop_union_tables']))
        	$parents_arr = preg_split ( '/[;\r\n]+/s', htmlspecialchars_decode ( $model ['pop_union_tables'] ) );
        
        //dump($parents_arr);

        if(!empty($parents_arr))
			foreach ($parents_arr as $vo) {
				$parents_arrs[] = $vo;
			}
		/*$parents_arrs = array_unique($parents_arrs);
		dump($parents_arrs);*/
		if(!$row)
			$row = empty ( $model ['list_row'] ) ? 20 : $model ['list_row'];		
	
		/* 查询记录数 */

        $count =M($name)->join ($parents_arrs)->where ( $map )->count ();

        empty ( $fields )  || array_push ( $fields, $fix.$name.'.id' );

        !in_array ( 'id', $fields ) || $key=array_search('id',$fields); unset($fields[$key]);

        //dump($fields);
		//dump($parents_arrs);
		// 查询数据
        $data =M($name)->join ( $parents_arrs)->field ( empty ( $fields ) ? true : $fields )->where ( $map )->order ( "{$fix}{$name}.{$order}" )->page ( $page, $row )->select ();
		
		//dump(M($name)->getlastsql());

		$list_data['list_data'] = $data;

		// 分页
		if ($count > $row) {
			$page = new \Think\Page ( $count, $row );
			$page->setConfig ( 'theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%' );
			$list_data ['_page'] = $page->show ();
		}

		//dump(M($name)->getlastsql());

		$list_data['count'] = $count;

		return $list_data;
	}

	//解析联合列表规则
	public function _pop_union_grid($model) {
		$fields = array ();
		$grids = preg_split ( '/[;\r\n]+/s', htmlspecialchars_decode ( $model ['pop_union_grid'] ) );
		foreach ( $grids as &$value ) {
			// 字段:标题:链接
			$val = explode ( ':', $value );
			// 支持多个字段显示
			$field = explode ( ',', $val [0] );
			$value = array (
					'field' => $field,
					'title' => $val [1] 
			);
			if (preg_match ( '/^([0-9]*)%/', $val [1], $matches )) {
				$value ['title'] = str_replace ( $matches [0], '', $value ['title'] );
				$value ['width'] = $matches [1];
			}
			if (isset ( $val [2] )) {
				// 链接信息
				$value ['href'] = $val [2];
				// 搜索链接信息中的字段信息
				preg_replace_callback ( '/\[([a-z_]+)\]/', function ($match) use(&$fields) {
					$fields [] = $match [1];
				}, $value ['href'] );
			}
			if (strpos ( $val [1], '|' )) {
				// 显示格式定义
				list ( $value ['title'], $value ['format'] ) = explode ( '|', $val [1] );
			}
			foreach ( $field as $val ) {
				$array = explode ( '|', $val );
				$fields [] = $array [0];
			}
		}
		// 过滤重复和错误字段信息
		/*$model_fields = M ( 'attribute' )->where ( 'model_id=' . $model ['id'] )->field ( 'name' )->select ();
		$model_fields = getSubByKey ( $model_fields, 'name' );
		in_array ( 'id', $model_fields ) || array_push ( $model_fields, 'id' );
		$fields = array_intersect ( $fields, $model_fields );*/
		$res ['fields'] = array_unique ( $fields );
		
		$res ['list_grids'] = $grids;
		return $res;
	}

	/***********************弹出列表数据结束*****************************************/

	/***********************PHPexcel start*************************************************/
	//导入excel
	public function importExcel($filename, $exts = 'xls') 
    { 

    	//$filename="./Public/1.xls";
	    //导入PHPExcel类库，因为PHPExcel没有用命名空间，只能inport导入 
	    import("Org.Util.PHPExcel"); 
	    //创建PHPExcel对象，注意，不能少了\ 
	    $PHPExcel = new \PHPExcel(); 
	    //如果excel文件后缀名为.xls，导入这个类 
	    if ($exts == 'xls') { 
	        import("Org.Util.PHPExcel.Reader.Excel5"); 
	        $PHPReader = new \PHPExcel_Reader_Excel5(); 
	    } else if ($exts == 'xlsx') { 
	        import("Org.Util.PHPExcel.Reader.Excel2007"); 
	        $PHPReader = new \PHPExcel_Reader_Excel2007(); 
	    } 
	    //载入文件 
	    $PHPExcel = $PHPReader->load($filename); 
	    //获取表中的第一个工作表，如果要获取第二个，把0改为1，依次类推 
	    $currentSheet = $PHPExcel->getSheet(0); 
	    //获取总列数 
	    $allColumn = $currentSheet->getHighestColumn(); 
	    //获取总行数 
	    $allRow = $currentSheet->getHighestRow(); 

	    $row = 0;
	    //循环获取表中的数据，$currentRow表示当前行，从哪行开始读取数据，索引值从0开始 
	    for ($currentRow = 1; $currentRow <= $allRow; $currentRow++) { 
	    	$col =0;
	        //从哪列开始，A表示第一列 
	        for ($currentColumn = 'A'; $currentColumn <= $allColumn; $currentColumn++) { 
	            //数据坐标 
	            $address = $currentColumn . $currentRow; 
	            //读取到的数据，保存到数组$arr中 
	            $cell = $currentSheet->getCell($address)->getValue(); 

				$data[$row][$col] = (string)$cell;

	            $col++;
	        } 

	        $row++;
	    } 
	    //$this->save_import($data); 
	    //dump($data);
	    return $data;
	}
	
	//导出excel
	public function exportExcel($data, $savefile = null, $title = null, $sheetname = 'sheet1') { 
    	
    	import("Org.Util.PHPExcel"); 
    	//import("Org.Util.PHPExcel.Cell.DataType.php");
    	//import('Org.Util.PHPexcel.Style.php');//PHPExcel\Style\NumberFormat.php
  		//import("Org.Util.PHPExcel.Writer.Excel5");
		// import("Org.Util.PHPExcel.IOFactory.php");
    	//若没有指定文件名则为当前时间戳 
    	if (is_null($savefile)) { 
    		$savefile = time(); 
    	} 
    	$savefile = $savefile.".xls";
    	//若指字了excel表头，则把表单追加到正文内容前面去 
    	if (is_array($title)) { 
    		array_unshift($data, $title); 
    	} 
    	$objPHPExcel = new \PHPExcel(); 
    	//Excel内容 
    	$head_num = count($data); 

    	foreach ($data as $k => $v) { 

    		$obj = $objPHPExcel->setActiveSheetIndex(0); 
	        $row = $k + 1; //行 
	        $nn = 0; 
	        foreach ($v as $vv) {

	            $col = chr(65 + $nn); //列 
	            //$obj->setCellValue($col . $row, "".$vv."" ); //列,行,值 
	            $obj->setCellValueExplicit($col . $row, $vv,\PHPExcel_Cell_DataType::TYPE_STRING);
	            $nn++; 
	        } 
	    } 
	    //设置列头标题 
	    for ($i = 0; $i < $head_num - 1; $i++) { 
	    	$alpha = chr(65 + $i); 

	    	//$objPHPExcel->getActiveSheet()->getStyle($colname)->getNumberFormat()->setFormatCode("@");
	        $objPHPExcel->getActiveSheet()->getColumnDimension($alpha)->setAutoSize(true); //单元宽度自适应  
	        $objPHPExcel->getActiveSheet()->getStyle($alpha . '1')->getFont()->setName("Candara");  //设置字体 
	        $objPHPExcel->getActiveSheet()->getStyle($alpha . '1')->getFont()->setSize(12);  //设置大小 
	        // $objPHPExcel->getActiveSheet()->getStyle($alpha . '1')->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_BLACK); //设置颜色 
	        // $objPHPExcel->getActiveSheet()->getStyle($alpha . '1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER); //水平居中 
	        // $objPHPExcel->getActiveSheet()->getStyle($alpha . '1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER); //垂直居中 
	        $objPHPExcel->getActiveSheet()->getStyle($alpha . '1')->getFont()->setBold(true); //加粗 
	    } 

	    	$objPHPExcel->setActiveSheetIndex(0);
	    	ob_end_clean();
	    	header('Content-Type: application/vnd.ms-excel');
			header("Content-Disposition: attachment;filename=\"$savefile\"");
	    	if (strpos($_SERVER['HTTP_USER_AGENT'], "MSIE") !== FALSE)  
	        {  
	            //header('Content-Type: "'.$mime.'"');  
	            //header('Content-Disposition: attachment; filename="'.$filename.'"');  
	            header('Expires: 0');  
	            header('Cache-Control: must-revalidate, post-check=0, pre-check=0');  
	            header("Content-Transfer-Encoding: binary");  
	            header('Pragma: public');  
	            header("Content-Length: ".strlen($data));  
	        }  
	        else  
	        {  
	            //header('Content-Type: "'.$mime.'"');  
	            //header('Content-Disposition: attachment; filename="'.$filename.'"');  
	            header("Content-Transfer-Encoding: binary");  
	            header('Expires: 0');  
	            header('Pragma: no-cache');  
	            //header("Content-Length: ".strlen($data));  
	        }  
		    
			//header('Cache-Control: max-age=0');

			/*header('Cache-Control: no-cache, no-store, max-age=0, must-revalidate');  
			header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past  
			header('Pragma: no-cache'); */ 

			/*header("Expires", "0");  
			header("Pragma", "public");  
			header("Cache-Control", "must-revalidate, post-check=0, pre-check=0");  
			header("Cache-Control", "public"); */

			/*header("Content-Transfer-Encoding","binary"); 
			header("Cache-Control", "must-revalidate, post-check=0, pre-check=0");  
			header("Pragma", "public"); */  

		  	$objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
		    $objWriter->save('php://output'); //文件通过浏览器下载
		    exit;
	}

	/***********************PHPexcel  end*************************************************/

}