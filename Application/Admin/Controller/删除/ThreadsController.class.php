<?php

namespace Admin\Controller;

class ThreadsController extends AdminController {

	private $table = 'threads';

	public function lists(){
		
		$model = $this->getModel($this->table);
		$list_data =$this->union_list($model);

		$this->assign('model',$model);
		$this->assign('is_hide_add',1);

		$this->assign($list_data);
		$this->display('Common:lists');
	}

	public function add(){
		if(IS_POST){

			/*$position = $_POST['essay_position'];
			
			if(is_array($position)){
				$pos = 0;
				foreach ($position as $key => $value){
					$pos += $value;
				}

				$_POST['essay_position'] = $pos;
			}*/

			$result =$this->common_add($this->table,null,'',true);

			if($result['status']){

				$jump = U('lists');

				$this->success ( '保存' . ' ' . ' ' .'成功', $jump );
			}
			else{

				$this->error ( $result['data'] );
			}
		}
		else{
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

			/*$position = $_POST['essay_position'];
			
			if(is_array($position)){
				$pos = 0;
				foreach ($position as $key => $value){
					$pos = $pos + $value;
				}

				$_POST['essay_position'] = strval($pos);
			}*/

			$result = $this->common_edit($this->table,null,null,'',true);

			if($result['status']){

				$jump = U('lists');

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

	/*private function getposition(){
		$position = I('post.essay_position');

		if(!is_array($position)){
			return $position;
		}else{
			$pos = 0;
			foreach ($position as $key=>$value){
               	$pos += $value;		//将各个推荐位的值相加
            }
            return $pos;
       }
	}*/

}
