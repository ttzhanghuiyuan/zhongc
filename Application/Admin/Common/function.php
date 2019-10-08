<?php

/**
 * 后台公共文件
 * 主要定义后台公共函数库
 */

/* 解析列表定义规则*/

function get_list_field($data, $grid,$model){

    // 获取当前字段数据
    foreach($grid['field'] as $field){
        $array  =   explode('|',$field);
        $temp  =    $data[$array[0]];
        // 函数支持
        if(isset($array[1])){
            $temp = call_user_func($array[1], $temp);
        }
        $data2[$array[0]]    =   $temp;
    }
    if(!empty($grid['format'])){
        $value  =   preg_replace_callback('/\[([a-z_]+)\]/', function($match) use($data2){return $data2[$match[1]];}, $grid['format']);
    }else{
        $value  =   implode(' ',$data2);
    }

    // 链接支持
    if(!empty($grid['href'])){
        $links  =   explode(',',$grid['href']);
        foreach($links as $link){
            $array  =   explode('|',$link);
            $href   =   $array[0];
            if(preg_match('/^\[([a-z_]+)\]$/',$href,$matches)){
                $val[]  =   $data2[$matches[1]];
            }
            else{

                $show   =   isset($array[1])?$array[1]:$value;
                $class ='';
                if(false !== strpos($href, 'pop') ){

                    $class = "btn-popwin";
                    $href    =  preg_replace_callback('/\[([a-z_]+)\]/', function($match) use($data){return $data[$match[1]];}, $href);
                    $temparr = explode('@',$href);
                    $val[]  =   '<a class="'.$class.'" href="javascript:;" data-src="'.U('Popup/fulllist?extra='.$temparr[1].'&'.$temparr[2].'='.$temparr[3]).'">'.$show.'</a>';

                }else{
                     // 替换系统特殊字符串
                    if($href == '[DELETE]'){
                        $class = 'ajax-get confirm';
                    }
                    if($href == '[EDIT]'){
                        $class = '';     
                    }
                    if($href=='[SELECT]'){
                        $class='btn-list-select';
                    }
                    $href   =   str_replace(
                            array('[DELETE]','[EDIT]','[SELECT]','[MODEL]'),
                            array('del?ids=[id]&model=[MODEL]','edit?id=[id]&model=[MODEL]','',$model['id']),
                            $href);
                    // 替换数据变量
                    $href   =   preg_replace_callback('/\[([a-z_]+)\]/', function($match) use($data){return $data[$match[1]];}, $href);
                    $val[]  =   '<a class="'.$class.'" href="'.U($href).'">'.$show.'</a>';
                }                
            }
        }
        $value  =   implode(' ',$val);
    }
   //dump($data);
    return $value;
}



// 获取模型名称
function get_model_by_id($id){
    return $model = M('Model')->getFieldById($id,'title');
}

// 获取属性类型信息
function get_attribute_type($type=''){
    // TODO 可以加入系统配置
    static $_type = array(
        'num'       =>  array('数字','int(10) UNSIGNED NOT NULL'),
        'float'     =>  array('单精点数值','float NOT NULL'),
        'string'    =>  array('字符串','varchar(255) NOT NULL'),
        'strings'   =>  array('字符串最大值','text'),
        'textarea'  =>  array('文本框','text NOT NULL'),
        'datetime'  =>  array('时间','int(10) NOT NULL'),
        'bool'      =>  array('布尔','tinyint(2) NOT NULL'),
        'select'    =>  array('枚举','char(50) NOT NULL'),
    	'radio'		=>	array('单选','char(10) NOT NULL'),
    	'checkbox'	=>	array('多选','varchar(100) NOT NULL'),
    	'editor'    =>  array('编辑器','text NOT NULL'),
    	'picture'   =>  array('上传图片','int(10) UNSIGNED NOT NULL'),
        'pictures'  =>  array('多图上传','varchar(100) NOT NULL'),
    	'file'    	=>  array('上传附件','int(10) UNSIGNED NOT NULL'),
        'md5'       =>  array('md5','char(32)'),
        'sha1'      =>  array('sha1','char(40)'),
        'pwd'       =>  array('密码','varchar(255) NOT NULL'),
        'char'      => array('字符集','char(40)'),
        'listselect'=> array('列表选择','varchar(255) NOT NULL'),
        'fields'    => array('多填写字段','text NOT NULL'),
        'field'    => array('单填写字段','text NOT NULL'),
        'belong'    => array('分类','int(10) UNSIGNED NOT NULL')
    );
    return $type?$_type[$type][0]:$_type;
}

/**
 * 获取对应状态的文字信息
 * @param int $status
 * @return string 状态文字 ，false 未获取到
 * @author 
 */
function get_status_title($status = null){
    if(!isset($status)){
        return false;
    }
    switch ($status){
        case -1 : return    '已删除';   break;
        case 0  : return    '禁用';     break;
        case 1  : return    '正常';     break;
        case 2  : return    '待审核';   break;
        default : return    false;      break;
    }
}

