<?php

namespace Admin\Controller;

class GoodController extends AdminController {

	private $table = 'good';

	public function lists(){
		
		$model = $this->getModel($this->table);

		//var_dump(expression)

		$list_data = $this->_get_join_list($model);
		
		foreach($list_data['list_data'] as &$vo) {
			
			$vo['path'] = '<img class="img-lazyload" data-src="'.$vo["path"].'" />';
		}

		unset($vo);

		$this->assign('model',$model);

		$this->assign($list_data);
		$this->display('Common:lists');
	}

	public function add(){
		if(IS_POST)
		{
             
			// I('priceterms')==0 && $this->error('账期内容与账期值必填');

			// if($_POST['max_vis']<$_POST['min_vis']){
			// 	$this->error('粘度最小值不能比最大值大');
			// 	exit();
			// }

			// if($_POST['left_solid']<$_POST['right_solid']){
			// 	$this->error('固体左边值必须大于右边值');
			// 	exit();
			// } 

			// $aci_sign = $_POST['aci_sign'];

			// switch ($aci_sign) {
			// 	case 5:
			// 		if(empty($_POST['min_aci'])){
			// 			$this->error('酸度最小值不能为空');
			// 			exit();
			// 		}
			// 		if($_POST['min_aci']>$_POST['max_aci']){
			// 			$this->error('酸度最小值不能比最大值大');
			// 			exit();
			// 		}
			// 		break;
			// 	default:
			// 		$_POST['min_aci'] = null;
			// 		break;
			// }

			// $_POST['minus_solid'] = $_POST['left_solid'] - $_POST['right_solid'];
			// $_POST['plus_solid'] = $_POST['left_solid'] + $_POST['right_solid'];

			$result =$this->common_add($this->table,null,'',true);

			if($result['status']){
                
                //账期添加
				// $attrs=I('attr');
				// $vals=I('val');

				// for ($i=0,$j=count($attrs); $i < $j; $i++) { 
				// 	$datas[]=array('good_id'=>$result['data'],'attr'=>$attrs[$i],'val'=>$vals[$i]);
				// }

				// M('Priceterms')->addAll($datas);

				// unset($datas);

				$jump = U('Good/lists');

				$this->success (   '新增' . $model ['title']. ' 成功' , $jump );

			}else{
				$this->error ( $result['data'] );
			}
		}
		else
		{
			$this->display('edit');
		}
		
	}

	public function del(){
		$this->common_del($this->table,null,'priceterms');
	}

	public function edit(){
		if(IS_POST)
		{

   //          I('priceterms')==0 && $this->error('账期内容与账期值必填');

   //          if($_POST['max_vis']<$_POST['min_vis']){
			// 	$this->error('粘度最小值不能比最大值大');
			// 	exit();
			// }

			// if($_POST['left_solid']<$_POST['right_solid']){
			// 	$this->error('固体左边值必须大于右边值');
			// 	exit();
			// } 

			// $aci_sign = $_POST['aci_sign'];

			// switch ($aci_sign) {
			// 	case 5:
			// 		if(empty($_POST['min_aci'])){
			// 			$this->error('酸度最小值不能为空');
			// 			exit();
			// 		}
			// 		if($_POST['min_aci']>$_POST['max_aci']){
			// 			$this->error('酸度最小值不能比最大值大');
			// 			exit();
			// 		}
			// 		break;
			// 	default:
			// 		$_POST['min_aci'] = null;
			// 		break;
			// }

			// $_POST['minus_solid'] = $_POST['left_solid'] - $_POST['right_solid'];
			// $_POST['plus_solid'] = $_POST['left_solid'] + $_POST['right_solid']; 
            
			$result = $this->common_edit($this->table,0,null,'',true);

			if($result['status']){

				// M('Priceterms')->where(array('good_id'=>$result['data']))->delete();

				// $attrs=I('attr');
				// $vals=I('val');

				// for ($i=0,$j=count($attrs); $i < $j; $i++) { 
				// 	$datas[]=array('good_id'=>$result['data'],'attr'=>$attrs[$i],'val'=>$vals[$i]);
				// }

				// M('Priceterms')->addAll($datas);

				// unset($datas);
	
				$jump = U('Good/lists');

				$this->success ( '保存' . ' ' . $model ['title'] . ' ' .'成功', $jump );
			}else{
				$this->error ( $result['data'] );
			}

		}
		else
		{
			$id || $id = I ( 'id' ,'intval');

			$info=M($this->table)->where(array('id'=>$id))->find();

			$cate=M('goodcates')->where(array('id'=>$info['goodcates_id']))->find();

			
           // $this->assign('priceterms',M('Priceterms')->where(array('good_id'=>$id))->select() );
			
			$this->assign('info',$info);

			$this->assign('pid',$cate['pid']);

			$this->display();
		}
		
	}
}
