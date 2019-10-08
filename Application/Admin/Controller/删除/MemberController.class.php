<?php

namespace Admin\Controller;

class MemberController extends AdminController {

	private $table = 'user';

	public function lists(){
		
		$model = $this->getModel($this->table);
		
		$list_data = $this->_get_model_list($model);

		foreach($list_data['list_data'] as &$vo) {

			$vo['member_status']=$vo['member_status']==1?
			 "正常"." | <a href='changeStatus?method=memberstatus&status=0&ids=".$vo['id']."' class='ajax-get' >切换到禁用</a>":
			 "禁用"." | <a href='changeStatus?method=memberstatus&status=1&ids=".$vo['id']."' class='ajax-get'>切换到正常</a>";

			$vo['audit_status']=$vo['audit_status']==0? 
			"未审核"." | <a href='changeStatus?method=auditstatus&status=1&ids=".$vo['id']."' class='ajax-get'>审核通过</a> <a href='changeStatus?method=auditstatus&status=2&ids=".$vo['id']."' class='ajax-get'>审核未通过</a>":
			                    ($vo['audit_status']==1? 
			"审核通过"." | <a href='changeStatus?method=auditstatus&status=2&ids=".$vo['id']."' class='ajax-get'>审核未通过</a> 
			<a href='changeStatus?method=auditstatus&status=0&ids=".$vo['id']."' class='ajax-get'>未审核</a>":

			"未通过"." | <a href='changeStatus?method=auditstatus&status=1&ids=".$vo['id']."' class='ajax-get'>审核通过</a> 
			<a href='changeStatus?method=auditstatus&status=0&ids=".$vo['id']."' class='ajax-get'>未审核</a>");
		}
		unset($vo);
        
        $this->assign('resume',array('is'=>1,'url'=>U('Member/changeStatus',array('method'=>'memberstatus','status'=>1)) ));

        $this->assign('forbid',array('is'=>1,'url'=>U('Member/changeStatus',array('method'=>'memberstatus','status'=>0)) ));

		$this->assign('model',$model);

		$this->assign($list_data);

		$this->display('Common:lists');
	}

	public function changeStatus($method=null,$status=1){

        $id = array_unique((array)I('ids',0));
        
        $id = is_array($id) ? implode(',',$id) : $id;

        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }

        $map['id'] =   array('in',$id);
        
        switch ( strtolower($method) ){
            case 'memberstatus':
                $this->edittable($this->table,$map,array('member_status'=>$status),null);
                break;
            case 'auditstatus':
                $this->edittable($this->table,$map,array('audit_status'=>$status,'audit_date'=>NOW_TIME,'audit_person'=>session('user_auth.username') ),null);
                break;
            default:
                $this->error('参数非法');
        }
    }

    public function del(){
		$this->common_del($this->table);
	}

	public function add(){

		if(IS_POST){
			
			$map['mobile']=trim(I('mobile'));
            $map['email']=trim(I('email'));
            $map['account'] = trim(I('account'));
            $map['_logic'] = 'OR';

			 $member=M('user')->where($map)->find();

            !empty($member) && $this->error('邮箱、手机号码或账号已经被注册过!');

            $_POST['member_status'] = 0;
			$_POST['audit_status'] =0;
			$_POST['create_date'] = time();

			$result =$this->common_add($this->table,null,'',true);

			if($result['status']){

				$jump = U('lists');

				$this->success (   '新增' . $model ['title']. ' 成功' , $jump );

			}else{
				$this->error ( $result['data'] );
			}
		}else{
			$this->display();
		}
	}

	public function edit(){
		if(IS_POST){

			$fullname = I('fullname');
			empty($fullname) && $this->error('请填写姓名');
			$this->edittable($this->table,array('id'=>I('id','intval')), array( 'fullname'=>I('fullname'), 'remarks'=>I('remarks','htmlspecialchars') ),U('lists') );
	    }
	    else{
	    	$id || $id = I ( 'id' ,'intval');
	    	$info=M($this->table)->where(array('id'=>$id))->find();
	    	$this->assign('info',$info);
	    	$this->display();
	    }
	}
}
