<?php

namespace Admin\Controller;

class OrderController extends AdminController {

	private $table = 'order';

	public function lists(){//待付款列表

		$map = array('payment_status'=>0,'order_status'=>0) ;
		$this->params($map);

		$model = $this->getModel($this->table);
		$list_data = $this->union_list($model);

		foreach($list_data['list_data'] as &$vo) {
			
			$vo['payment_status'] = "未支付 | <a class='confirm ajax-get' href='".U('updatestatus',array('orderid'=>$vo['order_no'],'status'=>4))."'>订单取消</a>";

			$vo['order_status'] = '未完成'; 

			$vo['express_status'] = '未发货';

			$vo['contract_template'] = "<a href='".U('edit',array('orderid'=>$vo['order_no'],'status'=>1 ))."'>订单详情</a>";
		}
		unset($vo);

		$this->assign('is_hide_add',1);
		$this->assign('is_hide_del',1);
		$this->assign('date_range',1);
		$this->assign('is_hide_account',1);
		$this->assign('model',$model);
		$this->assign($list_data);

		Cookie('__forward__',$_SERVER['REQUEST_URI']);
		$this->display('Common:lists');
	}

	public function cancellist(){//取消

		$map = array('order_status'=>2,'isdel'=>0);
		$this->params($map);
		
		$model = $this->getModel($this->table);
		
		$list_data = $this->union_list($model);
		
		foreach($list_data['list_data'] as &$vo) {

			$vo['payment_status'] = "未支付";

			$vo['order_status'] = '已取消'; 

			$vo['express_status'] = '未发货';

			$vo['contract_template'] = "<a href='".U('edit',array('orderid'=>$vo['order_no'],'status'=>2 ))."'>订单详情</a>"
									   ." | <a class='ajax-get confirm' href='".U('del',array('id'=>$vo['id']))."'>删除</a>";
		}
		unset($vo);

		$this->assign('is_hide_add',1);
		$this->assign('date_range',1);
		$this->assign('is_hide_account',1);
		$this->assign('model',$model);

		$this->assign($list_data);
		Cookie('__forward__',$_SERVER['REQUEST_URI']);
		$this->display('Common:lists');
	}

	public function undeliveredlist(){//待发货列表

		$map = array( 'order_status'=>0, 'payment_status'=>1,'express_id'=>array('exp','is null') );
		$this->params($map);

		$model = $this->getModel($this->table);
		
		$list_data = $this->union_list($model);
		
		foreach($list_data['list_data'] as &$vo) {

			$vo['payment_status'] = "已支付";

			$vo['order_status'] = '未完成'; 

			$vo['express_status'] = "未发货 | <a href='".U('orderexpress',array('orderid'=>$vo['order_no'],'status'=>5 ))."'>物流配送</a>";

			$vo['contract_template'] = "<a href='".U('edit',array('orderid'=>$vo['order_no'],'status'=>5 ))."'>订单详情</a>";
		}

		unset($vo);
		$this->assign('is_hide_add',1);
		$this->assign('is_hide_del',1);
		$this->assign('date_range',1);
		$this->assign('is_hide_account',1);

		$this->assign('model',$model);

		$this->assign($list_data);
		Cookie('__forward__',$_SERVER['REQUEST_URI']);
		$this->display('Common:lists');
	}

	public function deliveredlist(){//已发货

		$map = array( 'order_status'=>0,'payment_status'=>1,'express_id'=>array('exp','is not null') ) ;
		$this->params($map);
		
		$model = $this->getModel($this->table);
		
		$list_data = $this->union_list($model);
		
		foreach($list_data['list_data'] as &$vo) {
			
			$vo['payment_status'] = "已支付";

			$vo['order_status'] = '未完成'; 

			$vo['express_status'] = $vo['express_status'] == 2 ? 
									"发货中 | <a href='".U('orderexpress',array('orderid'=>$vo['order_no'],'status'=>6 ))."'>物流详情</a>" :
									($vo['express_status'] ==3 ? 
									"未签收 | <a href='".U('orderexpress',array('orderid'=>$vo['order_no'],'status'=>6 ))."'>物流详情</a>" :
									"已签收 | <a href='".U('orderexpress',array('orderid'=>$vo['order_no'],'status'=>6 ))."'>物流详情</a>" 
								   ." | <a class='confirm ajax-get' href='".U('updatestatus',array('orderid'=>$vo['order_no'],'status'=>3))."'>订单确认完成</a>"
									);

			$vo['contract_template'] = "<a href='".U('edit',array('orderid'=>$vo['order_no'],'status'=>6 ))."'>订单详情</a>";
		}
		unset($vo);

		$this->assign('is_hide_add',1);
		$this->assign('is_hide_del',1);
		$this->assign('date_range',1);
		$this->assign('is_hide_account',1);

		$this->assign('model',$model);

		$this->assign($list_data);
		Cookie('__forward__',$_SERVER['REQUEST_URI']);
		$this->display('Common:lists');
	}

