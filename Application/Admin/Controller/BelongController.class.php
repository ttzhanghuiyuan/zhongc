<?php
namespace Admin\Controller;

class BelongController extends AdminController {

	private $table = 'belong';

	public function lists(){

		$fix=C('DB_PREFIX');

		$list = M($this->table)
				->join(
					array(
						'left join bm_translate on bm_translate.translate_concern_id = bm_belong.id',
						'left join bm_lang on bm_lang.id = bm_translate.translate_lang_id'
					)
				)
				->field(
					array(
						$fix.$this->table.'.id',
						$fix.$this->table.'.belong_name',
						$fix.$this->table.'.belong_pid',
						$fix.$this->table.'.belong_sort',
						$fix.'translate.translate_content',
						$fix.'lang.lang_name',
						$fix.'translate.translate_lang_id'
					)
				)
				->order('belong_sort desc')
				->select();
		set_redirect_url($_SERVER['REQUEST_URI']);
		$list = D('Common/Tree')->formatTree($list,'belong_name','id','belong_pid',0);

		$this->assign('list',$list);

		$this->display();

	}

	public function popbelong(){

		$fix=C('DB_PREFIX');

		$map['translate_lang_id'] = $_GET['lang'];

		if(!empty($_GET['b_id'])){
			$map[$fix.$this->table.'.id'] = array('neq',$_GET['b_id']);
			$map['belong_pid'] = array('neq',$_GET['b_id']);
		}


		$list = M($this->table)
				->join(
					array(
						'left join bm_translate on bm_translate.translate_concern_id = bm_belong.id',
						'left join bm_lang on bm_lang.id = bm_translate.translate_lang_id'
					)
				)
				->field(
					array(
						$fix.$this->table.'.id',
						$fix.$this->table.'.belong_name',
						$fix.$this->table.'.belong_pid',
						$fix.$this->table.'.belong_sort',
						$fix.'translate.translate_content',
						$fix.'lang.lang_name',
						$fix.'translate.translate_lang_id'
					)
				)
				->where ( $map )
				->order('belong_sort desc')
				->select();

		$list = D('Common/Tree')->formatTree($list,'belong_name','id','belong_pid',0);

		$this->assign('list',$list);

		$this->display('Common:popbelong');
		
	}

	public function edit(){

		if(IS_POST){

			$result = $this->common_edit($this->table,null,null,'',true);

			if($result['status']){

				$jump = $_POST['jump'];

				empty($jump) ? $this->success ( '保存成功') : $this->success ( '保存成功' , get_redirect_url() );
				
			}
			else{

				$this->error ( $result['data'] );
			}
		}
		else{

			$this->assign('info',M($this->table)->find($_GET['id']));

			/*$this->assign(
				'list',
				 D('Common/Tree')
				 ->formatTree(
				 	M($this->table)->order('belong_sort desc')->select(),
				 	'belong_name',
				 	'id',
				 	'belong_pid',
				 	0
				 )
			);*/

			$lang_assign = edit_lang_assign(2);

			!empty($lang_assign) && $this->assign('translate',$lang_assign);

			$this->display();
		}
	}

	public function add(){

		if(IS_POST){

			$result =$this->common_add($this->table,null,'',true);

			if($result['status']){

				$this->success ( '保存' . ' ' . ' ' .'成功', get_redirect_url() );
			}
			else{

				$this->error ( $result['data'] );
			}
		}
		else{

			$lang_assign = add_lang_assign(2);

			!empty($lang_assign) && $this->assign('translate',$lang_assign);

			$this->display('edit');
		}
	}

	public function del(){

		$list = M($this->table)->where(array('belong_pid'=>$_GET['id']))->field('id')->select();
        
        !empty($list) && $this->error('请先删除该分类下的子分类');
        

		$result = $this->common_del($this->table,null,null,true,true);

		if($result['status']){

			$this->success('删除成功');
		}
		else{
			$this->error('删除失败');
		}
	}

}