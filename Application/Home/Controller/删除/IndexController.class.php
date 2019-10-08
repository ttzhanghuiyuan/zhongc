<?php

namespace Home\Controller;
use OT\DataDictionary;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends HomeController {

	//系统首页
    public function index(){

		/*banner图*/
		$this->assign(
			$this->get_banner()
		);


		$map['position'] = array('in','2,3');
		$map['category_id'] = array('neq' , 44);
		$map['status']=1;

		$where['category_id'] =44;
		$where['status']=1;

		$news = M("document")
			->field(array('id','title','category_id','create_time'))
			->where($map)
			->order('create_time desc')
			->limit(6)
			->select();

		$this->assign(
			'news',
			$news
		);

		//dump($news);

		$last_time =time_format( $news[0]['create_time'] ,'Y-m-d');

		$this->assign(
			'last_time',
			substr($last_time,5,2).'月'.substr($last_time, 8,2).'日'
		);

		$this->assign(
			'ads',
			M("document")
			->field(array('id','title','category_id'))
			->where($where)
			->order('create_time desc')
			->limit(6)
			->select()
		);

		$cate = get_cate();
		$count = count($cate);		
		
		if($count<7){
			for ($i=1; $i <$count ; $i++) { 

				$union[]="(SELECT hg_goodcates.pid,hg_goodcates.name,hg_good.good_name,hg_good.id,hg_good.application,hg_good.describe 
						FROM hg_good left join hg_goodcates on hg_goodcates.id = hg_good.goodcates_id 
					left join hg_picture on hg_picture.id = hg_good.picture_id
					where hg_goodcates.pid = ".$cate[$i]['id']." LIMIT 8)";
				
				$array[] = "(SELECT hg_goodcates.pid,hg_order.good_name,(hg_order.good_nums*hg_order.weight) as total_weight,hg_order.company_name,hg_order.linkman
						FROM hg_order left join hg_good on hg_good.id = hg_order.good_id left join hg_goodcates on
						hg_goodcates.id=hg_good.goodcates_id  where hg_goodcates.pid =".$cate[$i]['id']." LIMIT 6)";
				
			}
		}
		else{
			for ($i=1; $i <7 ; $i++) { 
				$union[]="(SELECT hg_goodcates.pid,hg_goodcates.name,hg_good.good_name,hg_good.id,hg_good.application,hg_good.describe
					FROM hg_good left join hg_goodcates on hg_goodcates.id = hg_good.goodcates_id 
					left join hg_picture on hg_picture.id = hg_good.picture_id
					where hg_goodcates.pid = ".$cate[$i]['id']." LIMIT 8)";

				$array[] = "(SELECT hg_goodcates.pid,hg_order.good_name,(hg_order.good_nums*hg_order.weight) as total_weight,hg_order.company_name,hg_order.linkman
						FROM hg_order left join hg_good on hg_good.id = hg_order.good_id left join hg_goodcates on
						hg_goodcates.id=hg_good.goodcates_id  where hg_goodcates.pid =".$cate[$i]['id']." LIMIT 6)";
			}
		}

		$this->assign(
			'goods',
			M('Good')
			->field('hg_goodcates.pid,hg_goodcates.name,hg_good.good_name,hg_good.id,hg_good.application,hg_good.describe')/*hg_picture.path*/
			->join(array(
				//'left join hg_picture on hg_picture.id =  hg_good.picture_id',
				'left join hg_goodcates on hg_goodcates.id = hg_good.goodcates_id'
				))
			->where(array( 'hg_goodcates.pid'=>$cate[0]['id'] ))
			->limit(8)
			->union($union,true)
			->select()
		);

		$this->assign(
			'orders',
			M("order")
			->field('hg_goodcates.pid,hg_order.good_name,(hg_order.good_nums*hg_order.weight) as total_weight,hg_order.company_name,hg_order.linkman')
			->join(array(
				'left join hg_good on hg_good.id = hg_order.good_id',
				'left join hg_goodcates on hg_goodcates.id=hg_good.goodcates_id'
			))
			->where(array( 'hg_goodcates.pid'=>$cate[0]['id'] ))
			->limit(6)
			->union($array,true)
			->select()
		);

		/*$orders=M("order")
			->field('hg_goodcates.pid,hg_order.good_name,(hg_order.good_nums*hg_order.weight) as total_weight,hg_order.company_name,hg_order.linkman')
			->join(array(
				'left join hg_good on hg_good.id = hg_order.good_id',
				'left join hg_goodcates on hg_goodcates.id=hg_good.goodcates_id'
			))
			->where(array( 'hg_goodcates.pid'=>$cate[0]['id'] ))
			->limit(6)
			->union($array,true)
			->select();
		dump($orders);*/

		$this->assign(
			'cate',
			array_slice($cate,0, ($count < 7 ? $count : 7) )
		);

		$this->assign('apply',get_apply());

		//dump(S('sys_contact'));

		cookie('refer', 'http://' . $_SERVER ['HTTP_HOST'] );
        $this->display();
    }

}