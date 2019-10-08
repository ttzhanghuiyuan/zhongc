<?php

namespace Home\Controller;
/**
* 
*/
class GoodlistController extends HomeController
{
	
	public function index()
	{
		/*$good=M('good')->find();
		for ($i=0; $i < 32; $i++) { 
			$data[]=array(
				'salescount'=>($i+1),
				'goodcates_id'=>$good['goodcates_id'],
				'good_name'=>$good['good_name'].$i,
				'package'=>$good['package'],
				'stocksize'=>$good['stocksize'],
				'weight'=>$good['weight'],
				'marketprice'=>(100+$i),
				'surface'=>$good['surface'],
				'picture_id'=>$good['picture_id'],
				'application'=>$good['application'],
				'solvents'=>$good['solvents'],
				'brokerage'=>$good['brokerage'],
				'createdate'=>$good['createdate']
				);
		}
		M('good')->addAll($data);
		unset($data);*/

		$sort='hg_good.createdate desc';
		//$map['_string'] = '';

		$GET=$_GET;
		unset($GET['p']);
		unset($GET['eprice']);
		unset($GET['sprice']);
		unset($GET['cate']);

		$t = $GET;
		unset($t['c1']);
		unset($t['c2']);
		$urlvar1 = $t ? http_build_query($t).'&' : '';

		$t = $GET;
		unset($t['c2']);
		$urlvar2 = $t ? http_build_query($t).'&' : '';

		$t = $GET;
		unset($t['c3']);
		$urlvar3 = $t ? http_build_query($t).'&' : '';

		$t=$GET;
		unset($t['c4']);
		$urlvar4 = $t ? http_build_query($t).'&' : '';

		$t=$_GET;
		unset($t['c5']);unset($t['c6']);
		$urlvar7 = $t ? http_build_query($t).'&' : '';

		/*$t = $_GET;
		unset($t['min_vis']);unset($t['max_vis']);
		$urlvar8 = $t ? http_build_query($t).'&' : '';

		$t = $_GET;
		unset($t['min_aci']);unset($t['max_aci']);
		$urlvar9 = $t ? http_build_query($t).'&' : '';

		$t = $_GET;
		unset($t['left_solid']);unset($t['right_solid']);
		$urlvar10 = $t ? http_build_query($t).'&' : '';*/

		$cur_c7="S_rank_cur";
		$cur_c5_arrow=$cur_c6_arrow="S_rank_down";

		if(isset($GET['c5'])){
			$cur_c5="S_rank_cur";			
			$cur_c7="";

			if ($GET['c5']==0) {	
				$urlvar5=$urlvar7.'c5=1';
				$sort='hg_good.marketprice desc';
				$cur_c5_arrow="S_rank_up";
			}
			else{
				$urlvar5=$urlvar7.'c5=0';
				$sort='hg_good.marketprice asc';
			}
		}
		else{
			$cur_c5="";
			$urlvar5=$urlvar7.'c5=0';
		}

		if(isset($GET['c6'])){
			$cur_c6="S_rank_cur";
			$cur_c7="";

			if ($GET['c6']==0) {
				$urlvar6=$urlvar7.'c6=1';
				$sort='hg_good.salescount desc';
				$cur_c6_arrow="S_rank_up";
			}
			else{
				$urlvar6=$urlvar7.'c6=0';
				$sort='hg_good.salescount asc';
			}
		}
		else{
			$cur_c6="";
			$urlvar6=$urlvar7.'c6=0';
		}

		$fix=C('DB_PREFIX');

		if(!empty($_GET['c1'])){
			$map['goodcates.pid']=$_GET['c1'];
		}
		if(!empty($_GET['c2'])){
			$map['goodcates_id']=$_GET['c2'];
		}
		if(!empty($_GET['c3'])){
			$map['solvents']=array('like','%'.$_GET['c3'].'%');
		}
		if(!empty($_GET['c4'])){
			$map['hg_good.application']=array('like','%'.$_GET['c4'].'%');
		}
		if(!empty($_GET['sprice'])){
			$map['marketprice']=array('between',array($_GET['sprice'],$_GET['eprice']));
		}

		if(!empty($_GET['flag'])){
			if(!empty($_GET['cate'])){

				$map['_string'] .=   "cates.name = '".$_GET['cate'].
				"' OR goodcates.name = '".
				$_GET['cate']."' ";
			}
		}
		else{
			if(!empty($_GET['cate'])){

				$map['_string'] .=   "cates.name like '%".$_GET['cate'].
				"%' OR goodcates.name like '%".
				$_GET['cate']."%' ";
			}
		}

		if(!empty($_GET['min_vis']) && !empty($_GET['max_vis']) ){

			if($_GET['min_vis']>$_GET['max_vis']){
				$map['min_vis'] = $map['max_vis'] = array('exp','is null');
			}
			else{
				$map['min_vis'] = array('elt',$_GET['min_vis']);
				$map['max_vis'] = array('egt',$_GET['max_vis']);
			}

		}elseif (!empty($_GET['min_vis'])) {

			$map['min_vis'] = array('elt',$_GET['min_vis']);
			$map['max_vis'] = array('egt',$_GET['min_vis']);

		}elseif(!empty($_GET['max_vis'])){

			$map['max_vis'] = array('egt',$_GET['max_vis']);

		}/*else{
			$vis="ScreenCur";
		}*/

		if( !empty($_GET['min_aci']) && !empty($_GET['max_aci']) ){

			if($_GET['min_aci']>$_GET['max_aci']){
				$map['min_aci'] = $map['max_aci'] = array('exp','is null');
			}
			else{
			
				$map['_string'] .= "( aci_sign=5 and max_aci >=".$_GET['max_aci']." and min_aci <=".$_GET['min_aci']." ) or"
								  ."( aci_sign=3 and max_aci <=".$_GET['min_aci']." ) or"
								  ."( aci_sign=4 and max_aci <=".$_GET['min_aci']." ) or"
								  ."( aci_sign=1 and max_aci >=".$_GET['max_aci']." ) or"
								  ."( aci_sign=2 and max_aci >=".$_GET['max_aci']." )";
			}

		}elseif (!empty($_GET['min_aci'])) {
			$map['_string'] .= "( aci_sign=3 and max_aci <=".$_GET['min_aci']." ) or"
							 ."( aci_sign=4 and max_aci <=".$_GET['min_aci']." ) or"
							 ."( aci_sign=1 and max_aci >=".$_GET['min_aci']." ) or"
							 ."( aci_sign=2 and max_aci >=".$_GET['min_aci']." ) or"
							 ."( aci_sign=5 and min_aci <=".$_GET['min_aci']." )";
		}elseif(!empty($_GET['max_aci'])){
			$map['_string'] .= "( aci_sign=1 and max_aci >=".$_GET['max_aci']." ) or"
							 ."( aci_sign=2 and max_aci >=".$_GET['max_aci']." ) or"
							 ."( aci_sign=3 and max_aci <=".$_GET['max_aci']." ) or"
							 ."( aci_sign=4 and max_aci <=".$_GET['max_aci']." ) or"
							 ."( aci_sign=5 and max_aci >=".$_GET['max_aci']." )";
		}/*else{
			$aci="ScreenCur";
		}*/

		if(!empty($_GET['left_solid']) && !empty($_GET['right_solid']) ){

			$min_solid = $_GET['left_solid'] - $_GET['right_solid'];
			$max_solid = $_GET['left_solid'] + $_GET['right_solid'];

			$map['minus_solid'] = array('egt',$min_solid) ;
			$map['plus_solid'] = array( 'elt', $max_solid );

		}elseif (!empty($_GET['left_solid'])) {

			$map['left_solid'] = $_GET['left_solid'];
			
		}elseif (!empty($_GET['right_solid'])) {

			$map['right_solid'] = $_GET['right_solid'];
		}/*else{
			$solid="ScreenCur";
		}*/


		$model = $this->getModel('good');

		$list_cate = get_cate();
		
		if (empty($map['goodcates.pid'])) {
			foreach ($list_cate as $key => $value) {
				foreach ($value['_'] as $key => $value) {
					$cate_child[]=$value;
				}
			}
		}
		else{
			foreach ($list_cate as $key => $value) {
				if($value['id']==$map['goodcates.pid']){
					foreach ($value['_'] as $key => $value) {
						$cate_child[]=$value;
					}
					break;
				}
			}
		}

		$this->assign('urlvar1',$urlvar1);
		$this->assign('urlvar2',$urlvar2);
		$this->assign('urlvar3',$urlvar3);
		$this->assign('urlvar4',$urlvar4);
		$this->assign('urlvar5',$urlvar5);
		$this->assign('urlvar6',$urlvar6);
		$this->assign('urlvar7',$urlvar7);

		/*$this->assign('urlvar8',$urlvar8);
		$this->assign('urlvar9',$urlvar9);
		$this->assign('urlvar10',$urlvar10);*/
		/*$this->assign('aci',$aci);
		$this->assign('vis',$vis);
		$this->assign('solid',$solid);*/
		$this->assign('GET',$_GET);

		$this->assign('cur_c5',$cur_c5);
		$this->assign('cur_c7',$cur_c7);
		$this->assign('cur_c6',$cur_c6);
		$this->assign('cur_c6_arrow',$cur_c6_arrow);
		$this->assign('cur_c5_arrow',$cur_c5_arrow);

		$this->assign(
			$this->_get_front_join_list($model,0,$sort,$map,
				array(
					'left join '.$fix.'goodcates goodcates on goodcates.id = '.$fix.'good.goodcates_id',
					//'left join '.$fix.'picture picture on picture.id= '.$fix.'good.picture_id',
					'left join '.$fix.'goodcates cates on cates.id = goodcates.pid'
				),
				array(
					$fix.'good.id',
					$fix.'good.good_name',
					$fix.'good.surface',
					$fix.'good.chromatic',
					$fix.'good.min_vis',
					$fix.'good.max_vis',
					$fix.'good.min_aci',
					$fix.'good.max_aci',
					$fix.'good.aci_sign',
					$fix.'good.right_solid',
					$fix.'good.left_solid',
					//$fix.'good.left_solid - '.$fix.'good.right_solid' => 'minus_solid',
					//$fix.'good.left_solid + '.$fix.'good.right_solid' => 'plus_solid',
					$fix.'good.hydroxyl',
					$fix.'good.vis_unit',
					$fix.'good.salescount',
					$fix.'good.marketprice',
					$fix.'good.application',
					$fix.'good.solvents',
					'goodcates.name',
					$fix.'good.describe'
					//'picture.path'
				)
			)
		);
		//dump(M('good')->getlastsql());

		$this->assign('cate_parent',$list_cate);
		$this->assign('cate_child',$cate_child);
		$this->assign('solvent',get_solvent());
		$this->assign('apply',get_apply());
        
		$this->display();
	}

