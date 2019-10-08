<?php

namespace Home\Controller;
/*use Think\Controller;*/
use Common\Controller\CommonController;
/*use Common\Library\SMS\SendSMS;*/

/**
 * 前台公共控制器
 * 为防止多分组Controller名称冲突，公共Controller名称统一使用分组名称
 */
class HomeController extends CommonController {

	protected function _initialize(){

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


		/*友情链接*/

		$model =  M ( 'Model' )->getByName ( 'links' );
		$map['translate_type'] = $model['lang_flag'];

		$links = M('links')
		->join(
			array(
				'left join '.$fix.'translate translate on translate.translate_concern_id = '.$fix.'links'.'.id',
			)
		)
		->field(
			array(
				$fix.'links.links_name',
				$fix.'links.links_url',
			)
		)
		->where($map)
		->select();

		/*联系*/
		$model =  M ( 'Model' )->getByName ( 'contact' );
		$map['translate_type'] = $model['lang_flag'];

		$contact = M('contact')
            ->alias('c')
            ->join('left join '.$fix.'translate tra on tra.translate_concern_id = c.id')
            ->join('left join '.$fix.'picture pic on c.wechat_qrcode_img = pic.id')
            ->field('c.*,pic.path')
            ->order('id desc')
            ->find();

		//dump($contact);

		$webcontent = M('webcontent')
		->join(
			array(
				'left join '.$fix.'picture rcode on rcode.id = '.$fix.'webcontent.webcontent_rcode',
				'left join '.$fix.'picture logo on logo.id = '.$fix.'webcontent.webcontent_logo'
			)
		)
		->field(
			array(
				$fix.'webcontent.webcontent_tel',
				$fix.'webcontent.webcontent_law',
				$fix.'webcontent.webcontent_law_en',
				'rcode.path as rcode_path',
				'logo.path as logo_path'
			)
		)
		->find();

		$lang = M('lang')->where(array('lang_tag'=>'zh_CN'))->find();
		$nav = M('nav')->where(array('nav_pos_lang'=>$l.'_1'))->find();
		$nav = json_decode($nav['nav_content'],true);

		$this->assign('links',$links);
		$this->assign('webcontent',$webcontent);
		$this->assign('contact',$contact);
//		print_r($nav);
		$this->assign('nav',$nav);

		$this->assign('lang',M('lang')->select());



		$config = api('Config/lists');
        C($config); //添加配置
        if(!C('WEB_SITE_CLOSE')){
            $this->error('站点已经关闭，请稍后访问~');
        }

        
	}


	public function book(){

		if(!preg_match('/^(1(([35][0-9])|(47)|[8][0126789]))\d{8}$/',$_POST['mobile'])){

			$this->ajaxReturn(

				array(
					'status' => 0 ,
					'info'  => '手机格式不正确'
				)
			);
		}

		$res = M('book')->add(

			array(
				'book_time' => strtotime( $_POST['time'] ),
				'book_times' => $_POST['times'],
				'book_name' => $_POST['name'],
				'book_mobile' => $_POST['mobile']

			)
		);

		if(false !== $res){

			$this->ajaxReturn(
				array(
					'status' => 1
				)
			);

		}else{

			$this->ajaxReturn(

				array(
					'status' => 0 ,
					'info'  => '网络繁忙'
				)
			);

		}
	}




}