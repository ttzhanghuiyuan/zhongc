<?php
namespace Admin\Widget;
use Think\Controller;

class DropdownWidget extends Controller
{
	public function lists($table)
	{
        $list=M($table)->where("pid=0")->order('sort desc')->field('id,name')->select();
        $this->assign('tb',$table);
        $this->assign('list',$list);
        /*dump($table);*/
        $this->display('Dropdown:lists');  
	}

}

?>