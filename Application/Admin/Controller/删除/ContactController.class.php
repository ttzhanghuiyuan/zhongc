<?php

namespace Admin\Controller;

class ContactController extends AdminController {

	private $table = 'contact';

	public function index(){
		$contact=M($this->table)->find(1);
		if($contact){
			//dump(think_decrypt($mailbox['email_pwd']));
			$this->edit();
			
		}
		else{
			$this->add();
			
		}
	}

	public function add(){
		//$this->common_add($this->table,'Common:add',U('index'));
		if(IS_POST){
			$result =$this->common_add($this->table,null,'',true);

			if($result['status']){

				$this->cache_contact();

				$jump = U('index');

				$this->success ( '保存' . ' ' . $model ['title'] . ' ' .'成功', $jump );/**/
			}
			else{

				$this->error ( $result['data'] );
			}
		}
		else{
			//$this->assign('nav_url',U('lists'));
		    $this->common_add($this->table,'Common:add');
		}
	}

	public function del(){
		$this->common_del($this->table);
	}

	public function edit(){
		//$this->common_edit($this->table,1,'Common:edit',U('index'));
		if(IS_POST){

			$result = $this->common_edit($this->table,null,null,'',true);

			if($result['status']){

				$this->cache_contact();

				$jump = U('index');

				$this->success ( '保存' . ' ' . $model ['title'] . ' ' .'成功', $jump );/**/
			}
			else{

				$this->error ( $result['data'] );
			}
		}
		else{
			$this->common_edit($this->table,1,'Common:edit');
		}
	}

	public function cache_contact(){
		S('sys_contact', null);
        S('sys_contact',M($this->table)->find());
	}

}
