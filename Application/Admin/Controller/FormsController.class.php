<?php

namespace Admin\Controller;

class FormsController extends AdminController {

	private $table = 'forms';

	public function index(){

		$id = $_GET['forms'];

		if(!empty($id)){

			$item = M($this->table)->find($id);
			$this->assign('item',$item);

			if(!empty($item['forms_struct'])){
				//dump(json_decode($item['forms_struct'],true));
				$this->assign('forms_struct',json_decode($item['forms_struct'],true));
			}
			
		}

		$this->assign('forms',M($this->table)->select());

		$this->display();
	}

	/*public function  lists(){

		$table = $_GET['model'];
		
		$model = $this->getModel($table);
		
		$list_data = $this->_sql_select($model,0,10,null,'id desc',null,null,null,'_list_grid',true, '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
		
		foreach ($list_data['list_data'] as &$vo) {

			$vo['name'] = array_pop($vo);
		}

		unset($vo);
		
		$this->assign($list_data);

		exit($this->fetch('lists'));

	}

	public function ajax_search(){

		empty($_GET['key']) && exit($this->fetch('ajaxsearch'));

		$table = $_GET['model'];
		
		$model = $this->getModel($table);

		$key= explode(':',$model['search_key']);
		$key = $key[0];

		$map[$key] = array('like',"%{$_GET['key']}%");
		
		$list_data = $this->_sql_select($model,0,10,null,'id desc',$map,null,null,'_list_grid',true, '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
		
		foreach ($list_data['list_data'] as &$vo) {

			$vo['name'] = array_pop($vo);
		}
		
		unset($vo);
		
		$this->assign($list_data);

		exit($this->fetch('ajaxsearch'));
	}*/

	public function ajax_add_form(){

		$result = M($this->table)
				->add(
					array(
						'forms_name' => $_POST['form_name']
					)
				);
		if( false !== $result ){

			$this->ajaxreturn(array('status'=>1, 'info'=>'创建菜单成功', 'value'=>$result, 'text'=> $_POST['form_name'] ));

		}else{

			$this->ajaxreturn(array('status'=>0,'info'=>'创建菜单失败'));
		}
	}

	public function lists($lists=null){

		$this->assign('lists', $lists);
		
        $this->display('lists');
	}

	public function ajax_save_form(){

		$item = M($this->table)
				->where(
					array(
						'id' =>array('neq',$_POST['id']),
						'forms_lang' => $_POST['pos']
					)
				)
				->find();

		if(!empty($item)){

			$this->error('该位置的菜单已经设置,请另选其他的位置');
		}

		$result = M($this->table)
				->where(
					array(
						'id' => $_POST['id']
					)
				 )
				->save(
					array(
						'forms_name' => $_POST['forms_name'],
						'forms_lang' => $_POST['pos'],
						'forms_struct' => $_POST['forms_struct']
					)
				);
		if(false !== $result){

			$this->success('菜单设置成功');

		}else{

			$this->error('菜单设置失败');
		}

	}

	public function ajax_del_form(){

		$result = M($this->table)
				->where(array('id' => $_POST['id']))
				->delete();

		if($result){

			$this->success('菜单删除成功',U('index'));

		}else{

			$this->error('菜单删除失败');
		}
	}



}
