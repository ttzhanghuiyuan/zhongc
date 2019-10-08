<?php

namespace Admin\Controller;

class DemandController extends AdminController {

	private $table = 'demand';

	public function lists(){

		$model = $this->getModel($this->table);

		/*$list_data = $this->_get_join_list($model);
		
		foreach($list_data['list_data'] as &$vo) {
			
			$vo['demand_content']=mb_strlen($vo['demand_content']) > 8 ?  msubstr($vo['demand_content'],0,8) :$vo['demand_content'];
			$vo['demand_status'] = $vo['demand_status']==1?'解决':'未解决';
		}

		unset($vo);*/

		$list_data =$this->union_list($model);

		$this->assign('is_hide_add',1);
		//$this->assign('is_hide_del',1);

		$this->assign('model',$model);

		$this->assign($list_data);
		$this->display('Common:lists');
	}

	//$this->edittable($this->table,array('id'=>I('id','intval')), array('remarks'=>I('remarks','htmlspecialchars')),U('lists') );

	/*public function add(){
		$this->common_add($this->table,'Common:add');
	}*/

	public function del(){
		$this->common_del($this->table);
	}

	public function edit(){
		if(IS_POST){

			empty(I('solve_content')) && $this->error('回复内容不能为空!');

            $mailbox=M('mailbox')->find(1);

            $result=sendMail(
            	I('email'),'起点销售回复',I('solve_content'),
                $mailbox['email_host'],$mailbox['email_from'],
                $mailbox['email_pwd'],$mailbox['email_from'],
                $mailbox['email_from']
                );

            if($result){

            	$this->edittable(
            		$this->table,
            		array('id'=>I('id','intval')),
            		array('solve_content'=>I('solve_content','htmlspecialchars'),'brokerage'=>I('brokerage') ),
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
	    			$fix.$this->table.'.demand_email',
	    			$fix.$this->table.'.demand_content',
	    			$fix.$this->table.'.solve_content'
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
