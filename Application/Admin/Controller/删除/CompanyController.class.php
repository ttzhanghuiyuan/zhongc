<?php

namespace Admin\Controller;

class CompanyController extends AdminController {

	private $table = 'company';

	public function index(){

		$company=M($this->table)->find(1);

		if($company){

			$this->edit();
			
		}
		else{
			$this->add();	
		}
	}

	public function add(){
		/*$this->common_add($this->table,'Common:add',U('index'));*/
		if(IS_POST){
			$result =$this->common_add($this->table,null,'',true);

			if($result['status']){

				$this->cache_company();

				$jump = U('index');

				$this->success ( '保存' . ' ' . $model ['title'] . ' ' .'成功', $jump );
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
		/*$this->common_edit($this->table,1,'Common:edit',U('index'));*/
		if(IS_POST){

			$result = $this->common_edit($this->table,null,null,'',true);

			if($result['status']){

				$this->cache_company();

				$jump = U('index');

				$this->success ( '保存' . ' ' . $model ['title'] . ' ' .'成功', $jump );
			}
			else{

				$this->error ( $result['data'] );
			}
		}
		else{
			$this->common_edit($this->table,1,'Common:edit');
		}
	}

	public function cache_company(){
		S('sys_company', null);
        S('sys_company',M($this->table)->find(1));
	}
}
