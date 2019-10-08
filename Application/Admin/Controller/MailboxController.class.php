<?php

namespace Admin\Controller;

class MailboxController extends AdminController {

	private $table = 'mailbox';

	public function index(){
		$mailbox=M($this->table)->find(1);
		if($mailbox){
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
