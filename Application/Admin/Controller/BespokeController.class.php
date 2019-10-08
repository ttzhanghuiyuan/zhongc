<?php

namespace Admin\Controller;

class BespokeController extends AdminController {

	private $table = 'bespoke';

	public function index(){
		$bespoke=M($this->table)->find(1);
		if($bespoke){
			//dump(think_decrypt($mailbox['email_pwd']));
			$this->edit();
			
		}
		else{
			$this->add();	
		}
	}

	public function add(){
		$this->common_add($this->table,'Common:add',U('index'));
	}

	public function del(){
		$this->common_del($this->table);
	}

	public function edit(){
		$this->common_edit($this->table,1,'Common:edit',U('index'));
		
	}
}
