<?php

namespace Home\Controller;

class OrderController extends HomeController {

	public function index(){

		$mode = I('mode');
		$fix=C('DB_PREFIX');

		//dump($mode);
		session('order_params',null);
		//dump(time_format(NOW_TIME));
		session('order_params',array(
			'order_no' => build_order_no(),
			'order_date' => NOW_TIME
		));

		if( empty($mode) ){
			$map[$fix.'cart.id'] =array('in', session('ids'));
			$this->assign(
				'list',
				M('Cart')
				->join(
					array(
						'left join '.$fix.'good good on good.id = '.$fix.'cart.good_id',
						'left join '.$fix.'goodcates goodcates on goodcates.id = good.goodcates_id'
						)
					)
				->field(
					array(
						'good.good_name',
						'good.weight',
						'good.package',
						'good.stocksize',
						'goodcates.name',
						$fix.'cart.id',
						$fix.'cart.good_nums',
						$fix.'cart.price_attr',
						$fix.'cart.good_price'
						)
					)
				->where( $map )
				->select()
			);
			$this->assign('mode',0);
		}
		else{
			if(!member_is_login()){

				$this->error("您还未登录，请登录",U('Public/login'));
				exit();
			}
			$list[] = M('good')
			->join(
				array(
					'left join '.$fix.'goodcates goodcates on goodcates.id = '.$fix.'good.goodcates_id'
				)
			)
			->field(
				array(
					$fix.'good.good_name',
					$fix.'good.weight',
					$fix.'good.package',
					$fix.'good.stocksize',
					'goodcates.name',
				)
			)
			->where( array( $fix.'good.id' => session('orderparams.good_id') ) )
			->find();

			$list[0]['good_nums'] = session('orderparams.good_nums');
			$list[0]['price_attr'] = session('orderparams.price_attr');
			$list[0]['good_price'] = session('orderparams.good_price');

			$this->assign('href',cookie('refer'));
			$this->assign('list',$list);
			$this->assign('mode',$mode);
		}
		$this->assign(
			'addr',
			M('shippingaddr')
			->where( array( 'user_id'=>session('member_auth.uid') ,'isdefault'=>1 ))
			->find()
		);

		$this->assign('order_params',session('order_params'));
		$this->display();
	}

	public function submitorder(){
		
		$fix=C('DB_PREFIX');

		$map[$fix.'cart.id'] =array('in', session('ids'));

		$list = M('Cart')
		->join(
			array(
			'left join '.$fix.'good good on good.id = '.$fix.'cart.good_id',
			'left join '.$fix.'goodcates goodcates on goodcates.id = good.goodcates_id'
			)
		)
		->field(
			array(
			'good.good_name',
			'good.weight',
			'good.package',
			'good.stocksize',
			'goodcates.name',
			$fix.'cart.id',
			$fix.'cart.good_nums',
			$fix.'cart.price_attr',
			$fix.'cart.good_price',
			$fix.'cart.good_id'
			)
		)
		->where( $map )
		->select();

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

		//$order_no = build_order_no();
		//$now_time=NOW_TIME;
		$total_price=0;

		$res = $datas = array();

		foreach ($list as $key => $value) {
			$data[] = array(
				'order_no'   => session('order_params.order_no'), //$order_no,
				'good_id'    => $value['good_id'],
				'good_name'  => $value['good_name'],
				'package'    => $value['package'],
				'good_nums'  => $value['good_nums'],
				'weight'     => $value['weight'],
				'unit_price' => $value['good_price'],
				'priceterms' => $value['price_attr'],
				'total_price'=> $value['good_nums']*$value['good_price'],
				'user_id'	 => session('member_auth.uid'),
				'company_name' => $addr['company_name'],
				'linkman'    => $addr['linkman'],
				'addr'       => $addr['addr'],
				'mobile'     => $addr['mobile'],
				'order_date' => session('order_params.order_date'),
				'payment_status' => 0,
				'audit_status' => 0,
				'order_status' => 0,
				'recipients' => $addr['recipients'],
				'recipient_phone' => $addr['recipient_phone'],
				'address'    => $addr['address'],
				'zip_code'  => $addr['zip_code'],
				'isdel' => 0,
				'receipt_status'=>0,
				'receipt_date'=>time()+604800
			);

			$res[$value['good_id']] += $value['good_nums'];

			$datas[$value['good_id']] = array(
				'salescount' => array( 'exp','salescount+'.$res[$value['good_id']] ),
				'stocksize' => array( 'exp','stocksize-'.$res[$value['good_id']] ),
			);

			$total_price += ($value['good_nums']*$value['good_price']);
		}

		if(M('Order')->addAll($data)){

			$this->assign('is_commit',1);
			$this->assign('total_price',number_format($total_price,2) );
			$this->assign('order_no', session('order_params.order_no'));

			$where['id']=array_keys($datas);

			$this->saveAll($where,array_values($datas),'good');

			M('cart')->where(array('id' => array('in',session('ids'))))->delete();
			
			cookie('Cart_num',M('cart')->where(array('user_id'=>session('member_auth.uid')))->count());

			session('ids',null);
			
		}
		else{
			$this->assign('is_commit',0);
		}
		$this->display();
	}

	public function order_add(){
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
		$value = M('Good')->find(session('good_id'));
		//$order_no = build_order_no();
		$now_time = NOW_TIME;
		$data = array(
			'order_no'   => session('order_params.order_no'),
			'good_id'    => session('orderparams.good_id'),//$value['good_id'],
			'good_name'  => $value['good_name'],
			'package'    => $value['package'],
			'good_nums'  => session('orderparams.good_nums'),//$value['good_nums'],
			'weight'     => $value['weight'],
			'unit_price' => session('orderparams.good_price'),//$value['good_price'],
			'priceterms' => session('orderparams.price_attr'),//$value['price_attr'],
			'total_price'=> session('orderparams.good_nums')*session('orderparams.good_price'),
			'user_id'	 => session('member_auth.uid'),
			'company_name' => $addr['company_name'],
			'linkman'    => $addr['linkman'],
			'addr'       => $addr['addr'],
			'mobile'     => $addr['mobile'],
			'order_date' => session('order_params.order_date'),
			'payment_status' => 0,
			'audit_status' => 0,
			'order_status' => 0,
			'recipients' => $addr['recipients'],
			'recipient_phone' => $addr['recipient_phone'],
			'address'    => $addr['address'],
			'zip_code'  => $addr['zip_code'],
			'isdel' => 0
		);

		if(M('Order')->add($data)){

			$this->assign('is_commit',1);
			$this->assign('total_price',number_format($data['total_price'],2) );
			$this->assign('order_no', session('order_params.order_no'));

			M('Good')->where( array('id'=>session('orderparams.good_id')) )->save(
				array(
					'salescount' => array( 'exp','salescount+'.$data['good_nums'] ),
					'stocksize' => array( 'exp','stocksize-'.$data['good_nums'] ),
				)
			);
			session('orderparams',null);
			
		}
		else{
			$this->assign('is_commit',0);
		}

		$this->display('submitorder');
	}
	
}

?>