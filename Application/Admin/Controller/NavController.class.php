<?php

namespace Admin\Controller;

class NavController extends AdminController {

	private $table = 'nav';

	public function index(){

		$id = $_GET['menu'];

		if(!empty($id)){

			$item = M($this->table)->find($id);
			$this->assign('item',$item);

			if(!empty($item['nav_content'])){

				$this->assign('nav_content',json_decode($item['nav_content'],true));
			}
			
		}

		$this->assign('nav',M($this->table)->select());

		$this->display();
	}

	public function  lists(){

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
	}

	public function ajax_add_menu(){

		$result = M($this->table)
				->add(
					array(
						'nav_name' => $_POST['nav_name']
					)
				);
		if( false !== $result ){

			$this->ajaxreturn(array('status'=>1, 'info'=>'创建菜单成功', 'value'=>$result, 'text'=> $_POST['nav_name'] ));

		}else{

			$this->ajaxreturn(array('status'=>0,'info'=>'创建菜单失败'));
		}
	}

	public function tree($tree=null){

		$this->assign('tree', $tree);
		
        $this->display('tree');
	}

	public function ajax_save_menu(){

		$item = M($this->table)
				->where(
					array(
						'id' =>array('neq',$_POST['id']),
						'nav_pos_lang' => $_POST['pos']
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
						'nav_name' => $_POST['nav_name'],
						'nav_pos_lang' => $_POST['pos'],
						'nav_content' => $_POST['nav_content']
					)
				);
		if(false !== $result){

			$this->success('菜单设置成功');

		}else{

			$this->error('菜单设置失败');
		}

	}

	public function ajax_del_menu(){

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
