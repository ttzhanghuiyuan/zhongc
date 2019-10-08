<?php

/**
 * 前台公共库文件
 * 主要定义前台公共函数库
 */

/**
 * 检测验证码
 * @param  integer $id 验证码ID
 * @return boolean     检测结果
 * @author 向日葵 <1584114809@qq.com>
 */
function check_verify($code, $id = 1){
	$verify = new \Think\Verify();
	return $verify->check($code, $id);
}

/**
 * 获取列表总行数
 * @param  string  $category 分类ID
 * @param  integer $status   数据状态
 * @author 向日葵 <1584114809@qq.com>
 */
function get_list_count($category, $status = 1){
    static $count;
    if(!isset($count[$category])){
        $count[$category] = D('Document')->listCount($category, $status);
    }
    return $count[$category];
}

/**
 * 获取段落总数
 * @param  string $id 文档ID
 * @return integer    段落总数
 * @author 向日葵 <1584114809@qq.com>
 */
function get_part_count($id){
    static $count;
    if(!isset($count[$id])){
        $count[$id] = D('Document')->partCount($id);
    }
    return $count[$id];
}

/**
 * 获取导航URL
 * @param  string $url 导航URL
 * @return string      解析或的url
 * @author 向日葵 <1584114809@qq.com>
 */
function get_nav_url($url){
    switch ($url) {
        case 'http://' === substr($url, 0, 7):
        case '#' === substr($url, 0, 1):
            break;        
        default:
            $url = U($url);
            break;
    }
    return $url;
}
/*4位纯数字的随机数*/
function get_rand(){
    return rand(1000,9999);
}

//生成订单号或取样号
function build_order_no(){
    return date('Ymd').substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
}
/*获取产品溶剂*/
function get_solvent(){

    $list=S('sys_solvent_list');

    if(empty($list)){

        $list=M('solvent')->select();

        S('sys_solvent_list',$list);
    }
    return $list;

}
/*获取产品应用领域*/
function get_apply(){

    $list=S('sys_apply_list');

    if(empty($list)){

        $list=M('apply')->select();
        S('sys_apply_list',$list);
    }
    return $list;
}
/*获取产品类别*/
function get_cate(){

    $list=S('sys_goodcates_list');

    if(empty($list)){
        $list=D('Goodcates')->getTree(0,'hg_goodcates.application,hg_goodcates.id,hg_goodcates.name,hg_goodcates.sort,hg_goodcates.pid,hg_goodcates.show,picture.path');
        S('sys_goodcates_list',$list);
    }
    
    return $list;
}



function get_contact(){

    $list=S('sys_contact');

    if(empty($list)){

        $list=M('contact')->find(1);

        S('sys_contact',$list);
    }
    return $list;

}

function get_hotline(){

    $list=S('sys_hotline');

    if(empty($list)){

        $list=M('hotline')->select();
        S('sys_hotline',$list);
    }
    return $list;
}



function get_explode($str,$arr,$count=null){
    $strs=array();
    $str=explode(',', $str);
    //dump($str);
    foreach ($str as $key => $val) {

        foreach ($arr as $key => $value) {

            if($value['id'] == $val ){
                $strs[]=$value['name'];
                break;
            }
        }
    }
    $arr_count = count($strs);
    if(!empty($count)){
        return array_slice( $strs,0, ( $arr_count < 6 ? $arr_count: 6) );
    }
    else{
        return $strs;
    }
}

/*产品应用领域或溶剂已逗号隔开*/
function get_implode($str,$arr,$split=0){

    $strs='';
    $str=explode(',', $str);
    $split = $split ==1 ? "/" : ",";
    //dump($str);
    foreach ($str as $key => $val) {

        foreach ($arr as $key => $value) {

            if($value['id'] == $val ){
                $strs.=$value['name'].$split;
                break;
            }
        }
    }
    return rtrim($strs, $split);
}

function aci_sign($value){
    switch ($value) {
        case '1':
            return '<';
        case '2':
            return '≤';
        case '3':
            return '>';
        
        case '4':
            return '≥';

        default:
            return '-';
    }
}

/*获取最近浏览过产品
$num 记录数
$day 保存时间
$产品id
用 | 隔开
*/
function RecentViews($id,$num=4,$day=30)
{   
    $id = !empty($id) ? $id : 0;
    if(isset($_COOKIE['views']))
    {   
        //直接替换
        if($num==1)
        {   
            setcookie("views",$id,time()+86400*$day);
            $datastr = $_COOKIE['views'];
        }
        else
        {   
            $datastr = $_COOKIE['views'];
            $ids = explode(',',$datastr);
            //在限定记录数以内
            if(count($ids )< $num){
                //id是否已经存在
                if(!in_array($id,$ids)){
                    $datastr .= ','.$id;
                    setcookie("views",$datastr,time()+86400*$day);
                }
            }
            else
            {
                if(!in_array($id,$ids))
                {
                    $datastr = str_replace($ids[0].',','',$datastr);
                    $datastr .= ','.$id;
                    setcookie("views",$datastr,time()+86400*$day);
                }
            }
        }
    }
    else
    {
        setcookie("views",strval($id),time()+86400*$day);
        $datastr = $id;
    }
    return $datastr;
}

function addup($num,$var){
    $outcome=$num * $var;
    return number_format($outcome,2) ;
}

function countview($para)
{
    $m=M('statistics');
    $time=strtotime(date('Y-m-d',time()));
    $statistics = S('statistics'.$time);
    if(!empty($statistics)){
        $m
        ->where(array('createtime'=>$time))
        ->save(
            array(
                $para => array('exp',$para."+1")
            )
        );
    }
    else{

        S('statistics'.$time,'1',86400);

        $statistics = $m->where('createtime='.$time)->find();

        if(empty($statistics)){
            $m
            ->add(
                array(
                    'membership'=>0,
                    'pageview' =>0,
                    'userview'=>0,
                    'ipcount'=>1,
                    'createtime' => $time
                    )
                );
        }
    }
    /*if($list=$m->where(array('createtime'=>$time))->find())
    {
        $data[$para] = $list[$para]+1;
        $m->where(array('createtime'=>$time))->save($data);
    }
    else
    {
        $data[$para] =1;
        $data['createtime'] =$time;
        $m->add($data);
    }*/
}

