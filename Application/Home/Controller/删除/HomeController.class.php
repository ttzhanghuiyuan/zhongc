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

	/* 空操作，用于输出404页面 */
	public function _empty(){
		$this->redirect('Index/index');
	}


    protected function _initialize(){

        /* 读取站点配置 */

        $this->assign(
        	'about_us',
        	M('document')
        	->field(array('id','title','category_id'))
        	->where( array( 'category_id' =>53 ) )
        	->select()
        );

        $this->assign(
        	'guid',
        	M('document')
        	->field(array('id','title','category_id','description'))
        	->where( array( 'category_id' =>51) )
        	->limit(3)
        	->select()
        );

        $this->assign(
        	'quiz',
        	M('document')
        	->field(array('id','title','category_id','description'))
        	->where( array( 'category_id' =>52) )
        	->limit(3)
        	->select()
        );

        $this->assign(
        	'contact',
        	//M('contact')->where('Id=1')->find()
            get_contact()
        );

        $this->assign(
        	'company',
        	/*M('company')->where('Id=1')->find()*/
            get_company()
        );


        $config = api('Config/lists');
        C($config); //添加配置

        if(!C('WEB_SITE_CLOSE')){
            $this->error('站点已经关闭，请稍后访问~');
        }

       

    }
    
	/* 用户登录检测 */
	protected function login(){
		/* 用户登录检测 */
		is_login() || $this->error('您还没有登录，请先登录！', U('User/login'));
	}

}
