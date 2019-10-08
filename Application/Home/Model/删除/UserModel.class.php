<?php
namespace Home\Model;
use Think\Model;

class UserModel extends Model{

	public function logout(){
		
        session('member_auth', null);
        session('member_auth_sign', null);
    }

    public function login($name,$pwd){

    	$map['email|mobile']=$name;

    	$member = $this->where($map)->find();

    	if(is_array($member) && $member['member_status']){

    		if ( $member['audit_status'] ==2 || $member['audit_status']==0 ) {

    			return -3;
			# code...
    		}

    		//dump($member);

			if( think_md5($pwd) === $member['password']){

				$auth = array(
					'uid'             => $member['id'],
					'account'         => $member['mobile'],
					'username'        => $member['linkman']
					);

				session('member_auth', $auth);
				session('member_auth_sign', data_auth_sign($auth));

				return $member['id']; 
			} 
			else {
				return -2; //密码错误
			}
		} 
		else {
			return -1; //用户不存在或被禁用或在审核中
		}
    }

    protected function verifyMember($id, $password_in){

		$password = $this->getFieldById($id, 'password');

		if(think_md5($password_in) === $password){
			return true;
		}
		return false;
	}

}

?>