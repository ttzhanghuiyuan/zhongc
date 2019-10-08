<?php

namespace Home\Controller;

class IndexController extends HomeController{

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

		/* banner 图 */
		/*$banners = M('banner')->join(
			['left join '.$fix.'picture pic on pic.id = '.$fix.'banner.banner_pic']
		)->field(
			[
				$fix.'banner.banner_url',
				$fix.'banner.banner_name',
				'pic.path'
            ]
		)->order( $fix.'banner.banner_sort desc' )
		->select();*/


		//首页banner图
        $advs = M('banner')
            ->alias('b')
            ->join('left join '.$fix.'picture pic on pic.id = b.banner_pic')
            ->field('b.banner_url,b.banner_name,pic.path')
            ->order('b.banner_sort asc')
            ->select();

		/*空间展示*/
		$model =  M ( 'Model' )->getByName ( 'spaceshow' );
		$map['translate_type'] = $model['lang_flag'];

		$spaceshows = M('spaceshow')->join(
			array(
				'left join '.$fix.'translate translate on translate.translate_concern_id = '.$fix.'spaceshow'.'.id',
				'left join '.$fix.'picture pic on pic.id = '.$fix.'spaceshow.spaceshow_pic'
			)
		)->field(
			array(
				$fix.'spaceshow.id',
				$fix.'spaceshow.spaceshow_title',
				$fix.'spaceshow.spaceshow_url',
				'pic.path'
			)
		)->where($map)
		->limit(6)
		->order( $fix.'spaceshow.spaceshow_sort desc' )
		->select();

		/*公司重大事件*/
		/*$model =  M ( 'Model' )->getByName ( 'history' );
		$map['translate_type'] = $model['lang_flag'];

		$history = M('history')->join(
			array(
				'left join '.$fix.'translate translate on translate.translate_concern_id = '.$fix.'history'.'.id'
			)
		)->field(
			array(
				$fix.'history.history_tile',
				$fix.'history.history_time',
				$fix.'history.history_content'
			)
		)->order('history_time asc')
		->where($map)
		->select();

		foreach ($history as &$v) {

			$v['date_time']  = date('d/m/Y',$v['history_time']);
			$v['time']  = date('Y-m',$v['history_time']);
			$v['history_time'] = date('y/m',$v['history_time']);

		}
		unset($v);*/

		//关于我们
        $model =  M ( 'Model' )->getByName ( 'aboutus' );
        $map['translate_type'] = $model['lang_flag'];
        $about_us = M('aboutus')
            ->alias('au')
            ->join('left join '.$fix.'picture pic on pic.id = au.aboutus_pics')
            ->join('left join '.$fix.'translate tra on tra.translate_concern_id = au.id')
            ->field('au.aboutus_content,pic.path')
            ->where($map)
            ->limit(1)
            ->order('au.id desc')
            ->find();

        //团队
        $model =  M ( 'Model' )->getByName ( 'worker' );
        $map['translate_type'] = $model['lang_flag'];
        $worker = M('worker')
            ->alias('w')
            ->join('left join '.$fix.'picture pic on w.worker_img = pic.id')
            ->join('left join '.$fix.'translate tra on tra.translate_concern_id = w.id')
            ->field('w.id,w.worker_name,pic.path,w.worker_brief,w.worker_position')
            ->where($map)
            ->limit(4)
            ->order('w.worker_sort')
            ->select();

        //资讯中心
        $model =  M ( 'Model' )->getByName ( 'infomation' );
        $map['translate_type'] = $model['lang_flag'];
        $infomation = M('infomation')
            ->alias('info')
            ->join('left join '.$fix.'picture pic on info.info_img = pic.id')
            ->join('left join '.$fix.'translate tra on tra.translate_concern_id = info.id')
            ->field('info.id,info.info_title,info.info_add_time,pic.path')
            ->where($map)
            ->limit(4)
            ->order('info.id desc')
            ->select();
		/* 公司近期活动 */

		/*$model =  M ( 'Model' )->getByName ( 'act' );
		$map['translate_type'] = $model['lang_flag'];

		$acts = M('act')
		->join(
			array(
				'left join '.$fix.'translate translate on translate.translate_concern_id = '.$fix.'act'.'.id',
				'left join '.$fix.'picture pic on pic.id = '.$fix.'act.act_pic'
			)
		)
		->field(
			array(
				$fix.'act.act_title',
				$fix.'act.act_time',
				$fix.'act.act_content',
				'pic.path'
			)
		)
		->where($map)
		->limit(6)
		->order( $fix.'act.act_time desc' )
		->select();*/

		//dump(date('d/m/Y',time()));
                $router = 'Index';
                $this->assign('router',$router);


//		$this->assign('banners',$banners);
		$this->assign('advs',$advs);
		$this->assign('spaceshows',$spaceshows);
//		$this->assign('history',$history);
//		$this->assign('acts',$acts);
        $this->assign('about_us',$about_us);
        $this->assign('worker',$worker);
        $this->assign('infomation',$infomation);

		$this->assign('active','#active');
		$this->assign('about',U('About/index').'#aboutus');

		if(isMobile()){
        	$this->assign('is_fullpage',false);
        }else{
        	$this->assign('is_fullpage',true);
        }


		$this->display();
	}
	
}
