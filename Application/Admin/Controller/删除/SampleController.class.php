<?php

namespace Admin\Controller;

class SampleController extends AdminController {

	private $table = 'sample';

	public function lists(){

		session ( 'common_condition',null );
		//session('common_condition' , array('status'=>0 ) );

		$mod=I('mod',0,'intval');
		switch ($mod) {
			case 0:
				session('common_condition' , array('status'=>0, 'audit_status'=>0 ) );
				break;
			case 1:
				session('common_condition' , array('status'=>0, 'audit_status'=>1 , 'express_no'=>array('exp','is null') ) );
				break;
			default:
				session('common_condition' , array('status'=>0, 'audit_status'=>2 ) );
				break;
		}
		
		$model = $this->getModel($this->table);

		$list_data = $this->_get_model_list($model,0,'id desc',null,true);

		/*$lists = $this->union_list($model);
		dump($lists);*/
		//dump($list_data);

		foreach($list_data['list_data'] as &$vo) {

			$vo['status']= "未完成";

			$vo['audit_status']= $vo['audit_status']==0? 
			"未审核 | <a class='confirm ajax-get' href='".U('updatestatus',array( 'status'=>1, 'id'=>$vo['id'] ))."'>审核通过</a>
					  <a class='confirm ajax-get' href='".U('updatestatus',array( 'status'=>2, 'id'=>$vo['id'] ))."'>审核未通过</a>":
			                    ($vo['audit_status']==1? 
			"审核通过 | <a class='confirm ajax-get' href='".U('updatestatus',array( 'status'=>2, 'id'=>$vo['id'] ))."'>审核未通过</a>":

			"未通过 | <a class='confirm ajax-get' href='".U('updatestatus',array( 'status'=>1, 'id'=>$vo['id'] ))."'>审核通过</a>");

			$vo['ids'] = "<a href='".U('edit',array('id'=>$vo['id'],'status'=>1 ))."'>取样详情</a>";
		}

		unset($vo);
        
	    $this->assign('is_hide_add',1);

	    $this->assign('is_hide_del',1);

		$this->assign('model',$model);

		$this->assign(
			'audit',
			array(
				'is' => 1,
				'url0' => U('lists',array('mod'=>0)),
				'url1' => U('lists',array('mod'=>1)),
				'url2' => U('lists',array('mod'=>2))
			)
		);

		$this->assign($list_data);
		Cookie('__forward__',$_SERVER['REQUEST_URI']);

		$this->display('Common:lists');
	}

	public function undeliveredlists(){

		session ( 'common_condition',null );
		session('common_condition' , array('audit_status'=>1,'status'=>0, 'express_no'=>array('exp','is null')  ) );
		
		$model = $this->getModel($this->table);

		$list_data = $this->_get_model_list($model,0,'id desc',null,true);

		foreach($list_data['list_data'] as &$vo) {

			$vo['status']="未完成";

			$vo['audit_status']= '审核通过';

			$vo['ids'] = "<a href='".U('edit',array('id'=>$vo['id'],'status'=>2 ))."'>取样详情</a>";
		}

		unset($vo);
        
	    $this->assign('is_hide_add',1);

	    $this->assign('is_hide_del',1);

		$this->assign('model',$model);

		$this->assign($list_data);
		Cookie('__forward__',$_SERVER['REQUEST_URI']);

		$this->display('Common:lists');
	}

	public function deliveredlists(){

		session ( 'common_condition',null );
		session('common_condition' , array('audit_status'=>1,'status'=>0, 'express_no'=>array('exp','is not null')  ) );
		
		$model = $this->getModel($this->table);

		$list_data = $this->_get_model_list($model,0,'id desc',null,true);

		foreach($list_data['list_data'] as &$vo) {

			$vo['status']="未完成";

			$vo['audit_status']= '审核通过';

			$vo['ids'] = "<a href='".U('edit',array('id'=>$vo['id'],'status'=>3 ))."'>取样详情</a>";
		}

		unset($vo);
        
	    $this->assign('is_hide_add',1);

	    $this->assign('is_hide_del',1);

		$this->assign('model',$model);

		$this->assign($list_data);
		Cookie('__forward__',$_SERVER['REQUEST_URI']);

		$this->display('Common:lists');
	}

