<?php

/**
 * UCenter客户端配置文件
 * 注意：该配置文件请使用常量方式定义
 */

define('UC_APP_ID', 1); //应用ID
define('UC_API_TYPE', 'Model'); //可选值 Model / Service
define('UC_AUTH_KEY', 'pnh<98zL]4%(rf0wF;RTGK:i{E5u[-v+/_N7"cC.'); //加密KEY
//define('UC_DB_DSN', 'mysql://root:654321@127.0.0.1:3306/zhongc'); // 数据库连接，使用Model方式调用API必须配置此项
define('UC_DB_DSN', 'mysqli://root:zhy195322@localhost:3306/zhongc#utf8'); // 数据库连接，使用Model方式调用API必须配置此项
define('UC_TABLE_PREFIX', 'bm_'); // 数据表前缀，使用Model方式调用API必须配置此项
