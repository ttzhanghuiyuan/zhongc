<?php

namespace Home\Controller;/*UcenterController*/

class MemberController extends UcenterController {

	public function index(){
		$this->display();
	}

	public function orders(){

		$fix=C('DB_PREFIX');

		$mod=I('mod',0,'intval');

		$map['user_id']=session('member_auth.uid');

		/*if(isset($_REQUEST['keyword'])){

			$key=$_REQUEST['keyword'];

			$map['_string']=$fix."order.order_no like '%".$key."%' OR ".$fix."order.good_name like '%".
			
			$key."%' ";
		}*/

		switch ($mod) {
			case 0:
				break;
			case 1:
				$map['order_status']=array('neq',2);
				$map['audit_status']=0;
				break;
			case 2:
				$map['order_status']=array('neq',2);
				$map['audit_status']=1;
				$map['payment_status']=0;
				break;

			case 3:
				//$map['audit_status']=1;
				//$map['payment_status']=1;
				$map['order_status']=array('neq',2);
				$map['express_status']= array(array('EXP','IS NULL'),0,"or");
				break;
			case 4:
				//$map['audit_status']=1;
				//$map['payment_status']=1;
				$map['order_status']=array('neq',2);
				$map['express_status']=array(array('EXP','IS not NULL'),array('neq',0),"and");
				break;
			case 5:
				$map['audit_status']=1;
				$map['payment_status']=1;
				$map['express_status']=array(array('EXP','IS not NULL'),array('neq',0),"and");
				$map['order_status']=1;
				break;
			case 6:
				$map['order_status']=2;
				break;

			default:
				
				break;
		}

		$startdate = $_REQUEST['startdate'];
		$enddate = $_REQUEST['enddate'];

		if( !empty($startdate) && !empty($enddate) ){

			$map['order_date']= array( array('egt',strtotime($startdate) ),array('elt',strtotime($enddate)) );

			$this->assign('startdate',$startdate);
			$this->assign('enddate',$enddate);
		}
		else if( !empty($startdate) ){
			$map['order_date']= array( array('egt',strtotime($startdate) ) );
			$this->assign('startdate',$startdate);
		}
		else if( !empty($enddate) ){
			$map['order_date']= array( array('elt',strtotime($enddate) ) );
			$this->assign('enddate',$enddate);
		}

		/*$model = $this->getModel('order');

		$list_data = $this->_get_front_join_list($model,0,'hg_order.order_date desc',$map,$parent_arr,$field);

		foreach($list_data['list_data'] as &$vo) {
			$vo['order_date']=time_format($vo['order_date'],'Y-m-d H:m:s');
			$vo['audit_status'] = $vo['audit_status']==0 ? "未审核":($vo['audit_status']==1 ? "通过" : "未通过");
			$vo['weight']=number_format($vo['weight'],2);
			$vo['unit_price']=number_format($vo['unit_price'],2);
			$vo['total_price']=number_format($vo['total_price'],2);
		}
		unset($vo);*/


		$list_data=$this->_get_front_join_list($this->getModel('order'),0,'hg_order.order_date desc',$map,
				array(
					'left join '.$fix.'express express on express.id = '.$fix.'order.express_id',
					'left join '.$fix.'good good on good.id = '.$fix.'order.good_id',
					'left join '.$fix.'goodcates goodcates on goodcates.id = good.goodcates_id',
					'left join '.$fix.'picture picture on picture.id= good.picture_id'
				),
				array(
					'picture.path',
					'good.good_name',
					'goodcates.name',
					$fix.'order.id',
					$fix.'order.order_date',
					$fix.'order.order_no',
					$fix.'order.package',
					$fix.'order.express_id',
					$fix.'order.good_nums',
					$fix.'order.weight',
					$fix.'order.unit_price',
					$fix.'order.total_price',
					$fix.'order.receipt_status',
					$fix.'order.audit_status',//订单审核状态
					$fix.'order.order_contract',
					$fix.'order.order_status',//订单完成状态
					$fix.'order.payment_status',//订单支付状态
					'express.express_status'//订单发货状态
				)
		);

		foreach ($list_data['list_data'] as $key => $value) {
			$list[$value['order_no']]['order_no'] = $value['order_no'];
			$list[$value['order_no']]['order_date']=$value['order_date'];
			$list[$value['order_no']]['key'][] = $value;
			$list[$value['order_no']]['count'] = count($list[$value['order_no']]['key']);
		}

		//dump($list);
		$this->assign('list',$list);
		unset($list_data);
		unset($list);
		$this->assign('mod',$mod);

		$this->display();
	}