	public function finishlists(){

		session ( 'common_condition',null );
		session('common_condition' , array('status'=>1  ) );
		
		$model = $this->getModel($this->table);

		$list_data = $this->_get_model_list($model,0,'id desc',null,true);

		foreach($list_data['list_data'] as &$vo) {

			$vo['status']="已完成";

			$vo['audit_status']= '审核通过';

			$vo['ids'] = "<a href='".U('edit',array('id'=>$vo['id'],'status'=>5 ))."'>取样详情</a>";
		}

		unset($vo);
        
	    $this->assign('is_hide_add',1);

	    $this->assign('is_hide_del',1);

		$this->assign('model',$model);

		$this->assign($list_data);
		Cookie('__forward__',$_SERVER['REQUEST_URI']);

		$this->display('Common:lists');
	}


    public function updatestatus(){
		$status = I('status');
		$map['id'] = I('id');
		$data['brokerage'] = session('user_auth.username');

		switch ($status) {
			case 1: //审核通过
				$data['audit_status'] = 1;
				$data['audit_date'] = time();
				break;
			case 2://审核未通过
				$data['audit_status'] = 2;
				$data['audit_date'] = time();
				break;
			
			default:
				
				break;
		}
		$result=M($this->table)->where($map)->save( $data );

		if($result!==false){
			$this->success('设置成功');
		}else{
			$this->error('设置失败');
		}

	}

	public function del(){
		$this->common_del($this->table,null,null,false);
	}

	public function printview(){

		$id || $id = I ( 'id' ,'intval');
		$fix=C('DB_PREFIX');

		$tempsql=' (select * from '.$fix.'shippingaddr where '.$fix.'shippingaddr.isdefault=1) as shippingaddr ';
		
		$info=M($this->table)
		->join(array(
			'left join '.$fix.'user on '.$fix.'user.id = '.$fix.$this->table.'.user_id',
			'left join '.$fix.'good on '.$fix.'good.id = '.$fix.$this->table.'.good_id',
			'left join '.$fix.'goodcates on '.$fix.'goodcates.id = '.$fix.'good.goodcates_id',
			'left join '.$tempsql.' on shippingaddr.user_id = '.$fix.$this->table.'.user_id', 
			))
		->field(
			array(
				$fix.'user.company_name',
				$fix.'user.linkman',
				$fix.'user.mobile',
				$fix.'user.addr',
				$fix.'good.good_name',
				$fix.'goodcates.name',
				'shippingaddr.recipients',
				'shippingaddr.recipient_phone',
				'shippingaddr.zip_code',
				'shippingaddr.address',
				$fix.$this->table.'.sample_no',
				$fix.$this->table.'.sample_date',
				$fix.$this->table.'.id',
				$fix.$this->table.'.remarks',
				$fix.$this->table.'.audit_status',
				$fix.$this->table.'.audit_date',
				$fix.$this->table.'.status',
				$fix.$this->table.'.complete_date',
				$fix.$this->table.'.express_name',
				$fix.$this->table.'.express_no',
				$fix.$this->table.'.express_date',
				$fix.$this->table.'.picture_id',
				$fix.$this->table.'.signer',
				$fix.$this->table.'.sign_date'
				)
			)
		->where(
			array( 
				$fix.$this->table.'.id'=>$id
				)
			)
		->find();

		$this->assign('info',$info);
		$this->display();
	}

