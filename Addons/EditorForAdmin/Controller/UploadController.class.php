<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 
// +----------------------------------------------------------------------

namespace Addons\EditorForAdmin\Controller;
use Home\Controller\AddonsController;
use Admin\Model\PictureModel;
use Admin\Model\FileModel;
use Think\Upload;

class UploadController extends AddonsController{

	public $uploader = null;

	/* 上传图片 */
	public function upload(){
		session('upload_error', null);
		/* 上传配置 */
		//$setting = C('EDITOR_UPLOAD');

		/* 调用文件上传组件上传文件 */
		// $this->uploader = new Upload($setting, 'Local');
		// $info   = $this->uploader->upload($_FILES);
		// if($info){
		// 	$url = C('EDITOR_UPLOAD.rootPath').$info['imgFile']['savepath'].$info['imgFile']['savename'];
		// 	$url = str_replace('./', '/', $url);
		// 	$info['fullpath'] = __ROOT__.$url;
		// }

		$ext = explode('.', $_FILES['imgFile']['name']);

		if(in_array(strtolower($ext[1]), array('jpg','gif','png','jpeg') )){

			$upload = D('Picture');
	        $pic_driver = C('PICTURE_UPLOAD_DRIVER');
	        $info = $upload->upload(
	            $_FILES,
	            C('PICTURE_UPLOAD'),
	            C('PICTURE_UPLOAD_DRIVER'),
	            C("UPLOAD_{$pic_driver}_CONFIG")
	        );
	        if($info){
				$url = C('PICTURE_UPLOAD.rootPath').$info['imgFile']['savepath'].$info['imgFile']['savename'];
				$url = str_replace('./', '/', $url);
				$info['fullpath'] = __ROOT__.$url;
			}

		}else{

			$upload = D('File');
			$file_driver = C('PICTURE_UPLOAD_DRIVER');
			$info = $upload->upload(
				$_FILES,
				C('File_UPLOAD'),
				C('PICTURE_UPLOAD_DRIVER'),
				C("UPLOAD_{$file_driver}_CONFIG")
			);
			if($info){
				$url = $info['imgFile']['savepath'];
				$url = str_replace('./', '/', $url);
				$info['fullpath'] = __ROOT__.$url;
			}
		}
		
		session('upload_error',$upload->getError() );//$this->uploader->getError()
		return $info;
	}

	//keditor编辑器上传图片处理
	public function ke_upimg(){
		/* 返回标准数据 */
		$return  = array('error' => 0, 'info' => '上传成功', 'data' => '');
		$img = $this->upload();
		/* 记录附件信息 */
		if($img){
			$return['url'] = $img['fullpath'];
			unset($return['info'], $return['data']);
		} else {
			$return['error'] = 1;
			$return['message']   = session('upload_error');
		}

		/* 返回JSON数据 */
		exit(json_encode($return));
	}

	//ueditor编辑器上传图片处理
	public function ue_upimg(){

		$img = $this->upload();
		$return = array();
		$return['url'] = $img['fullpath'];
		$title = htmlspecialchars($_POST['pictitle'], ENT_QUOTES);
		$return['title'] = $title;
		$return['original'] = $img['imgFile']['name'];
		$return['state'] = ($img)? 'SUCCESS' : session('upload_error');
		/* 返回JSON数据 */
		$this->ajaxReturn($return);
	}

}
