<?php

namespace Home\Widget;
use Think\Action;

class GoodcateWidget extends Action{
	
	public function lists(){
		//dump(get_cate());
		//dump('__ROOT__');
		$this->assign('list',get_cate());
		$this->display('Category/catelist');
	}

	public function mobilelists(){
		$this->assign('list',get_cate());
		$this->display('Category/mobilelists');
	}
	
}