	/*public function receiptlist(){
		session ( 'common_condition',null );
		session('common_condition' , array('audit_status'=>1,'order_status'=>0,'order_contract'=>array('exp','is not null'),'express_id'=>array('exp','is not null'),'receipt_status'=>1 ) );
		
		$model = $this->getModel($this->table);
		
		$list_data = $this->_get_join_list($model,0,'id desc',null,true);
		
		foreach($list_data['list_data'] as &$vo) {
	
			$vo['audit_status'] = '审核通过';

			$vo['order_status']='未完成'; 
			
			if($vo['express_status']==1 && $vo['payment_status'] ==1 ){
				$vo['order_status'] .=" | <a class='confirm ajax-get' href='".U('updatestatus',array('orderid'=>$vo['order_no'],'status'=>3))."'>订单确认完成</a>";
			}

			$vo['payment_status'] = $vo['payment_status'] == 0 ? '未支付' : '已支付' ;
			$vo['express_status'] = $vo['express_status'] == 1 ? 
									"已签收 | <a href='".U('orderexpress',array('orderid'=>$vo['order_no'],'status'=>7 ))."'>物流详情</a>" :
									"未签收 | <a href='".U('orderexpress',array('orderid'=>$vo['order_no'],'status'=>7 ))."'>物流详情</a>";
			
			$vo['ids'] = "<a href='".U('edit',array('orderid'=>$vo['order_no'],'status'=>7 ))."'>订单详情</a>";
		}
		unset($vo);
		$this->assign('is_hide_add',1);
		$this->assign('is_hide_del',1);

		$this->assign('model',$model);

		$this->assign($list_data);
		Cookie('__forward__',$_SERVER['REQUEST_URI']);
		$this->display('Common:lists');
	}*/

	public function finishlist(){

		$map = array( 'order_status'=>1 ) ;
		$this->params($map);
		
		$model = $this->getModel($this->table);
		
		$list_data = $this->union_list($model);
		
		foreach($list_data['list_data'] as &$vo) {
			
			$vo['payment_status'] = "已支付";

			$vo['order_status'] = '完成'; 

			$vo['express_status'] = "已收货 | <a href='".U('orderexpress',array('orderid'=>$vo['order_no'],'status'=>8 ))."'>物流详情</a>";

			$vo['contract_template'] = "<a href='".U('edit',array('orderid'=>$vo['order_no'],'status'=>8 ))."'>订单详情</a>";
		}
		unset($vo);
		$this->assign('is_hide_add',1);
		$this->assign('is_hide_del',1);
		$this->assign('date_range',1);
		$this->assign('is_hide_account',1);

		$this->assign('model',$model);

		$this->assign($list_data);
		Cookie('__forward__',$_SERVER['REQUEST_URI']);
		$this->display('Common:lists');
	}

	public function params($map){

		if(!empty($_GET['account'])){
			$map['account'] = array('like','%'.$_GET['account'].'%');
		}
		else{
			unset($_REQUEST['account']);
		}
		if( !empty($_GET['min_time']) && !empty($_GET['max_time']) )
		{
			$map['order_date'] =array(array('egt',strtotime($_GET['min_time']) ),array('elt',strtotime($_GET['max_time'])) ); 
		}
		elseif ( !empty($_GET['min_time']) ) {
			$map['order_date'] = array('egt',strtotime($_GET['min_time']));
		}
		elseif ( !empty($_GET['max_time']) ) {
			$map['order_date'] = array( 'elt',strtotime($_GET['max_time']) );
		}
		session('common_condition',$map);
	}


	public function updatestatus(){
		$status = I('status');
		$map['order_no'] = I('orderid');
		$data['brokerage'] = session('user_auth.username');

		switch ($status) {
			/*case 1: //审核通过
				$data['audit_status'] = 1;
				$data['audit_date'] = time();
				break;
			case 2://审核未通过
				$data['audit_status'] = 2;
				$data['audit_date'] = time();
				break;*/
			case 3:
				$data['order_status'] = 1;
				$data['finish_date'] = time();
				break;
			case 4:
				$data['order_status'] = 2;
				$data['finish_date'] = time();
				break;
			
			default:
				
				break;
		}
		$result=M($this->table)->where($map)->save( $data );

		if($result!==false){
			$url = $status==4 ? U('cancellist') : U('');
			$this->success('设置成功',$url);
		}else{
			$this->error('设置失败');
		}

	}

