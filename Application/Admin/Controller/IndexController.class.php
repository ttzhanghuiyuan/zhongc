<?php

namespace Admin\Controller;
use User\Api\UserApi as UserApi;

/**
 * 后台首页控制器
 * @author 向日葵 <1584114809@qq.com>
 */
class IndexController extends AdminController {

    /**
     * 后台首页
     * @author 向日葵 <1584114809@qq.com>
     */
    public function index(){
        if(UID){
            $this->meta_title = '管理首页';
            $this->display();
            //$this->redirect('User/index');
        } else {
            $this->redirect('Public/login');
        }
    }

}