	public function edit(){
		if(IS_POST){

			$status = I('status');
			switch ($status) {
				case 1:
					$data=array(
						'audit_status'=>I('audit_status','intval'),
						'audit_date' =>strtotime(I('audit_date')),
						'remarks' => I('remarks','htmlspecialchars'),
						'brokerage' => I('brokerage')
					);
					break;
				case 2:
					$data=array(
						'remarks' => I('remarks','htmlspecialchars'),
						'brokerage' => I('brokerage'),
						'express_name'=>I('express_name'),
						'express_no'=>!empty(I('express_no'))?I('express_no'):null,
						'express_date'=>!empty(I('express_date'))?strtotime(I('express_date')):null,
						'picture_id'=>I('picture_id',0,'intval')
					);
					break;
				case 3:

					$order_status = I('order_status');
					if($order_status == 1 ){

						$sign_date = I('sign_date');
						$signer = I('signer');
						$express_name = I('express_name');
						$express_no = I('express_no');

						if(empty($express_name) || empty($express_no)){

							$this->error('请填写快递详情');
							exit();
						}

						if (empty($sign_date) || empty($signer) ) {

							$this->error('请填写签收的详情');
							exit();
						}
					}

					$data=array(
						'remarks' => I('remarks','htmlspecialchars'),
						'brokerage' => I('brokerage'),
						'express_name'=>I('express_name'),
						'express_no'=>!empty(I('express_no'))?I('express_no'):null,
						'express_date'=>!empty(I('express_date'))?strtotime(I('express_date')):null,
						'picture_id'=>I('picture_id',0,'intval'),
						'signer'=>I('signer'),
						'sign_date'=>!empty(I('sign_date'))?strtotime(I('sign_date')):null,
						'status' => $order_status,
						'complete_date' => !empty($order_status) ? strtotime(I('complete_date')) :null
					);
					break;
				
				default:
					
					break;
			}
			
			$this->edittable(
				$this->table,
				array('id'=>I('id','intval')),
				$data,
				Cookie('__forward__')
				);
	    }
	    else{
	    	$id || $id = I ( 'id' ,'intval');
	    	$fix=C('DB_PREFIX');

	    	$tempsql=' (select * from '.$fix.'shippingaddr where '.$fix.'shippingaddr.isdefault=1) as shippingaddr ';
	    	
	    	$info=M($this->table)
	    	->join(array(
	    		'left join '.$fix.'user on '.$fix.'user.id = '.$fix.$this->table.'.user_id',
	    		'left join '.$fix.'good on '.$fix.'good.id = '.$fix.$this->table.'.good_id',
	    		'left join '.$fix.'goodcates on '.$fix.'goodcates.id = '.$fix.'good.goodcates_id',
	    		'left join '.$tempsql.' on shippingaddr.user_id = '.$fix.$this->table.'.user_id', 
	    		))
	    	->field(
	    		array(
	    			$fix.'user.company_name',
	    			$fix.'user.linkman',
	    			$fix.'user.mobile',
	    			$fix.'user.addr',
	    			$fix.'good.good_name',
	    			$fix.'goodcates.name',
	    			'shippingaddr.recipients',
	    			'shippingaddr.recipient_phone',
	    			'shippingaddr.zip_code',
	    			'shippingaddr.address',
	    			$fix.$this->table.'.sample_no',
	    			$fix.$this->table.'.sample_date',
	    			$fix.$this->table.'.id',
	    			$fix.$this->table.'.remarks',
	    			$fix.$this->table.'.audit_status',
	    			$fix.$this->table.'.audit_date',
                    $fix.$this->table.'.status',
                    $fix.$this->table.'.complete_date',
                    $fix.$this->table.'.express_name',
                    $fix.$this->table.'.express_no',
                    $fix.$this->table.'.express_date',
                    $fix.$this->table.'.picture_id',
                    $fix.$this->table.'.signer',
                    $fix.$this->table.'.sign_date'
	    			)
	    		)
	    	->where(
	    		array( 
	    		    $fix.$this->table.'.id'=>$id
	    		    )
	    		)
	    	->find();

	    	$status = I('status');
			switch ($status) {
				case 1:
					$this->assign('nav_active',U('lists'));
					break;
				case 2:
					$this->assign('nav_active',U('undeliveredlists'));
					break;
				case 3:
					$this->assign('nav_active',U('deliveredlists'));
					break;
				case 4:
					break;
				case 5:
					$this->assign('nav_active',U('finishlists'));
					break;
				default:
					break;
			}

			$this->assign('status',$status);

	    	$this->assign('info',$info);
	    	$this->display();
	    }
	}
}