// 获取数据的状态操作
function show_status_op($status) {
    switch ($status){
        case 0  : return    '启用';     break;
        case 1  : return    '禁用';     break;
        case 2  : return    '审核';		break;
        default : return    false;      break;
    }
}

/**
 * 获取文档的类型文字
 * @param string $type
 * @return string 状态文字 ，false 未获取到
 * @author 
 */
function get_document_type($type = null){
    if(!isset($type)){
        return false;
    }
    switch ($type){
        case 1  : return    '目录'; break;
        case 2  : return    '主题'; break;
        case 3  : return    '段落'; break;
        default : return    false;  break;
    }
}

/**
 * 获取配置的类型
 * @param string $type 配置类型
 * @return string
 */
function get_config_type($type=0){
    $list = C('CONFIG_TYPE_LIST');
    return $list[$type];
}

/**
 * 获取配置的分组
 * @param string $group 配置分组
 * @return string
 */
function get_config_group($group=0){
    $list = C('CONFIG_GROUP_LIST');
    return $group?$list[$group]:'';
}

/**
 * select返回的数组进行整数映射转换
 *
 * @param array $map  映射关系二维数组  array(
 *                                          '字段名1'=>array(映射关系数组),
 *                                          '字段名2'=>array(映射关系数组),
 *                                           ......
 *                                       )
 * @author  
 * @return array
 *
 *  array(
 *      array('id'=>1,'title'=>'标题','status'=>'1','status_text'=>'正常')
 *      ....
 *  )
 *
 */
function int_to_string(&$data,$map=array('status'=>array(1=>'正常',-1=>'删除',0=>'禁用',2=>'未审核',3=>'草稿'))) {
    if($data === false || $data === null ){
        return $data;
    }
    $data = (array)$data;
    foreach ($data as $key => $row){
        foreach ($map as $col=>$pair){
            if(isset($row[$col]) && isset($pair[$row[$col]])){
                $data[$key][$col.'_text'] = $pair[$row[$col]];
            }
        }
    }
    return $data;
}

/**
 * 动态扩展左侧菜单,base.html里用到
 * @author 
 */
function extra_menu($extra_menu,&$base_menu){
    foreach ($extra_menu as $key=>$group){
        if( isset($base_menu['child'][$key]) ){
            $base_menu['child'][$key] = array_merge( $base_menu['child'][$key], $group);
        }else{
            $base_menu['child'][$key] = $group;
        }
    }
}

/**
 * 获取参数的所有父级分类
 * @param int $cid 分类id
 * @return array 参数分类和父类的信息集合
 * @author 
 */
function get_parent_category($cid){
    if(empty($cid)){
        return false;
    }
    $cates  =   M('Category')->where(array('status'=>1))->field('id,title,pid')->order('sort')->select();
    $child  =   get_category($cid);	//获取参数分类的信息
    $pid    =   $child['pid'];
    $temp   =   array();
    $res[]  =   $child;
    while(true){
        foreach ($cates as $key=>$cate){
            if($cate['id'] == $pid){
                $pid = $cate['pid'];
                array_unshift($res, $cate);	//将父分类插入到数组第一个元素前
            }
        }
        if($pid == 0){
            break;
        }
    }
    return $res;
}

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
 * 获取当前分类的文档类型
 * @param int $id
 * @return array 文档类型数组
 * @author 
 */
function get_type_bycate($id = null){
    if(empty($id)){
        return false;
    }
    $type_list  =   C('DOCUMENT_MODEL_TYPE');
    $model_type =   M('Category')->getFieldById($id, 'type');
    $model_type =   explode(',', $model_type);
    foreach ($type_list as $key=>$value){
        if(!in_array($key, $model_type)){
            unset($type_list[$key]);
        }
    }
    return $type_list;
}

/**
 * 获取当前文档的分类
 * @param int $id
 * @return array 文档类型数组
 * @author 
 */
function get_cate($cate_id = null){
    if(empty($cate_id)){
        return false;
    }
    $cate   =   M('Category')->where('id='.$cate_id)->getField('title');
    return $cate;
}

 // 分析枚举类型配置值 格式 a:名称1,b:名称2
function parse_config_attr($string) {
    $array = preg_split('/[,;\r\n]+/', trim($string, ",;\r\n"));
    if(strpos($string,':')){
        $value  =   array();
        foreach ($array as $val) {
            list($k, $v) = explode(':', $val);
            $value[$k]   = $v;
        }
    }else{
        $value  =   $array;
    }
    return $value;
}

// 获取子文档数目
function get_subdocument_count($id=0){
    return  M('Document')->where('pid='.$id)->count();
}



 // 分析枚举类型字段值 格式 a:名称1,b:名称2
 // 暂时和 parse_config_attr功能相同
 // 但请不要互相使用，后期会调整