	public function orderexpress()
	{
		if(IS_POST){

			I('expressdetail')==0 && $this->error('物流详情必填'); 

			$id=I('id','intval');

			$result = empty($id)? $this->common_add('express',null,'',true):$this->common_edit('express',0,null,'',true);

			if($result['status']){

				if(empty($id)){
					M($this->table)->where(array('order_no'=>I('express_order_no','strip_tags') ))->save(array('express_id'=>$result['data']));
				}
				
				M('ExpressDetail')->where(array('express_id'=>$result['data']))->delete();

				$detail_time=I('detail_time');

				$detail_content=I('detail_content');

				for ($i=0,$j=count($detail_time); $i < $j; $i++) {

					$datas[]=array('express_id'=>$result['data'],'detail_time'=>strtotime($detail_time[$i]),'detail_content'=>$detail_content[$i]);
				}

				M('ExpressDetail')->addAll($datas);

				unset($datas);

				$jump =Cookie('__forward__');// U('Order/lists');

				$this->success ( '保存物流详情成功' , $jump );

			}
			else{
				$this->error ( $result['data'] );
			}
		}
		else{
			$orderid || $orderid=I('orderid','strip_tags');

			$order=M($this->table)->where(array('order_no'=>$orderid))->find();

			$info=M('express')->where(array('express_order_no'=>$orderid))->find();

			$expressdetails= empty($info) ? null : M('ExpressDetail')->where(array('express_id'=>$info['id']))->select();

			$status = I('status');
			switch ($status) {
				case 5:
					$this->assign('nav_active',U('undeliveredlist'));
					break;
				case 6:
					$this->assign('nav_active',U('deliveredlist'));
					break;
				/*case 7:
					$this->assign('nav_active',U('receiptlist'));
					break;*/
				case 8:
					$this->assign('nav_active',U('finishlist'));
					$this->assign('is_hide_confirm',1);
					break;
				default:
					
					break;
			}

			$this->assign('status',$status);

			$this->assign('info',$info);

			$this->assign('order',$order);

			$this->assign('expressdetails',$expressdetails);

			$this->assign('orderid',$orderid);

			$this->display();
		}
	}

	public function del(){
		$this->common_del($this->table,null,null,false);
	}

	public function printview(){

		$orderid || $orderid=I('orderid','strip_tags');

		$fix=C('DB_PREFIX');

		$list=M($this->table)
		->join(array(
			'left join '.$fix.'good on '.$fix.'good.id = '.$fix.$this->table.'.good_id',
			'left join '.$fix.'goodcates on '.$fix.'goodcates.id = '.$fix.'good.goodcates_id'
			))
		->field(
			array(
				$fix.$this->table.'.order_no',
				$fix.$this->table.'.good_id',
				$fix.$this->table.'.id',
				$fix.$this->table.'.good_name',
				$fix.$this->table.'.package',
				$fix.$this->table.'.good_nums',
				$fix.$this->table.'.weight',
				$fix.$this->table.'.unit_price',
				$fix.$this->table.'.priceterms',
				$fix.$this->table.'.total_price',
				$fix.$this->table.'.user_id',
				$fix.$this->table.'.company_name',
				$fix.$this->table.'.linkman',
				$fix.$this->table.'.addr',
				$fix.$this->table.'.mobile',
				$fix.$this->table.'.order_date',
				$fix.$this->table.'.payment_status',
				$fix.$this->table.'.payment_date',
				$fix.$this->table.'.express_id',
				$fix.$this->table.'.brokerage',
				$fix.$this->table.'.audit_status',
				$fix.$this->table.'.audit_date',
				$fix.$this->table.'.order_status',
				$fix.$this->table.'.finish_date',
				$fix.$this->table.'.recipients',
				$fix.$this->table.'.recipient_phone',
				$fix.$this->table.'.address',
				$fix.$this->table.'.zip_code',
				$fix.$this->table.'.contract_template',
				$fix.$this->table.'.order_contract',
				$fix.$this->table.'.priceterm_remark',
				$fix.'goodcates.name as catename',
				)
				)
		->where(array('order_no'=>$orderid))
		->select();

		foreach ($list as &$vo) {
			$vo['good_nums']=intval($vo['good_nums']);
			$vo['weight']=number_format($vo['weight'],2);
			$vo['unit_price']=number_format($vo['unit_price'],2);
			$vo['total_price']=number_format($vo['total_price'],2);
		}

		unset($vo);
		$this->assign('list',$list);
		$this->assign('info',$list[0]);
		$this->display();
	}

