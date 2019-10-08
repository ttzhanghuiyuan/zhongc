<?php

namespace Admin\Controller;

class OrderstaticsController extends AdminController {

	private $table = "order";

	public function index()
	{
		
		$map = $this->params();

		$page || $page = I ( 'p', 1, 'intval' );

		$data  = M( $this->table )->where( $map )->order ( 'order_date desc' )->page ( $page, 20 )->select ();

		$sum   = M( $this->table )->where( $map )->sum( 'total_price' );

		$count = M( $this->table )->where( $map )->count ();

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
