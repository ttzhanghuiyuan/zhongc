<?php

namespace Home\Controller;
/*use Think\Controller;*/
use Common\Controller\CommonController;
/*use Common\Library\SMS\SendSMS;*/

/**
 * 前台公共控制器
 * 为防止多分组Controller名称冲突，公共Controller名称统一使用分组名称
 */
class TongjiController extends HomeController {

    /*public function index(){
        $this->display();
    }*/
    public function stats(){

         //设置客户端登陆标识
        $cookieid = $_COOKIE['TONGJI_COOKIEID'];

        if($cookieid == ''){
            $cookieid = session_id();
            setcookie('TONGJI_COOKIEID',$cookieid,time()+31536000);
        }

        //查找当前登陆IP今天是否存在，统计IP数
        $ip_exist = S(  $_SERVER['REMOTE_ADDR'].date('Y-m-d',time()) );

        if(empty($ip_exist)){
            countview('ipcount');
            S( $_SERVER['REMOTE_ADDR'].date('Y-m-d',time()), '1' , 86400 );
        }
        //$map['_string'] = "FROM_UNIXTIME(`createtime`,'%Y-%m-%d') = '".date('Y-m-d',time())."'";
        //$map['ipadress'] = $_SERVER['REMOTE_ADDR'];
        //(M('records')->where($map)->count()>0)?:

        //统计PV数
        countview('pageview');

        //查找标识今天是否登陆，统计UV

        $token_exist = S( $cookieid.date('Y-m-d',time()) );

        if(empty($token_exist)){
            countview('userview');
            S( $cookieid.date('Y-m-d',time()), '1' , 86400 );
        }
        /*$where['_string']="FROM_UNIXTIME(`createtime`,'%Y-%m-%d') = '".date('Y-m-d',time())."'";
        $where['token'] = $cookieid;
        (M('records')->where($where)->count()>0)?:countview('userview');*/

        M('records')->add(
            array(
            'token'     =>  $cookieid,
            'source'   =>  I('get.referer'),
            'surveyed'    =>  I('get.target'),
            'adress'  =>  getIPLoc_sina($_SERVER['REMOTE_ADDR']),//null,
            'ipadress'     =>  $_SERVER['REMOTE_ADDR'],
            'createtime'  =>  time()
            )
        );  
    }


}
