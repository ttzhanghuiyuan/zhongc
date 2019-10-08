<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 向日葵 <1584114809@qq.com> 
// +----------------------------------------------------------------------

/**
 * 系统配文件
 * 所有系统级别的配置
 */
return array(
    /* 模块相关配置 */
    'AUTOLOAD_NAMESPACE' => array('Addons' => ONETHINK_ADDON_PATH), //扩展模块列表
    'DEFAULT_MODULE'     => 'Home',
    'MODULE_DENY_LIST'   => array('Common', 'User'),
    'MODULE_ALLOW_LIST'  => array('Home','Admin'),

    //'LOG_EXCEPTION_RECORD' =>true,

    /* 系统数据加密设置 */
    'DATA_AUTH_KEY' => 'pnh<98zL]4%(rf0wF;RTGK:i{E5u[-v+/_N7"cC.', //默认数据加密KEY

    /* 调试配置 */
    'SHOW_PAGE_TRACE' => true,

    /* 用户相关设置 */
    'USER_MAX_CACHE'     => 1000, //最大缓存用户数
    'USER_ADMINISTRATOR' => 1, //管理员用户ID

    /* URL配置 */
    'URL_CASE_INSENSITIVE' => true, //默认false 表示URL区分大小写 true则表示不区分大小写
    'URL_MODEL'            => 2, //URL模式
    'VAR_URL_PARAMS'       => '', // PATHINFO URL参数变量
    'URL_PATHINFO_DEPR'    => '/', //PATHINFO URL分割符

    /* 全局过滤配置 */
    'DEFAULT_FILTER' => '', //全局过滤函数

    /* 数据库配置 */
    'DB_TYPE'   => 'mysqli', // 数据库类型
    'DB_HOST'   => 'localhost', // 服务器地址
    'DB_NAME'   => 'zhongc', // 数据库名
    'DB_USER'   => 'root', // 用户名
//    'DB_PWD'    => '654321',  // 密码7d2c23d458
    'DB_PWD'    => 'zhy195322',  // 密码7d2c23d458
    'DB_PORT'   => '3306', // 端口654321
    
    'DB_PREFIX' => 'bm_', // 数据库表前缀

    /* 文档模型配置 (文档模型核心配置，请勿更改) */
    'DOCUMENT_MODEL_TYPE' => array(2 => '主题', 1 => '目录', 3 => '段落'),

    'SESSION_PREFIX' => 'zc',
    
    /*邮箱配置*/
    // 'MAIL_HOST' =>'smtp.qq.com',// 配置邮件发送服务器
    'MAIL_SMTPAUTH' =>TRUE, //启用smtp认证
    //'MAIL_USERNAME' =>'1584114809@qq.com',
    //'MAIL_FROM' =>'1584114809@qq.com',
    //'MAIL_FROMNAME' =>'1584114809',
    //'MAIL_PASSWORD' =>'',
    'MAIL_CHARSET' =>'utf-8',
    'MAIL_ISHTML' =>true, // 是否HTML格式邮件

    /*短信发送配置*/
    /*'SMS_ACCOUNT_SID' =>'8a48b55149e0e7a20149eca34e310860',
    'SMS_AUTH_TOKEN' =>'8615f96ae7ff41e7878da6a53e10c8d1',
    'SMS_APPID'=>'8a48b5514fba2f87014fc58a754a177a',
    'SMS_REST_VERSION'=>'2013-12-26',
    'SMS_SERVER' =>'app.cloopen.com',*/

    /*测试短信*/
    'SMS_ACCOUNT_SID' =>'8a48b55149e0e7a20149eca34e310860',
    'SMS_AUTH_TOKEN' =>'8615f96ae7ff41e7878da6a53e10c8d1',
    'SMS_APPID'=>'aaf98f8949e0e5ac0149eca3c04d07d3',
    'SMS_REST_VERSION'=>'2013-12-26',
    'SMS_SERVER' =>'app.cloopen.com',

    //开启日志
    'LOG_RECORD'=>  true,  // 进行日志记录
    'LOG_EXCEPTION_RECORD'=>  true,    // 是否记录异常信息日志
    'LOG_LEVEL' =>  'EMERG,ALERT,CRIT,ERR,WARN,NOTIC,INFO,DEBUG,SQL',  // 允许记录的日志级别

);
