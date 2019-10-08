<?php

namespace Home\Controller;

/**
 * 文档模型控制器
 * 文档模型列表和详情
 */
class HelpcenterController extends HomeController {

	private $table = 'document';

    /* 文档模型频道页 */
	public function index(){

		//pid=48
		/*$map['category_id']=!empty(I('cate')) ? I('cate') : $cate[0]['id'];

		$map['hg_document.status']=1;

		$model = $this->getModel($this->table);
		
		$list_data = $this->_get_front_join_list($model,0,'hg_document.create_time desc',$map);

		$root=C('TMPL_PARSE_STRING.__IMG__');

		foreach($list_data['list_data'] as &$vo) {

			$vo['create_time']=time_format($vo['create_time'],'Y-m-d');
			$vo['description']=empty($vo['description']) ? '' : msubstr($vo['description'],0,110,"utf-8",false);
			$vo['path']=empty($vo['path'])?'<img src="'.$root.'/timthumb.png" />':'<img src="'.$vo['path'].'" />';
			
		}
		unset($vo);
		
		$this->assign('cate',$map['category_id']);
		$this->assign('category',$cate);
		$this->assign($list_data);*/
		$cates=M('Category')
		->field(array('id','title'))
		->where('pid=48')->order('id asc')->select();

		$ids = array();  
		$ids = array_map('array_shift', $cates);
		//dump($ids);  

		$map['category_id']=array('in',$ids);
		$map['hg_document.status']=1;

		$list=M($this->table)
		->field(array('id','title','category_id'))
		->where($map)
		->select();

		$id = empty(I('id')) ? $list[0]['id'] : I('id','intval');
		$cate_id = empty(I('cate')) ? $ids[0] : I('cate','intval');

		$info=M($this->table)
		->join('left join hg_document_article on hg_document_article.id = hg_document.id')
		->field( array('hg_document_article.content','hg_document.title') )
		->where('hg_document.id='.$id)->find();
		
		//dump($list);

		$this->assign('cates',$cates);
		$this->assign('list',$list);

		$this->assign('id',$id);
		$this->assign('cate_id',$cate_id);
		$this->assign('info',$info);

		$this->display();
		
	}


	
	public function feedback(){
		if(IS_POST){
			
			$result =$this->common_add("feedback",null,'',true);

			if($result['status']){

				$this->success ( '发表成功'  );

			}else{
				$this->error ( $result['data'] );
			}
		}
		else{
			$cates=M('Category')
			->field(array('id','title'))
			->where('pid=48')->order('id asc')->select();

			$ids = array();  
			$ids = array_map('array_shift', $cates);

			$map['category_id']=array('in',$ids);
			$map['hg_document.status']=1;

			$list=M($this->table)
			->field(array('id','title','category_id'))
			->where($map)
			->select();

			$this->assign('cates',$cates);
			$this->assign('list',$list);


			$this->display();
		}	
	}

}
