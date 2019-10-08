<?php

namespace Home\Controller;

class ContentController extends HomeController{

	public function index(){

		$fix = C('DB_PREFIX');

		if(empty($_GET['l'])){

			$l = cookie('l');

			$map['translate_lang_id'] = $l;

			if(empty($l)){

				$l = M('lang')->where( array('lang_tag'=>'zh_CN') )->find();
				$l = $l['id'];

				$map['translate_lang_id'] = $l;
				
				cookie('l',$l);
			}

		}else{

			cookie('l',$_GET['l']);
			$l = $_GET['l'];
		}

		

		if(empty( $_GET['m'] )){

			$this->assign('title',get_trans('law'.'_'.$l));

			$webcontent = M('webcontent')->find();

			$this->assign('content', ( $l == 1 ? $webcontent['webcontent_law'] : $webcontent['webcontent_law_en'])  );

		}else {

			$model =  M ( 'Model' )->getByName ( $_GET['m'] );
			$map['translate_type'] = $model['lang_flag'];

			$map['translate_concern_id'] = $_GET['id'];

			$translate = M('translate')
			->field(
				array(
					$fix.'translate.translate_content',
				)
			)
			->where($map)
			->find();

			$translate = json_decode($translate['translate_content'],true);


			if(empty($translate[$l])){

				$this->assign('is_empty',1);

			}else{



				$spaceshow = M('spaceshow')->find($translate[$l]);

				//dump($spaceshow);

				$this->assign('title',$spaceshow['spaceshow_title']);
				$this->assign('content',$spaceshow['spaceshow_content']);

			}

		}

		$this->assign('active',U('Index/index').'#active');
		$this->assign('about',U('About/index').'#aboutus');


		$this->display();
	}
	
}