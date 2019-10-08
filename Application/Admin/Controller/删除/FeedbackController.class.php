<?php

namespace Admin\Controller;

class FeedbackController extends AdminController {

	private $table = 'feedback';

	public function lists(){
		$model = $this->getModel($this->table);

		

		$list_data =$this->union_list($model);

		$this->assign('is_hide_add',1);

		$this->assign('model',$model);

		$this->assign($list_data);
		$this->display('Common:lists');
	}

	/*public function add(){
		$this->common_add($this->table,'Common:add');
	}*/

	public function del(){
		$this->common_del($this->table);
	}

	public function edit(){
		if(IS_POST){

			empty(I('tofeedback')) && $this->error('回复内容不能为空!');

            $mailbox=M('mailbox')->find();

            $result=sendMail(
            	I('email'),'起点化工回复',I('tofeedback'),
                $mailbox['email_host'],$mailbox['email_from'],
                $mailbox['email_pwd'],$mailbox['email_from'],
                $mailbox['email_from']
                );

            if($result){

            	$this->edittable(
            		$this->table,
            		array('id'=>I('id','intval')),
            		array('tofeedback'=>I('tofeedback','htmlspecialchars'),'brokerage'=>I('brokerage') ),
            		U('lists')
            	);
            }
            else{
            	$this->error('邮件发送失败');
            }              
		}
		else{
			$id || $id = I ( 'id' ,'intval');
			$fix=C('DB_PREFIX');
	    	$info=M($this->table)
	    	->join('left join '.$fix.'user on '.$fix.'user.id = '.$fix.$this->table.'.user_id')
	    	->field(
	    		array(
	    			$fix.'user.account',
	    			$fix.'user.mobile',
	    			$fix.'user.fullname',
	    			$fix.$this->table.'.id',
	    			$fix.$this->table.'.feedback_email',
	    			$fix.$this->table.'.msg',
	    			$fix.$this->table.'.tofeedback'
	    			)
	    		)
	    	->where(array($fix.$this->table.'.id'=>$id))
	    	->find();
	    	//dump($info);
	    	//dump(M($this->table)->getlastsql());
	    	$this->assign('info',$info);
			$this->display();
		}
	}
}
