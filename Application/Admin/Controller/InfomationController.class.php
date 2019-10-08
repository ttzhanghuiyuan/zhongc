<?php

namespace Admin\Controller;

class InfomationController extends AdminController {

	private $table = 'infomation';

	public function index(){
		
		$model = $this->getModel($this->table);
//        $list_data =$this->_get_model_list($model);
        $list_data =$this->union_list($model);
		
		$this->assign('model',$model);

		$this->assign($list_data);
		
		set_redirect_url($_SERVER['REQUEST_URI']);

		//dump($list_data);

		$this->assign('is_hide_del',1);

		$this->display('Common:lists');
	}

	public function add(){
		if(IS_POST){

			$result =$this->common_add($this->table,null,'',true);

			if($result['status']){

				$jump = get_redirect_url();


				$this->success ( '保存' . ' ' . ' ' .'成功', $jump );
			}
			else{

				$this->error ( $result['data'] );
			}
		}
		else{

			$this->assign('nav_url',U('lists'));
			
		    $this->common_add($this->table,'Common:add');
		}
	}

	public function del(){

		$result = $this->common_del($this->table,null,null,true,true);

		if($result['status']){
			
			$this->success('删除成功');
		}
		else{
			$this->error('删除失败');
		}
	}

	public function edit(){
		if(IS_POST){

			$result = $this->common_edit($this->table,null,null,'',true);

			if($result['status']){

				$jump = get_redirect_url();

				$this->success ( '保存' . ' ' . $model ['title'] . ' ' .'成功',$jump);
			}
			else{

				$this->error ( $result['data'] );
			}
		}
		else{

			$this->common_edit($this->table,null,'Common:edit');
		}
	}

}