	public function ordercontract(){

		$order_no=I('orderid','strip_tags');
		$filename =  iconv("UTF-8","GB2312",'起点化工有限公司购销合同及送货凭证').$order_no.'.pdf';
		if(file_exists('./Uploads/'.$filename)){
			header('Content-type: application/pdf');
			header('Content-Disposition: attachment; filename='.$filename);
			readfile('./Uploads/'.$filename);
			exit();
		}
		else{
			$this->toword($order_no,'./Uploads/',$filename);
		}
		
	}

	public function contract(){

		$orderid || $orderid=I('orderid','strip_tags');

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

		//$order_no=$orderid;
		//$priceterm_remark=$list[0]['priceterm_remark'];
		//$sumtotal=number_format($sumtotal,2);

		$company = get_company();

		$this->assign('list',$list);
		$this->assign('sumtotal',number_format($sumtotal,2) );
		$this->assign('company_name',$company['name']);
		$this->assign('order_no',$orderid);
		$this->assign('priceterm_remark',$list[0]['priceterm_remark']);
		unset($list);

		$this->display();
	}

	public function setstatus(){

		$ordercontract=I('order_contract');
		empty($ordercontract) && $this->error('请上传合同');

		$order_no=I('order_no');
		empty($order_no) && $this->error('订单出错');

		$result=M('Order')->where('order_no='.$order_no)->save( array('order_contract'=>$ordercontract ));
		if($result !==false){
			$this->success('合同上传成功',U('orders', array('mod'=>0) ));
		}else{
			$this->error('发送未知错误');
		}
	}

	public function setcancel(){
		$order_no = I('orderid');
		empty($order_no) && $this->error('请选择订单');

		$result = M('Order')->where('order_no='.$order_no)->save( array( 'order_status'=> 2,'finish_date'=>time() ) );

		if($result!==false){
			$list = M('Order')->where('order_no='.$order_no)->select();
			foreach ($list as $key => $value) {

				$res[$value['good_id']] += $value['good_nums'];

				$datas[$value['good_id']] = array(
					'salescount' => array( 'exp','salescount-'.$res[$value['good_id']] ),
					'stocksize' => array( 'exp','stocksize+'.$res[$value['good_id']] ),
				);
			}
			$this->saveAll( array('id'=>array_keys($datas)) ,array_values($datas),'good');

			$this->success('订单成功取消');
		}else{
			$this->error('操作出现未知错误');
		}
	}

	public function setrecv(){
		$order_no = I('orderid');

		$result = M('Order')->where('order_no='.$order_no)->save(array('receipt_status'=>1,'receipt_date'=>time()));

		if($result!==false){
			$this->success('操作成功');
		}else{
			$this->error('操作出现未知错误');
		}
	}

