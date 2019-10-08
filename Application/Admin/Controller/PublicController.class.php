<?php

namespace Admin\Controller;
use User\Api\UserApi;

/**
 * 后台首页控制器
 * @author 向日葵 <1584114809@qq.com>
 */
class PublicController extends \Think\Controller {

    /**
     * 后台用户登录
     * @author 向日葵 <1584114809@qq.com>
     */
    public function login($username = null, $password = null, $verify = null){
        if(IS_POST){
            $fp = fopen('./a.txt', 'a+b');
            fwrite($fp, print_r('1111', true));
            fclose($fp);

            /* 检测验证码 TODO: */
            if(!check_verify($verify)){
                $this->error('验证码输入错误！');
            }

            /* 调用UC登录接口登录 */
            $User = new UserApi;
            $uid = $User->login(trim($username), $password);
            $fp = fopen('./a.txt', 'a+b');
            fwrite($fp, print_r($uid, true));
            fclose($fp);
            if(0 < $uid){ //UC登录成功
                /* 登录用户 */
                $Member = D('Member');
                if($Member->login($uid)){ //登录用户
                    //TODO:跳转到登录前页面
                    $refer = cookie('_refer');
                    if(!empty($refer))
                    {
                        $this->success('登录成功!',$refer);
                        cookie('_refer',null);
                    }
                    else
                        $this->success('登录成功！', U('Index/index'));
                } else {
                    $this->error($Member->getError());
                }

            } else { //登录失败
                switch($uid) {
                    case -1: $error = '用户不存在或被禁用！'; break; //系统级别禁用
                    case -2: $error = '密码错误！'; break;
                    default: $error = '未知错误！'; break; // 0-接口参数错误（调试阶段使用）
                }
                $this->error($error);
            }
        } else {
            if(is_login()){
                $this->redirect('Index/index');
            }else{
                /* 读取数据库中的配置 */
                $config	=	S('DB_CONFIG_DATA');
                if(!$config){
                    $config	=	D('Config')->lists();
                    S('DB_CONFIG_DATA',$config);
                }
                C($config); //添加配置
                $this->display();
            }
        }
    }

    /* 退出登录 */
    public function logout(){
        if(is_login()){
            D('Member')->logout();
            //session('[destroy]');
            $this->success('退出成功！', U('login'));
        } else {
            $this->redirect('login');
        }
    }

    public function verify(){
        ob_clean();
        $verify = new \Think\Verify();
        $verify->entry(1);
    }

}