	public function edit(){

		if(IS_POST){

			/*$status = I('status');
			switch ($status) {
				case 1:
					$audit_status = I('audit_status','intval');
					$priceterm_remark = I('priceterm_remark');
					if( $audit_status==1 && empty($priceterm_remark) ){

						$this->error('请填写账期备注');
						exit();
					}
					$data=array(
						'audit_status'=>I('audit_status','intval'),
						'audit_date' =>strtotime(I('audit_date')),
						'priceterm_remark' => I('priceterm_remark'),
						'brokerage' => I('brokerage')
					);
					break;
				case 5:
				case 6:
				case 7:
					$data=array(
						'payment_status'=>I('payment_status','intval'),
						'payment_date' =>strtotime(I('payment_date')),
						'brokerage' => I('brokerage')
					);
					break;
				
				default:
					
					break;
			}
			$this->edittable(
				$this->table,
				array('order_no'=>I('order_no','strip_tags')), 
				
				$data,
				Cookie('__forward__')
				);*/
		}
		else{
			$orderid || $orderid=I('orderid','strip_tags');

			$fix=C('DB_PREFIX');

			$item=M($this->table)
			->join(array(
				'left join '.$fix.'good on '.$fix.'good.id = '.$fix.$this->table.'.good_id',
				'left join '.$fix.'goodcates on '.$fix.'goodcates.id = '.$fix.'good.goodcates_id'
				))
			->field(
	    		array(
	    			$fix.$this->table.'.order_no',
	    			//$fix.$this->table.'.good_id',
	    			$fix.$this->table.'.id',
	    			//$fix.$this->table.'.good_name',
	    			//$fix.$this->table.'.package',
	    			//$fix.$this->table.'.good_nums',
                    //$fix.$this->table.'.weight',
                    //$fix.$this->table.'.unit_price',
                    //$fix.$this->table.'.priceterms',
                    $fix.$this->table.'.total_price',
                    $fix.$this->table.'.user_id',
                    //$fix.$this->table.'.company_name',
                    $fix.$this->table.'.linkman',
                    $fix.$this->table.'.addr',
                    $fix.$this->table.'.mobile',
                    $fix.$this->table.'.order_date',
                    $fix.$this->table.'.payment_status',
                    $fix.$this->table.'.payment_date',
                    $fix.$this->table.'.express_id',
                    $fix.$this->table.'.brokerage',
                    $fix.$this->table.'.audit_status',
                    $fix.$this->table.'.audit_date',
                    $fix.$this->table.'.order_status',
                    $fix.$this->table.'.finish_date',
                    $fix.$this->table.'.recipients',
                    $fix.$this->table.'.recipient_phone',
                    $fix.$this->table.'.address',
                    $fix.$this->table.'.zip_code',
                    //$fix.$this->table.'.contract_template',
                    //$fix.$this->table.'.order_contract',
                    //$fix.$this->table.'.priceterm_remark',
	    			)
	    		)
			->where(array('order_no'=>$orderid))
			->find();

			$list = M('order_goods')
			->join(array(
				'left join '.$fix.'good on '.$fix.'good.id = '.$fix.'order_goods.order_good_id',
				'left join '.$fix.'goodcates on '.$fix.'goodcates.id = '.$fix.'good.goodcates_id'
				))
			->field(
	    		array(
	    			$fix.'order_goods.order_good_name',
	    			$fix.'order_goods.order_good_package',
	    			$fix.'order_goods.order_good_nums',
	    			$fix.'order_goods.order_good_weight',
	    			$fix.'order_goods.order_good_price',
	    			$fix.'goodcates.name as catename',
                 )
	    	)
			->where('order_good_order_id='.$item['id'])->select();

			foreach ($list as &$vo) {
				//$vo['good_nums']=intval($vo['good_nums']);
				$vo['order_good_weight']=number_format($vo['order_good_weight'],2);
				$vo['order_good_price']=number_format($vo['order_good_price'],2);
				//$vo['total_price']=number_format($vo['total_price'],2);
			}
			unset($vo);

			//$status = I('status');
			$status = I('status');
			switch ($status) {
				case 1:
					$this->assign('nav_active',U('lists'));
					//$this->assign('is_hide_confirm',1);
					break;
				case 2:
					$this->assign('nav_active',U('cancellist'));
					//$this->assign('is_hide_confirm',1);
					break;
				case 5:
					$this->assign('nav_active',U('undeliveredlist'));
					//$this->assign('is_hide_confirm',1);
					break;
				case 6:
					$this->assign('nav_active',U('deliveredlist'));
					//$this->assign('is_hide_confirm',1);
					break;
				/*case 7:
					$this->assign('nav_active',U('receiptlist'));
					break;*/
				case 8:
					$this->assign('nav_active',U('finishlist'));
					
					break;
				default:
					
					break;
			}

			$this->assign('status',$status);
			$this->assign('is_hide_confirm',1);
			$this->assign('list',$list);
			$this->assign('info',$item);
			$this->display();

		}
	}

	/*public function ordercontract(){

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
		
	}*/

}

?>