	public function addorder(){

		if(IS_POST){
			$fix=C('DB_PREFIX');
			$addr = M('User')
			->join(
				array(
					'left join '.$fix.'shippingaddr addr on addr.user_id = '.$fix.'user.id'
					)
				)
			->field(
				array(
					$fix.'user.company_name',
					$fix.'user.linkman',
					$fix.'user.addr',
					$fix.'user.mobile',
					'addr.recipients',
					'addr.recipient_phone',
					'addr.address',
					'addr.zip_code'
					)
				)
			->where( array( $fix.'user.id'=>session('member_auth.uid') ,'addr.isdefault'=>1 ))
			->find();

			/*$order_no = I('order_no');
			$order_date = I('order_date');*/
			$num = I('num');
			$good_id = I('good_id');
			$good_name = I('good_name');
			$package = I('package');
			$weight = I('weight');
			$unit_price = I('unit_price');
			$priceterms = I('priceterms');

			for ($i=0,$j=count($num); $i < $j; $i++) { 
				$data[] = array(
					'order_no'   => I('order_no'), //$order_no,
					'good_id'    => $good_id[$i],
					'good_name'  => $good_name[$i],
					'package'    => $package[$i],
					'good_nums'  => $num[$i],
					'weight'     => $weight[$i],
					'unit_price' => $unit_price[$i],
					'priceterms' => $priceterms[$i],
					'total_price'=> $num[$i]*$unit_price[$i],
					'user_id'	 => session('member_auth.uid'),
					'company_name' => $addr['company_name'],
					'linkman'    => $addr['linkman'],
					'addr'       => $addr['addr'],
					'mobile'     => $addr['mobile'],
					'order_date' => I('order_date'),
					'payment_status' => 0,
					'audit_status' => 0,
					'order_status' => 0,
					'recipients' => $addr['recipients'],
					'recipient_phone' => $addr['recipient_phone'],
					'address'    => $addr['address'],
					'zip_code'  => $addr['zip_code'],
					'isdel' => 0
				);
				$res[$good_id[$i]] += $num[$i];

				$datas[$good_id[$i]] = array(
					'salescount' => array( 'exp','salescount+'.$res[$good_id[$i]] ),
					'stocksize' => array( 'exp','stocksize-'.$res[$good_id[$i]] ),
				);
			}

			if(M('Order')->addAll($data)){

				/*$this->assign('is_commit',1);
				$this->assign('total_price',number_format($total_price,2) );
				$this->assign('order_no', session('order_params.order_no'));
				$where['id']=array_keys($datas);*/

				$this->saveAll(array('id'=>array_keys($datas)),array_values($datas),'good');

				unset($datas);
				unset($data);

				/*M('cart')->where(array('id' => array('in',session('ids'))))->delete();

				cookie('Cart_num',M('cart')->where(array('user_id'=>session('member_auth.uid')))->count());

				session('ids',null);*/
				$this->success('订单提交成功',U('orders',array('mod'=>0)));

			}
			else{
				//$this->assign('is_commit',0);
				$this->error('发生未知错误');
			}

			exit();
		}

		$fix=C('DB_PREFIX');
		$this->assign(
			'list',
			M('Order')
			->join(
				array(
					'left join '.$fix.'good good on good.id = '.$fix.'order.good_id',
					'left join '.$fix.'goodcates goodcates on goodcates.id = good.goodcates_id'
					)
				)
			->field(
				array(
					'good.stocksize',
					'good.good_name',
					'goodcates.name',
					$fix.'order.id',
					$fix.'order.good_id',
					//$fix.'order.good_name',
					$fix.'order.package',
					$fix.'order.weight',
					$fix.'order.unit_price',
					$fix.'order.priceterms'
					)
				)
			->where( array( 'order_no' => I('orderid') ) )
			->select()
		);
		
		$this->assign(
			'addr',
			M('shippingaddr')
			->where( array( 'user_id'=>session('member_auth.uid') ,'isdefault'=>1 ))
			->find()
		);
		$this->assign('order_params',array(
			'order_no' => build_order_no(),
			'order_date' => NOW_TIME
		));
		$this->display();
	}

	public function info(){
		if(IS_POST){

			$result = $this->common_edit('User',0,'','',true);

			if($result['status']){

				$this->success ( '保存成功');

			}else{
				$this->error ( $result['data'] );
			}
		}
		else{

			$info=M('User')->where('id='.session('member_auth.uid'))->find();
			$this->assign('info',$info);
			$this->display();
		}
	}

