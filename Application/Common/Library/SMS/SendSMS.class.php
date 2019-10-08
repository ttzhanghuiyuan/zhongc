<?php

namespace Common\Library\SMS;

use Common\Library\SMS\sdk\REST;
use Think\Log;

class SendSMS{
	public function send($to,$datas,$tempId){
	    // 初始化REST SDK
	    //主帐号,对应开官网发者主账号下的 ACCOUNT SID
		$accountSid= C('SMS_ACCOUNT_SID');

		//主帐号令牌,对应官网开发者主账号下的 AUTH TOKEN
		$accountToken= C('SMS_AUTH_TOKEN');

		//应用Id，在官网应用列表中点击应用，对应应用详情中的APP ID
		//在开发调试的时候，可以使用官网自动为您分配的测试Demo的APP ID
		$appId=C('SMS_APPID');

		//请求地址
		//沙盒环境（用于应用开发调试）：sandboxapp.cloopen.com
		//生产环境（用户应用上线使用）：app.cloopen.com
		$serverIP=C('SMS_SERVER');


		//请求端口，生产环境和沙盒环境一致
		$serverPort='8883';

		//REST版本号，在官网文档REST介绍中获得。
		$softVersion=C('SMS_REST_VERSION');

	     $rest = new REST($serverIP,$serverPort,$softVersion);
	     $rest->setAccount($accountSid,$accountToken);
	     $rest->setAppId($appId);
	    
	     // 发送模板短信

	     $result = $rest->sendTemplateSMS($to,$datas,$tempId);
	     if($result == NULL ) {
	     	Log::write("result error!");
	        /*return false;*/
	        return array(
	        	'status' => -1
	        );
	     }
	     if($result->statusCode!=0) {
	     	Log::write("error code :" . $result->statusCode . " , error msg :" . $result->statusMsg);
	        //return false;
	        return array(
	         	'status'    => 0,
	         	'msg'	=>	$result->statusMsg
	         );
	     }else{
	         $smsmessage = $result->TemplateSMS;
	 
	         return array(
	         	'status'    => 1,
	         	'datetime'	=>	$smsmessage->dateCreated,
	         	'msgid'		=>	$smsmessage->smsMessageSid
	         );
	     }
	}
}