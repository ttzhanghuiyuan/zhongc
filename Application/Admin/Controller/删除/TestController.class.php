<?php

namespace Admin\Controller;

class TestController extends AdminController {

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

}
