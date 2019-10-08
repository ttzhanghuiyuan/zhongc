<?php

namespace Admin\Controller;
/**
 * 文件控制器
 * 主要用于下载模型的文件上传和下载
 */
class FileController extends AdminController {
    
    private $table = "file";

    public function lists(){
        $this->assign('is_display_file',1);
        $this->assign('is_hide_add',1);
        $this->common_lists($this->table,0,'Common:lists');
    }

    public function popfile(){

        $this->assign('is_hide_add',1);
        $this->assign('is_display_file',1);
        $this->assign('is_hide_del',1);
        
        $this->assign($this->_pop_union_list($this->getModel($this->table)));
        $this->display('Common:popfile');
    }

    public function del(){

        $id = array_unique((array)I('ids','','strip_tags'));

        $id = count($id) <=0 ? I('id','intval') : $id;

        $list = M($this->table)->where( array( 'id' => array('in',$id) ) )->getField('id,savepath');

        $i = 0;

        foreach ($list as $key => $value) {

            if(file_exists($_SERVER['DOCUMENT_ROOT'].$value))
            {
                @unlink($_SERVER['DOCUMENT_ROOT'].$value);
            }

            M($this->table)->where('id='.$key)->delete();

            $i=$i+1;
        }

        if( $i<=0 ){

            $this->error('删除'.$i.'个文件');

        }else{
            $this->success('删除'.$i."个文件");
        }

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
            /*$return['data'] = think_encrypt(json_encode($info['download']));
            $return['info'] = $info['download']['name'];*/
            $return['status'] = 1;
            $return = array_merge($info['download'], $return);
        } else {
            $return['status'] = 0;
            $return['info']   = $File->getError();
        }

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

        /* 返回JSON数据 */
        $this->ajaxReturn($return);
    }

    public function downLocalFile($id,$flag=1){

        $file=null;

        if($flag=='0')
        {
            $file = M('File')->find($id);
            //$file['type']=$file['mime'];
            $file['rootpath']=C('DOWNLOAD_UPLOAD.rootPath');

        }
        else
        {
            $file = M('Picture')->find($id);
            $file['rootpath']=C('PICTURE_UPLOAD.rootPath');
        }

        if(is_file($file['rootpath'].$file['savepath'].$file['savename'])){

            /* 调用回调函数新增下载数 */
            //is_callable($callback) && call_user_func($callback, $args);
            /* 执行下载 */ //TODO: 大文件断点续传

            header("Content-Description: File Transfer");
            header('Content-type: ' . $file['type']);
            header('Content-Length:' . $file['size']);
            if (preg_match('/MSIE/', $_SERVER['HTTP_USER_AGENT'])) { //for IE
                header('Content-Disposition: attachment; filename="' . rawurlencode($file['name']) . '"');
            } else {
                header('Content-Disposition: attachment; filename="' . $file['name'] . '"');
            }
            readfile($file['rootpath'].$file['savepath'].$file['savename']);
            exit;
        } 
        else {
            $this->error = '文件已被删除！';
            return false;
        }
    }


}
