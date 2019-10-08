<?php

namespace Admin\Controller;

class SolventController extends AdminController {

	private $table = 'solvent';

	public function lists(){
		/*$listselect = I('listselect');

		if($listselect){
			$model = $this->getModel($this->table);
			$list_data = $this->_get_model_list($model);
			
			foreach($list_data['list_grids'] as &$vo) {
				if(($vo['title'] == '操作' || $vo['title'] == '@operation') && $vo['href']){
					$vo['href'] = '#|'.L('select');
					$vo['class'] = 'btn btn-info btn-list-select btn-xs';
					$vo['icon'] = '<i class="fa fa-check"></i>';
				}
			}

			$this->meta_title = TL($model['title']).' '.L('list');
			$this->assign($list_data);
			$this->display('Common:lists_select');
		}else{*/
			$this->common_lists($this->table,0,'Common:lists');
		/*}*/
	}

	public function add(){

		if(IS_POST){
			$result =$this->common_add($this->table,null,'',true);

			if($result['status']){

				$this->cache_solvent();

				$jump = U('lists');

				$this->success ( '保存' . ' ' . $model ['title'] . ' ' .'成功', $jump );
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
		//$this->common_del($this->table);
		$result = $this->common_del($this->table,null,null,true,true);
		if($result['status']){
			$this->cache_solvent();
			$this->success('删除成功');
		}
		else{
			$this->error('删除失败');
		}
	}

	public function edit(){
		if(IS_POST){
			$result = $this->common_edit($this->table,0,null,'',true);
			if($result['status']){

				$this->cache_solvent();

				$jump = U('lists');

				$this->success ( '保存' . ' ' . $model ['title'] . ' ' .'成功', $jump );
			}
			else{

				$this->error ( $result['data'] );
			}
		}
		else{
			$this->common_edit($this->table,null,'Common:edit');
		}
		
	}

	public function cache_solvent(){
		S('sys_solvent_list', null);
        S('sys_solvent_list',M($this->table)->select());
	}
}
