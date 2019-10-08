<?php

namespace Home\Controller;

class SpaceController extends HomeController{

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

		/*关于我们*/
		/*$model =  M ( 'Model' )->getByName ( 'aboutus' );
		$map['translate_type'] = $model['lang_flag'];

		$aboutus = M('aboutus')
		->join(
			array(
				'left join '.$fix.'translate translate on translate.translate_concern_id = '.$fix.'aboutus'.'.id',
			)
		)
		->field(
			array(
				$fix.'aboutus.aboutus_title',
				$fix.'aboutus.aboutus_pics',
				$fix.'aboutus.aboutus_content'
			)
		)
		->where($map)
		->find();*/
		//dump(M('aboutus')->getlastsql());

//		$aboutus_img = empty($aboutus['aboutus_pics']) ? null : M()->query('select id,path from '.$fix.'picture where id in ('.$aboutus['aboutus_pics'].') order by field(id,'.$aboutus['aboutus_pics'].')') ;


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
				'pic.path'
			)
		)
		->where($map)
		->order( $fix.'worker.worker_sort desc' )
		->select();*/

		/*合作伙伴*/
		/*$partners = M('partner')
		->join(
			array(
				'left join '.$fix.'picture pic on pic.id = '.$fix.'partner.partner_img'
			)
		)
		->field(
			array(
				$fix.'partner.partner_name',
				'pic.path'
			)
		)
		->order( $fix.'partner.partner_sort desc' )
		->limit(30)
		->select();*/

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

        //获取空间展示页banner
        $where_arr = ['sec.sec_type' => 2];
        $sec_banner = M('secondbanner')
            ->alias('sec')
            ->join('left join '.$fix.'picture pic on sec.second_img_url = pic.id')
            ->field('pic.path')
            ->where($where_arr)
            ->find();
        $banner_url = $sec_banner['path'];

        // 获取空间展示图片
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
        $router = 'Space';
        $this->assign('router',$router);
        $this->assign('banner_url',$banner_url);
        $this->assign('spaceshows',$spaceshows);
		/*$this->assign('aboutus',$aboutus);
		$this->assign('aboutus_img',$aboutus_img);
		$this->assign('workers',$workers);
		$this->assign('partners',$partners);
		$this->assign('bespoke',$bespoke);

		$this->assign('active',U('Index/index').'#active');
		$this->assign('about','#aboutus');*/


		$this->display();
	}

	//@desn:展示空间展示细节
    //@date:2017-04-02
    //@author:yuan<turing_zhy@163.com>
    public function detail(){
	    $id = I('get.id');
	    if($id){
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

            $model =  M ( 'Model' )->getByName ( 'spaceshow' );
	        $where_arr = [
	            'sp.id'=>$id,
                'translate_type' => $model['lang_flag']
            ];
            $space_detail = M('spaceshow')
                ->alias('sp')
                ->join('left join '.$fix.'picture pic on sp.spaceshow_banner = pic.id')
                ->join('left join '.$fix.'translate tra on tra.translate_concern_id = sp.id')
                ->where($where_arr)
                ->field('sp.*,pic.path')
                ->find();

            $this->assign('space_detail',$space_detail);
            $this->display();
        }else{
	        $this->error('未知错误!');
        }
    }
	
}