function parse_field_attr($string) {
    if(0 === strpos($string,':')){
        // 采用函数定义
        return   eval(substr($string,1).';');
    }
    $array = preg_split('/[,;\r\n]+/', trim($string, ",;\r\n"));
    if(strpos($string,':')){
        $value  =   array();
        foreach ($array as $val) {
            list($k, $v) = explode(':', $val);
            $value[$k]   = $v;
        }
    }else{
        $value  =   $array;
    }
    return $value;
}

function get_covers($ids){
    return empty($ids) ? null : M()->query('select id,path,ext from hg_picture where id in ('.$ids.') order by field(id,'.$ids.')');
}

/**
 * 获取行为数据
 * @param string $id 行为id
 * @param string $field 需要获取的字段
 * @author 
 */
function get_action($id = null, $field = null){
	if(empty($id) && !is_numeric($id)){
		return false;
	}
	$list = S('action_list');
	if(empty($list[$id])){
		$map = array('status'=>array('gt', -1), 'id'=>$id);
		$list[$id] = M('Action')->where($map)->field(true)->find();
	}
	return empty($field) ? $list[$id] : $list[$id][$field];
}

/**
 * 根据条件字段获取数据
 * @param mixed $value 条件，可用常量或者数组
 * @param string $condition 条件字段
 * @param string $field 需要返回的字段，不传则返回整个数据
 * @author 
 */
function get_document_field($value = null, $condition = 'id', $field = null){
	if(empty($value)){
		return false;
	}

	//拼接参数
	$map[$condition] = $value;
	$info = M('Model')->where($map);
	if(empty($field)){
		$info = $info->field(true)->find();
	}else{
		$info = $info->getField($field);
	}
	return $info;
}

/**
 * 获取行为类型
 * @param intger $type 类型
 * @param bool $all 是否返回全部类型
 * @author 
 */
function get_action_type($type, $all = false){
	$list = array(
		1=>'系统',
		2=>'用户',
	);
	if($all){
		return $list;
	}
	return $list[$type];
}

function format_date($format,$timestamp){
    if(!$timestamp || $timestamp < 0) return '';

    return date($format,$timestamp);
}

function getlanguages(){
    return array(
        'en_US'=>'English',
        'zh_CN'=>'中文 (中国)',
        'zh_HK'=>'中文 (香港)',
        'zh_TW' => '中文 (台灣)',
        'ja' => '日本語',
        'lo' => 'ພາສາລາວ',
        'fr_FR' => 'Français',
    );
}

function getlang(){

    $list=S('sys_lang');

    if(empty($list)){

        $list=  M('lang') -> select();

        S('sys_lang',$list);
    }
    return $list;
}

function get_menu_position(){
    return array(
        '1' => '主菜单',
        '2' => '顶栏左边菜单',
        '3' => '语言栏',
        '4' => '底部右下菜单'
    );
}

function get_nav_pos_lang($nav_pos_lang){

    if(empty($nav_pos_lang)){

        return '';
    }

    $nav_pos_lang= explode('_',$nav_pos_lang);
    
    $pos = get_menu_position();
    $pos = $pos[$nav_pos_lang[1]];

    $lang = get_lang_tag($nav_pos_lang[0]);

    if(empty($lang))
        return '';
    
    return $pos.'_'.$lang;

}

function get_fields_value($name_value){

    $name_value = json_decode($name_value,true); //dump($name_value);
    $name_value = $name_value[0];
    //dump($name_value);
    $name_name =current($name_value);
    $name_value = end($name_value);
    //dump($name_value);

    return  (empty($name_name)?'字段名未填':$name_name ).'<br/>' .(empty($name_value)?'字段值未填':$name_value);
}

/*手机正则验证*/
function pregPN($test){
    $rule  = "/^((13[0-9])|147|(15[0-35-9])|180|182|(18[5-9]))[0-9]{8}$/A";
    preg_match($rule,$test,$result);
    return $result;
}

/*邮箱正则验证*/
function pregE($test){
    $zhengze = '/^[a-zA-Z0-9][a-zA-Z0-9._-]*\@[a-zA-Z0-9]+\.[a-zA-Z0-9\.]+$/A';
    preg_match($zhengze,$test,$result);
    return $result;
}

/*电话正则表达*/
function pregTP($test){
    $rule = '/^(\(((010)|(021)|(0\d{3,4}))\)( ?)([0-9]{7,8}))|((010|021|0\d{3,4}))([- ]{1,2})([0-9]{7,8})$/A';
    preg_match($rule,$test,$result);
    return $result;
}

/*身份证号的正则表达式*/
function pregIC($test){
    $rule = '/^(([0-9]{15})|([0-9]{18})|([0-9]{17}x))$/';
    preg_match($rule,$test,$result);
    return $result;
}

/*邮编正则表达*/
function pregPOS($test){
    $rule ='/^[1-9]\d{5}$/';
    preg_match($rule,$test,$result);
    return $result;
}
/*function get_company(){

    $list=S('sys_company');

    if(empty($list)){

        $list=M('company')->find(1);

        S('sys_company',$list);
    }
    return $list;

}*/
