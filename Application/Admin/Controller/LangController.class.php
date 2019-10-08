<?php

namespace Admin\Controller;

class LangController extends AdminController {

	private $table = 'lang';

	public function lists(){
		
		$model = $this->getModel($this->table);
		$list_data =$this->union_list($model);
		
		$this->assign('model',$model);

		$this->assign($list_data);

		$this->assign('is_hide_del',1);
		
		set_redirect_url($_SERVER['REQUEST_URI']);

		$this->display('Common:lists');
	}

	public function add(){

		if(IS_POST){

			$info = M($this->table)->where(array('lang_tag'=>$_POST['lang_tag']))->find();

			!empty($info) && $this->error('该种语言已添加');

			$result =$this->common_add($this->table,null,'',true);

			if($result['status']){

				$this->cache_lang();

				$jump = get_redirect_url();

				$this->success ( '保存' . ' ' . ' ' .'成功', $jump );
			}
			else{

				$this->error ( $result['data'] );
			}
		}
		else{
			
		    $this->display('edit');
		}
	}

	public function del(){

		$result = $this->common_del($this->table,null,null,true,true);

		if($result['status']){

			$this->cache_lang();
			
			$this->success('删除成功');
		}
		else{
			$this->error('删除失败');
		}
	}

	public function edit(){

		if(IS_POST){

			$info = M($this->table)->where(array('lang_tag'=>$_POST['lang_tag'],'id'=>array('neq',$_POST['id'])))->find();

			!empty($info) && $this->error('已存在该种语言,不能更换语言标签');

			$result = $this->common_edit($this->table,null,null,'',true);

			if($result['status']){

				M('translate')->where(array('translate_lang_id'=>$_POST['id']))
            	->save(array( 'translate_lang_tag' => $_POST['lang_tag'] ));

				$this->cache_lang();

				$jump = get_redirect_url();

				$this->success ( '保存' . ' ' . $model ['title'] . ' ' .'成功',$jump);
			}
			else{

				$this->error ( $result['data'] );
			}
		}
		else{
			
			$this->assign('info',M($this->table)->find($_GET['id']));

			$this->display();
		}
	}

	public function cache_lang(){

		unset($_REQUEST);

		S('sys_lang', null);
		S('sys_lang',M($this->table)->select());

	}

}
