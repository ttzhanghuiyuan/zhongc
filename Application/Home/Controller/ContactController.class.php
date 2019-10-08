<?php

namespace Home\Controller;

class ContactController extends HomeController{

	public function index(){

		$fix = C('DB_PREFIX');

		if(empty($_GET['l'])){

			$l = cookie('l');
			if(empty($l)){
				$l = M('lang')->where( array('lang_tag'=>'zh_CN') )->find();
				$l = $l['id'];
				cookie('l',$l);
			}
		}else{
			cookie('l',$_GET['l']);
			$l = $_GET['l'];
		}

		$map['translate_lang_id'] = $l;

        //获取空间展示页banner
        $where_arr = ['sec.sec_type' => 1];
        $sec_banner = M('secondbanner')
            ->alias('sec')
            ->join('left join '.$fix.'picture pic on sec.second_img_url = pic.id')
            ->field('pic.path')
            ->where($where_arr)
            ->find();
        $banner_url = $sec_banner['path'];
        $router = 'Contact';
        $this->assign('router',$router);
        //$this->assign('bespoke',$bespoke);
		$this->assign('active',U('Index/index').'#active');
		$this->assign('about','#aboutus');
        $this->assign('banner_url',$banner_url);


		$this->display();
	}
	
}