<?php

namespace Home\Controller;

/**
 * 文档模型控制器
 * 文档模型列表和详情
 */
class ArticlesController extends HomeController {

	private $table = 'document';

    /* 文档模型频道页 */
	public function index(){

		$cate=M('Category')->where('pid=1')->order('id asc')->select();

		$map['category_id']=!empty(I('cate')) ? I('cate') : $cate[0]['id'];

		$map['hg_document.status']=1;

		$model = $this->getModel($this->table);
		
		//$list_data = $this->_get_front_join_list($model,0,'hg_document.create_time desc',$map);

		//dump($list_data);

		//$root=C('TMPL_PARSE_STRING.__IMG__');

		//dump($root);

		/*foreach($list_data['list_data'] as &$vo) {

			$vo['create_time']=time_format($vo['create_time'],'Y-m-d');
			$vo['description']=empty($vo['description']) ? '' : msubstr($vo['description'],0,110,"utf-8",false);
			$vo['path']=empty($vo['path'])?'<img class="img-lazyload" data-src="'.$root.'/timthumb.png" />':'<img class="img-lazyload"  data-src="'.$vo['path'].'" />';
			
		}
		unset($vo);*/
		
		$this->assign('cate',$map['category_id']);
		$this->assign('category',$cate);
		$this->assign(
			$this->_get_front_join_list($model,0,'hg_document.create_time desc',$map)
		);
		$this->display();
		
	}


	/* 文档模型详情页 */
	public function detail(){

		//$cate=M('Category')->where('id='.I('cate'))->find();

		$info=M($this->table)
		->join('left join hg_document_article on hg_document_article.id = hg_document.id')
		->field(array('hg_document_article.content','hg_document.title','hg_document.create_time'))
		->where('hg_document.id='.I('id'))->find();

		$info['create_time']=time_format($info['create_time'],'Y-m-d');

		//$after=M($this->table)->where("category_id=".I('cate')." and id < ".I('id'))->order('id desc')->find();
        //$front=M($this->table)->where("category_id=".I('cate')." and id > ".I('id'))->order('id asc')->find();

        //dump($after);

		$this->assign('info',$info);
		$this->assign(
			'cate',
			M('Category')->where('id='.I('cate'))->find()
		);

		$this->assign(
			'front',
			M($this->table)->where("category_id=".I('cate')." and id > ".I('id'))->order('id asc')->find()
		);
		$this->assign(
			'after',
			M($this->table)->where("category_id=".I('cate')." and id < ".I('id'))->order('id desc')->find()
		);


		$this->display();
		
	}

}
