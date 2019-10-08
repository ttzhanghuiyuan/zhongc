<?php

namespace Home\Controller;

class CartController extends HomeController {

	public function index(){

		$fix=C('DB_PREFIX');

		/*$parent_arr=array(
			'left join '.$fix.'good good on good.id = '.$fix.'cart.good_id',
			'left join '.$fix.'goodcates goodcates on goodcates.id = good.goodcates_id'
		);

		$field=array(
			'good.good_name',

			'good.weight',
			'good.package',
			'good.stocksize',
			'goodcates.name',
			$fix.'cart.id',
			$fix.'cart.good_nums',
			$fix.'cart.price_attr',
			$fix.'cart.good_price',
			$fix.'cart.good_id'
		);*/

		/*$list = M('Cart')
		->join(
			array(
			'left join '.$fix.'good good on good.id = '.$fix.'cart.good_id',
			'left join '.$fix.'goodcates goodcates on goodcates.id = good.goodcates_id'
			)
		)
		->field(
			array(
			'good.good_name',

			'good.weight',
			'good.package',
			'good.stocksize',
			'goodcates.name',
			$fix.'cart.id',
			$fix.'cart.good_nums',
			$fix.'cart.price_attr',
			$fix.'cart.good_price',
			$fix.'cart.good_id'
			)
		)
		->where( array( 'user_id' => session('member_auth.uid') ) )
		->select();*/

		/*dump($list);

		$res = $datas = array();

		foreach ($list as $item) {

			$res[$item['good_id']] += $item['good_nums'];

			$datas[$item['good_id']] = array(
				'salescount' => array( 'exp','salescount+'.$res[$item['good_id']] ),
				'stocksize' => array( 'exp','stocksize-'.$res[$item['good_id']] ),
			);
		}

		$where['id']=array_keys($datas);

		$this->saveAll( $where , array_values($datas),'good');

		dump(array_keys($datas));

		dump(M('good')->getlastsql());*/
		

		$this->assign(
			'list',
			M('Cart')
			->join(
				array(
					'left join '.$fix.'good good on good.id = '.$fix.'cart.good_id',
					'left join '.$fix.'goodcates goodcates on goodcates.id = good.goodcates_id'
					)
				)
			->field(
				array(
					'good.good_name',
					'good.weight',
					'good.package',
					'good.stocksize',
					'goodcates.name',
					$fix.'cart.id',
					$fix.'cart.good_nums',
					$fix.'cart.price_attr',
					$fix.'cart.good_price',
					$fix.'cart.good_id'
					)
				)
			->where( array( 'user_id' => session('member_auth.uid') ) )
			->select()
		);

		$this->display();
	}

	/*public function saveAll($saveWhere,&$saveData,$tableName){
		if($saveWhere==null||$tableName==null)
			return false;
        //获取更新的主键id名称
		$key = array_keys($saveWhere)[0];
        //获取更新列表的长度
		$len = count($saveWhere[$key]);
		$flag=true;
		$model = isset($model)?$model:M($tableName);
        //开启事务处理机制
		$model->startTrans();
        //记录更新失败ID
		$error=[];
		for($i=0;$i<$len;$i++){
            //预处理sql语句
			$isRight=$model->where($key.'='.$saveWhere[$key][$i])->setField($saveData[$i]);
			if($isRight==0){
                //将更新失败的记录下来
				$error[]=$i;
				$flag=false;
			}
		}
		if($flag ){

			$model->commit();
			return $saveWhere;
		}elseif(count($error)>0&count($error)<$len){
			$model->rollback();
			for($i=0;$i<count($error);$i++){

                //删除更新失败的ID和Data
				unset($saveWhere[$key][$error[$i]]);
				unset($saveData[$error[$i]]);

			}
            //重新将数组下标进行排序
			$saveWhere[$key]=array_merge($saveWhere[$key]);
			$saveData=array_merge($saveData);

			$this->saveAll($saveWhere,$saveData,$tableName);
			return $saveWhere;
		}
		else{
			$model->rollback();
			return false;
		}
	}*/

	public function del(){

		$result = $this->common_del("cart",null,null,true,true);

		if($result['status']){
			$count = M('Cart')->where( array('user_id'=> session('member_auth.uid') ) )->count();

			cookie('Cart_num',$count);
			$this->success('删除成功');
		}
		else{
			$this->error('删除失败');
		}
	}

	public function add(){

		if(!member_is_login()){
					
			$this->error("您还未登录，请登录",U('Public/login'));
			exit();
		}
		$map['good_id'] = $data['good_id'] = I('good_id','intval');
		$map['user_id'] = $data['user_id'] = session('member_auth.uid');
		$data['good_nums'] = I('good_nums','intval');
		$map['price_attr'] = $data['price_attr'] =I('price_attr');
		$data['good_price']=I('good_price');

		$map['good_price'] = array(
			array('gt',(floatval($data['good_price'])-0.001)),
			array('lt',(floatval($data['good_price'])+0.001))
		);

		$model = $this->getModel ( "Cart" );
		$Model = D ( parse_name ( get_table_name ( $model ['id'] ), 1 ) );
		$Model = $this->checkAttr ( $Model, $model ['id'] );

		$result = $Model->where($map)->find();
		/*var_dump($Model->getlastsql());
		exit();*/

		if(!empty($result)){

			$result = $Model->where($map)->setInc('good_nums',$data['good_nums']);

			if($result !== false){
				$this->getCount();
				$this->success('+1');
			}
			else{
				$this->error( $Model->getError() );
			}
			exit();
		}

		if( $Model->add($data) ){
			$this->getCount();
			$this->success('添加到购物车成功!');
		}
		else
		{
			$this->error( $Model->getError() );
		}
	}
	

	public function getCount(){

		$count = M('Cart')->where( array('user_id'=> session('member_auth.uid') ) )->count();

		cookie('Cart_num',$count);
		//$this->success($count);

	}

	public function submitorder(){

		$ids = I ( 'ids' );
		! empty ( $ids ) || $this->error ( '请选择商品');
		$jump = U('Order/index');
		session('ids',null);
		session('ids',$ids);		
		$this->success('提交成功',$jump);
	}

	public function order_add(){
		if(!member_is_login()){
					
			$this->error("您还未登录，请登录",U('Public/login'));
			exit();
		}
		$jump = U('Order/index',array('mode'=>1));
		session('orderparams',null);
		session(
			'orderparams',
			array(
				'good_id' => I('good_id'),
				'good_nums' => I('good_nums'),
				'price_attr' => I('price_attr'),
				'good_price' => I('good_price')
			)
		);
		$this->success('提交成功',$jump);
	}


}

?>