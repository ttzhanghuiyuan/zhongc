<?php

namespace Home\Controller;

class InfoController extends HomeController{

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
        $where_arr = ['sec.sec_type' => 5];
        $sec_banner = M('secondbanner')
            ->alias('sec')
            ->join('left join '.$fix.'picture pic on sec.second_img_url = pic.id')
            ->field('pic.path')
            ->where($where_arr)
            ->find();
        $banner_url = $sec_banner['path'];

		//咨询中心
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

        foreach($infomation as &$item){
            $item['add_time'] = date('Y-m-d H:i',$item['info_add_time']);
        }
        $router = 'Info';
        $this->assign('router',$router);
        //$this->assign('bespoke',$bespoke);
		$this->assign('active',U('Index/index').'#active');
		$this->assign('about','#aboutus');
        $this->assign('banner_url',$banner_url);
        $this->assign('infomation',$infomation);


		$this->display();
	}

    //@desn:资讯详情
    //@date:2017-04-02
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

            $model = M('Model')->getByName('spaceshow');
            $where_arr = [
                'info.id' => $id,
                'translate_type' => $model['lang_flag']
            ];
            $info_detail = M('infomation')
                ->alias('info')
                ->join('left join '.$fix.'picture pic on pic.id = info.info_img')
                ->join('left join '.$fix.'translate tra on tra.translate_concern_id = info.id')
                ->field('info.*,pic.path')
                ->where($where_arr)
                ->find();
            /*echo '<pre>';
            var_dump($info_detail);
            exit;*/
            $info_detail['add_time'] = date('Y-m-d H:i',$info_detail['info_add_time']);

            //获取空间展示页banner
            $where_arr = ['sec.sec_type' => 2];
            $sec_banner = M('secondbanner')
                ->alias('sec')
                ->join('left join ' . $fix . 'picture pic on sec.second_img_url = pic.id')
                ->field('pic.path')
                ->where($where_arr)
                ->find();
            $banner_url = $sec_banner['path'];
            $router = 'Info';
            $this->assign('router',$router);
            $this->assign('banner_url', $banner_url);
            $this->assign('info_detail', $info_detail);
            $this->display();
        } else {
            $this->error('未知错误!');
        }
    }
	
}