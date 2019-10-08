<?php

namespace Admin\Controller;

class HistoryController extends AdminController {

	

	public function index()
	{
		
		$Dao = M('statistics');
		$where['createtime'] = array('between',array(strtotime(I('min_time')),strtotime(I('max_time'))));
		$data = $Dao->where($where)->order('createtime DESC')->select();



		$list_records = M('records'); // 实例化User对象
		$map['_string'] = "FROM_UNIXTIME(`createtime`,'%Y-%m-%d') between '".I('min_time')."' and "."'".I('max_time')."'";// //自定义mysql条件
		$count      = $list_records->where($map)->count();// 查询满足要求的总记录数
		$Page       = new \Think\Page($count,20);// 实例化分页类 传入总记录数和每页显示的记录数(25)
		$show       = $Page->show();// 分页显示输出
		// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$list = $list_records->where($map)->order('createtime desc')->limit($Page->firstRow.','.$Page->listRows)->select();




		foreach($data as $v)
		{	
			foreach($v as $key=>$vo)
			{
				if($key!="id")
				{	
					$list_data[$key] +=$v[$key];
				}
			}
		}

		$this->assign('min_time',I('min_time'));
		$this->assign('max_time',I('max_time'));
		$this->assign('page',$show);
		$this->assign('list',$list);
		$this->assign('list_data',$list_data);
		$this->display();
	}
		
	

	
}
