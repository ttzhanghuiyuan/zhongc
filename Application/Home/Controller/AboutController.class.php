<?php

namespace Home\Controller;

class AboutController extends HomeController{

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
        $where_arr = ['sec.sec_type' => 3];
        $sec_banner = M('secondbanner')
            ->alias('sec')
            ->join('left join '.$fix.'picture pic on sec.second_img_url = pic.id')
            ->field('pic.path')
            ->where($where_arr)
            ->find();
        $banner_url = $sec_banner['path'];

		//关于我们
		$model =  M ( 'Model' )->getByName ( 'aboutus' );
		$map['translate_type'] = $model['lang_flag'];

		$aboutus = M('aboutus')
            ->alias('a')
		    ->join('left join '.$fix.'translate tra on tra.translate_concern_id = a.id')
		    ->field('a.aboutus_title,a.aboutus_pics,a.aboutus_content')
		    ->where($map)
		    ->find();

		$aboutus_img = empty($aboutus['aboutus_pics']) ? null : M()->query('select id,path from '.$fix.'picture where id in ('.$aboutus['aboutus_pics'].') order by field(id,'.$aboutus['aboutus_pics'].')') ;


		/* 公司成员 */
		/*$model =  M ( 'Model' )->getByName ( 'worker' );
		$map['translate_type'] = $model['lang_flag'];
		$workers = M('worker')
		->join(
			array(
				'left join '.$fix.'translate translate on translate.translate_concern_id = '.$fix.'worker'.'.id',
				'left join '.$fix.'picture pic on pic.id = '.$fix.'worker.worker_img'
			)
		)
		->field(
			array(
				$fix.'worker.worker_name',
				$fix.'worker.worker_brief',
				'pic.path','w.worker_position'
			)
		)
		->where($map)
		->order( $fix.'worker.worker_sort desc' )
		->select();*/

		//企业风采
        $adv = M('adv')
            ->alias('a')
            ->join('left join '.$fix.'picture pic on pic.id = a.adv_pic')
            ->field('pic.path,@count:=1 as count')
            ->order('a.id desc')
            ->limit(6)
            ->select();
        $count = 0;
        foreach($adv as &$item){
            $item['count'] = $count++;
        }

        //团队
        $model =  M ( 'Model' )->getByName ( 'worker' );
        $map['translate_type'] = $model['lang_flag'];
        $worker = M('worker')
            ->alias('w')
            ->join('left join '.$fix.'picture pic on w.worker_img = pic.id')
            ->join('left join '.$fix.'translate tra on tra.translate_concern_id = w.id')
            ->field('w.id,w.worker_name,pic.path,w.worker_brief,w.worker_position')
            ->where($map)
            ->limit(5)
            ->order('w.worker_sort')
            ->select();

		/*合作伙伴*/
		$partners = M('partner')
            ->alias('p')
            ->join('left join '.$fix.'picture pic on pic.id = p.partner_img')
            ->field('p.partner_name,pic.path')
            ->order( 'p.partner_sort desc' )
            ->limit(16)
            ->select();

		/*预约背景图*/
		/*$bespoke = M('bespoke')
		->join(
			array(
				'left join '.$fix.'picture pic on pic.id = '.$fix.'bespoke.bespoke_pic'
			)
		)
		->field(
			array(
				'pic.path'
			)
		)
		->find();*/
                $router = 'About';
                $this->assign('router',$router);


		$this->assign('aboutus',$aboutus);
		$this->assign('aboutus_img',$aboutus_img);
		$this->assign('workers',$workers);
		$this->assign('partners',$partners);
        //$this->assign('bespoke',$bespoke);
		$this->assign('active',U('Index/index').'#active');
		$this->assign('about','#aboutus');
        $this->assign('banner_url',$banner_url);
        $this->assign('adv',$adv);
        $this->assign('worker',$worker);


        $this->display();
    }


    //@desn:团队成员详情
    //@date:2017-04-16
    //@author:yuan<turing_zhy@163.com>
    public function detail()
    {
        $id = I('get.id');
        if ($id) {
            $fix = C('DB_PREFIX');

            if (empty($_GET['l'])) {

                $l = cookie('l');

                if (empty($l)) {

                    $l = M('lang')->where(array('lang_tag' => 'zh_CN'))->find();
                    $l = $l['id'];

                    cookie('l', $l);
                }

            } else {

                cookie('l', $_GET['l']);
                $l = $_GET['l'];
            }

            $map['translate_lang_id'] = $l;

            $model = M('Model')->getByName('worker');
            $where_arr = [
                'w.id' => $id,
                'translate_type' => $model['lang_flag']
            ];
            $worker_detail = M('worker')
                ->alias('w')
                ->join('left join ' . $fix . 'picture pic on pic.id = w.worker_img')
                ->join('left join ' . $fix . 'translate tra on tra.translate_concern_id = w.id')
                ->field('w.*,pic.path')
                ->where($where_arr)
                ->find();

            //获取空间展示页banner
            $where_arr = ['sec.sec_type' => 3];
            $sec_banner = M('secondbanner')
                ->alias('sec')
                ->join('left join ' . $fix . 'picture pic on sec.second_img_url = pic.id')
                ->field('pic.path')
                ->where($where_arr)
                ->find();
            $banner_url = $sec_banner['path'];

            $this->assign('banner_url', $banner_url);
            $this->assign('worker_detail', $worker_detail);
            $this->display();
        } else {
            $this->error('未知错误!');
        }

    }

}
