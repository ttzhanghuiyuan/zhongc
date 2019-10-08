<?php

namespace Admin\Controller;

class GradeController extends AdminController {

	private $table = 'grade';

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
			//$this->common_lists($this->table,0,'Common:lists');
		/*}*/

		/*$model = $this->getModel($this->table);
		//dump($model);
		$list_data = $this->_get_join_list($model);

		//dump($list_data);	
		
		foreach($list_data['list_data'] as &$vo) {
			$vo['path'] = '<img class="img-lazyload" data-src="'.$vo["path"].'" />';
		}

		unset($vo);*/
		$model = $this->getModel($this->table);
		$list_data =$this->_get_model_list($model);

		//dump(dirname(dirname(__FILE__)));

		$this->assign('model',$model);

		$this->assign($list_data);
		$this->display('Common:lists');
	}

	public function add(){
		//$this->common_add($this->table,'Common:add');
		if(IS_POST){
			$result =$this->common_add($this->table,null,'',true);

			if($result['status']){

				//$this->cache_banner();

				$jump = U('lists');

				$this->success ( '保存' . ' ' . ' ' .'成功', $jump );/*. $model ['title'] */
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
		//$this->common_del($this->table);
		$result = $this->common_del($this->table,null,null,true,true);

		if($result['status']){

			//$this->cache_banner();
			
			$this->success('删除成功');
		}
		else{
			$this->error('删除失败');
		}
	}

	public function edit(){
		//$this->common_edit($this->table,null,'Common:edit');
		if(IS_POST){

			$result = $this->common_edit($this->table,null,null,'',true);

			if($result['status']){

				//$this->cache_banner();

				$jump = U('lists');

				$this->success ( '保存' . ' ' . $model ['title'] . ' ' .'成功',$jump);/*, $jump */
			}
			else{

				$this->error ( $result['data'] );
			}
		}
		else{
			$this->common_edit($this->table,null,'Common:edit');
		}
	}

	public function cache_banner(){

		
		
		/*$list=$this->_get_join_list($this->getModel('banner'),0,'sort desc') ;
       
		$banners['list_data'] = $list['list_data'];
		$banners['count'] = $list['count'];*/

		unset($_REQUEST);

		S('sys_banner', null);
		S('sys_banner',$this->union_list($this->getModel('banner'),0,'sort desc'));
	}


}