	public function detail(){

		$id=I('id','intval');

		$fix=C('DB_PREFIX');

		$info=M('Good')->join(array(
			'left join '.$fix.'goodcates goodcates on goodcates.id = '.$fix.'good.goodcates_id',
			'left join '.$fix.'picture on '.$fix.'picture.id = '.$fix.'good.picture_id',
			'left join '.$fix.'goodcates a on a.id = goodcates.pid'
			))
		->field(
			array(
				'goodcates.name as catename',
				'goodcates.pid',
				'goodcates.id as cateid',
				'a.name as pcatename',
				$fix.'good.goodcates_id',
				$fix.'good.good_name',
				$fix.'good.package',
				$fix.'good.stocksize',
				$fix.'good.weight',
				$fix.'good.picture_id',
				$fix.'good.id',
				$fix.'picture.path',
				$fix.'good.params',
				$fix.'good.describe',
				$fix.'good.application'
			)
		)
		->where(array($fix.'good.id'=>$id))
		->find();

		$prices=M('Priceterms')->where(array('good_id'=>$id))->select();


		$RecentViews=M('Good')
		->join(
			array(
			'left join '.$fix.'goodcates on '.$fix.'goodcates.id = '.$fix.'good.goodcates_id',
			'left join '.$fix.'picture on '.$fix.'picture.id = '.$fix.'good.picture_id'
			)
		)
		->field(
			array(
				$fix.'good.good_name',
				$fix.'good.id',
				$fix.'goodcates.name as catename',
				$fix.'picture.path'
			)
		)
		->where( array( $fix.'good.id' => array( 'in',RecentViews( $id ) ))) 
		->select();

		$map[$fix.'good.id'] = array('neq',$info['id']);

		$intrest=M('Good')
		->join(
			array(
			'left join '.$fix.'goodcates on '.$fix.'goodcates.id = '.$fix.'good.goodcates_id',
			'left join '.$fix.'picture on '.$fix.'picture.id = '.$fix.'good.picture_id'
			)
		)
		->field(
			array(
				$fix.'good.good_name',
				$fix.'good.id',
				$fix.'goodcates.name as catename',
				$fix.'picture.path'
			)
		)
		->where( $map )
		->limit(4)
		->select();


		$this->assign('info',$info);
		$this->assign('RecentViews',$RecentViews);
		$this->assign('intrest',$intrest);

		$this->assign('prices',$prices);

		$this->assign(
			'trads',
			M("order")//(hg_order.good_nums*hg_order.weight) as total_weight,
			->field(
				'hg_order.good_name,
				hg_order.good_nums,
				hg_order.order_date,
				hg_order.company_name,hg_order.linkman')
			->where('good_id='.$id)
			->select()
		);
		
		/*if (preg_match('/MSIE/', $_SERVER['HTTP_USER_AGENT'])){
			
			cookie('refer','http://' . $_SERVER ['HTTP_HOST'] . $_SERVER['REQUEST_URI']);
			//cookie('param',I('id'));
		}
		else
		{*/
		cookie('refer', 'http://' . $_SERVER ['HTTP_HOST'] . $_SERVER['REQUEST_URI']);
		/*}*/
		$this->display();
	}

}
?>