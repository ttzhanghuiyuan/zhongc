<?php

namespace Admin\Controller;
/**
 * 文件控制器
 * 主要用于下载模型的文件上传和下载
 */
class PictureController extends AdminController {
    
    private $table = "Picture";

    public function lists(){
        $this->assign('is_hide_add',1);
        $this->assign('is_display_picture',1);
        $this->common_lists($this->table,0,'Common:lists');
    }

    public function popimg(){
        $this->assign('is_hide_add',1);
        $this->assign('is_display_picture',1);
        $this->assign($this->_get_model_list($this->getModel($this->table)));
        $this->display('Common:popimg');
    }

    public function edit(){
        
    	$this->assign('path', M('Picture')->where('id='.I('id'))->getField('path'));
    	$this->display();
    }

    public function del(){

    	$id = array_unique((array)I('ids','','strip_tags'));

    	$id = count($id) <=0 ? I('id') : $id;

    	$list = M($this->table)->where( array( 'id' => array('in',$id) ) )->getField('id,path');

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

    /*public function saveShear(){
    	$temp['savedata'] =json_decode(trim(stripslashes($_POST["savedata"])), true); 
		dump($temp['savedata']['imgurl']);
		exit();
		$size = filesize($temp);
		$temp = explode('.' , basename($temp) ); 
		$num  = count($temp);
		$result = M($this->table)->add(
			array(
				'path' 		  => I('imgurl'),
				'md5'         => md5_file(I('imgname')),
				'sha1'        => sha1_file(I('imgname')),
				'status'      => 1,
				'create_time' => time(),
				'savename'    => I('imgname'),
				'picture_name'=> I('imgname'),
				'type'        => 'application/octet-stream',
				'size'        => $size,
				'savepath'    => 'Download/',
				'ext'         => $temp[$num-1],
				)
		);
		if($result!==false){

			$this->ajaxReturn(array('status'=>1));
		}else{
			$this->ajaxReturn(array('status'=>2));
		}
    }*/
    
}
