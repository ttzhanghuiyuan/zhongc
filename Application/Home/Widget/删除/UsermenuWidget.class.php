<?php

namespace Home\Widget;
use Think\Action;

class UsermenuWidget extends Action{
	
	public function lists(){
		$this->display('Usermenu/lists');
	}

	public function userhead(){
		$this->display("Usermenu/userhead");
	}
	
}
