<?php

namespace Home\Controller;

/**
 * 文件控制器
 * 主要用于下载模型的文件上传和下载
 */

class FileController extends HomeController {

	public function index(){
		
	}
	/* 文件上传 */
	public function upload(){
		$return  = array('status' => 1, 'info' => '上传成功', 'data' => '');
		/* 调用文件上传组件上传文件 */
		$File = D('File');
		$file_driver = C('DOWNLOAD_UPLOAD_DRIVER');
		$info = $File->upload(
			$_FILES,
			C('DOWNLOAD_UPLOAD'),
			C('DOWNLOAD_UPLOAD_DRIVER'),
			C("UPLOAD_{$file_driver}_CONFIG")
		);
		//dump($info);
		/* 记录附件信息 */
		if($info){
			/*$return['data'] = think_encrypt(json_encode($info['download']));*/
			/*$order_no=I('order_no');

			if(!empty($order_no))
			{
				//dump($info['download']['id']);
				M('Order')->where('order_no='.$order_no)->save( array('order_contract'=>$info['download']['id'] ));
			}*/

			$return['status'] = 1;
            $return = array_merge($info['download'], $return);
		} else {
			$return['status'] = 0;
			$return['info']   = $File->getError();
		}

		/* 返回JSON数据 */
		$this->ajaxReturn($return);
	}

	/**
     * 上传图片
     * @author 
     */
    public function uploadPicture(){
        //TODO: 用户登录检测

        /* 返回标准数据 */
        $return  = array('status' => 1, 'info' => '上传成功', 'data' => '');

        /* 调用文件上传组件上传文件 */
        $Picture = D('Picture');
        $pic_driver = C('PICTURE_UPLOAD_DRIVER');
        $info = $Picture->upload(
            $_FILES,
            C('PICTURE_UPLOAD'),
            C('PICTURE_UPLOAD_DRIVER'),
            C("UPLOAD_{$pic_driver}_CONFIG")
        ); //TODO:上传到远程服务器
        //dump($info);
        /* 记录图片信息 */
        if($info){
            $return['status'] = 1;
            $return = array_merge($info['download'], $return);
        } else {
            $return['status'] = 0;
            $return['info']   = $Picture->getError();
        }
        //dump($return);

        /* 返回JSON数据 */
        $this->ajaxReturn($return);
    }

	/* 下载文件 */
	public function download($id = null){
		if(empty($id) || !is_numeric($id)){
			$this->error('参数错误！');
		}

		$logic = D('Download', 'Logic');
		if(!$logic->download($id)){
			$this->error($logic->getError());
		}
		
	}
}
