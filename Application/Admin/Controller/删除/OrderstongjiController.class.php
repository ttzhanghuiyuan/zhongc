<?php

namespace Admin\Controller;

class OrderstongjiController extends AdminController {

	private $table = "order";

	public function index()
	{
		
		$map = $this->params();

		$page || $page = I ( 'p', 1, 'intval' );

		$data =M($this->table)->join (
			array(
				'left join hg_user on hg_user.id = hg_order.user_id'
			)
		)
		->field(
			array(
				'hg_user.account',
				'hg_user.mobile',
				'hg_user.create_date',
				'hg_user.fullname',
				'hg_order.order_no',
				'hg_order.good_name',
				'hg_order.good_nums',
				'hg_order.order_date',
				'hg_order.total_price'
			)
		)
		->where ( $map )->order ( "order_date desc" )->page ( $page, 20 )->select ();

		$sum   = M( $this->table )->join(
			array(
				'left join hg_user on hg_user.id = hg_order.user_id'
			)
		)
		->field(
			array(
				'hg_user.account',
				'hg_user.mobile',
				'hg_user.create_date',
				'hg_user.fullname',
				'hg_order.order_no',
				'hg_order.good_name',
				'hg_order.good_nums',
				'hg_order.order_date',
				'hg_order.total_price'
			)
		)
		->where( $map )->sum( 'total_price' );

		$count = M( $this->table )
		->join(
			array(
				'left join hg_user on hg_user.id = hg_order.user_id'
			)
		)
		->field(
			array(
				'hg_user.account',
				'hg_user.mobile',
				'hg_user.create_date',
				'hg_user.fullname',
				'hg_order.order_no',
				'hg_order.good_name',
				'hg_order.good_nums',
				'hg_order.order_date',
				'hg_order.total_price'
			)
		)
		->where( $map )->count ();

		

		if ($count > 20) {
			$page = new \Think\Page ( $count, 20 );
			$page->setConfig ( 'theme', '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%' );
			$show = $page->show ();
		}

		$this->assign('list',$data);
		
		$this->assign('page',$show);

		$this->assign(
			'list_data',
			array(
			'count' => $count,
			'sum' => number_format($sum,2) ,
			'avg' => number_format($sum/$count,2) 
			)
		);

		$this->assign('statusitem',I('statusitem'));

		$this->display();
	}

	public function params(){

		$statusitem = I('statusitem');

		$keyword = I('keyword');

		

		switch ($statusitem) {
			case 0:
				break;
			case 1:
				$map = array('payment_status'=>0,'order_status'=>0) ;
				break;
			case 2:
				$map = array( 'order_status'=>0, 'payment_status'=>1,'express_id'=>array('exp','is null') );
				break;
			case 3:
				$map = array( 'order_status'=>0,'payment_status'=>1,'express_id'=>array('exp','is not null') ) ;
				break;
			case 4:
				$map = array('order_status'=>2,'isdel'=>0);
				break;
			case 5:
				$map = array( 'order_status'=>1 ) ;
				break;
			default:
				break;
		}

		if(!empty($keyword)){
			$map['account'] = array('like','%'.$keyword.'%');
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

		return $map;
	}
		
	

	
}
