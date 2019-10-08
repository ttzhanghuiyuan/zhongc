<?php

namespace Home\Widget;
use Think\Action;

class SidenewsWidget extends Action{
	
	public function lists(){
		$map['position'] = array('in','1,3');
		$map['category_id'] = array('neq' , 44);
		$map['status']=1;
		$this->assign(
			'list',
			M("document")
			->field(array('id','title','category_id'))
			->where($map)
			->order('create_time desc')
			->limit(10)
			->select()
		);
		$this->display('Sidenews/lists');
	}

	public function trades(){
		$this->assign(
			'trads',
			M("order")
			->field(
				'hg_order.good_name,
				(hg_order.good_nums*hg_order.weight) as total_weight,
				hg_order.company_name,hg_order.linkman')
			/*->join(array(
				'left join hg_good on hg_good.id = hg_order.good_id'
			))*/
			->limit(10)
			->select()
		);
		$this->display('Sidenews/trades');
	}
	
}