	public function updatepwd(){

		if(IS_POST){
			
			empty(I('post.old')) && $this->error('请输入原密码');

			$password = I('post.password');
			empty($password) && $this->error('请输入新密码');
			
			$repassword = I('post.repassword');
			empty($repassword) && $this->error('请输入确认密码');

			if($password !== $repassword){
				$this->error('您输入的新密码与确认密码不一致');
			}

			if(!D('User')->verifyMember( I('id'), I('old') )){
				$this->error('原密码输入错误');
			}

			$result = $this->common_edit('user',0,null,'',true);

			if($result['status']){
				$this->success('修改密码成功！');
			}else{
				$this->error($result['data']);
			}
		}
		else{
			$this->display();
		}

	}

	public function addrs(){

		$model = $this->getModel('shippingaddr');

		$list_data=$this->_get_front_join_list($model, 0, 'hg_shippingaddr.isdefault desc',array( 'user_id' =>session('member_auth.uid') ) );

		$this->assign($list_data);

		$this->display();
	}

	public function editadr(){
		if(IS_POST){

			$result = $this->common_edit('shippingaddr',0,null,'',true);

			if($result['status']){

				$jump = U('Member/addrs');

				if(!empty(I('isdefault'))){
					
					M('shippingaddr')
					->where(array(
						"user_id" => session('member_auth.uid'),
						'id' =>array('neq',$result['data'])
					))
					->setField('isdefault',0);
				}
				

				$this->success ( '保存成功' , $jump );


			}else{
				$this->error ( $result['data'] );
			}

		}
		else{

			$id || $id = I ( 'id' ,'intval');

			$info=M('shippingaddr')->where(array('id'=>$id))->find();

			$this->assign('info',$info);

			$this->display();
		}
	}

	public function addAddr(){
		if(IS_POST){

			$result =$this->common_add("shippingaddr",null,'',true);

			if($result['status']){

				$jump = U('Member/addrs');

				if(!empty(I('isdefault'))){
					
					M('shippingaddr')
					->where(array(
						"user_id" => session('member_auth.uid'),
						'id' =>array('neq',$result['data'])
					))/*'user_id='.session('member_auth.uid')*/
					->setField('isdefault',0);

					/*M('shippingaddr')
					->where('id='.$result['data'])
					->setField('isdefault',1);*/
				}

				$this->success ( '新增成功' , $jump );

			}else{
				$this->error ( $result['data'] );
			}
		}
		else{
			$this->display('editadr');
		}
	}

	public function delAddr(){
		$this->common_del("shippingaddr");
	}

	public function notices(){

		$map['category_id']=44;

		$map['hg_document.status']=1;

		$model = $this->getModel("document");

		$list_data = $this->_get_front_list($model,0,'create_time desc',$map);

		foreach($list_data['list_data'] as &$vo) {
			$vo['create_time']=time_format($vo['create_time'],'Y-m-d H:m');
			/*$vo['description']=empty($vo['description']) ? '' : msubstr($vo['description'],0,110,"utf-8",false);*/
		}
		unset($vo);

		$this->assign($list_data);

		$this->display();
	}

	public function samples(){

		$fix=C('DB_PREFIX');

		/*$parent_arr=array(
			'left join '.$fix.'good good on good.id = '.$fix.'sample.good_id',
			'left join '.$fix.'goodcates goodcates on goodcates.id = good.goodcates_id'
			);

		$field=array(
				'good.good_name',
				'goodcates.name',
				$fix.'sample.express_name',
				$fix.'sample.express_no',
				$fix.'sample.sample_date'
				);*/

		$map['user_id']=session('member_auth.uid');

		//$model = $this->getModel('sample');
		//$list_data = $this->_get_front_join_list($model,0,'hg_sample.sample_date desc',$map,$parent_arr,$field);
		//dump($list_data);
		$this->assign(
			$this->_get_front_join_list($this->getModel('sample'),0,'hg_sample.sample_date desc',$map,
				array(
					'left join '.$fix.'good good on good.id = '.$fix.'sample.good_id',
					'left join '.$fix.'goodcates goodcates on goodcates.id = good.goodcates_id'
				),
				array(
					'good.good_name',
					'goodcates.name',
					$fix.'sample.express_name',
					$fix.'sample.express_no',
					$fix.'sample.sample_date'
				)
			)
		);

		$this->display();
	}

