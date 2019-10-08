<?php

namespace Home\Controller;

class DemandController extends HomeController {

	private $table = 'demand';

	public function add(){
		if(!member_is_login()){

			$this->error("您还未登录，请登录",U('Public/login'));
			exit();
		}
		//dump($_POST);
		//$this->common_add("shippingaddr",null,'',true);
		$result = $this->common_add($this->table,null,'',true);

		if($result['status']){

			$this->success ( '您的请求提交成功，请等待回复' );

		}else{
			$this->error ( $result['data'] );
		}

	}

	
}
