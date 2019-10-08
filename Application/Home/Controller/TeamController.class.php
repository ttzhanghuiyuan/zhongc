<?php

namespace Home\Controller;

class TeamController extends HomeController{

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
        $where_arr = ['sec.sec_type' => 6];
        $sec_banner = M('secondbanner')
            ->alias('sec')
            ->join('left join '.$fix.'picture pic on sec.second_img_url = pic.id')
            ->field('pic.path')
            ->where($where_arr)
            ->find();
        $banner_url = $sec_banner['path'];
        $router = 'Team';
        $this->assign('router',$router);
        //$this->assign('bespoke',$bespoke);
        //$this->assign('active',U('Index/index').'#active');
        //$this->assign('about','#aboutus');
        $this->assign('banner_url',$banner_url);


		$this->display();
	}

    //@desn:入驻条件
    //@date:2017-04-08
    //@author:yuan<turing_zhy@163.com>
    public function condition()
    {
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
        $where_arr = ['sec.sec_type' => 7];
        $sec_banner = M('secondbanner')
            ->alias('sec')
            ->join('left join '.$fix.'picture pic on sec.second_img_url = pic.id')
            ->field('pic.path')
            ->where($where_arr)
            ->find();
        $banner_url = $sec_banner['path'];

        //获取入驻条件文案
        $model = M('Model')->getByName('process');
        $where_arr = [
            'translate_type' => $model['lang_flag'],
            'p.team_type' => 1
        ];
        $condition = M('Process')
            ->alias('p')
            ->join('left join '.$fix.'picture pic on pic.id = p.team_img')
            ->join('left join '.$fix.'translate tra on tra.translate_concern_id = p.id')
            ->field('p.*,pic.path')
            ->where($where_arr)
            ->order('p.id desc')
            ->find();
        $router = 'Team';
        $this->assign('router',$router);
        //$this->assign('bespoke',$bespoke);
        //$this->assign('active',U('Index/index').'#active');
        //$this->assign('about','#aboutus');
        $this->assign('banner_url',$banner_url);
        $this->assign('condition',$condition);


        $this->display();
    }

    //@desn:入驻流程
    //@date:2017-04-08
    //@author:yuan<turing_zhy@163.com>
    public function progress()
    {
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
        $where_arr = ['sec.sec_type' => 8];
        $sec_banner = M('secondbanner')
            ->alias('sec')
            ->join('left join '.$fix.'picture pic on sec.second_img_url = pic.id')
            ->field('pic.path')
            ->where($where_arr)
            ->find();
        $banner_url = $sec_banner['path'];

        //获取入驻条件文案
        $model = M('Model')->getByName('process');
        $where_arr = [
            'translate_type' => $model['lang_flag'],
            'p.team_type' => 2
        ];
        $condition = M('Process')
            ->alias('p')
            ->join('left join '.$fix.'picture pic on pic.id = p.team_img')
            ->join('left join '.$fix.'translate tra on tra.translate_concern_id = p.id')
            ->field('p.*,pic.path')
            ->where($where_arr)
            ->order('p.id desc')
            ->find();
        $router = 'Team';
        $this->assign('router',$router);
        //$this->assign('bespoke',$bespoke);
        //$this->assign('active',U('Index/index').'#active');
        //$this->assign('about','#aboutus');
        $this->assign('banner_url',$banner_url);
        $this->assign('condition',$condition);


        $this->display();
    }

    //@desn:入驻申请
    //@date:2017-04-08
    //@author:yuan<turing_zhy@163.com>
    public function apply($verify = null){
        if(IS_POST){
            /* 检测验证码 TODO: */
            if(!check_verify($verify)){
                $this->error('验证码输入错误！');
            }
            $data['space'] = I('post.space');
            $data['book_name'] = I('post.team_name');
            $data['book_mobile'] = I('post.phone');
            $data['email'] = I('post.email');
            $data['company_name'] = I('post.company_name');
            $data['company_count'] = I('post.team_count');
            $data['company_desc'] = I('post.company_desc');
            $data['book_time'] = time();

            $insert_flag = M('book')->data($data)->add();

            if($insert_flag){
                $this->success('预约成功!');
            }else{
                $this->error('预约成功!');
            }

        } else {
            $router = 'Team';
            $this->assign('router',$router);
            $this->display();
        }
    }

    //生成验证码
    public function verify(){
        ob_clean();
        $verify = new \Think\Verify();
        $verify->entry(1);
    }
	
}
