<?php

namespace Home\Controller;
use Common\Controller\CommonController;
/**
* 
*/
class UcenterController extends CommonController
{
	
	protected function _initialize()
	{
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
        	->field(array('id','title','category_id'))
        	->where( array( 'category_id' =>51) )
        	->limit(3)
        	->select()
        );

        $this->assign(
        	'quiz',
        	M('document')
        	->field(array('id','title','category_id'))
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

		define('UID',member_is_login());
        if( !UID ){// 还没登录 跳转到登录页面
        	$refer = 'http://' . $_SERVER ['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
			cookie('refer', $refer);
            $this->redirect('Public/login');
        }

	}


}


?>