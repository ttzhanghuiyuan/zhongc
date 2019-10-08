<?php

namespace Admin\Controller;

class CountController extends AdminController 
{
	public function lists()
	{


		
		$time=strtotime(date('Y-m-d',time()));

		$list_data = M('statistics')->where(array('createtime'=>$time))->find();
		$data = M('statistics')->order('createtime asc')->limit(10)->select();



		foreach ($data as $key=> $value) 
		{		
			foreach($value as $k=>$v)
			{
				
				if($k!='createtime')
				{
					$arr[$k][] = intval($value[$k]);
				}
				else
				{
					$arr[$k][] =  date("Y-m-d",$value['createtime']);
				}
				
			}

			// $arr['id'][] = $value['id'];
			// $arr['membership'][] = intval($value['membership']);
			// $arr['pageview'][] = intval($value['pageview']);
			// $arr['userview'][] = intval($value['userview']);
			// $arr['ipcount'][] = intval($value['ipcount']);
			// $arr['createtime'][] = date("Y-m-d",$value['createtime']);

		}

		
		$list_records = M('records')->where($map)->select();

		

		$list_records = M('records'); // 实例化User对象
		$map['_string'] = "FROM_UNIXTIME(`createtime`,'%Y-%m-%d') = '".date('Y-m-d',time())."'";// //自定义mysql条件
		$count      = $list_records->where($map)->count();// 查询满足要求的总记录数
		$Page       = new \Think\Page($count,20);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show       = $Page->show();// 分页显示输出



		// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$list = $list_records->where($map)->order('createtime desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		$this->assign('list',$list);// 赋值数据集
		$this->assign('page',$show);// 赋值分页输出


		$this->assign('list_data',$list_data);

		$this->assign('timevalue',I('payment_date'));

		$this->assign('data',json_encode($arr));
		$this->assign('list_records',$list_records);

		$this->display();

		

	}

}
