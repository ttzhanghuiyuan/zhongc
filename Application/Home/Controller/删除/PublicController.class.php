<?php

namespace Home\Controller;
use Think\Controller;
use Common\Controller\CommonController;
use Common\Library\SMS\SendSMS;
use Think\Log;

class PublicController extends CommonController {

    protected function _initialize(){
        /* 读取站点配置 */
        $config = api('Config/lists');
        C($config); //添加配置

        if(!C('WEB_SITE_CLOSE')){
            $this->error('站点已经关闭，请稍后访问~');
        }
    }

    /**
     * 后台用户登录
     * @author 向日葵 <1584114809@qq.com>
     */
    public function login($account = '', $pwd = ''){
        //dump(M('user'));
        if(IS_POST){

            empty($account) && $this->error('请输入用户名');

            empty($pwd) && $this->error('请输入密码');

            $uid = D('User')->login( trim($account), $pwd);

            if(0 < $uid){

                $count = M('Cart')->where( array('user_id' => $uid ) )->count();
                
                cookie('Cart_num',$count);

                $refer = cookie('refer');


                if(!empty($refer)){

                   /* if(preg_match('/MSIE/', $_SERVER['HTTP_USER_AGENT']) && strpos($refer,'id')!==false ){
                        $refer .= cookie('param');
                        cookie('param',null);
                    }*/

                    cookie('refer',null);
                    $this->success('登录成功!',$refer);
                    
                }
                else
                    $this->success('登陆成功!',U('Index/index'));
            } 
            else {
                switch($uid) {
                    case -1: $error = '用户不存在或被禁用！'; break; //系统级别禁用
                    case -2: $error = '密码错误！'; break;
                    case -3: $error="用户在审核中"; break;
                    default: $error = '未知错误！'; break; // 0-接口参数错误（调试阶段使用）
                }
                $this->error($error);
            }
        } else {
            if(member_is_login()){
                $this->redirect('Index/index');
            }else{

                $this->initialize();

                //dump(cookie('refer'));

                $this->assign('meta_title','欢迎登录');
                $this->display("Member:login");
            }
        }
    }

    public function register(){

        if(IS_POST){

            !check_verify(I('verify_code')) && $this->error('验证码输入错误！');

            if(I('password')!==I('confirmPassword')){
                $this->error('密码两次输入不一致');
            }

            empty(I('msgCode')) && $this->error('请输入短信验证码！');

            if( (session('mtime')+120) < time() ){

                session('mcode',null);
                session('mtime',null);

                $this->error('手机短信验证码已过期，请重新获取!');
            }

            I('msgCode') != session('mcode') && $this->error('短信验证码输入错误，请重新输入!');

            $map['mobile']=trim(I('mobile'));
            $map['email']=trim(I('email'));
            $map['_logic'] = 'OR';

            $member=M('user')->where($map)->find();

            !empty($member) && $this->error('邮箱或手机号码已经被注册过,请登录!');

            $result =$this->common_add('user',null,'',true);

            if($result['status']){
                countview('membership');
                $jump = U('Index/index');
                $this->success ( '注册成功' , $jump );

            }else{
                $this->error ( $result['data'] );
            }

        }
        else{

            $this->initialize();
            $this->assign('meta_title','欢迎注册');
            $this->display('Member:register');
        }
        
    }

    public function initialize(){
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
    }

    /* 退出登录 */
    public function logout(){

        if(member_is_login()){

            D('User')->logout();

            cookie('Cart_num',null);

            $this->redirect('login');
        } else {
            $this->redirect('login');
        }
    }

    public function verify(){
        $config =    array(
        'fontSize'    =>    30,    // 验证码字体大小
        'length'      =>    4,     // 验证码位数
        'useNoise'    =>    false, // 关闭验证码杂点
        );
        $verify = new \Think\Verify($config);
        $verify->entry(1);
    }

    public function identity(){
        if(IS_POST){

            !check_verify(I('verify_code')) && $this->error('验证码输入错误！');

            $map['mobile']=I('mobile');

            $member=M('user')->where($map)->find();

            if(empty($member)){
                $this->error('手机号码不存在！');
            }
            else{
                $jump=U('identitynext',array( 'uid' => $map['mobile'] ));
                $this->success('',$jump);
            }
        }
        else{
            $this->initialize();
            $this->assign('meta_title','安全中心-找回密码');
            $this->display("Member:identity");
        } 
    }

    public function identitynext(){
        if(IS_POST){

            empty(I('msgCode')) && $this->error('请输入短信验证码！');

            if( (session('mtime')+120) < time() ){

                session('mcode',null);
                session('mtime',null);

                $this->error('手机短信验证码已过期，请重新获取!');
            }

            I('msgCode') != session('mcode') && $this->error('短信验证码输入错误，请重新输入!');

            
            $jump=U('setpwd',array( 'uid' => I('mobile') ));
            
            $this->success('',$jump);

            /*if(empty(I('msg_code'))){
                $this->error('请输入短信验证码！');

            } 
            else{*/
            
            /*}*/
        }
        else{
            $this->initialize();
            $this->assign('meta_title','安全中心-找回密码');

            $this->assign('mobile',I('uid'));
            $this->display("Member:identitynext");
        }
        
    }

    public function setpwd(){

        if(IS_POST){

            if(I('password')!==I('repassword')){
                $this->error('密码两次输入不一致');
            }

            $result =$this->common_edit('user',0,null,'',true);

            if($result['status']){
                
                $jump = U('issuccess');

                $this->success ( '注册成功' , $jump );

            }else{
                $this->error ( $result['data'] );
            }

        }
        else{

            $map['mobile']=I('uid');

            $member=M('user')->where($map)->find();

            $this->assign('id',$member['id']);

            $this->initialize();
            $this->assign('meta_title','安全中心-找回密码');

            $this->display("Member:setpwd");
        }
    }

    public function issuccess(){
        $this->initialize();
        $this->assign('meta_title','安全中心-找回密码');
        $this->display("Member:issuccess");
    }

    public function SendSMS(){
        //'13076800359';
        $mobile = I('mobile','strip_tags');
        
        $pattern_test = "/^(1(([35][0-9])|(47)|[8][0126789]))\d{8}$/";

        !preg_match($pattern_test, $mobile) && $this->error('手机格式不正确');


        $SendSMS=new SendSMS();

        $mcode = get_rand();

        $result = $SendSMS->send($mobile,array($mcode,2),1);//65493

        if($result['status'] !== 0){

            if(session('?mcode')){
                session('mcode',null);
                session('mtime',null);
            }
            session('mcode',$mcode);
            session('mtime',time());

            $this->success('验证码已发送，请留意您的手机短信!');
        }
        else if($result['status'] ==0 ){
            Log::write($result);
            //dump($result);$result['msg']'抱歉，手机短信发送失败，请重新获取'
            $this->error('手机限定的时间内发送次数已达到限制的次数');
        }
        else{
            $this->error('抱歉，手机短信发送失败，请重新获取');
        }

    }

}
