<?php

/*NOW_TIME*/
namespace Home\Controller;

class SampleController extends HomeController{

	public function index(){

		if(!member_is_login()){

			$this->error("您还未登录，请登录",U('Public/login'));
			exit();
		}


		$map['good_id']=$data['good_id'] = I('id','intval');
		$data['sample_date'] = NOW_TIME;
		$data['isdel'] = 0;
		$data['status'] = 0;
		$data['sample_no'] = build_order_no();
		$map['user_id']=$data['user_id'] = session('member_auth.uid');
		$data['audit_status'] = 0;
		$map['status'] = 0;

		$result = M('sample')->where($map)->find();

		if(!empty($result)){

			$this->error('已经取样，等待商家回复');
		}

		$model = $this->getModel ( "sample" );
		$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );

		$Model = $this->checkAttr ( $Model, $model ['id'] );

		if( $Model->add($data) ){
			//exit();
			$this->success('取样成功');
		}
		else
		{
			$this->error( $Model->getError() );
		}
	}

	public function check_addr(){

		if(!member_is_login()){

			$this->error("您还未登录，请登录",U('Public/login'));
			exit();
		}

		$addr = M('shippingaddr')
		->where(array(
			'user_id'=>session('member_auth.uid'),
			'isdefault'=>1
			)
		)->find();

		if($addr){
            $return['status'] = 1;
            $return = array_merge($addr, $return);
        } else {
            $return['status'] = 0;
            $return['info']   = M('shippingaddr')->getError();
        }
        $this->ajaxReturn($return);
        
	}

}

