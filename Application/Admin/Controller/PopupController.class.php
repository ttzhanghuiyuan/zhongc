<?php

namespace Admin\Controller;

class PopupController extends AdminController {

	public function lists(){
		
		$model = $this->getModel($_GET['extra']);
		$list_data =$this->_pop_union_list($model);

		$this->assign('model',$model);

		$this->assign($list_data);

		set_pop_redirect_url($_SERVER['REQUEST_URI']);

		$this->display('Common:listpop');
	}

	public function fulllist(){

		$model = $this->getModel($_GET['extra']);

		$list_data = $this->_get_pop_list($model);

		$this->assign('model',$model);
		
		$this->assign($list_data);

		$this->display('Common:listfull');
	}

	public function add(){
		if(IS_POST){

			$result = $this->common_add(null,null,'',true);

			if($result['status']){

				$jump = get_pop_redirect_url();//U('lists',array('extra'=>$_REQUEST['model']));

				$this->success ( '保存' . ' ' . ' ' .'成功', $jump );
			}
			else{

				$this->error ( $result['data'] );
			}
		}
		else{
		    $this->common_add(null,'Common:popadd');
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


			$result = $this->common_edit(null,null,null,'',true);

			if($result['status']){

				$jump = get_pop_redirect_url();//U('lists');

				$this->success ( '保存' . ' ' . $model ['title'] . ' ' .'成功',$jump);
			}
			else{

				$this->error ( $result['data'] );
			}
		}
		else{
			$this->common_edit(null,null,'Common:popedit');
		}
	}

}