	public function logitics(){
		$fix=C('DB_PREFIX');
		$map['user_id']=session('member_auth.uid');

		$model = $this->getModel('order');

		$list_data = $this->_get_front_join_list($model,0,'hg_order.order_date desc',$map,$parent_arr,$field);

		foreach($list_data['list_data'] as &$vo) {
			$vo['order_date']=time_format($vo['order_date'],'Y-m-d H:m:s');
			$vo['express_status'] = $vo['express_status'] ==0 ? "未发货" : ($vo['express_status'] ==1 ? "已签收" :($vo['express_status']==2? "发货中" :"未签收" ) );
		}
		unset($vo);
		$this->assign(
			$this->_get_front_join_list($this->getModel('order'),0,'hg_order.order_date desc',$map,
				array(
					'left join '.$fix.'express express on express.id = '.$fix.'order.express_id',
					'left join '.$fix.'good good on good.id = '.$fix.'order.good_id',
					'left join '.$fix.'goodcates goodcates on goodcates.id = good.goodcates_id'
				),
				array(
					'good.good_name',
					'goodcates.name',
					$fix.'order.order_date',
					$fix.'order.order_no',
					'express.express_status',
					'express.id'
				)
			)
		);

		$this->display();
	}
	
	public function logitic(){

		$id=I('expressid');
		$fix=C('DB_PREFIX');
		$info=M('express')
		->join(array(
			'left join '.$fix.'order on '.$fix.'order.order_no = '.$fix.'express.express_order_no'
			))
		->field(
			array(
				$fix.'express.express_order_no',
				$fix.'express.courier',
				$fix.'express.express_no',
				$fix.'express.courier_mobile',
				$fix.'order.address',
				$fix.'order.recipients',
				$fix.'order.recipient_phone',
				$fix.'order.zip_code'
				)
			)
		->where(array($fix.'express.id'=>$id))
		->find();
		$this->assign('info',$info);
		$this->assign('list',M('express_detail')->where(array('express_id'=>$id))->order('detail_time desc')->select());
		$this->assign(
			'goodpics',
			M('order')
			->join(
				array(
					'left join '.$fix.'good good on good.id = '.$fix.'order.good_id',
					'left join '.$fix.'picture picture on picture.id= good.picture_id'
				)
			)
			->field(
				array(
					'picture.path',
					'good.id',
					'good.good_name'
				)
			)
			->where( array( 'order_no'=>$info['express_order_no']) )
			->select()
		);
		$this->display();
	}
	/*public function expressdetail(){

		$id=I('id');

		$fix=C('DB_PREFIX');

		$info=M('express')
		->join(array(
			'left join '.$fix.'order on '.$fix.'order.order_no = '.$fix.'express.express_order_no'
			))
		->field(
			array(
				$fix.'express.courier',
				$fix.'express.express_no',
				$fix.'express.courier_mobile',
				$fix.'order.address',
				$fix.'order.recipients',
				$fix.'order.recipient_phone',
				$fix.'order.zip_code'
				)
			)
		->where(array($fix.'express.id'=>$id))
		->find();

		$list=M('express_detail')->where(array('express_id'=>$id))->order('detail_time desc')->select();

		$this->assign('info',$info);
		$this->assign('list',$list);

		$this->display();
	}*/
}

?>