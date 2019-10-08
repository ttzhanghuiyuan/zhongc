/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : zhongc

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-04-05 22:15:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bm_aboutus
-- ----------------------------
DROP TABLE IF EXISTS `bm_aboutus`;
CREATE TABLE `bm_aboutus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `aboutus_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `aboutus_content` text COMMENT '内容',
  `aboutus_pics` varchar(100) DEFAULT NULL COMMENT '图片组',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_aboutus
-- ----------------------------
INSERT INTO `bm_aboutus` VALUES ('2', '惠州市大亚湾众创空间投资管理有限公司', '<p class=\"MsoNormal\"><span style=\"font-family: &quot;andale mono&quot;; font-size: 14px;\">我们是一家为创客提供创业场地、设施及配套服务全流程一站式的企业。公司以打造“中国领先的众创空间及孵化器运营机构”为目标，致力于众创空间与孵化器的开发、运营、管理及孵化体系建设，重点聚焦互联网、电子商务、大数据、商业智能、科技金融、文化内容、健康医疗等新兴产业园的开发建设及产业孵化服务体系搭建，打造产业创新驱动平台，孵化创新创业企业。</span></p>', '192');
INSERT INTO `bm_aboutus` VALUES ('3', 'Huizhou, Dayawan public space Cci Capital Ltd', 'We are a one-stop shop providing customers with entrepreneurial sites, facilities and supporting services. The company to create Chinese leading public record space and incubator operation mechanism \"as the goal, dedicated to the public record space and business incubator development, operation, management and incubation system construction, build focus on the Internet, e-commerce, big data, business intelligence, technology finance, culture content, health care and other emerging industrial park the development and construction industry incubator service system, to build the industrial innovation platform, innovation enterprise incubator.', '192,191,229');

-- ----------------------------
-- Table structure for bm_act
-- ----------------------------
DROP TABLE IF EXISTS `bm_act`;
CREATE TABLE `bm_act` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `act_title` varchar(255) DEFAULT NULL COMMENT '活动标题',
  `act_content` text COMMENT '活动内容',
  `act_pic` int(10) unsigned DEFAULT NULL COMMENT '活动展示图',
  `act_time` int(10) DEFAULT NULL COMMENT '活动时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_act
-- ----------------------------
INSERT INTO `bm_act` VALUES ('3', '国际化联合办公氛围	', '对于思微SimplyWork的微友，那更是有福啦！每当过节，社区经理们会不定期策划各种主题社区活动：38女神节活动、开学日主题活动、中秋节月饼DIY活动、冬至包饺子活动……这些都是思微为入驻微友鲸心准备的专属活动，让微友们能在办公空间里感受到社区的温暖。\r\n', '192', '1502347320');
INSERT INTO `bm_act` VALUES ('4', 'international work', 'international work', '192', '1502347440');
INSERT INTO `bm_act` VALUES ('5', '公司简介', '我们是一家为创客提供创业场地、设施及配套服务全流程一站式的企业。公司以打造“中国领先的众创空间及孵化器运营机构”为目标，致力于众创空间与孵化器的开发、运营、管理及孵化体系建设，重点聚焦互联网、电子商务、大数据、商业智能、科技金融、文化内容、健康医疗等新兴产业园的开发建设及产业孵化服务体系搭建，打造产业创新驱动平台，孵化创新创业企业。', '201', '1277195040');
INSERT INTO `bm_act` VALUES ('6', 'Company profile', 'We are a one-stop shop providing customers with entrepreneurial sites, facilities and supporting services. The company to create Chinese leading public record space and incubator operation mechanism \"as the goal, dedicated to the public record space and business incubator development, operation, management and incubation system construction, build focus on the Internet, e-commerce, big data, business intelligence, technology finance, culture content, health care and other emerging industrial park the development and construction industry incubator service system, to build the industrial innovation platform, innovation enterprise incubator.', '201', '1502699100');
INSERT INTO `bm_act` VALUES ('7', 'Dayawan ', 'In the industry of Dayawan District of Huizhou city project signing ceremony, hand in hand, Gao Hong, three Century Investment investment capital, the construction of Dayawan \"one\" hit off the entrepreneurial ecosystem.', '201', '1494295200');
INSERT INTO `bm_act` VALUES ('12', '大亚湾“创业壹号“创客生态圈', '参加惠州市大亚湾区产业项目签约仪式，携手世纪投资、高弘投资、元古资本，共建大亚湾“创业壹号“创客生态圈。						      ', '201', '1501659840');
INSERT INTO `bm_act` VALUES ('10', '签订战略合作协议', '2017.07.27 与“惠州揭商青联”签订战略合作协议', '195', '1501120800');
INSERT INTO `bm_act` VALUES ('11', 'Sign a strategic cooperation agreement', '2017.07.27 and \"Huizhou Jie Business Federation signed a strategic cooperation agreement\"', '195', '1501120800');

-- ----------------------------
-- Table structure for bm_action
-- ----------------------------
DROP TABLE IF EXISTS `bm_action`;
CREATE TABLE `bm_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of bm_action
-- ----------------------------
INSERT INTO `bm_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `bm_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '1', '1440497381');
INSERT INTO `bm_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `bm_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `bm_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `bm_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `bm_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `bm_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1440497933');
INSERT INTO `bm_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `bm_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1440497916');
INSERT INTO `bm_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1440497533');

-- ----------------------------
-- Table structure for bm_action_log
-- ----------------------------
DROP TABLE IF EXISTS `bm_action_log`;
CREATE TABLE `bm_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2083 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of bm_action_log
-- ----------------------------
INSERT INTO `bm_action_log` VALUES ('1', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-24 17:53登录了后台', '1', '1440410033');
INSERT INTO `bm_action_log` VALUES ('2', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-24 17:56登录了后台', '1', '1440410168');
INSERT INTO `bm_action_log` VALUES ('3', '1', '2', '2130706433', 'member', '2', 'test在2015-08-24 17:59登录了后台', '1', '1440410364');
INSERT INTO `bm_action_log` VALUES ('4', '1', '2', '2130706433', 'member', '2', 'test在2015-08-24 17:59登录了后台', '1', '1440410397');
INSERT INTO `bm_action_log` VALUES ('5', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-24 18:00登录了后台', '1', '1440410424');
INSERT INTO `bm_action_log` VALUES ('6', '1', '2', '2130706433', 'member', '2', 'test在2015-08-24 18:01登录了后台', '1', '1440410514');
INSERT INTO `bm_action_log` VALUES ('7', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-24 18:02登录了后台', '1', '1440410553');
INSERT INTO `bm_action_log` VALUES ('8', '1', '2', '2130706433', 'member', '2', 'test在2015-08-24 18:03登录了后台', '1', '1440410637');
INSERT INTO `bm_action_log` VALUES ('9', '1', '2', '2130706433', 'member', '2', 'test在2015-08-24 18:05登录了后台', '1', '1440410735');
INSERT INTO `bm_action_log` VALUES ('10', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-24 18:05登录了后台', '1', '1440410756');
INSERT INTO `bm_action_log` VALUES ('11', '1', '2', '2130706433', 'member', '2', 'test在2015-08-24 18:07登录了后台', '1', '1440410832');
INSERT INTO `bm_action_log` VALUES ('12', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-24 18:08登录了后台', '1', '1440410883');
INSERT INTO `bm_action_log` VALUES ('13', '1', '1', '-1062731159', 'member', '1', 'admin在2015-08-24 19:05登录了后台', '1', '1440414348');
INSERT INTO `bm_action_log` VALUES ('14', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-25 14:37登录了后台', '1', '1440484642');
INSERT INTO `bm_action_log` VALUES ('15', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-25 14:40登录了后台', '1', '1440484828');
INSERT INTO `bm_action_log` VALUES ('16', '11', '1', '2130706433', 'category', '2', '操作url：/index.php?s=/admin/category/edit.html', '1', '1440485147');
INSERT INTO `bm_action_log` VALUES ('17', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-25 16:15登录了后台', '1', '1440490516');
INSERT INTO `bm_action_log` VALUES ('18', '11', '1', '2130706433', 'category', '39', '操作url：/index.php?s=/admin/category/add.html', '1', '1440490826');
INSERT INTO `bm_action_log` VALUES ('19', '11', '1', '2130706433', 'category', '1', '操作url：/index.php?s=/admin/category/edit.html', '1', '1440491304');
INSERT INTO `bm_action_log` VALUES ('20', '11', '1', '2130706433', 'category', '39', '操作url：/index.php?s=/admin/category/edit.html', '1', '1440491313');
INSERT INTO `bm_action_log` VALUES ('21', '11', '1', '2130706433', 'category', '39', '操作url：/index.php?s=/admin/category/edit.html', '1', '1440491321');
INSERT INTO `bm_action_log` VALUES ('22', '11', '1', '2130706433', 'category', '2', '操作url：/index.php?s=/admin/category/edit.html', '1', '1440491328');
INSERT INTO `bm_action_log` VALUES ('23', '10', '1', '2130706433', 'Menu', '43', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1440491426');
INSERT INTO `bm_action_log` VALUES ('24', '10', '1', '2130706433', 'Menu', '1', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1440491441');
INSERT INTO `bm_action_log` VALUES ('25', '10', '1', '2130706433', 'Menu', '2', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1440491486');
INSERT INTO `bm_action_log` VALUES ('26', '10', '1', '2130706433', 'Menu', '86', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1440491706');
INSERT INTO `bm_action_log` VALUES ('27', '10', '1', '2130706433', 'Menu', '90', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1440491761');
INSERT INTO `bm_action_log` VALUES ('28', '10', '1', '2130706433', 'Menu', '63', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1440491787');
INSERT INTO `bm_action_log` VALUES ('29', '11', '1', '2130706433', 'category', '39', '操作url：/index.php?s=/admin/category/edit.html', '1', '1440491855');
INSERT INTO `bm_action_log` VALUES ('30', '10', '1', '2130706433', 'Menu', '43', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1440492081');
INSERT INTO `bm_action_log` VALUES ('31', '11', '1', '2130706433', 'category', '1', '操作url：/index.php?s=/admin/category/edit.html', '1', '1440493074');
INSERT INTO `bm_action_log` VALUES ('32', '11', '1', '2130706433', 'category', '39', '操作url：/index.php?s=/admin/category/edit.html', '1', '1440493081');
INSERT INTO `bm_action_log` VALUES ('33', '11', '1', '2130706433', 'category', '2', '操作url：/index.php?s=/admin/category/edit.html', '1', '1440493103');
INSERT INTO `bm_action_log` VALUES ('34', '6', '1', '2130706433', 'config', '13', '操作url：/index.php?s=/admin/config/edit.html', '1', '1440494236');
INSERT INTO `bm_action_log` VALUES ('35', '6', '1', '2130706433', 'config', '13', '操作url：/index.php?s=/admin/config/edit.html', '1', '1440494421');
INSERT INTO `bm_action_log` VALUES ('36', '6', '1', '2130706433', 'config', '13', '操作url：/index.php?s=/admin/config/edit.html', '1', '1440494890');
INSERT INTO `bm_action_log` VALUES ('37', '6', '1', '2130706433', 'config', '13', '操作url：/index.php?s=/admin/config/edit.html', '1', '1440494926');
INSERT INTO `bm_action_log` VALUES ('38', '6', '1', '2130706433', 'config', '13', '操作url：/index.php?s=/admin/config/edit.html', '1', '1440494950');
INSERT INTO `bm_action_log` VALUES ('39', '10', '1', '2130706433', 'Menu', '43', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1440496184');
INSERT INTO `bm_action_log` VALUES ('40', '10', '1', '2130706433', 'Menu', '43', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1440496214');
INSERT INTO `bm_action_log` VALUES ('41', '1', '4', '2130706433', 'member', '4', 'test123在2015-08-25 17:51登录了后台', '1', '1440496294');
INSERT INTO `bm_action_log` VALUES ('42', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-25 17:52登录了后台', '1', '1440496336');
INSERT INTO `bm_action_log` VALUES ('43', '1', '4', '2130706433', 'member', '4', 'test123在2015-08-25 17:54登录了后台', '1', '1440496440');
INSERT INTO `bm_action_log` VALUES ('44', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-25 17:54登录了后台', '1', '1440496491');
INSERT INTO `bm_action_log` VALUES ('45', '1', '4', '2130706433', 'member', '4', 'test123在2015-08-25 17:55登录了后台', '1', '1440496543');
INSERT INTO `bm_action_log` VALUES ('46', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-25 17:56登录了后台', '1', '1440496565');
INSERT INTO `bm_action_log` VALUES ('47', '1', '4', '2130706433', 'member', '4', 'test123在2015-08-25 17:57登录了后台', '1', '1440496679');
INSERT INTO `bm_action_log` VALUES ('48', '1', '4', '2130706433', 'member', '4', 'test123在2015-08-25 17:59登录了后台', '1', '1440496790');
INSERT INTO `bm_action_log` VALUES ('49', '1', '4', '2130706433', 'member', '4', 'test123在2015-08-25 18:01登录了后台', '1', '1440496863');
INSERT INTO `bm_action_log` VALUES ('50', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-25 18:02登录了后台', '1', '1440496927');
INSERT INTO `bm_action_log` VALUES ('51', '1', '4', '2130706433', 'member', '4', 'test123在2015-08-25 18:02登录了后台', '1', '1440496967');
INSERT INTO `bm_action_log` VALUES ('52', '1', '4', '2130706433', 'member', '4', 'test123在2015-08-25 18:11登录了后台', '1', '1440497495');
INSERT INTO `bm_action_log` VALUES ('53', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-25 18:12登录了后台', '1', '1440497575');
INSERT INTO `bm_action_log` VALUES ('54', '10', '1', '2130706433', 'Menu', '122', '操作url：/index.php?s=/admin/menu/add.html', '1', '1440497802');
INSERT INTO `bm_action_log` VALUES ('55', '10', '1', '2130706433', 'Menu', '122', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1440497865');
INSERT INTO `bm_action_log` VALUES ('56', '1', '4', '2130706433', 'member', '4', 'test123在2015-08-25 18:18登录了后台', '1', '1440497908');
INSERT INTO `bm_action_log` VALUES ('57', '1', '4', '2130706433', 'member', '4', 'test123在2015-08-25 18:21登录了后台', '1', '1440498118');
INSERT INTO `bm_action_log` VALUES ('58', '1', '4', '2130706433', 'member', '4', 'test123在2015-08-25 18:28登录了后台', '1', '1440498538');
INSERT INTO `bm_action_log` VALUES ('59', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-25 18:49登录了后台', '1', '1440499796');
INSERT INTO `bm_action_log` VALUES ('60', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-26 09:19登录了后台', '1', '1440551962');
INSERT INTO `bm_action_log` VALUES ('61', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-26 09:31登录了后台', '1', '1440552705');
INSERT INTO `bm_action_log` VALUES ('62', '10', '1', '2130706433', 'Menu', '19', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1440556506');
INSERT INTO `bm_action_log` VALUES ('63', '10', '1', '2130706433', 'Menu', '106', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1440556541');
INSERT INTO `bm_action_log` VALUES ('64', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-26 10:58登录了后台', '1', '1440557907');
INSERT INTO `bm_action_log` VALUES ('65', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-26 10:58登录了后台', '1', '1440557925');
INSERT INTO `bm_action_log` VALUES ('66', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-26 11:06登录了后台', '1', '1440558379');
INSERT INTO `bm_action_log` VALUES ('67', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-26 11:06登录了后台', '1', '1440558397');
INSERT INTO `bm_action_log` VALUES ('68', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-26 11:06登录了后台', '1', '1440558417');
INSERT INTO `bm_action_log` VALUES ('69', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-26 11:08登录了后台', '1', '1440558538');
INSERT INTO `bm_action_log` VALUES ('70', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-26 11:09登录了后台', '1', '1440558551');
INSERT INTO `bm_action_log` VALUES ('71', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-26 11:16登录了后台', '1', '1440558992');
INSERT INTO `bm_action_log` VALUES ('72', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-26 11:18登录了后台', '1', '1440559093');
INSERT INTO `bm_action_log` VALUES ('73', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-26 14:25登录了后台', '1', '1440570322');
INSERT INTO `bm_action_log` VALUES ('74', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/admin/model/update.html', '1', '1440575229');
INSERT INTO `bm_action_log` VALUES ('75', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/admin/model/update.html', '1', '1440575350');
INSERT INTO `bm_action_log` VALUES ('76', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/admin/model/update.html', '1', '1440575407');
INSERT INTO `bm_action_log` VALUES ('77', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-26 15:51登录了后台', '1', '1440575491');
INSERT INTO `bm_action_log` VALUES ('78', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/admin/model/update.html', '1', '1440575561');
INSERT INTO `bm_action_log` VALUES ('79', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/admin/model/update.html', '1', '1440575622');
INSERT INTO `bm_action_log` VALUES ('80', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1440575700');
INSERT INTO `bm_action_log` VALUES ('81', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/admin/model/update.html', '1', '1440575844');
INSERT INTO `bm_action_log` VALUES ('82', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/admin/model/update.html', '1', '1440576352');
INSERT INTO `bm_action_log` VALUES ('83', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/admin/model/update.html', '1', '1440576860');
INSERT INTO `bm_action_log` VALUES ('84', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/admin/model/update.html', '1', '1440576906');
INSERT INTO `bm_action_log` VALUES ('85', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/admin/model/update.html', '1', '1440577099');
INSERT INTO `bm_action_log` VALUES ('86', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/admin/model/update.html', '1', '1440577193');
INSERT INTO `bm_action_log` VALUES ('87', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/admin/model/update.html', '1', '1440577231');
INSERT INTO `bm_action_log` VALUES ('88', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/admin/model/update.html', '1', '1440577243');
INSERT INTO `bm_action_log` VALUES ('89', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/admin/model/update.html', '1', '1440577284');
INSERT INTO `bm_action_log` VALUES ('90', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/admin/model/update.html', '1', '1440577313');
INSERT INTO `bm_action_log` VALUES ('91', '7', '1', '2130706433', 'model', '2', '操作url：/index.php?s=/admin/model/update.html', '1', '1440577330');
INSERT INTO `bm_action_log` VALUES ('92', '8', '1', '2130706433', 'attribute', '9', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1440577928');
INSERT INTO `bm_action_log` VALUES ('93', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-27 09:28登录了后台', '1', '1440638932');
INSERT INTO `bm_action_log` VALUES ('94', '7', '1', '2130706433', 'model', '1', '操作url：/index.php?s=/admin/model/update.html', '1', '1440643458');
INSERT INTO `bm_action_log` VALUES ('95', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-27 14:17登录了后台', '1', '1440656276');
INSERT INTO `bm_action_log` VALUES ('96', '10', '1', '2130706433', 'Menu', '123', '操作url：/admin/menu/add.html', '1', '1440667053');
INSERT INTO `bm_action_log` VALUES ('97', '10', '1', '2130706433', 'Menu', '123', '操作url：/admin/menu/edit.html', '1', '1440667077');
INSERT INTO `bm_action_log` VALUES ('98', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-28 16:47登录了后台', '1', '1440751623');
INSERT INTO `bm_action_log` VALUES ('99', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-28 17:21登录了后台', '1', '1440753709');
INSERT INTO `bm_action_log` VALUES ('100', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-29 12:01登录了后台', '1', '1440820863');
INSERT INTO `bm_action_log` VALUES ('101', '1', '1', '2130706433', 'member', '1', 'admin在2015-08-31 15:05登录了后台', '1', '1441004720');
INSERT INTO `bm_action_log` VALUES ('102', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-01 09:24登录了后台', '1', '1441070679');
INSERT INTO `bm_action_log` VALUES ('103', '10', '1', '2130706433', 'Menu', '123', '操作url：/admin/menu/edit.html', '1', '1441073441');
INSERT INTO `bm_action_log` VALUES ('104', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-01 10:19登录了后台', '1', '1441073961');
INSERT INTO `bm_action_log` VALUES ('105', '7', '1', '2130706433', 'model', '5', '操作url：/admin/model/update.html', '1', '1441075802');
INSERT INTO `bm_action_log` VALUES ('106', '8', '1', '2130706433', 'attribute', '33', '操作url：/admin/attribute/update.html', '1', '1441077563');
INSERT INTO `bm_action_log` VALUES ('107', '8', '1', '2130706433', 'attribute', '34', '操作url：/admin/attribute/update.html', '1', '1441077782');
INSERT INTO `bm_action_log` VALUES ('108', '7', '1', '2130706433', 'model', '5', '操作url：/admin/model/update.html', '1', '1441078653');
INSERT INTO `bm_action_log` VALUES ('109', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-01 14:13登录了后台', '1', '1441088021');
INSERT INTO `bm_action_log` VALUES ('110', '7', '1', '2130706433', 'model', '5', '操作url：/admin/model/update.html', '1', '1441090938');
INSERT INTO `bm_action_log` VALUES ('111', '7', '1', '2130706433', 'model', '6', '操作url：/admin/model/update.html', '1', '1441092110');
INSERT INTO `bm_action_log` VALUES ('112', '8', '1', '2130706433', 'attribute', '34', '操作url：/admin/attribute/update.html', '1', '1441092176');
INSERT INTO `bm_action_log` VALUES ('113', '8', '1', '2130706433', 'attribute', '35', '操作url：/admin/attribute/update.html', '1', '1441092236');
INSERT INTO `bm_action_log` VALUES ('114', '8', '1', '2130706433', 'attribute', '36', '操作url：/admin/attribute/update.html', '1', '1441092283');
INSERT INTO `bm_action_log` VALUES ('115', '8', '1', '2130706433', 'attribute', '37', '操作url：/admin/attribute/update.html', '1', '1441092544');
INSERT INTO `bm_action_log` VALUES ('116', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-01 16:35登录了后台', '1', '1441096524');
INSERT INTO `bm_action_log` VALUES ('117', '1', '1', '-1062731159', 'member', '1', 'admin在2015-09-01 16:38登录了后台', '1', '1441096698');
INSERT INTO `bm_action_log` VALUES ('118', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-01 16:42登录了后台', '1', '1441096963');
INSERT INTO `bm_action_log` VALUES ('119', '1', '1', '-1062731159', 'member', '1', 'admin在2015-09-01 17:30登录了后台', '1', '1441099842');
INSERT INTO `bm_action_log` VALUES ('120', '1', '1', '-1062731159', 'member', '1', 'admin在2015-09-01 17:45登录了后台', '1', '1441100750');
INSERT INTO `bm_action_log` VALUES ('121', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-02 09:23登录了后台', '1', '1441157018');
INSERT INTO `bm_action_log` VALUES ('122', '10', '1', '2130706433', 'Menu', '124', '操作url：/admin/menu/add.html', '1', '1441160367');
INSERT INTO `bm_action_log` VALUES ('123', '10', '1', '2130706433', 'Menu', '124', '操作url：/admin/menu/edit.html', '1', '1441160391');
INSERT INTO `bm_action_log` VALUES ('124', '10', '1', '2130706433', 'Menu', '125', '操作url：/admin/menu/add.html', '1', '1441160763');
INSERT INTO `bm_action_log` VALUES ('125', '7', '1', '2130706433', 'model', '5', '操作url：/Admin/Model/update.html', '1', '1441163588');
INSERT INTO `bm_action_log` VALUES ('126', '1', '1', '-1062731159', 'member', '1', 'admin在2015-09-02 16:33登录了后台', '1', '1441182838');
INSERT INTO `bm_action_log` VALUES ('127', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-02 20:27登录了后台', '1', '1441196859');
INSERT INTO `bm_action_log` VALUES ('128', '10', '1', '2130706433', 'Menu', '126', '操作url：/Admin/Menu/add.html', '1', '1441197086');
INSERT INTO `bm_action_log` VALUES ('129', '7', '1', '2130706433', 'model', '6', '操作url：/Admin/Model/update.html', '1', '1441197278');
INSERT INTO `bm_action_log` VALUES ('130', '10', '1', '2130706433', 'Menu', '125', '操作url：/Admin/Menu/edit.html', '1', '1441197737');
INSERT INTO `bm_action_log` VALUES ('131', '7', '1', '2130706433', 'model', '6', '操作url：/Admin/Model/update.html', '1', '1441198062');
INSERT INTO `bm_action_log` VALUES ('132', '10', '1', '2130706433', 'Menu', '126', '操作url：/Admin/Menu/edit.html', '1', '1441198141');
INSERT INTO `bm_action_log` VALUES ('133', '10', '1', '2130706433', 'Menu', '125', '操作url：/Admin/Menu/edit.html', '1', '1441198710');
INSERT INTO `bm_action_log` VALUES ('134', '10', '1', '2130706433', 'Menu', '126', '操作url：/Admin/Menu/edit.html', '1', '1441198768');
INSERT INTO `bm_action_log` VALUES ('135', '10', '1', '2130706433', 'Menu', '127', '操作url：/Admin/Menu/add.html', '1', '1441198799');
INSERT INTO `bm_action_log` VALUES ('136', '10', '1', '2130706433', 'Menu', '127', '操作url：/Admin/Menu/edit.html', '1', '1441198835');
INSERT INTO `bm_action_log` VALUES ('137', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/127.html', '1', '1441199296');
INSERT INTO `bm_action_log` VALUES ('138', '10', '1', '2130706433', 'Menu', '128', '操作url：/Admin/Menu/add.html', '1', '1441199354');
INSERT INTO `bm_action_log` VALUES ('139', '10', '1', '2130706433', 'Menu', '129', '操作url：/Admin/Menu/add.html', '1', '1441199374');
INSERT INTO `bm_action_log` VALUES ('140', '10', '1', '2130706433', 'Menu', '130', '操作url：/Admin/Menu/add.html', '1', '1441199494');
INSERT INTO `bm_action_log` VALUES ('141', '10', '1', '2130706433', 'Menu', '131', '操作url：/Admin/Menu/add.html', '1', '1441199512');
INSERT INTO `bm_action_log` VALUES ('142', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/128.html', '1', '1441200052');
INSERT INTO `bm_action_log` VALUES ('143', '10', '1', '2130706433', 'Menu', '132', '操作url：/Admin/Menu/add.html', '1', '1441200091');
INSERT INTO `bm_action_log` VALUES ('144', '10', '1', '2130706433', 'Menu', '133', '操作url：/Admin/Menu/add.html', '1', '1441200193');
INSERT INTO `bm_action_log` VALUES ('145', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/130.html', '1', '1441200204');
INSERT INTO `bm_action_log` VALUES ('146', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-04 09:31登录了后台', '1', '1441330281');
INSERT INTO `bm_action_log` VALUES ('147', '7', '1', '2130706433', 'model', '7', '操作url：/Admin/Model/update.html', '1', '1441333973');
INSERT INTO `bm_action_log` VALUES ('148', '8', '1', '2130706433', 'attribute', '38', '操作url：/Admin/Attribute/update.html', '1', '1441334080');
INSERT INTO `bm_action_log` VALUES ('149', '8', '1', '2130706433', 'attribute', '39', '操作url：/Admin/Attribute/update.html', '1', '1441334139');
INSERT INTO `bm_action_log` VALUES ('150', '8', '1', '2130706433', 'attribute', '40', '操作url：/Admin/Attribute/update.html', '1', '1441334213');
INSERT INTO `bm_action_log` VALUES ('151', '8', '1', '2130706433', 'attribute', '41', '操作url：/Admin/Attribute/update.html', '1', '1441334308');
INSERT INTO `bm_action_log` VALUES ('152', '10', '1', '2130706433', 'Menu', '123', '操作url：/Admin/Menu/edit.html', '1', '1441336624');
INSERT INTO `bm_action_log` VALUES ('153', '10', '1', '2130706433', 'Menu', '134', '操作url：/Admin/Menu/add.html', '1', '1441336663');
INSERT INTO `bm_action_log` VALUES ('154', '11', '1', '2130706433', 'category', '1', '操作url：/Admin/Goodcates/add.html', '1', '1441338646');
INSERT INTO `bm_action_log` VALUES ('155', '8', '1', '2130706433', 'attribute', '42', '操作url：/Admin/Attribute/update.html', '1', '1441339212');
INSERT INTO `bm_action_log` VALUES ('156', '8', '1', '2130706433', 'attribute', '42', '操作url：/Admin/Attribute/remove/id/42.html', '1', '1441342076');
INSERT INTO `bm_action_log` VALUES ('157', '11', '1', '2130706433', 'category', '1', '操作url：/Admin/Goodcates/edit.html', '1', '1441342236');
INSERT INTO `bm_action_log` VALUES ('158', '11', '1', '2130706433', 'category', '40', '操作url：/Admin/Category/add.html', '1', '1441343317');
INSERT INTO `bm_action_log` VALUES ('159', '11', '1', '2130706433', 'category', '40', '操作url：/Admin/Category/remove/id/40.html', '1', '1441343327');
INSERT INTO `bm_action_log` VALUES ('160', '10', '1', '2130706433', 'Menu', '135', '操作url：/Admin/Menu/add.html', '1', '1441343859');
INSERT INTO `bm_action_log` VALUES ('161', '10', '1', '2130706433', 'Menu', '136', '操作url：/Admin/Menu/add.html', '1', '1441343884');
INSERT INTO `bm_action_log` VALUES ('162', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-06 10:28登录了后台', '1', '1441506530');
INSERT INTO `bm_action_log` VALUES ('163', '7', '1', '2130706433', 'model', '8', '操作url：/Admin/Model/update.html', '1', '1441506757');
INSERT INTO `bm_action_log` VALUES ('164', '8', '1', '2130706433', 'attribute', '43', '操作url：/Admin/Attribute/update.html', '1', '1441506806');
INSERT INTO `bm_action_log` VALUES ('165', '7', '1', '2130706433', 'model', '8', '操作url：/Admin/Model/update.html', '1', '1441506851');
INSERT INTO `bm_action_log` VALUES ('166', '7', '1', '2130706433', 'model', '9', '操作url：/Admin/Model/update.html', '1', '1441506901');
INSERT INTO `bm_action_log` VALUES ('167', '8', '1', '2130706433', 'attribute', '44', '操作url：/Admin/Attribute/update.html', '1', '1441506922');
INSERT INTO `bm_action_log` VALUES ('168', '7', '1', '2130706433', 'model', '9', '操作url：/Admin/Model/update.html', '1', '1441506956');
INSERT INTO `bm_action_log` VALUES ('169', '8', '1', '2130706433', 'attribute', '45', '操作url：/Admin/Attribute/update.html', '1', '1441507181');
INSERT INTO `bm_action_log` VALUES ('170', '7', '1', '2130706433', 'model', '6', '操作url：/Admin/Model/update.html', '1', '1441507216');
INSERT INTO `bm_action_log` VALUES ('171', '10', '1', '2130706433', 'Menu', '137', '操作url：/Admin/Menu/add.html', '1', '1441507314');
INSERT INTO `bm_action_log` VALUES ('172', '10', '1', '2130706433', 'Menu', '137', '操作url：/Admin/Menu/edit.html', '1', '1441507339');
INSERT INTO `bm_action_log` VALUES ('173', '10', '1', '2130706433', 'Menu', '137', '操作url：/Admin/Menu/edit.html', '1', '1441507392');
INSERT INTO `bm_action_log` VALUES ('174', '10', '1', '2130706433', 'Menu', '138', '操作url：/Admin/Menu/add.html', '1', '1441507437');
INSERT INTO `bm_action_log` VALUES ('175', '10', '1', '2130706433', 'Menu', '139', '操作url：/Admin/Menu/add.html', '1', '1441507454');
INSERT INTO `bm_action_log` VALUES ('176', '7', '1', '2130706433', 'model', '9', '操作url：/Admin/Model/update.html', '1', '1441507519');
INSERT INTO `bm_action_log` VALUES ('177', '7', '1', '2130706433', 'model', '8', '操作url：/Admin/Model/update.html', '1', '1441507529');
INSERT INTO `bm_action_log` VALUES ('178', '8', '1', '2130706433', 'attribute', '46', '操作url：/Admin/Attribute/update.html', '1', '1441507987');
INSERT INTO `bm_action_log` VALUES ('179', '7', '1', '2130706433', 'model', '9', '操作url：/Admin/Model/update.html', '1', '1441508011');
INSERT INTO `bm_action_log` VALUES ('180', '8', '1', '2130706433', 'attribute', '47', '操作url：/Admin/Attribute/update.html', '1', '1441508045');
INSERT INTO `bm_action_log` VALUES ('181', '7', '1', '2130706433', 'model', '8', '操作url：/Admin/Model/update.html', '1', '1441508064');
INSERT INTO `bm_action_log` VALUES ('182', '7', '1', '2130706433', 'model', '9', '操作url：/Admin/Model/update.html', '1', '1441508111');
INSERT INTO `bm_action_log` VALUES ('183', '7', '1', '2130706433', 'model', '8', '操作url：/Admin/Model/update.html', '1', '1441508120');
INSERT INTO `bm_action_log` VALUES ('184', '10', '1', '2130706433', 'Menu', '140', '操作url：/Admin/Menu/add.html', '1', '1441508164');
INSERT INTO `bm_action_log` VALUES ('185', '10', '1', '2130706433', 'Menu', '140', '操作url：/Admin/Menu/edit.html', '1', '1441508183');
INSERT INTO `bm_action_log` VALUES ('186', '10', '1', '2130706433', 'Menu', '141', '操作url：/Admin/Menu/add.html', '1', '1441508208');
INSERT INTO `bm_action_log` VALUES ('187', '10', '1', '2130706433', 'Menu', '142', '操作url：/Admin/Menu/add.html', '1', '1441508230');
INSERT INTO `bm_action_log` VALUES ('188', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-06 11:04登录了后台', '1', '1441508699');
INSERT INTO `bm_action_log` VALUES ('189', '1', '1', '-1062731160', 'member', '1', 'admin在2015-09-06 15:11登录了后台', '1', '1441523469');
INSERT INTO `bm_action_log` VALUES ('190', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-06 15:12登录了后台', '1', '1441523538');
INSERT INTO `bm_action_log` VALUES ('191', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-06 15:22登录了后台', '1', '1441524155');
INSERT INTO `bm_action_log` VALUES ('192', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-06 15:54登录了后台', '1', '1441526070');
INSERT INTO `bm_action_log` VALUES ('193', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-06 19:54登录了后台', '1', '1441540478');
INSERT INTO `bm_action_log` VALUES ('194', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-06 21:17登录了后台', '1', '1441545447');
INSERT INTO `bm_action_log` VALUES ('195', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-06 21:43登录了后台', '1', '1441547022');
INSERT INTO `bm_action_log` VALUES ('196', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-06 22:08登录了后台', '1', '1441548491');
INSERT INTO `bm_action_log` VALUES ('197', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-07 14:27登录了后台', '1', '1441607230');
INSERT INTO `bm_action_log` VALUES ('198', '7', '1', '2130706433', 'model', '10', '操作url：/Admin/Model/update.html', '1', '1441607343');
INSERT INTO `bm_action_log` VALUES ('199', '8', '1', '2130706433', 'attribute', '48', '操作url：/Admin/Attribute/update.html', '1', '1441607481');
INSERT INTO `bm_action_log` VALUES ('200', '8', '1', '2130706433', 'attribute', '49', '操作url：/Admin/Attribute/update.html', '1', '1441607517');
INSERT INTO `bm_action_log` VALUES ('201', '8', '1', '2130706433', 'attribute', '50', '操作url：/Admin/Attribute/update.html', '1', '1441608396');
INSERT INTO `bm_action_log` VALUES ('202', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-07 15:40登录了后台', '1', '1441611613');
INSERT INTO `bm_action_log` VALUES ('203', '1', '1', '-1062731156', 'member', '1', 'admin在2015-09-07 16:10登录了后台', '1', '1441613411');
INSERT INTO `bm_action_log` VALUES ('204', '7', '1', '2130706433', 'model', '11', '操作url：/Admin/Model/update.html', '1', '1441617391');
INSERT INTO `bm_action_log` VALUES ('205', '8', '1', '2130706433', 'attribute', '51', '操作url：/Admin/Attribute/update.html', '1', '1441617515');
INSERT INTO `bm_action_log` VALUES ('206', '8', '1', '2130706433', 'attribute', '52', '操作url：/Admin/Attribute/update.html', '1', '1441617789');
INSERT INTO `bm_action_log` VALUES ('207', '8', '1', '2130706433', 'attribute', '53', '操作url：/Admin/Attribute/update.html', '1', '1441618245');
INSERT INTO `bm_action_log` VALUES ('208', '8', '1', '2130706433', 'attribute', '54', '操作url：/Admin/Attribute/update.html', '1', '1441618360');
INSERT INTO `bm_action_log` VALUES ('209', '8', '1', '2130706433', 'attribute', '55', '操作url：/Admin/Attribute/update.html', '1', '1441618418');
INSERT INTO `bm_action_log` VALUES ('210', '8', '1', '2130706433', 'attribute', '56', '操作url：/Admin/Attribute/update.html', '1', '1441618478');
INSERT INTO `bm_action_log` VALUES ('211', '8', '1', '2130706433', 'attribute', '57', '操作url：/Admin/Attribute/update.html', '1', '1441618531');
INSERT INTO `bm_action_log` VALUES ('212', '8', '1', '2130706433', 'attribute', '58', '操作url：/Admin/Attribute/update.html', '1', '1441618629');
INSERT INTO `bm_action_log` VALUES ('213', '8', '1', '2130706433', 'attribute', '59', '操作url：/Admin/Attribute/update.html', '1', '1441618684');
INSERT INTO `bm_action_log` VALUES ('214', '8', '1', '2130706433', 'attribute', '60', '操作url：/Admin/Attribute/update.html', '1', '1441618756');
INSERT INTO `bm_action_log` VALUES ('215', '8', '1', '2130706433', 'attribute', '61', '操作url：/Admin/Attribute/update.html', '1', '1441618793');
INSERT INTO `bm_action_log` VALUES ('216', '8', '1', '2130706433', 'attribute', '62', '操作url：/Admin/Attribute/update.html', '1', '1441618882');
INSERT INTO `bm_action_log` VALUES ('217', '8', '1', '2130706433', 'attribute', '63', '操作url：/Admin/Attribute/update.html', '1', '1441618979');
INSERT INTO `bm_action_log` VALUES ('218', '8', '1', '2130706433', 'attribute', '64', '操作url：/Admin/Attribute/update.html', '1', '1441619071');
INSERT INTO `bm_action_log` VALUES ('219', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-08 00:14登录了后台', '1', '1441642486');
INSERT INTO `bm_action_log` VALUES ('220', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-08 10:45登录了后台', '1', '1441680348');
INSERT INTO `bm_action_log` VALUES ('221', '7', '1', '2130706433', 'model', '7', '操作url：/Admin/Model/update.html', '1', '1441682010');
INSERT INTO `bm_action_log` VALUES ('222', '7', '1', '2130706433', 'model', '7', '操作url：/Admin/Model/update.html', '1', '1441686024');
INSERT INTO `bm_action_log` VALUES ('223', '7', '1', '2130706433', 'model', '7', '操作url：/Admin/Model/update.html', '1', '1441686602');
INSERT INTO `bm_action_log` VALUES ('224', '1', '1', '-1062731156', 'member', '1', 'admin在2015-09-08 14:36登录了后台', '1', '1441694209');
INSERT INTO `bm_action_log` VALUES ('225', '7', '1', '2130706433', 'model', '12', '操作url：/Admin/Model/update.html', '1', '1441695258');
INSERT INTO `bm_action_log` VALUES ('226', '7', '1', '2130706433', 'model', '13', '操作url：/Admin/Model/update.html', '1', '1441695466');
INSERT INTO `bm_action_log` VALUES ('227', '8', '1', '2130706433', 'attribute', '67', '操作url：/Admin/Attribute/update.html', '1', '1441695500');
INSERT INTO `bm_action_log` VALUES ('228', '8', '1', '2130706433', 'attribute', '68', '操作url：/Admin/Attribute/update.html', '1', '1441695523');
INSERT INTO `bm_action_log` VALUES ('229', '8', '1', '2130706433', 'attribute', '69', '操作url：/Admin/Attribute/update.html', '1', '1441695798');
INSERT INTO `bm_action_log` VALUES ('230', '8', '1', '2130706433', 'attribute', '70', '操作url：/Admin/Attribute/update.html', '1', '1441695827');
INSERT INTO `bm_action_log` VALUES ('231', '8', '1', '2130706433', 'attribute', '71', '操作url：/Admin/Attribute/update.html', '1', '1441695866');
INSERT INTO `bm_action_log` VALUES ('232', '8', '1', '2130706433', 'attribute', '72', '操作url：/Admin/Attribute/update.html', '1', '1441695888');
INSERT INTO `bm_action_log` VALUES ('233', '7', '1', '2130706433', 'model', '7', '操作url：/Admin/Model/update.html', '1', '1441696466');
INSERT INTO `bm_action_log` VALUES ('234', '7', '1', '2130706433', 'model', '7', '操作url：/Admin/Model/update.html', '1', '1441698021');
INSERT INTO `bm_action_log` VALUES ('235', '7', '1', '2130706433', 'model', '6', '操作url：/Admin/Model/update.html', '1', '1441698412');
INSERT INTO `bm_action_log` VALUES ('236', '1', '1', '-1062731156', 'member', '1', 'admin在2015-09-08 15:47登录了后台', '1', '1441698470');
INSERT INTO `bm_action_log` VALUES ('237', '7', '1', '2130706433', 'model', '6', '操作url：/Admin/Model/update.html', '1', '1441698597');
INSERT INTO `bm_action_log` VALUES ('238', '7', '1', '2130706433', 'model', '6', '操作url：/Admin/Model/update.html', '1', '1441698652');
INSERT INTO `bm_action_log` VALUES ('239', '7', '1', '2130706433', 'model', '6', '操作url：/Admin/Model/update.html', '1', '1441698679');
INSERT INTO `bm_action_log` VALUES ('240', '7', '1', '2130706433', 'model', '7', '操作url：/Admin/Model/update.html', '1', '1441699076');
INSERT INTO `bm_action_log` VALUES ('241', '7', '1', '2130706433', 'model', '6', '操作url：/Admin/Model/update.html', '1', '1441699684');
INSERT INTO `bm_action_log` VALUES ('242', '7', '1', '2130706433', 'model', '6', '操作url：/Admin/Model/update.html', '1', '1441699734');
INSERT INTO `bm_action_log` VALUES ('243', '7', '1', '2130706433', 'model', '7', '操作url：/Admin/Model/update.html', '1', '1441700521');
INSERT INTO `bm_action_log` VALUES ('244', '8', '1', '2130706433', 'attribute', '37', '操作url：/Admin/Attribute/update.html', '1', '1441703087');
INSERT INTO `bm_action_log` VALUES ('245', '7', '1', '2130706433', 'model', '6', '操作url：/Admin/Model/update.html', '1', '1441703125');
INSERT INTO `bm_action_log` VALUES ('246', '7', '1', '2130706433', 'model', '13', '操作url：/Admin/Model/update.html', '1', '1441703176');
INSERT INTO `bm_action_log` VALUES ('247', '7', '1', '2130706433', 'model', '13', '操作url：/Admin/Model/update.html', '1', '1441703213');
INSERT INTO `bm_action_log` VALUES ('248', '7', '1', '2130706433', 'model', '6', '操作url：/Admin/Model/update.html', '1', '1441703787');
INSERT INTO `bm_action_log` VALUES ('249', '7', '1', '2130706433', 'model', '6', '操作url：/Admin/Model/update.html', '1', '1441704582');
INSERT INTO `bm_action_log` VALUES ('250', '7', '1', '2130706433', 'model', '6', '操作url：/Admin/Model/update.html', '1', '1441704808');
INSERT INTO `bm_action_log` VALUES ('251', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-08 20:35登录了后台', '1', '1441715754');
INSERT INTO `bm_action_log` VALUES ('252', '7', '1', '2130706433', 'model', '6', '操作url：/Admin/Model/update.html', '1', '1441719422');
INSERT INTO `bm_action_log` VALUES ('253', '7', '1', '2130706433', 'model', '5', '操作url：/Admin/Model/update.html', '1', '1441719481');
INSERT INTO `bm_action_log` VALUES ('254', '7', '1', '2130706433', 'model', '6', '操作url：/Admin/Model/update.html', '1', '1441721000');
INSERT INTO `bm_action_log` VALUES ('255', '7', '1', '2130706433', 'model', '5', '操作url：/Admin/Model/update.html', '1', '1441721055');
INSERT INTO `bm_action_log` VALUES ('256', '10', '1', '2130706433', 'Menu', '134', '操作url：/Admin/Menu/edit.html', '1', '1441722197');
INSERT INTO `bm_action_log` VALUES ('257', '10', '1', '2130706433', 'Menu', '137', '操作url：/Admin/Menu/edit.html', '1', '1441722205');
INSERT INTO `bm_action_log` VALUES ('258', '10', '1', '2130706433', 'Menu', '140', '操作url：/Admin/Menu/edit.html', '1', '1441722215');
INSERT INTO `bm_action_log` VALUES ('259', '8', '1', '2130706433', 'attribute', '58', '操作url：/Admin/Attribute/update.html', '1', '1441722436');
INSERT INTO `bm_action_log` VALUES ('260', '8', '1', '2130706433', 'attribute', '58', '操作url：/Admin/Attribute/update.html', '1', '1441722541');
INSERT INTO `bm_action_log` VALUES ('261', '7', '1', '2130706433', 'model', '11', '操作url：/Admin/Model/update.html', '1', '1441723176');
INSERT INTO `bm_action_log` VALUES ('262', '7', '1', '2130706433', 'model', '11', '操作url：/Admin/Model/update.html', '1', '1441723194');
INSERT INTO `bm_action_log` VALUES ('263', '7', '1', '2130706433', 'model', '11', '操作url：/Admin/Model/update.html', '1', '1441723235');
INSERT INTO `bm_action_log` VALUES ('264', '7', '1', '2130706433', 'model', '11', '操作url：/Admin/Model/update.html', '1', '1441723287');
INSERT INTO `bm_action_log` VALUES ('265', '7', '1', '2130706433', 'model', '7', '操作url：/Admin/Model/update.html', '1', '1441723312');
INSERT INTO `bm_action_log` VALUES ('266', '10', '1', '2130706433', 'Menu', '143', '操作url：/Admin/Menu/add.html', '1', '1441723372');
INSERT INTO `bm_action_log` VALUES ('267', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-09 00:31登录了后台', '1', '1441729869');
INSERT INTO `bm_action_log` VALUES ('268', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-09 09:22登录了后台', '1', '1441761745');
INSERT INTO `bm_action_log` VALUES ('269', '1', '1', '-1062731156', 'member', '1', 'admin在2015-09-09 10:40登录了后台', '1', '1441766429');
INSERT INTO `bm_action_log` VALUES ('270', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-09 20:17登录了后台', '1', '1441801047');
INSERT INTO `bm_action_log` VALUES ('271', '8', '1', '2130706433', 'attribute', '51', '操作url：/Admin/Attribute/update.html', '1', '1441801114');
INSERT INTO `bm_action_log` VALUES ('272', '8', '1', '2130706433', 'attribute', '55', '操作url：/Admin/Attribute/update.html', '1', '1441805035');
INSERT INTO `bm_action_log` VALUES ('273', '10', '1', '2130706433', 'Menu', '144', '操作url：/Admin/Menu/add.html', '1', '1441808798');
INSERT INTO `bm_action_log` VALUES ('274', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-09 23:27登录了后台', '1', '1441812426');
INSERT INTO `bm_action_log` VALUES ('275', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-09 23:47登录了后台', '1', '1441813623');
INSERT INTO `bm_action_log` VALUES ('276', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-10 09:20登录了后台', '1', '1441848050');
INSERT INTO `bm_action_log` VALUES ('277', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-10 09:58登录了后台', '1', '1441850327');
INSERT INTO `bm_action_log` VALUES ('278', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-10 10:20登录了后台', '1', '1441851629');
INSERT INTO `bm_action_log` VALUES ('279', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-10 11:03登录了后台', '1', '1441854235');
INSERT INTO `bm_action_log` VALUES ('280', '1', '1', '-1062731156', 'member', '1', 'admin在2015-09-10 14:15登录了后台', '1', '1441865755');
INSERT INTO `bm_action_log` VALUES ('281', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-10 14:25登录了后台', '1', '1441866335');
INSERT INTO `bm_action_log` VALUES ('282', '8', '1', '2130706433', 'attribute', '52', '操作url：/Admin/Attribute/update.html', '1', '1441870642');
INSERT INTO `bm_action_log` VALUES ('283', '8', '1', '2130706433', 'attribute', '53', '操作url：/Admin/Attribute/update.html', '1', '1441870661');
INSERT INTO `bm_action_log` VALUES ('284', '8', '1', '2130706433', 'attribute', '54', '操作url：/Admin/Attribute/update.html', '1', '1441870667');
INSERT INTO `bm_action_log` VALUES ('285', '8', '1', '2130706433', 'attribute', '59', '操作url：/Admin/Attribute/update.html', '1', '1441871190');
INSERT INTO `bm_action_log` VALUES ('286', '8', '1', '2130706433', 'attribute', '63', '操作url：/Admin/Attribute/update.html', '1', '1441871202');
INSERT INTO `bm_action_log` VALUES ('287', '8', '1', '2130706433', 'attribute', '63', '操作url：/Admin/Attribute/update.html', '1', '1441871211');
INSERT INTO `bm_action_log` VALUES ('288', '7', '1', '2130706433', 'model', '7', '操作url：/Admin/Model/update.html', '1', '1441874810');
INSERT INTO `bm_action_log` VALUES ('289', '7', '1', '2130706433', 'model', '7', '操作url：/Admin/Model/update.html', '1', '1441874891');
INSERT INTO `bm_action_log` VALUES ('290', '8', '1', '2130706433', 'attribute', '38', '操作url：/Admin/Attribute/update.html', '1', '1441874955');
INSERT INTO `bm_action_log` VALUES ('291', '7', '1', '2130706433', 'model', '7', '操作url：/Admin/Model/update.html', '1', '1441874996');
INSERT INTO `bm_action_log` VALUES ('292', '8', '1', '2130706433', 'attribute', '38', '操作url：/Admin/Attribute/update.html', '1', '1441875119');
INSERT INTO `bm_action_log` VALUES ('293', '7', '1', '2130706433', 'model', '7', '操作url：/Admin/Model/update.html', '1', '1441875170');
INSERT INTO `bm_action_log` VALUES ('294', '8', '1', '2130706433', 'attribute', '38', '操作url：/Admin/Attribute/update.html', '1', '1441875699');
INSERT INTO `bm_action_log` VALUES ('295', '7', '1', '2130706433', 'model', '7', '操作url：/Admin/Model/update.html', '1', '1441875737');
INSERT INTO `bm_action_log` VALUES ('296', '8', '1', '2130706433', 'attribute', '52', '操作url：/Admin/Attribute/update.html', '1', '1441875770');
INSERT INTO `bm_action_log` VALUES ('297', '7', '1', '2130706433', 'model', '11', '操作url：/Admin/Model/update.html', '1', '1441875793');
INSERT INTO `bm_action_log` VALUES ('298', '1', '1', '-1062731156', 'member', '1', 'admin在2015-09-10 17:16登录了后台', '1', '1441876564');
INSERT INTO `bm_action_log` VALUES ('299', '8', '1', '2130706433', 'attribute', '55', '操作url：/Admin/Attribute/update.html', '1', '1441882783');
INSERT INTO `bm_action_log` VALUES ('300', '8', '1', '2130706433', 'attribute', '56', '操作url：/Admin/Attribute/update.html', '1', '1441882794');
INSERT INTO `bm_action_log` VALUES ('301', '8', '1', '2130706433', 'attribute', '60', '操作url：/Admin/Attribute/update.html', '1', '1441882825');
INSERT INTO `bm_action_log` VALUES ('302', '8', '1', '2130706433', 'attribute', '60', '操作url：/Admin/Attribute/update.html', '1', '1441882840');
INSERT INTO `bm_action_log` VALUES ('303', '10', '1', '2130706433', 'Menu', '143', '操作url：/Admin/Menu/edit.html', '1', '1441884714');
INSERT INTO `bm_action_log` VALUES ('304', '10', '1', '2130706433', 'Menu', '144', '操作url：/Admin/Menu/edit.html', '1', '1441884723');
INSERT INTO `bm_action_log` VALUES ('305', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-10 19:55登录了后台', '1', '1441886108');
INSERT INTO `bm_action_log` VALUES ('306', '10', '1', '2130706433', 'Menu', '145', '操作url：/Admin/Menu/add.html', '1', '1441888577');
INSERT INTO `bm_action_log` VALUES ('307', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-11 09:19登录了后台', '1', '1441934346');
INSERT INTO `bm_action_log` VALUES ('308', '1', '1', '-1062731156', 'member', '1', 'admin在2015-09-11 09:57登录了后台', '1', '1441936665');
INSERT INTO `bm_action_log` VALUES ('309', '10', '1', '2130706433', 'Menu', '2', '操作url：/Admin/Menu/edit.html', '1', '1441961015');
INSERT INTO `bm_action_log` VALUES ('310', '10', '1', '2130706433', 'Menu', '2', '操作url：/Admin/Menu/edit.html', '1', '1441961306');
INSERT INTO `bm_action_log` VALUES ('311', '10', '1', '2130706433', 'Menu', '2', '操作url：/Admin/Menu/edit.html', '1', '1441961355');
INSERT INTO `bm_action_log` VALUES ('312', '10', '1', '2130706433', 'Menu', '2', '操作url：/Admin/Menu/edit.html', '1', '1441961445');
INSERT INTO `bm_action_log` VALUES ('313', '10', '1', '2130706433', 'Menu', '2', '操作url：/Admin/Menu/edit.html', '1', '1441961893');
INSERT INTO `bm_action_log` VALUES ('314', '10', '1', '2130706433', 'Menu', '2', '操作url：/Admin/Menu/edit.html', '1', '1441962120');
INSERT INTO `bm_action_log` VALUES ('315', '10', '1', '2130706433', 'Menu', '3', '操作url：/Admin/Menu/edit.html', '1', '1441963612');
INSERT INTO `bm_action_log` VALUES ('316', '10', '1', '2130706433', 'Menu', '13', '操作url：/Admin/Menu/edit.html', '1', '1441963620');
INSERT INTO `bm_action_log` VALUES ('317', '7', '1', '2130706433', 'model', '11', '操作url：/Admin/Model/update.html', '1', '1441964111');
INSERT INTO `bm_action_log` VALUES ('318', '7', '1', '2130706433', 'model', '11', '操作url：/Admin/Model/update.html', '1', '1441964182');
INSERT INTO `bm_action_log` VALUES ('319', '7', '1', '2130706433', 'model', '6', '操作url：/Admin/Model/update.html', '1', '1441964886');
INSERT INTO `bm_action_log` VALUES ('320', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-12 20:42登录了后台', '1', '1442061777');
INSERT INTO `bm_action_log` VALUES ('321', '7', '1', '2130706433', 'model', '1', '操作url：/Admin/Model/update.html', '1', '1442067136');
INSERT INTO `bm_action_log` VALUES ('322', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-13 14:22登录了后台', '1', '1442125352');
INSERT INTO `bm_action_log` VALUES ('323', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-14 09:23登录了后台', '1', '1442193825');
INSERT INTO `bm_action_log` VALUES ('324', '7', '1', '2130706433', 'model', '14', '操作url：/Admin/Model/update.html', '1', '1442195113');
INSERT INTO `bm_action_log` VALUES ('325', '8', '1', '2130706433', 'attribute', '73', '操作url：/Admin/Attribute/update.html', '1', '1442195220');
INSERT INTO `bm_action_log` VALUES ('326', '8', '1', '2130706433', 'attribute', '74', '操作url：/Admin/Attribute/update.html', '1', '1442195304');
INSERT INTO `bm_action_log` VALUES ('327', '8', '1', '2130706433', 'attribute', '75', '操作url：/Admin/Attribute/update.html', '1', '1442195367');
INSERT INTO `bm_action_log` VALUES ('328', '8', '1', '2130706433', 'attribute', '76', '操作url：/Admin/Attribute/update.html', '1', '1442195413');
INSERT INTO `bm_action_log` VALUES ('329', '8', '1', '2130706433', 'attribute', '77', '操作url：/Admin/Attribute/update.html', '1', '1442195437');
INSERT INTO `bm_action_log` VALUES ('330', '8', '1', '2130706433', 'attribute', '78', '操作url：/Admin/Attribute/update.html', '1', '1442195469');
INSERT INTO `bm_action_log` VALUES ('331', '8', '1', '2130706433', 'attribute', '79', '操作url：/Admin/Attribute/update.html', '1', '1442195526');
INSERT INTO `bm_action_log` VALUES ('332', '8', '1', '2130706433', 'attribute', '73', '操作url：/Admin/Attribute/update.html', '1', '1442195568');
INSERT INTO `bm_action_log` VALUES ('333', '8', '1', '2130706433', 'attribute', '80', '操作url：/Admin/Attribute/update.html', '1', '1442195627');
INSERT INTO `bm_action_log` VALUES ('334', '8', '1', '2130706433', 'attribute', '81', '操作url：/Admin/Attribute/update.html', '1', '1442195659');
INSERT INTO `bm_action_log` VALUES ('335', '8', '1', '2130706433', 'attribute', '82', '操作url：/Admin/Attribute/update.html', '1', '1442195816');
INSERT INTO `bm_action_log` VALUES ('336', '8', '1', '2130706433', 'attribute', '83', '操作url：/Admin/Attribute/update.html', '1', '1442195870');
INSERT INTO `bm_action_log` VALUES ('337', '8', '1', '2130706433', 'attribute', '84', '操作url：/Admin/Attribute/update.html', '1', '1442195906');
INSERT INTO `bm_action_log` VALUES ('338', '8', '1', '2130706433', 'attribute', '85', '操作url：/Admin/Attribute/update.html', '1', '1442196136');
INSERT INTO `bm_action_log` VALUES ('339', '8', '1', '2130706433', 'attribute', '86', '操作url：/Admin/Attribute/update.html', '1', '1442196177');
INSERT INTO `bm_action_log` VALUES ('340', '8', '1', '2130706433', 'attribute', '87', '操作url：/Admin/Attribute/update.html', '1', '1442196216');
INSERT INTO `bm_action_log` VALUES ('341', '8', '1', '2130706433', 'attribute', '88', '操作url：/Admin/Attribute/update.html', '1', '1442196277');
INSERT INTO `bm_action_log` VALUES ('342', '8', '1', '2130706433', 'attribute', '89', '操作url：/Admin/Attribute/update.html', '1', '1442196431');
INSERT INTO `bm_action_log` VALUES ('343', '8', '1', '2130706433', 'attribute', '90', '操作url：/Admin/Attribute/update.html', '1', '1442196594');
INSERT INTO `bm_action_log` VALUES ('344', '8', '1', '2130706433', 'attribute', '91', '操作url：/Admin/Attribute/update.html', '1', '1442196633');
INSERT INTO `bm_action_log` VALUES ('345', '8', '1', '2130706433', 'attribute', '92', '操作url：/Admin/Attribute/update.html', '1', '1442196673');
INSERT INTO `bm_action_log` VALUES ('346', '8', '1', '2130706433', 'attribute', '93', '操作url：/Admin/Attribute/update.html', '1', '1442196702');
INSERT INTO `bm_action_log` VALUES ('347', '8', '1', '2130706433', 'attribute', '94', '操作url：/Admin/Attribute/update.html', '1', '1442196736');
INSERT INTO `bm_action_log` VALUES ('348', '8', '1', '2130706433', 'attribute', '95', '操作url：/Admin/Attribute/update.html', '1', '1442196787');
INSERT INTO `bm_action_log` VALUES ('349', '8', '1', '2130706433', 'attribute', '96', '操作url：/Admin/Attribute/update.html', '1', '1442210473');
INSERT INTO `bm_action_log` VALUES ('350', '7', '1', '2130706433', 'model', '14', '操作url：/Admin/Model/update.html', '1', '1442210989');
INSERT INTO `bm_action_log` VALUES ('351', '10', '1', '2130706433', 'Menu', '146', '操作url：/Admin/Menu/add.html', '1', '1442211224');
INSERT INTO `bm_action_log` VALUES ('352', '1', '1', '-1062731156', 'member', '1', 'admin在2015-09-14 15:04登录了后台', '1', '1442214240');
INSERT INTO `bm_action_log` VALUES ('353', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-14 20:33登录了后台', '1', '1442234036');
INSERT INTO `bm_action_log` VALUES ('354', '8', '1', '2130706433', 'attribute', '97', '操作url：/Admin/Attribute/update.html', '1', '1442240244');
INSERT INTO `bm_action_log` VALUES ('355', '8', '1', '2130706433', 'attribute', '97', '操作url：/Admin/Attribute/remove/id/97.html', '1', '1442242150');
INSERT INTO `bm_action_log` VALUES ('356', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-15 10:05登录了后台', '1', '1442282722');
INSERT INTO `bm_action_log` VALUES ('357', '8', '1', '2130706433', 'attribute', '98', '操作url：/Admin/Attribute/update.html', '1', '1442286716');
INSERT INTO `bm_action_log` VALUES ('358', '10', '1', '2130706433', 'Menu', '147', '操作url：/Admin/Menu/add.html', '1', '1442288623');
INSERT INTO `bm_action_log` VALUES ('359', '8', '1', '2130706433', 'attribute', '99', '操作url：/Admin/Attribute/update.html', '1', '1442297117');
INSERT INTO `bm_action_log` VALUES ('360', '8', '1', '2130706433', 'attribute', '100', '操作url：/Admin/Attribute/update.html', '1', '1442297252');
INSERT INTO `bm_action_log` VALUES ('361', '8', '1', '2130706433', 'attribute', '101', '操作url：/Admin/Attribute/update.html', '1', '1442297332');
INSERT INTO `bm_action_log` VALUES ('362', '8', '1', '2130706433', 'attribute', '102', '操作url：/Admin/Attribute/update.html', '1', '1442297426');
INSERT INTO `bm_action_log` VALUES ('363', '8', '1', '2130706433', 'attribute', '102', '操作url：/Admin/Attribute/update.html', '1', '1442297489');
INSERT INTO `bm_action_log` VALUES ('364', '8', '1', '2130706433', 'attribute', '103', '操作url：/Admin/Attribute/update.html', '1', '1442298279');
INSERT INTO `bm_action_log` VALUES ('365', '8', '1', '2130706433', 'attribute', '103', '操作url：/Admin/Attribute/remove/id/103.html', '1', '1442298932');
INSERT INTO `bm_action_log` VALUES ('366', '8', '1', '2130706433', 'attribute', '104', '操作url：/Admin/Attribute/update.html', '1', '1442298966');
INSERT INTO `bm_action_log` VALUES ('367', '8', '1', '2130706433', 'attribute', '105', '操作url：/Admin/Attribute/update.html', '1', '1442299016');
INSERT INTO `bm_action_log` VALUES ('368', '7', '1', '2130706433', 'model', '15', '操作url：/Admin/Model/update.html', '1', '1442302529');
INSERT INTO `bm_action_log` VALUES ('369', '8', '1', '2130706433', 'attribute', '106', '操作url：/Admin/Attribute/update.html', '1', '1442302592');
INSERT INTO `bm_action_log` VALUES ('370', '8', '1', '2130706433', 'attribute', '107', '操作url：/Admin/Attribute/update.html', '1', '1442302650');
INSERT INTO `bm_action_log` VALUES ('371', '8', '1', '2130706433', 'attribute', '108', '操作url：/Admin/Attribute/update.html', '1', '1442302695');
INSERT INTO `bm_action_log` VALUES ('372', '8', '1', '2130706433', 'attribute', '109', '操作url：/Admin/Attribute/update.html', '1', '1442302778');
INSERT INTO `bm_action_log` VALUES ('373', '8', '1', '2130706433', 'attribute', '110', '操作url：/Admin/Attribute/update.html', '1', '1442302813');
INSERT INTO `bm_action_log` VALUES ('374', '7', '1', '2130706433', 'model', '14', '操作url：/Admin/Model/update.html', '1', '1442303691');
INSERT INTO `bm_action_log` VALUES ('375', '7', '1', '2130706433', 'model', '15', '操作url：/Admin/Model/update.html', '1', '1442304001');
INSERT INTO `bm_action_log` VALUES ('376', '8', '1', '2130706433', 'attribute', '111', '操作url：/Admin/Attribute/update.html', '1', '1442304078');
INSERT INTO `bm_action_log` VALUES ('377', '7', '1', '2130706433', 'model', '15', '操作url：/Admin/Model/update.html', '1', '1442304096');
INSERT INTO `bm_action_log` VALUES ('378', '10', '1', '2130706433', 'Menu', '148', '操作url：/Admin/Menu/add.html', '1', '1442304540');
INSERT INTO `bm_action_log` VALUES ('379', '7', '1', '2130706433', 'model', '15', '操作url：/Admin/Model/update.html', '1', '1442304700');
INSERT INTO `bm_action_log` VALUES ('380', '7', '1', '2130706433', 'model', '15', '操作url：/Admin/Model/update.html', '1', '1442304832');
INSERT INTO `bm_action_log` VALUES ('381', '10', '1', '2130706433', 'Menu', '149', '操作url：/Admin/Menu/add.html', '1', '1442305213');
INSERT INTO `bm_action_log` VALUES ('382', '10', '1', '2130706433', 'Menu', '149', '操作url：/Admin/Menu/edit.html', '1', '1442305259');
INSERT INTO `bm_action_log` VALUES ('383', '10', '1', '2130706433', 'Menu', '148', '操作url：/Admin/Menu/edit.html', '1', '1442307319');
INSERT INTO `bm_action_log` VALUES ('384', '7', '1', '2130706433', 'model', '16', '操作url：/Admin/Model/update.html', '1', '1442319835');
INSERT INTO `bm_action_log` VALUES ('385', '8', '1', '2130706433', 'attribute', '112', '操作url：/Admin/Attribute/update.html', '1', '1442319899');
INSERT INTO `bm_action_log` VALUES ('386', '8', '1', '2130706433', 'attribute', '113', '操作url：/Admin/Attribute/update.html', '1', '1442319941');
INSERT INTO `bm_action_log` VALUES ('387', '8', '1', '2130706433', 'attribute', '114', '操作url：/Admin/Attribute/update.html', '1', '1442320171');
INSERT INTO `bm_action_log` VALUES ('388', '8', '1', '2130706433', 'attribute', '112', '操作url：/Admin/Attribute/update.html', '1', '1442320185');
INSERT INTO `bm_action_log` VALUES ('389', '8', '1', '2130706433', 'attribute', '115', '操作url：/Admin/Attribute/update.html', '1', '1442320524');
INSERT INTO `bm_action_log` VALUES ('390', '8', '1', '2130706433', 'attribute', '115', '操作url：/Admin/Attribute/update.html', '1', '1442320565');
INSERT INTO `bm_action_log` VALUES ('391', '8', '1', '2130706433', 'attribute', '113', '操作url：/Admin/Attribute/update.html', '1', '1442320618');
INSERT INTO `bm_action_log` VALUES ('392', '10', '1', '2130706433', 'Menu', '150', '操作url：/Admin/Menu/add.html', '1', '1442321249');
INSERT INTO `bm_action_log` VALUES ('393', '8', '1', '2130706433', 'attribute', '115', '操作url：/Admin/Attribute/update.html', '1', '1442321401');
INSERT INTO `bm_action_log` VALUES ('394', '8', '1', '2130706433', 'attribute', '115', '操作url：/Admin/Attribute/update.html', '1', '1442321580');
INSERT INTO `bm_action_log` VALUES ('395', '8', '1', '2130706433', 'attribute', '115', '操作url：/Admin/Attribute/update.html', '1', '1442321926');
INSERT INTO `bm_action_log` VALUES ('396', '8', '1', '2130706433', 'attribute', '115', '操作url：/Admin/Attribute/update.html', '1', '1442324516');
INSERT INTO `bm_action_log` VALUES ('397', '10', '1', '2130706433', 'Menu', '68', '操作url：/Admin/Menu/edit.html', '1', '1442324958');
INSERT INTO `bm_action_log` VALUES ('398', '7', '1', '2130706433', 'model', '17', '操作url：/Admin/Model/update.html', '1', '1442325072');
INSERT INTO `bm_action_log` VALUES ('399', '8', '1', '2130706433', 'attribute', '116', '操作url：/Admin/Attribute/update.html', '1', '1442325113');
INSERT INTO `bm_action_log` VALUES ('400', '8', '1', '2130706433', 'attribute', '117', '操作url：/Admin/Attribute/update.html', '1', '1442325158');
INSERT INTO `bm_action_log` VALUES ('401', '8', '1', '2130706433', 'attribute', '118', '操作url：/Admin/Attribute/update.html', '1', '1442325189');
INSERT INTO `bm_action_log` VALUES ('402', '8', '1', '2130706433', 'attribute', '119', '操作url：/Admin/Attribute/update.html', '1', '1442325227');
INSERT INTO `bm_action_log` VALUES ('403', '8', '1', '2130706433', 'attribute', '119', '操作url：/Admin/Attribute/update.html', '1', '1442325263');
INSERT INTO `bm_action_log` VALUES ('404', '8', '1', '2130706433', 'attribute', '120', '操作url：/Admin/Attribute/update.html', '1', '1442325322');
INSERT INTO `bm_action_log` VALUES ('405', '8', '1', '2130706433', 'attribute', '121', '操作url：/Admin/Attribute/update.html', '1', '1442325354');
INSERT INTO `bm_action_log` VALUES ('406', '10', '1', '2130706433', 'Menu', '151', '操作url：/Admin/Menu/add.html', '1', '1442325783');
INSERT INTO `bm_action_log` VALUES ('407', '8', '1', '2130706433', 'attribute', '122', '操作url：/Admin/Attribute/update.html', '1', '1442326542');
INSERT INTO `bm_action_log` VALUES ('408', '8', '1', '2130706433', 'attribute', '122', '操作url：/Admin/Attribute/update.html', '1', '1442326557');
INSERT INTO `bm_action_log` VALUES ('409', '8', '1', '2130706433', 'attribute', '120', '操作url：/Admin/Attribute/update.html', '1', '1442326574');
INSERT INTO `bm_action_log` VALUES ('410', '7', '1', '2130706433', 'model', '17', '操作url：/Admin/Model/update.html', '1', '1442326636');
INSERT INTO `bm_action_log` VALUES ('411', '10', '1', '2130706433', 'Menu', '151', '操作url：/Admin/Menu/edit.html', '1', '1442327443');
INSERT INTO `bm_action_log` VALUES ('412', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-16 09:12登录了后台', '1', '1442365943');
INSERT INTO `bm_action_log` VALUES ('413', '10', '1', '2130706433', 'Menu', '149', '操作url：/Admin/Menu/edit.html', '1', '1442370704');
INSERT INTO `bm_action_log` VALUES ('414', '8', '1', '2130706433', 'attribute', '60', '操作url：/Admin/Attribute/update.html', '1', '1442373820');
INSERT INTO `bm_action_log` VALUES ('415', '8', '1', '2130706433', 'attribute', '61', '操作url：/Admin/Attribute/update.html', '1', '1442373833');
INSERT INTO `bm_action_log` VALUES ('416', '8', '1', '2130706433', 'attribute', '107', '操作url：/Admin/Attribute/update.html', '1', '1442373872');
INSERT INTO `bm_action_log` VALUES ('417', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-17 00:09登录了后台', '1', '1442419751');
INSERT INTO `bm_action_log` VALUES ('418', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-17 09:29登录了后台', '1', '1442453376');
INSERT INTO `bm_action_log` VALUES ('419', '7', '1', '2130706433', 'model', '18', '操作url：/Admin/Model/update.html', '1', '1442453960');
INSERT INTO `bm_action_log` VALUES ('420', '8', '1', '2130706433', 'attribute', '123', '操作url：/Admin/Attribute/update.html', '1', '1442454000');
INSERT INTO `bm_action_log` VALUES ('421', '8', '1', '2130706433', 'attribute', '124', '操作url：/Admin/Attribute/update.html', '1', '1442454069');
INSERT INTO `bm_action_log` VALUES ('422', '8', '1', '2130706433', 'attribute', '125', '操作url：/Admin/Attribute/update.html', '1', '1442454176');
INSERT INTO `bm_action_log` VALUES ('423', '8', '1', '2130706433', 'attribute', '126', '操作url：/Admin/Attribute/update.html', '1', '1442454216');
INSERT INTO `bm_action_log` VALUES ('424', '8', '1', '2130706433', 'attribute', '127', '操作url：/Admin/Attribute/update.html', '1', '1442454275');
INSERT INTO `bm_action_log` VALUES ('425', '8', '1', '2130706433', 'attribute', '128', '操作url：/Admin/Attribute/update.html', '1', '1442454303');
INSERT INTO `bm_action_log` VALUES ('426', '7', '1', '2130706433', 'model', '19', '操作url：/Admin/Model/update.html', '1', '1442458314');
INSERT INTO `bm_action_log` VALUES ('427', '8', '1', '2130706433', 'attribute', '129', '操作url：/Admin/Attribute/update.html', '1', '1442458424');
INSERT INTO `bm_action_log` VALUES ('428', '8', '1', '2130706433', 'attribute', '130', '操作url：/Admin/Attribute/update.html', '1', '1442458469');
INSERT INTO `bm_action_log` VALUES ('429', '8', '1', '2130706433', 'attribute', '131', '操作url：/Admin/Attribute/update.html', '1', '1442458573');
INSERT INTO `bm_action_log` VALUES ('430', '8', '1', '2130706433', 'attribute', '132', '操作url：/Admin/Attribute/update.html', '1', '1442458615');
INSERT INTO `bm_action_log` VALUES ('431', '8', '1', '2130706433', 'attribute', '133', '操作url：/Admin/Attribute/update.html', '1', '1442458678');
INSERT INTO `bm_action_log` VALUES ('432', '8', '1', '2130706433', 'attribute', '134', '操作url：/Admin/Attribute/update.html', '1', '1442458757');
INSERT INTO `bm_action_log` VALUES ('433', '8', '1', '2130706433', 'attribute', '135', '操作url：/Admin/Attribute/update.html', '1', '1442458785');
INSERT INTO `bm_action_log` VALUES ('434', '8', '1', '2130706433', 'attribute', '136', '操作url：/Admin/Attribute/update.html', '1', '1442458824');
INSERT INTO `bm_action_log` VALUES ('435', '7', '1', '2130706433', 'model', '20', '操作url：/Admin/Model/update.html', '1', '1442459072');
INSERT INTO `bm_action_log` VALUES ('436', '8', '1', '2130706433', 'attribute', '137', '操作url：/Admin/Attribute/update.html', '1', '1442460791');
INSERT INTO `bm_action_log` VALUES ('437', '8', '1', '2130706433', 'attribute', '138', '操作url：/Admin/Attribute/update.html', '1', '1442460916');
INSERT INTO `bm_action_log` VALUES ('438', '8', '1', '2130706433', 'attribute', '139', '操作url：/Admin/Attribute/update.html', '1', '1442460967');
INSERT INTO `bm_action_log` VALUES ('439', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-18 10:26登录了后台', '1', '1442543218');
INSERT INTO `bm_action_log` VALUES ('440', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-18 15:06登录了后台', '1', '1442559997');
INSERT INTO `bm_action_log` VALUES ('441', '7', '1', '2130706433', 'model', '21', '操作url：/Admin/Model/update.html', '1', '1442560149');
INSERT INTO `bm_action_log` VALUES ('442', '8', '1', '2130706433', 'attribute', '140', '操作url：/Admin/Attribute/update.html', '1', '1442560189');
INSERT INTO `bm_action_log` VALUES ('443', '8', '1', '2130706433', 'attribute', '141', '操作url：/Admin/Attribute/update.html', '1', '1442560220');
INSERT INTO `bm_action_log` VALUES ('444', '8', '1', '2130706433', 'attribute', '142', '操作url：/Admin/Attribute/update.html', '1', '1442560318');
INSERT INTO `bm_action_log` VALUES ('445', '8', '1', '2130706433', 'attribute', '143', '操作url：/Admin/Attribute/update.html', '1', '1442560377');
INSERT INTO `bm_action_log` VALUES ('446', '8', '1', '2130706433', 'attribute', '144', '操作url：/Admin/Attribute/update.html', '1', '1442560455');
INSERT INTO `bm_action_log` VALUES ('447', '8', '1', '2130706433', 'attribute', '145', '操作url：/Admin/Attribute/update.html', '1', '1442560499');
INSERT INTO `bm_action_log` VALUES ('448', '8', '1', '2130706433', 'attribute', '146', '操作url：/Admin/Attribute/update.html', '1', '1442560577');
INSERT INTO `bm_action_log` VALUES ('449', '8', '1', '2130706433', 'attribute', '147', '操作url：/Admin/Attribute/update.html', '1', '1442560614');
INSERT INTO `bm_action_log` VALUES ('450', '8', '1', '2130706433', 'attribute', '148', '操作url：/Admin/Attribute/update.html', '1', '1442560641');
INSERT INTO `bm_action_log` VALUES ('451', '8', '1', '2130706433', 'attribute', '149', '操作url：/Admin/Attribute/update.html', '1', '1442561591');
INSERT INTO `bm_action_log` VALUES ('452', '8', '1', '2130706433', 'attribute', '150', '操作url：/Admin/Attribute/update.html', '1', '1442561683');
INSERT INTO `bm_action_log` VALUES ('453', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-19 16:02登录了后台', '1', '1442649729');
INSERT INTO `bm_action_log` VALUES ('454', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-20 20:42登录了后台', '1', '1442752978');
INSERT INTO `bm_action_log` VALUES ('455', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-21 09:24登录了后台', '1', '1442798645');
INSERT INTO `bm_action_log` VALUES ('456', '8', '1', '2130706433', 'attribute', '151', '操作url：/Admin/Attribute/update.html', '1', '1442798796');
INSERT INTO `bm_action_log` VALUES ('457', '8', '1', '2130706433', 'attribute', '152', '操作url：/Admin/Attribute/update.html', '1', '1442798831');
INSERT INTO `bm_action_log` VALUES ('458', '7', '1', '2130706433', 'model', '19', '操作url：/Admin/Model/update.html', '1', '1442798863');
INSERT INTO `bm_action_log` VALUES ('459', '7', '1', '2130706433', 'model', '19', '操作url：/Admin/Model/update.html', '1', '1442798899');
INSERT INTO `bm_action_log` VALUES ('460', '8', '1', '2130706433', 'attribute', '152', '操作url：/Admin/Attribute/remove/id/152.html', '1', '1442801417');
INSERT INTO `bm_action_log` VALUES ('461', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-21 21:03登录了后台', '1', '1442840639');
INSERT INTO `bm_action_log` VALUES ('462', '8', '1', '2130706433', 'attribute', '143', '操作url：/Admin/Attribute/remove/id/143.html', '1', '1442840805');
INSERT INTO `bm_action_log` VALUES ('463', '8', '1', '2130706433', 'attribute', '153', '操作url：/Admin/Attribute/update.html', '1', '1442840910');
INSERT INTO `bm_action_log` VALUES ('464', '8', '1', '2130706433', 'attribute', '154', '操作url：/Admin/Attribute/update.html', '1', '1442841385');
INSERT INTO `bm_action_log` VALUES ('465', '8', '1', '2130706433', 'attribute', '155', '操作url：/Admin/Attribute/update.html', '1', '1442841465');
INSERT INTO `bm_action_log` VALUES ('466', '8', '1', '2130706433', 'attribute', '156', '操作url：/Admin/Attribute/update.html', '1', '1442841510');
INSERT INTO `bm_action_log` VALUES ('467', '8', '1', '2130706433', 'attribute', '133', '操作url：/Admin/Attribute/update.html', '1', '1442841538');
INSERT INTO `bm_action_log` VALUES ('468', '8', '1', '2130706433', 'attribute', '157', '操作url：/Admin/Attribute/update.html', '1', '1442841643');
INSERT INTO `bm_action_log` VALUES ('469', '8', '1', '2130706433', 'attribute', '158', '操作url：/Admin/Attribute/update.html', '1', '1442842183');
INSERT INTO `bm_action_log` VALUES ('470', '10', '1', '2130706433', 'Menu', '152', '操作url：/Admin/Menu/add.html', '1', '1442842383');
INSERT INTO `bm_action_log` VALUES ('471', '10', '1', '2130706433', 'Menu', '152', '操作url：/Admin/Menu/edit.html', '1', '1442842399');
INSERT INTO `bm_action_log` VALUES ('472', '10', '1', '2130706433', 'Menu', '123', '操作url：/Admin/Menu/edit.html', '1', '1442842435');
INSERT INTO `bm_action_log` VALUES ('473', '10', '1', '2130706433', 'Menu', '152', '操作url：/Admin/Menu/edit.html', '1', '1442842445');
INSERT INTO `bm_action_log` VALUES ('474', '10', '1', '2130706433', 'Menu', '68', '操作url：/Admin/Menu/edit.html', '1', '1442842459');
INSERT INTO `bm_action_log` VALUES ('475', '10', '1', '2130706433', 'Menu', '152', '操作url：/Admin/Menu/edit.html', '1', '1442842469');
INSERT INTO `bm_action_log` VALUES ('476', '10', '1', '2130706433', 'Menu', '43', '操作url：/Admin/Menu/edit.html', '1', '1442842481');
INSERT INTO `bm_action_log` VALUES ('477', '10', '1', '2130706433', 'Menu', '152', '操作url：/Admin/Menu/edit.html', '1', '1442842499');
INSERT INTO `bm_action_log` VALUES ('478', '10', '1', '2130706433', 'Menu', '68', '操作url：/Admin/Menu/edit.html', '1', '1442842509');
INSERT INTO `bm_action_log` VALUES ('479', '10', '1', '2130706433', 'Menu', '124', '操作url：/Admin/Menu/edit.html', '1', '1442842580');
INSERT INTO `bm_action_log` VALUES ('480', '10', '1', '2130706433', 'Menu', '43', '操作url：/Admin/Menu/edit.html', '1', '1442842592');
INSERT INTO `bm_action_log` VALUES ('481', '7', '1', '2130706433', 'model', '21', '操作url：/Admin/Model/update.html', '1', '1442842922');
INSERT INTO `bm_action_log` VALUES ('482', '7', '1', '2130706433', 'model', '21', '操作url：/Admin/Model/update.html', '1', '1442842983');
INSERT INTO `bm_action_log` VALUES ('483', '7', '1', '2130706433', 'model', '21', '操作url：/Admin/Model/update.html', '1', '1442843004');
INSERT INTO `bm_action_log` VALUES ('484', '10', '1', '2130706433', 'Menu', '153', '操作url：/Admin/Menu/add.html', '1', '1442844020');
INSERT INTO `bm_action_log` VALUES ('485', '7', '1', '2130706433', 'model', '21', '操作url：/Admin/Model/update.html', '1', '1442844517');
INSERT INTO `bm_action_log` VALUES ('486', '7', '1', '2130706433', 'model', '21', '操作url：/Admin/Model/update.html', '1', '1442844682');
INSERT INTO `bm_action_log` VALUES ('487', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-22 09:19登录了后台', '1', '1442884773');
INSERT INTO `bm_action_log` VALUES ('488', '10', '1', '2130706433', 'Menu', '154', '操作url：/Admin/Menu/add.html', '1', '1442891324');
INSERT INTO `bm_action_log` VALUES ('489', '10', '1', '2130706433', 'Menu', '154', '操作url：/Admin/Menu/edit.html', '1', '1442891415');
INSERT INTO `bm_action_log` VALUES ('490', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-22 20:40登录了后台', '1', '1442925630');
INSERT INTO `bm_action_log` VALUES ('491', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-22 20:55登录了后台', '1', '1442926545');
INSERT INTO `bm_action_log` VALUES ('492', '8', '1', '2130706433', 'attribute', '136', '操作url：/Admin/Attribute/update.html', '1', '1442927205');
INSERT INTO `bm_action_log` VALUES ('493', '7', '1', '2130706433', 'model', '19', '操作url：/Admin/Model/update.html', '1', '1442927527');
INSERT INTO `bm_action_log` VALUES ('494', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1442928517');
INSERT INTO `bm_action_log` VALUES ('495', '8', '1', '2130706433', 'attribute', '159', '操作url：/Admin/Attribute/update.html', '1', '1442928546');
INSERT INTO `bm_action_log` VALUES ('496', '8', '1', '2130706433', 'attribute', '159', '操作url：/Admin/Attribute/update.html', '1', '1442928575');
INSERT INTO `bm_action_log` VALUES ('497', '8', '1', '2130706433', 'attribute', '160', '操作url：/Admin/Attribute/update.html', '1', '1442928611');
INSERT INTO `bm_action_log` VALUES ('498', '8', '1', '2130706433', 'attribute', '161', '操作url：/Admin/Attribute/update.html', '1', '1442929108');
INSERT INTO `bm_action_log` VALUES ('499', '8', '1', '2130706433', 'attribute', '162', '操作url：/Admin/Attribute/update.html', '1', '1442929136');
INSERT INTO `bm_action_log` VALUES ('500', '8', '1', '2130706433', 'attribute', '163', '操作url：/Admin/Attribute/update.html', '1', '1442929244');
INSERT INTO `bm_action_log` VALUES ('501', '8', '1', '2130706433', 'attribute', '163', '操作url：/Admin/Attribute/update.html', '1', '1442929280');
INSERT INTO `bm_action_log` VALUES ('502', '8', '1', '2130706433', 'attribute', '164', '操作url：/Admin/Attribute/update.html', '1', '1442929391');
INSERT INTO `bm_action_log` VALUES ('503', '8', '1', '2130706433', 'attribute', '165', '操作url：/Admin/Attribute/update.html', '1', '1442929428');
INSERT INTO `bm_action_log` VALUES ('504', '8', '1', '2130706433', 'attribute', '166', '操作url：/Admin/Attribute/update.html', '1', '1442929473');
INSERT INTO `bm_action_log` VALUES ('505', '8', '1', '2130706433', 'attribute', '164', '操作url：/Admin/Attribute/update.html', '1', '1442929501');
INSERT INTO `bm_action_log` VALUES ('506', '8', '1', '2130706433', 'attribute', '167', '操作url：/Admin/Attribute/update.html', '1', '1442929539');
INSERT INTO `bm_action_log` VALUES ('507', '8', '1', '2130706433', 'attribute', '168', '操作url：/Admin/Attribute/update.html', '1', '1442929568');
INSERT INTO `bm_action_log` VALUES ('508', '8', '1', '2130706433', 'attribute', '169', '操作url：/Admin/Attribute/update.html', '1', '1442929731');
INSERT INTO `bm_action_log` VALUES ('509', '8', '1', '2130706433', 'attribute', '170', '操作url：/Admin/Attribute/update.html', '1', '1442929769');
INSERT INTO `bm_action_log` VALUES ('510', '8', '1', '2130706433', 'attribute', '171', '操作url：/Admin/Attribute/update.html', '1', '1442929814');
INSERT INTO `bm_action_log` VALUES ('511', '8', '1', '2130706433', 'attribute', '172', '操作url：/Admin/Attribute/update.html', '1', '1442929864');
INSERT INTO `bm_action_log` VALUES ('512', '8', '1', '2130706433', 'attribute', '173', '操作url：/Admin/Attribute/update.html', '1', '1442929932');
INSERT INTO `bm_action_log` VALUES ('513', '8', '1', '2130706433', 'attribute', '174', '操作url：/Admin/Attribute/update.html', '1', '1442930010');
INSERT INTO `bm_action_log` VALUES ('514', '8', '1', '2130706433', 'attribute', '175', '操作url：/Admin/Attribute/update.html', '1', '1442930044');
INSERT INTO `bm_action_log` VALUES ('515', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-23 09:29登录了后台', '1', '1442971756');
INSERT INTO `bm_action_log` VALUES ('516', '8', '1', '2130706433', 'attribute', '176', '操作url：/Admin/Attribute/update.html', '1', '1442976401');
INSERT INTO `bm_action_log` VALUES ('517', '8', '1', '2130706433', 'attribute', '177', '操作url：/Admin/Attribute/update.html', '1', '1442976504');
INSERT INTO `bm_action_log` VALUES ('518', '8', '1', '2130706433', 'attribute', '178', '操作url：/Admin/Attribute/update.html', '1', '1442976548');
INSERT INTO `bm_action_log` VALUES ('519', '8', '1', '2130706433', 'attribute', '179', '操作url：/Admin/Attribute/update.html', '1', '1442976616');
INSERT INTO `bm_action_log` VALUES ('520', '8', '1', '2130706433', 'attribute', '180', '操作url：/Admin/Attribute/update.html', '1', '1442976675');
INSERT INTO `bm_action_log` VALUES ('521', '8', '1', '2130706433', 'attribute', '181', '操作url：/Admin/Attribute/update.html', '1', '1442976708');
INSERT INTO `bm_action_log` VALUES ('522', '8', '1', '2130706433', 'attribute', '182', '操作url：/Admin/Attribute/update.html', '1', '1442976868');
INSERT INTO `bm_action_log` VALUES ('523', '8', '1', '2130706433', 'attribute', '183', '操作url：/Admin/Attribute/update.html', '1', '1442976908');
INSERT INTO `bm_action_log` VALUES ('524', '8', '1', '2130706433', 'attribute', '184', '操作url：/Admin/Attribute/update.html', '1', '1442976938');
INSERT INTO `bm_action_log` VALUES ('525', '8', '1', '2130706433', 'attribute', '185', '操作url：/Admin/Attribute/update.html', '1', '1442976966');
INSERT INTO `bm_action_log` VALUES ('526', '8', '1', '2130706433', 'attribute', '186', '操作url：/Admin/Attribute/update.html', '1', '1442978595');
INSERT INTO `bm_action_log` VALUES ('527', '8', '1', '2130706433', 'attribute', '187', '操作url：/Admin/Attribute/update.html', '1', '1442978633');
INSERT INTO `bm_action_log` VALUES ('528', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1442979221');
INSERT INTO `bm_action_log` VALUES ('529', '7', '1', '2130706433', 'model', '19', '操作url：/Admin/Model/update.html', '1', '1442979320');
INSERT INTO `bm_action_log` VALUES ('530', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1442979393');
INSERT INTO `bm_action_log` VALUES ('531', '10', '1', '2130706433', 'Menu', '155', '操作url：/Admin/Menu/add.html', '1', '1442980235');
INSERT INTO `bm_action_log` VALUES ('532', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-23 14:14登录了后台', '1', '1442988857');
INSERT INTO `bm_action_log` VALUES ('533', '8', '1', '2130706433', 'attribute', '135', '操作url：/Admin/Attribute/update.html', '1', '1442992531');
INSERT INTO `bm_action_log` VALUES ('534', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1442994447');
INSERT INTO `bm_action_log` VALUES ('535', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1442994520');
INSERT INTO `bm_action_log` VALUES ('536', '10', '1', '2130706433', 'Menu', '156', '操作url：/Admin/Menu/add.html', '1', '1442995257');
INSERT INTO `bm_action_log` VALUES ('537', '8', '1', '2130706433', 'attribute', '137', '操作url：/Admin/Attribute/update.html', '1', '1442995793');
INSERT INTO `bm_action_log` VALUES ('538', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-24 10:24登录了后台', '1', '1443061494');
INSERT INTO `bm_action_log` VALUES ('539', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1443064215');
INSERT INTO `bm_action_log` VALUES ('540', '10', '1', '2130706433', 'Menu', '157', '操作url：/Admin/Menu/add.html', '1', '1443079126');
INSERT INTO `bm_action_log` VALUES ('541', '8', '1', '2130706433', 'attribute', '164', '操作url：/Admin/Attribute/update.html', '1', '1443083404');
INSERT INTO `bm_action_log` VALUES ('542', '8', '1', '2130706433', 'attribute', '164', '操作url：/Admin/Attribute/update.html', '1', '1443083415');
INSERT INTO `bm_action_log` VALUES ('543', '10', '1', '2130706433', 'Menu', '39', '操作url：/Admin/Menu/edit.html', '1', '1443083705');
INSERT INTO `bm_action_log` VALUES ('544', '7', '1', '2130706433', 'model', '19', '操作url：/Admin/Model/update.html', '1', '1443084996');
INSERT INTO `bm_action_log` VALUES ('545', '8', '1', '2130706433', 'attribute', '151', '操作url：/Admin/Attribute/update.html', '1', '1443088035');
INSERT INTO `bm_action_log` VALUES ('546', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-24 18:21登录了后台', '1', '1443090065');
INSERT INTO `bm_action_log` VALUES ('547', '8', '1', '2130706433', 'attribute', '188', '操作url：/Admin/Attribute/update.html', '1', '1443090352');
INSERT INTO `bm_action_log` VALUES ('548', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-25 09:17登录了后台', '1', '1443143868');
INSERT INTO `bm_action_log` VALUES ('549', '10', '1', '2130706433', 'Menu', '153', '操作url：/Admin/Menu/edit.html', '1', '1443143911');
INSERT INTO `bm_action_log` VALUES ('550', '10', '1', '2130706433', 'Menu', '153', '操作url：/Admin/Menu/edit.html', '1', '1443143936');
INSERT INTO `bm_action_log` VALUES ('551', '10', '1', '2130706433', 'Menu', '155', '操作url：/Admin/Menu/edit.html', '1', '1443143943');
INSERT INTO `bm_action_log` VALUES ('552', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/153.html', '1', '1443144046');
INSERT INTO `bm_action_log` VALUES ('553', '10', '1', '2130706433', 'Menu', '158', '操作url：/Admin/Menu/add.html', '1', '1443144071');
INSERT INTO `bm_action_log` VALUES ('554', '10', '1', '2130706433', 'Menu', '155', '操作url：/Admin/Menu/edit.html', '1', '1443144112');
INSERT INTO `bm_action_log` VALUES ('555', '10', '1', '2130706433', 'Menu', '152', '操作url：/Admin/Menu/edit.html', '1', '1443144143');
INSERT INTO `bm_action_log` VALUES ('556', '10', '1', '2130706433', 'Menu', '158', '操作url：/Admin/Menu/edit.html', '1', '1443144203');
INSERT INTO `bm_action_log` VALUES ('557', '10', '1', '2130706433', 'Menu', '159', '操作url：/Admin/Menu/add.html', '1', '1443150524');
INSERT INTO `bm_action_log` VALUES ('558', '10', '1', '2130706433', 'Menu', '159', '操作url：/Admin/Menu/edit.html', '1', '1443150607');
INSERT INTO `bm_action_log` VALUES ('559', '10', '1', '2130706433', 'Menu', '159', '操作url：/Admin/Menu/edit.html', '1', '1443150687');
INSERT INTO `bm_action_log` VALUES ('560', '8', '1', '2130706433', 'attribute', '147', '操作url：/Admin/Attribute/update.html', '1', '1443153746');
INSERT INTO `bm_action_log` VALUES ('561', '8', '1', '2130706433', 'attribute', '94', '操作url：/Admin/Attribute/update.html', '1', '1443154018');
INSERT INTO `bm_action_log` VALUES ('562', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-25 16:48登录了后台', '1', '1443170926');
INSERT INTO `bm_action_log` VALUES ('563', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-25 19:43登录了后台', '1', '1443181412');
INSERT INTO `bm_action_log` VALUES ('564', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-25 20:03登录了后台', '1', '1443182602');
INSERT INTO `bm_action_log` VALUES ('565', '11', '1', '2130706433', 'category', '39', '操作url：/Admin/Category/edit.html', '1', '1443186203');
INSERT INTO `bm_action_log` VALUES ('566', '11', '1', '2130706433', 'category', '2', '操作url：/Admin/Category/edit.html', '1', '1443186214');
INSERT INTO `bm_action_log` VALUES ('567', '11', '1', '2130706433', 'category', '39', '操作url：/Admin/Category/edit.html', '1', '1443186221');
INSERT INTO `bm_action_log` VALUES ('568', '11', '1', '2130706433', 'category', '2', '操作url：/Admin/Category/edit.html', '1', '1443186225');
INSERT INTO `bm_action_log` VALUES ('569', '11', '1', '2130706433', 'category', '39', '操作url：/Admin/Category/edit.html', '1', '1443186309');
INSERT INTO `bm_action_log` VALUES ('570', '11', '1', '2130706433', 'category', '2', '操作url：/Admin/Category/edit.html', '1', '1443186320');
INSERT INTO `bm_action_log` VALUES ('571', '11', '1', '2130706433', 'category', '41', '操作url：/Admin/Category/add.html', '1', '1443186345');
INSERT INTO `bm_action_log` VALUES ('572', '11', '1', '2130706433', 'category', '42', '操作url：/Admin/Category/add.html', '1', '1443186369');
INSERT INTO `bm_action_log` VALUES ('573', '11', '1', '2130706433', 'category', '42', '操作url：/Admin/Category/edit.html', '1', '1443186378');
INSERT INTO `bm_action_log` VALUES ('574', '11', '1', '2130706433', 'category', '43', '操作url：/Admin/Category/add.html', '1', '1443186398');
INSERT INTO `bm_action_log` VALUES ('575', '11', '1', '2130706433', 'category', '43', '操作url：/Admin/Category/edit.html', '1', '1443186404');
INSERT INTO `bm_action_log` VALUES ('576', '11', '1', '2130706433', 'category', '44', '操作url：/Admin/Category/add.html', '1', '1443186418');
INSERT INTO `bm_action_log` VALUES ('577', '11', '1', '2130706433', 'category', '44', '操作url：/Admin/Category/edit.html', '1', '1443186425');
INSERT INTO `bm_action_log` VALUES ('578', '11', '1', '2130706433', 'category', '45', '操作url：/Admin/Category/add.html', '1', '1443186436');
INSERT INTO `bm_action_log` VALUES ('579', '11', '1', '2130706433', 'category', '45', '操作url：/Admin/Category/edit.html', '1', '1443186444');
INSERT INTO `bm_action_log` VALUES ('580', '11', '1', '2130706433', 'category', '39', '操作url：/Admin/Category/edit.html', '1', '1443186492');
INSERT INTO `bm_action_log` VALUES ('581', '11', '1', '2130706433', 'category', '2', '操作url：/Admin/Category/edit.html', '1', '1443186495');
INSERT INTO `bm_action_log` VALUES ('582', '11', '1', '2130706433', 'category', '41', '操作url：/Admin/Category/edit.html', '1', '1443186503');
INSERT INTO `bm_action_log` VALUES ('583', '7', '1', '2130706433', 'model', '9', '操作url：/Admin/Model/update.html', '1', '1443187620');
INSERT INTO `bm_action_log` VALUES ('584', '7', '1', '2130706433', 'model', '9', '操作url：/Admin/Model/update.html', '1', '1443188001');
INSERT INTO `bm_action_log` VALUES ('585', '7', '1', '2130706433', 'model', '8', '操作url：/Admin/Model/update.html', '1', '1443188214');
INSERT INTO `bm_action_log` VALUES ('586', '7', '1', '2130706433', 'model', '5', '操作url：/Admin/Model/update.html', '1', '1443188429');
INSERT INTO `bm_action_log` VALUES ('587', '7', '1', '2130706433', 'model', '6', '操作url：/Admin/Model/update.html', '1', '1443188467');
INSERT INTO `bm_action_log` VALUES ('588', '7', '1', '2130706433', 'model', '14', '操作url：/Admin/Model/update.html', '1', '1443188659');
INSERT INTO `bm_action_log` VALUES ('589', '7', '1', '2130706433', 'model', '15', '操作url：/Admin/Model/update.html', '1', '1443188943');
INSERT INTO `bm_action_log` VALUES ('590', '7', '1', '2130706433', 'model', '15', '操作url：/Admin/Model/update.html', '1', '1443189041');
INSERT INTO `bm_action_log` VALUES ('591', '7', '1', '2130706433', 'model', '15', '操作url：/Admin/Model/update.html', '1', '1443189801');
INSERT INTO `bm_action_log` VALUES ('592', '7', '1', '2130706433', 'model', '15', '操作url：/Admin/Model/update.html', '1', '1443189820');
INSERT INTO `bm_action_log` VALUES ('593', '7', '1', '2130706433', 'model', '11', '操作url：/Admin/Model/update.html', '1', '1443190038');
INSERT INTO `bm_action_log` VALUES ('594', '8', '1', '2130706433', 'attribute', '99', '操作url：/Admin/Attribute/update.html', '1', '1443190890');
INSERT INTO `bm_action_log` VALUES ('595', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1443191196');
INSERT INTO `bm_action_log` VALUES ('596', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1443191290');
INSERT INTO `bm_action_log` VALUES ('597', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1443191332');
INSERT INTO `bm_action_log` VALUES ('598', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1443191549');
INSERT INTO `bm_action_log` VALUES ('599', '7', '1', '2130706433', 'model', '21', '操作url：/Admin/Model/update.html', '1', '1443191689');
INSERT INTO `bm_action_log` VALUES ('600', '8', '1', '2130706433', 'attribute', '136', '操作url：/Admin/Attribute/update.html', '1', '1443192146');
INSERT INTO `bm_action_log` VALUES ('601', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1443192237');
INSERT INTO `bm_action_log` VALUES ('602', '11', '1', '2130706433', 'category', '41', '操作url：/Admin/Category/edit.html', '1', '1443194464');
INSERT INTO `bm_action_log` VALUES ('603', '11', '1', '2130706433', 'category', '42', '操作url：/Admin/Category/edit.html', '1', '1443194480');
INSERT INTO `bm_action_log` VALUES ('604', '11', '1', '2130706433', 'category', '43', '操作url：/Admin/Category/edit.html', '1', '1443194488');
INSERT INTO `bm_action_log` VALUES ('605', '11', '1', '2130706433', 'category', '44', '操作url：/Admin/Category/edit.html', '1', '1443194496');
INSERT INTO `bm_action_log` VALUES ('606', '11', '1', '2130706433', 'category', '45', '操作url：/Admin/Category/edit.html', '1', '1443194503');
INSERT INTO `bm_action_log` VALUES ('607', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-25 23:37登录了后台', '1', '1443195444');
INSERT INTO `bm_action_log` VALUES ('608', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-25 23:45登录了后台', '1', '1443195954');
INSERT INTO `bm_action_log` VALUES ('609', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-25 23:49登录了后台', '1', '1443196144');
INSERT INTO `bm_action_log` VALUES ('610', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-25 23:52登录了后台', '1', '1443196343');
INSERT INTO `bm_action_log` VALUES ('611', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-26 13:33登录了后台', '1', '1443245590');
INSERT INTO `bm_action_log` VALUES ('612', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-26 16:27登录了后台', '1', '1443256047');
INSERT INTO `bm_action_log` VALUES ('613', '8', '1', '2130706433', 'attribute', '2', '操作url：/Admin/Attribute/update.html', '1', '1443260756');
INSERT INTO `bm_action_log` VALUES ('614', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-27 15:50登录了后台', '1', '1443340224');
INSERT INTO `bm_action_log` VALUES ('615', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-28 14:46登录了后台', '1', '1443422760');
INSERT INTO `bm_action_log` VALUES ('616', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-29 00:25登录了后台', '1', '1443457554');
INSERT INTO `bm_action_log` VALUES ('617', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-29 13:04登录了后台', '1', '1443503080');
INSERT INTO `bm_action_log` VALUES ('618', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-29 16:25登录了后台', '1', '1443515114');
INSERT INTO `bm_action_log` VALUES ('619', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-29 16:33登录了后台', '1', '1443515616');
INSERT INTO `bm_action_log` VALUES ('620', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-29 16:53登录了后台', '1', '1443516799');
INSERT INTO `bm_action_log` VALUES ('621', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-29 17:00登录了后台', '1', '1443517234');
INSERT INTO `bm_action_log` VALUES ('622', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-29 21:42登录了后台', '1', '1443534176');
INSERT INTO `bm_action_log` VALUES ('623', '1', '1', '2130706433', 'member', '1', 'admin在2015-09-30 23:26登录了后台', '1', '1443626819');
INSERT INTO `bm_action_log` VALUES ('624', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-02 17:03登录了后台', '1', '1443776598');
INSERT INTO `bm_action_log` VALUES ('625', '7', '1', '2130706433', 'model', '1', '操作url：/Admin/Model/update.html', '1', '1443776828');
INSERT INTO `bm_action_log` VALUES ('626', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-03 19:51登录了后台', '1', '1443873109');
INSERT INTO `bm_action_log` VALUES ('627', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-03 20:05登录了后台', '1', '1443873925');
INSERT INTO `bm_action_log` VALUES ('628', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-04 14:50登录了后台', '1', '1443941440');
INSERT INTO `bm_action_log` VALUES ('629', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-05 20:27登录了后台', '1', '1444048027');
INSERT INTO `bm_action_log` VALUES ('630', '7', '1', '2130706433', 'model', '2', '操作url：/Admin/Model/update.html', '1', '1444056804');
INSERT INTO `bm_action_log` VALUES ('631', '7', '1', '2130706433', 'model', '2', '操作url：/Admin/Model/update.html', '1', '1444056881');
INSERT INTO `bm_action_log` VALUES ('632', '7', '1', '2130706433', 'model', '2', '操作url：/Admin/Model/update.html', '1', '1444056893');
INSERT INTO `bm_action_log` VALUES ('633', '8', '1', '2130706433', 'attribute', '10', '操作url：/Admin/Attribute/update.html', '1', '1444057000');
INSERT INTO `bm_action_log` VALUES ('634', '8', '1', '2130706433', 'attribute', '9', '操作url：/Admin/Attribute/update.html', '1', '1444057717');
INSERT INTO `bm_action_log` VALUES ('635', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-06 09:19登录了后台', '1', '1444094355');
INSERT INTO `bm_action_log` VALUES ('636', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-06 09:40登录了后台', '1', '1444095600');
INSERT INTO `bm_action_log` VALUES ('637', '7', '1', '2130706433', 'model', '1', '操作url：/Admin/Model/update.html', '1', '1444114577');
INSERT INTO `bm_action_log` VALUES ('638', '7', '1', '2130706433', 'model', '1', '操作url：/Admin/Model/update.html', '1', '1444115003');
INSERT INTO `bm_action_log` VALUES ('639', '7', '1', '2130706433', 'model', '2', '操作url：/Admin/Model/update.html', '1', '1444115229');
INSERT INTO `bm_action_log` VALUES ('640', '7', '1', '2130706433', 'model', '1', '操作url：/Admin/Model/update.html', '1', '1444115251');
INSERT INTO `bm_action_log` VALUES ('641', '7', '1', '2130706433', 'model', '1', '操作url：/Admin/Model/update.html', '1', '1444118315');
INSERT INTO `bm_action_log` VALUES ('642', '8', '1', '2130706433', 'attribute', '12', '操作url：/Admin/Attribute/update.html', '1', '1444121996');
INSERT INTO `bm_action_log` VALUES ('643', '8', '1', '2130706433', 'attribute', '19', '操作url：/Admin/Attribute/update.html', '1', '1444122903');
INSERT INTO `bm_action_log` VALUES ('644', '8', '1', '2130706433', 'attribute', '17', '操作url：/Admin/Attribute/update.html', '1', '1444122920');
INSERT INTO `bm_action_log` VALUES ('645', '8', '1', '2130706433', 'attribute', '16', '操作url：/Admin/Attribute/update.html', '1', '1444122946');
INSERT INTO `bm_action_log` VALUES ('646', '8', '1', '2130706433', 'attribute', '14', '操作url：/Admin/Attribute/update.html', '1', '1444122969');
INSERT INTO `bm_action_log` VALUES ('647', '8', '1', '2130706433', 'attribute', '13', '操作url：/Admin/Attribute/update.html', '1', '1444122977');
INSERT INTO `bm_action_log` VALUES ('648', '8', '1', '2130706433', 'attribute', '11', '操作url：/Admin/Attribute/update.html', '1', '1444122987');
INSERT INTO `bm_action_log` VALUES ('649', '8', '1', '2130706433', 'attribute', '25', '操作url：/Admin/Attribute/update.html', '1', '1444123226');
INSERT INTO `bm_action_log` VALUES ('650', '8', '1', '2130706433', 'attribute', '26', '操作url：/Admin/Attribute/update.html', '1', '1444123236');
INSERT INTO `bm_action_log` VALUES ('651', '7', '1', '2130706433', 'model', '1', '操作url：/Admin/Model/update.html', '1', '1444124689');
INSERT INTO `bm_action_log` VALUES ('652', '7', '1', '2130706433', 'model', '1', '操作url：/Admin/Model/update.html', '1', '1444124959');
INSERT INTO `bm_action_log` VALUES ('653', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-06 20:12登录了后台', '1', '1444133579');
INSERT INTO `bm_action_log` VALUES ('654', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-07 09:12登录了后台', '1', '1444180377');
INSERT INTO `bm_action_log` VALUES ('655', '7', '1', '2130706433', 'model', '1', '操作url：/Admin/Model/update.html', '1', '1444180697');
INSERT INTO `bm_action_log` VALUES ('656', '7', '1', '2130706433', 'model', '1', '操作url：/Admin/Model/update.html', '1', '1444181778');
INSERT INTO `bm_action_log` VALUES ('657', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-07 16:43登录了后台', '1', '1444207388');
INSERT INTO `bm_action_log` VALUES ('658', '8', '1', '2130706433', 'attribute', '5', '操作url：/Admin/Attribute/update.html', '1', '1444208662');
INSERT INTO `bm_action_log` VALUES ('659', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-07 19:28登录了后台', '1', '1444217301');
INSERT INTO `bm_action_log` VALUES ('660', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-07 19:42登录了后台', '1', '1444218169');
INSERT INTO `bm_action_log` VALUES ('661', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-08 09:39登录了后台', '1', '1444268367');
INSERT INTO `bm_action_log` VALUES ('662', '8', '1', '2130706433', 'attribute', '77', '操作url：/Admin/Attribute/update.html', '1', '1444271127');
INSERT INTO `bm_action_log` VALUES ('663', '8', '1', '2130706433', 'attribute', '75', '操作url：/Admin/Attribute/update.html', '1', '1444271365');
INSERT INTO `bm_action_log` VALUES ('664', '8', '1', '2130706433', 'attribute', '76', '操作url：/Admin/Attribute/update.html', '1', '1444271536');
INSERT INTO `bm_action_log` VALUES ('665', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-08 11:36登录了后台', '1', '1444275398');
INSERT INTO `bm_action_log` VALUES ('666', '8', '1', '2130706433', 'attribute', '96', '操作url：/Admin/Attribute/update.html', '1', '1444284778');
INSERT INTO `bm_action_log` VALUES ('667', '8', '1', '2130706433', 'attribute', '96', '操作url：/Admin/Attribute/update.html', '1', '1444285167');
INSERT INTO `bm_action_log` VALUES ('668', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-08 16:54登录了后台', '1', '1444294491');
INSERT INTO `bm_action_log` VALUES ('669', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-08 17:04登录了后台', '1', '1444295090');
INSERT INTO `bm_action_log` VALUES ('670', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-09 11:02登录了后台', '1', '1444359741');
INSERT INTO `bm_action_log` VALUES ('671', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-09 15:14登录了后台', '1', '1444374882');
INSERT INTO `bm_action_log` VALUES ('672', '8', '1', '2130706433', 'attribute', '96', '操作url：/Admin/Attribute/update.html', '1', '1444374949');
INSERT INTO `bm_action_log` VALUES ('673', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-12 09:50登录了后台', '1', '1444614646');
INSERT INTO `bm_action_log` VALUES ('674', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-12 14:17登录了后台', '1', '1444630624');
INSERT INTO `bm_action_log` VALUES ('675', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-13 15:56登录了后台', '1', '1444722986');
INSERT INTO `bm_action_log` VALUES ('676', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-14 09:36登录了后台', '1', '1444786561');
INSERT INTO `bm_action_log` VALUES ('677', '7', '1', '2130706433', 'model', '18', '操作url：/Admin/Model/update.html', '1', '1444803728');
INSERT INTO `bm_action_log` VALUES ('678', '8', '1', '2130706433', 'attribute', '125', '操作url：/Admin/Attribute/update.html', '1', '1444803795');
INSERT INTO `bm_action_log` VALUES ('679', '8', '1', '2130706433', 'attribute', '126', '操作url：/Admin/Attribute/update.html', '1', '1444803913');
INSERT INTO `bm_action_log` VALUES ('680', '7', '1', '2130706433', 'model', '18', '操作url：/Admin/Model/update.html', '1', '1444804785');
INSERT INTO `bm_action_log` VALUES ('681', '8', '1', '2130706433', 'attribute', '123', '操作url：/Admin/Attribute/update.html', '1', '1444806574');
INSERT INTO `bm_action_log` VALUES ('682', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-15 09:42登录了后台', '1', '1444873338');
INSERT INTO `bm_action_log` VALUES ('683', '8', '1', '2130706433', 'attribute', '87', '操作url：/Admin/Attribute/update.html', '1', '1444873503');
INSERT INTO `bm_action_log` VALUES ('684', '8', '1', '2130706433', 'attribute', '86', '操作url：/Admin/Attribute/update.html', '1', '1444873511');
INSERT INTO `bm_action_log` VALUES ('685', '8', '1', '2130706433', 'attribute', '84', '操作url：/Admin/Attribute/update.html', '1', '1444873522');
INSERT INTO `bm_action_log` VALUES ('686', '8', '1', '2130706433', 'attribute', '83', '操作url：/Admin/Attribute/update.html', '1', '1444873531');
INSERT INTO `bm_action_log` VALUES ('687', '8', '1', '2130706433', 'attribute', '82', '操作url：/Admin/Attribute/update.html', '1', '1444873540');
INSERT INTO `bm_action_log` VALUES ('688', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-15 14:18登录了后台', '1', '1444889916');
INSERT INTO `bm_action_log` VALUES ('689', '7', '1', '2130706433', 'model', '21', '操作url：/Admin/Model/update.html', '1', '1444897633');
INSERT INTO `bm_action_log` VALUES ('690', '7', '1', '2130706433', 'model', '11', '操作url：/Admin/Model/update.html', '1', '1444897761');
INSERT INTO `bm_action_log` VALUES ('691', '7', '1', '2130706433', 'model', '21', '操作url：/Admin/Model/update.html', '1', '1444897790');
INSERT INTO `bm_action_log` VALUES ('692', '7', '1', '2130706433', 'model', '21', '操作url：/Admin/Model/update.html', '1', '1444897887');
INSERT INTO `bm_action_log` VALUES ('693', '7', '1', '2130706433', 'model', '21', '操作url：/Admin/Model/update.html', '1', '1444898287');
INSERT INTO `bm_action_log` VALUES ('694', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-16 09:34登录了后台', '1', '1444959263');
INSERT INTO `bm_action_log` VALUES ('695', '7', '1', '2130706433', 'model', '1', '操作url：/Admin/Model/update.html', '1', '1444976312');
INSERT INTO `bm_action_log` VALUES ('696', '7', '1', '2130706433', 'model', '1', '操作url：/Admin/Model/update.html', '1', '1444976548');
INSERT INTO `bm_action_log` VALUES ('697', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-16 17:26登录了后台', '1', '1444987601');
INSERT INTO `bm_action_log` VALUES ('698', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-19 11:48登录了后台', '1', '1445226519');
INSERT INTO `bm_action_log` VALUES ('699', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-19 16:40登录了后台', '1', '1445244026');
INSERT INTO `bm_action_log` VALUES ('700', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-20 09:31登录了后台', '1', '1445304676');
INSERT INTO `bm_action_log` VALUES ('701', '8', '1', '2130706433', 'attribute', '189', '操作url：/Admin/Attribute/update.html', '1', '1445313245');
INSERT INTO `bm_action_log` VALUES ('702', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-20 14:17登录了后台', '1', '1445321830');
INSERT INTO `bm_action_log` VALUES ('703', '11', '1', '2130706433', 'category', '46', '操作url：/Admin/Category/add.html', '1', '1445333226');
INSERT INTO `bm_action_log` VALUES ('704', '11', '1', '2130706433', 'category', '46', '操作url：/Admin/Category/remove/id/46.html', '1', '1445333254');
INSERT INTO `bm_action_log` VALUES ('705', '11', '1', '2130706433', 'category', '47', '操作url：/Admin/Category/add.html', '1', '1445333316');
INSERT INTO `bm_action_log` VALUES ('706', '11', '1', '2130706433', 'category', '47', '操作url：/Admin/Category/edit.html', '1', '1445333344');
INSERT INTO `bm_action_log` VALUES ('707', '11', '1', '2130706433', 'category', '47', '操作url：/Admin/Category/remove/id/47.html', '1', '1445333401');
INSERT INTO `bm_action_log` VALUES ('708', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-21 09:50登录了后台', '1', '1445392229');
INSERT INTO `bm_action_log` VALUES ('709', '11', '1', '2130706433', 'category', '39', '操作url：/Admin/Category/edit.html', '1', '1445393161');
INSERT INTO `bm_action_log` VALUES ('710', '11', '1', '2130706433', 'category', '2', '操作url：/Admin/Category/edit.html', '1', '1445393170');
INSERT INTO `bm_action_log` VALUES ('711', '11', '1', '2130706433', 'category', '39', '操作url：/Admin/Category/edit.html', '1', '1445393185');
INSERT INTO `bm_action_log` VALUES ('712', '11', '1', '2130706433', 'category', '2', '操作url：/Admin/Category/edit.html', '1', '1445393187');
INSERT INTO `bm_action_log` VALUES ('713', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-21 10:17登录了后台', '1', '1445393839');
INSERT INTO `bm_action_log` VALUES ('714', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-22 09:34登录了后台', '1', '1445477693');
INSERT INTO `bm_action_log` VALUES ('715', '7', '1', '2130706433', 'model', '11', '操作url：/Admin/Model/update.html', '1', '1445478252');
INSERT INTO `bm_action_log` VALUES ('716', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-23 09:17登录了后台', '1', '1445563076');
INSERT INTO `bm_action_log` VALUES ('717', '8', '1', '2130706433', 'attribute', '190', '操作url：/Admin/Attribute/update.html', '1', '1445570786');
INSERT INTO `bm_action_log` VALUES ('718', '8', '1', '2130706433', 'attribute', '10', '操作url：/Admin/Attribute/update.html', '1', '1445572215');
INSERT INTO `bm_action_log` VALUES ('719', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-23 20:13登录了后台', '1', '1445602385');
INSERT INTO `bm_action_log` VALUES ('720', '11', '1', '2130706433', 'category', '48', '操作url：/Admin/Category/add.html', '1', '1445602511');
INSERT INTO `bm_action_log` VALUES ('721', '11', '1', '2130706433', 'category', '48', '操作url：/Admin/Category/edit.html', '1', '1445602527');
INSERT INTO `bm_action_log` VALUES ('722', '11', '1', '2130706433', 'category', '48', '操作url：/Admin/Category/edit.html', '1', '1445602537');
INSERT INTO `bm_action_log` VALUES ('723', '11', '1', '2130706433', 'category', '49', '操作url：/Admin/Category/add.html', '1', '1445602573');
INSERT INTO `bm_action_log` VALUES ('724', '11', '1', '2130706433', 'category', '50', '操作url：/Admin/Category/add.html', '1', '1445602595');
INSERT INTO `bm_action_log` VALUES ('725', '11', '1', '2130706433', 'category', '51', '操作url：/Admin/Category/add.html', '1', '1445602623');
INSERT INTO `bm_action_log` VALUES ('726', '11', '1', '2130706433', 'category', '52', '操作url：/Admin/Category/add.html', '1', '1445602646');
INSERT INTO `bm_action_log` VALUES ('727', '11', '1', '2130706433', 'category', '51', '操作url：/Admin/Category/edit.html', '1', '1445602653');
INSERT INTO `bm_action_log` VALUES ('728', '11', '1', '2130706433', 'category', '50', '操作url：/Admin/Category/edit.html', '1', '1445602656');
INSERT INTO `bm_action_log` VALUES ('729', '11', '1', '2130706433', 'category', '49', '操作url：/Admin/Category/edit.html', '1', '1445602659');
INSERT INTO `bm_action_log` VALUES ('730', '11', '1', '2130706433', 'category', '49', '操作url：/Admin/Category/edit.html', '1', '1445602772');
INSERT INTO `bm_action_log` VALUES ('731', '11', '1', '2130706433', 'category', '50', '操作url：/Admin/Category/edit.html', '1', '1445602773');
INSERT INTO `bm_action_log` VALUES ('732', '11', '1', '2130706433', 'category', '51', '操作url：/Admin/Category/edit.html', '1', '1445602778');
INSERT INTO `bm_action_log` VALUES ('733', '11', '1', '2130706433', 'category', '52', '操作url：/Admin/Category/edit.html', '1', '1445602781');
INSERT INTO `bm_action_log` VALUES ('734', '8', '1', '2130706433', 'attribute', '191', '操作url：/Admin/Attribute/update.html', '1', '1445604258');
INSERT INTO `bm_action_log` VALUES ('735', '8', '1', '2130706433', 'attribute', '192', '操作url：/Admin/Attribute/update.html', '1', '1445604306');
INSERT INTO `bm_action_log` VALUES ('736', '10', '1', '2130706433', 'Menu', '152', '操作url：/Admin/Menu/edit.html', '1', '1445605123');
INSERT INTO `bm_action_log` VALUES ('737', '10', '1', '2130706433', 'Menu', '152', '操作url：/Admin/Menu/edit.html', '1', '1445605151');
INSERT INTO `bm_action_log` VALUES ('738', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-23 23:28登录了后台', '1', '1445614112');
INSERT INTO `bm_action_log` VALUES ('739', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-24 17:15登录了后台', '1', '1445678127');
INSERT INTO `bm_action_log` VALUES ('740', '10', '1', '2130706433', 'Menu', '158', '操作url：/Admin/Menu/edit.html', '1', '1445678591');
INSERT INTO `bm_action_log` VALUES ('741', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-24 19:36登录了后台', '1', '1445686560');
INSERT INTO `bm_action_log` VALUES ('742', '8', '1', '2130706433', 'attribute', '132', '操作url：/Admin/Attribute/update.html', '1', '1445691432');
INSERT INTO `bm_action_log` VALUES ('743', '8', '1', '2130706433', 'attribute', '34', '操作url：/Admin/Attribute/update.html', '1', '1445694420');
INSERT INTO `bm_action_log` VALUES ('744', '8', '1', '2130706433', 'attribute', '36', '操作url：/Admin/Attribute/update.html', '1', '1445694631');
INSERT INTO `bm_action_log` VALUES ('745', '8', '1', '2130706433', 'attribute', '36', '操作url：/Admin/Attribute/update.html', '1', '1445694861');
INSERT INTO `bm_action_log` VALUES ('746', '8', '1', '2130706433', 'attribute', '36', '操作url：/Admin/Attribute/update.html', '1', '1445694957');
INSERT INTO `bm_action_log` VALUES ('747', '8', '1', '2130706433', 'attribute', '36', '操作url：/Admin/Attribute/update.html', '1', '1445695050');
INSERT INTO `bm_action_log` VALUES ('748', '8', '1', '2130706433', 'attribute', '122', '操作url：/Admin/Attribute/update.html', '1', '1445695129');
INSERT INTO `bm_action_log` VALUES ('749', '8', '1', '2130706433', 'attribute', '112', '操作url：/Admin/Attribute/update.html', '1', '1445695247');
INSERT INTO `bm_action_log` VALUES ('750', '8', '1', '2130706433', 'attribute', '118', '操作url：/Admin/Attribute/update.html', '1', '1445695488');
INSERT INTO `bm_action_log` VALUES ('751', '8', '1', '2130706433', 'attribute', '117', '操作url：/Admin/Attribute/update.html', '1', '1445695530');
INSERT INTO `bm_action_log` VALUES ('752', '8', '1', '2130706433', 'attribute', '76', '操作url：/Admin/Attribute/update.html', '1', '1445695971');
INSERT INTO `bm_action_log` VALUES ('753', '8', '1', '2130706433', 'attribute', '117', '操作url：/Admin/Attribute/update.html', '1', '1445696020');
INSERT INTO `bm_action_log` VALUES ('754', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-25 11:14登录了后台', '1', '1445742873');
INSERT INTO `bm_action_log` VALUES ('755', '11', '1', '2130706433', 'category', '1', '操作url：/Admin/Category/edit.html', '1', '1445744423');
INSERT INTO `bm_action_log` VALUES ('756', '11', '1', '2130706433', 'category', '53', '操作url：/Admin/Category/add.html', '1', '1445746270');
INSERT INTO `bm_action_log` VALUES ('757', '11', '1', '2130706433', 'category', '53', '操作url：/Admin/Category/edit.html', '1', '1445746277');
INSERT INTO `bm_action_log` VALUES ('758', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-25 17:12登录了后台', '1', '1445764325');
INSERT INTO `bm_action_log` VALUES ('759', '7', '1', '2130706433', 'model', '23', '操作url：/Admin/Model/update.html', '1', '1445765197');
INSERT INTO `bm_action_log` VALUES ('760', '8', '1', '2130706433', 'attribute', '193', '操作url：/Admin/Attribute/update.html', '1', '1445765229');
INSERT INTO `bm_action_log` VALUES ('761', '8', '1', '2130706433', 'attribute', '194', '操作url：/Admin/Attribute/update.html', '1', '1445765349');
INSERT INTO `bm_action_log` VALUES ('762', '8', '1', '2130706433', 'attribute', '195', '操作url：/Admin/Attribute/update.html', '1', '1445765424');
INSERT INTO `bm_action_log` VALUES ('763', '8', '1', '2130706433', 'attribute', '196', '操作url：/Admin/Attribute/update.html', '1', '1445765485');
INSERT INTO `bm_action_log` VALUES ('764', '8', '1', '2130706433', 'attribute', '197', '操作url：/Admin/Attribute/update.html', '1', '1445765596');
INSERT INTO `bm_action_log` VALUES ('765', '8', '1', '2130706433', 'attribute', '197', '操作url：/Admin/Attribute/update.html', '1', '1445765898');
INSERT INTO `bm_action_log` VALUES ('766', '7', '1', '2130706433', 'model', '23', '操作url：/Admin/Model/update.html', '1', '1445766058');
INSERT INTO `bm_action_log` VALUES ('767', '7', '1', '2130706433', 'model', '23', '操作url：/Admin/Model/update.html', '1', '1445766103');
INSERT INTO `bm_action_log` VALUES ('768', '10', '1', '2130706433', 'Menu', '160', '操作url：/Admin/Menu/add.html', '1', '1445766260');
INSERT INTO `bm_action_log` VALUES ('769', '10', '1', '2130706433', 'Menu', '160', '操作url：/Admin/Menu/edit.html', '1', '1445766715');
INSERT INTO `bm_action_log` VALUES ('770', '7', '1', '2130706433', 'model', '23', '操作url：/Admin/Model/update.html', '1', '1445766790');
INSERT INTO `bm_action_log` VALUES ('771', '7', '1', '2130706433', 'model', '23', '操作url：/Admin/Model/update.html', '1', '1445766852');
INSERT INTO `bm_action_log` VALUES ('772', '8', '1', '2130706433', 'attribute', '197', '操作url：/Admin/Attribute/update.html', '1', '1445767516');
INSERT INTO `bm_action_log` VALUES ('773', '8', '1', '2130706433', 'attribute', '197', '操作url：/Admin/Attribute/update.html', '1', '1445774510');
INSERT INTO `bm_action_log` VALUES ('774', '10', '1', '2130706433', 'Menu', '161', '操作url：/Admin/Menu/add.html', '1', '1445775904');
INSERT INTO `bm_action_log` VALUES ('775', '7', '1', '2130706433', 'model', '23', '操作url：/Admin/Model/update.html', '1', '1445775938');
INSERT INTO `bm_action_log` VALUES ('776', '8', '1', '2130706433', 'attribute', '124', '操作url：/Admin/Attribute/update.html', '1', '1445777073');
INSERT INTO `bm_action_log` VALUES ('777', '8', '1', '2130706433', 'attribute', '123', '操作url：/Admin/Attribute/update.html', '1', '1445777094');
INSERT INTO `bm_action_log` VALUES ('778', '7', '1', '2130706433', 'model', '24', '操作url：/Admin/Model/update.html', '1', '1445786146');
INSERT INTO `bm_action_log` VALUES ('779', '8', '1', '2130706433', 'attribute', '198', '操作url：/Admin/Attribute/update.html', '1', '1445786171');
INSERT INTO `bm_action_log` VALUES ('780', '8', '1', '2130706433', 'attribute', '199', '操作url：/Admin/Attribute/update.html', '1', '1445786197');
INSERT INTO `bm_action_log` VALUES ('781', '8', '1', '2130706433', 'attribute', '200', '操作url：/Admin/Attribute/update.html', '1', '1445786225');
INSERT INTO `bm_action_log` VALUES ('782', '8', '1', '2130706433', 'attribute', '201', '操作url：/Admin/Attribute/update.html', '1', '1445786248');
INSERT INTO `bm_action_log` VALUES ('783', '8', '1', '2130706433', 'attribute', '202', '操作url：/Admin/Attribute/update.html', '1', '1445786297');
INSERT INTO `bm_action_log` VALUES ('784', '8', '1', '2130706433', 'attribute', '203', '操作url：/Admin/Attribute/update.html', '1', '1445786332');
INSERT INTO `bm_action_log` VALUES ('785', '8', '1', '2130706433', 'attribute', '204', '操作url：/Admin/Attribute/update.html', '1', '1445786365');
INSERT INTO `bm_action_log` VALUES ('786', '8', '1', '2130706433', 'attribute', '205', '操作url：/Admin/Attribute/update.html', '1', '1445786391');
INSERT INTO `bm_action_log` VALUES ('787', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-26 13:40登录了后台', '1', '1445838053');
INSERT INTO `bm_action_log` VALUES ('788', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-27 13:22登录了后台', '1', '1445923341');
INSERT INTO `bm_action_log` VALUES ('789', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-27 16:52登录了后台', '1', '1445935944');
INSERT INTO `bm_action_log` VALUES ('790', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-28 09:12登录了后台', '1', '1445994757');
INSERT INTO `bm_action_log` VALUES ('791', '7', '1', '2130706433', 'model', '6', '操作url：/Admin/Model/update.html', '1', '1446005208');
INSERT INTO `bm_action_log` VALUES ('792', '10', '1', '2130706433', 'Menu', '126', '操作url：/Admin/Menu/edit.html', '1', '1446005391');
INSERT INTO `bm_action_log` VALUES ('793', '10', '1', '2130706433', 'Menu', '126', '操作url：/Admin/Menu/edit.html', '1', '1446005405');
INSERT INTO `bm_action_log` VALUES ('794', '10', '1', '2130706433', 'Menu', '133', '操作url：/Admin/Menu/edit.html', '1', '1446005422');
INSERT INTO `bm_action_log` VALUES ('795', '10', '1', '2130706433', 'Menu', '131', '操作url：/Admin/Menu/edit.html', '1', '1446005447');
INSERT INTO `bm_action_log` VALUES ('796', '8', '1', '2130706433', 'attribute', '206', '操作url：/Admin/Attribute/update.html', '1', '1446013022');
INSERT INTO `bm_action_log` VALUES ('797', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-29 12:01登录了后台', '1', '1446091314');
INSERT INTO `bm_action_log` VALUES ('798', '1', '1', '2130706433', 'member', '1', 'admin在2015-10-30 14:55登录了后台', '1', '1446188113');
INSERT INTO `bm_action_log` VALUES ('799', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-02 09:22登录了后台', '1', '1446427328');
INSERT INTO `bm_action_log` VALUES ('800', '8', '1', '2130706433', 'attribute', '126', '操作url：/Admin/Attribute/update.html', '1', '1446449367');
INSERT INTO `bm_action_log` VALUES ('801', '8', '1', '2130706433', 'attribute', '126', '操作url：/Admin/Attribute/update.html', '1', '1446449460');
INSERT INTO `bm_action_log` VALUES ('802', '8', '1', '2130706433', 'attribute', '126', '操作url：/Admin/Attribute/update.html', '1', '1446449617');
INSERT INTO `bm_action_log` VALUES ('803', '8', '1', '2130706433', 'attribute', '126', '操作url：/Admin/Attribute/update.html', '1', '1446449645');
INSERT INTO `bm_action_log` VALUES ('804', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-03 10:37登录了后台', '1', '1446518222');
INSERT INTO `bm_action_log` VALUES ('805', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-03 14:04登录了后台', '1', '1446530689');
INSERT INTO `bm_action_log` VALUES ('806', '7', '1', '2130706433', 'model', '25', '操作url：/Admin/Model/update.html', '1', '1446541826');
INSERT INTO `bm_action_log` VALUES ('807', '8', '1', '2130706433', 'attribute', '207', '操作url：/Admin/Attribute/update.html', '1', '1446541866');
INSERT INTO `bm_action_log` VALUES ('808', '8', '1', '2130706433', 'attribute', '208', '操作url：/Admin/Attribute/update.html', '1', '1446541988');
INSERT INTO `bm_action_log` VALUES ('809', '8', '1', '2130706433', 'attribute', '209', '操作url：/Admin/Attribute/update.html', '1', '1446542074');
INSERT INTO `bm_action_log` VALUES ('810', '8', '1', '2130706433', 'attribute', '210', '操作url：/Admin/Attribute/update.html', '1', '1446542199');
INSERT INTO `bm_action_log` VALUES ('811', '10', '1', '2130706433', 'Menu', '162', '操作url：/Admin/Menu/add.html', '1', '1446542415');
INSERT INTO `bm_action_log` VALUES ('812', '10', '1', '2130706433', 'Menu', '162', '操作url：/Admin/Menu/edit.html', '1', '1446542452');
INSERT INTO `bm_action_log` VALUES ('813', '8', '1', '2130706433', 'attribute', '211', '操作url：/Admin/Attribute/update.html', '1', '1446543103');
INSERT INTO `bm_action_log` VALUES ('814', '8', '1', '2130706433', 'attribute', '10', '操作url：/Admin/Attribute/update.html', '1', '1446545726');
INSERT INTO `bm_action_log` VALUES ('815', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-04 10:29登录了后台', '1', '1446604166');
INSERT INTO `bm_action_log` VALUES ('816', '10', '1', '2130706433', 'Menu', '43', '操作url：/Admin/Menu/edit.html', '1', '1446623462');
INSERT INTO `bm_action_log` VALUES ('817', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-05 09:24登录了后台', '1', '1446686692');
INSERT INTO `bm_action_log` VALUES ('818', '8', '1', '2130706433', 'attribute', '212', '操作url：/Admin/Attribute/update.html', '1', '1446686994');
INSERT INTO `bm_action_log` VALUES ('819', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-05 14:31登录了后台', '1', '1446705091');
INSERT INTO `bm_action_log` VALUES ('820', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-05 15:33登录了后台', '1', '1446708817');
INSERT INTO `bm_action_log` VALUES ('821', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-05 16:37登录了后台', '1', '1446712643');
INSERT INTO `bm_action_log` VALUES ('822', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-06 10:44登录了后台', '1', '1446777851');
INSERT INTO `bm_action_log` VALUES ('823', '8', '1', '2130706433', 'attribute', '126', '操作url：/Admin/Attribute/update.html', '1', '1446781503');
INSERT INTO `bm_action_log` VALUES ('824', '8', '1', '2130706433', 'attribute', '204', '操作url：/Admin/Attribute/update.html', '1', '1446786477');
INSERT INTO `bm_action_log` VALUES ('825', '8', '1', '2130706433', 'attribute', '203', '操作url：/Admin/Attribute/update.html', '1', '1446786488');
INSERT INTO `bm_action_log` VALUES ('826', '8', '1', '2130706433', 'attribute', '202', '操作url：/Admin/Attribute/update.html', '1', '1446786500');
INSERT INTO `bm_action_log` VALUES ('827', '8', '1', '2130706433', 'attribute', '204', '操作url：/Admin/Attribute/update.html', '1', '1446787146');
INSERT INTO `bm_action_log` VALUES ('828', '8', '1', '2130706433', 'attribute', '203', '操作url：/Admin/Attribute/update.html', '1', '1446787153');
INSERT INTO `bm_action_log` VALUES ('829', '8', '1', '2130706433', 'attribute', '202', '操作url：/Admin/Attribute/update.html', '1', '1446787162');
INSERT INTO `bm_action_log` VALUES ('830', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-09 09:29登录了后台', '1', '1447032597');
INSERT INTO `bm_action_log` VALUES ('831', '8', '1', '2130706433', 'attribute', '106', '操作url：/Admin/Attribute/update.html', '1', '1447032637');
INSERT INTO `bm_action_log` VALUES ('832', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-09 14:22登录了后台', '1', '1447050135');
INSERT INTO `bm_action_log` VALUES ('833', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-10 09:27登录了后台', '1', '1447118858');
INSERT INTO `bm_action_log` VALUES ('834', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-10 14:25登录了后台', '1', '1447136758');
INSERT INTO `bm_action_log` VALUES ('835', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-11 15:15登录了后台', '1', '1447226115');
INSERT INTO `bm_action_log` VALUES ('836', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-12 14:51登录了后台', '1', '1447311074');
INSERT INTO `bm_action_log` VALUES ('837', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-13 09:58登录了后台', '1', '1447379893');
INSERT INTO `bm_action_log` VALUES ('838', '1', '1', '-1062731381', 'member', '1', 'admin在2015-11-13 10:50登录了后台', '1', '1447383038');
INSERT INTO `bm_action_log` VALUES ('839', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-13 17:21登录了后台', '1', '1447406488');
INSERT INTO `bm_action_log` VALUES ('840', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-13 17:22登录了后台', '1', '1447406578');
INSERT INTO `bm_action_log` VALUES ('841', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-16 09:30登录了后台', '1', '1447637438');
INSERT INTO `bm_action_log` VALUES ('842', '6', '1', '2130706433', 'config', '20', '操作url：/Admin/Config/edit.html', '1', '1447637475');
INSERT INTO `bm_action_log` VALUES ('843', '8', '1', '2130706433', 'attribute', '213', '操作url：/Admin/Attribute/update.html', '1', '1447637592');
INSERT INTO `bm_action_log` VALUES ('844', '10', '1', '2130706433', 'Menu', '63', '操作url：/Admin/Menu/edit.html', '1', '1447638444');
INSERT INTO `bm_action_log` VALUES ('845', '10', '1', '2130706433', 'Menu', '70', '操作url：/Admin/Menu/edit.html', '1', '1447638498');
INSERT INTO `bm_action_log` VALUES ('846', '10', '1', '2130706433', 'Menu', '80', '操作url：/Admin/Menu/edit.html', '1', '1447638519');
INSERT INTO `bm_action_log` VALUES ('847', '10', '1', '2130706433', 'Menu', '76', '操作url：/Admin/Menu/edit.html', '1', '1447638534');
INSERT INTO `bm_action_log` VALUES ('848', '1', '1', '-1062731381', 'member', '1', 'admin在2015-11-16 10:42登录了后台', '1', '1447641760');
INSERT INTO `bm_action_log` VALUES ('849', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-16 11:07登录了后台', '1', '1447643267');
INSERT INTO `bm_action_log` VALUES ('850', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-16 11:08登录了后台', '1', '1447643282');
INSERT INTO `bm_action_log` VALUES ('851', '1', '1', '-1062731401', 'member', '1', 'admin在2015-11-16 11:08登录了后台', '1', '1447643334');
INSERT INTO `bm_action_log` VALUES ('852', '1', '1', '-1062731381', 'member', '1', 'admin在2015-11-16 11:10登录了后台', '1', '1447643457');
INSERT INTO `bm_action_log` VALUES ('853', '1', '1', '-1062731401', 'member', '1', 'admin在2015-11-16 11:13登录了后台', '1', '1447643592');
INSERT INTO `bm_action_log` VALUES ('854', '8', '1', '-1062731401', 'attribute', '75', '操作url：/Admin/Attribute/update.html', '1', '1447643793');
INSERT INTO `bm_action_log` VALUES ('855', '8', '1', '-1062731401', 'attribute', '77', '操作url：/Admin/Attribute/update.html', '1', '1447643802');
INSERT INTO `bm_action_log` VALUES ('856', '1', '1', '-1062731381', 'member', '1', 'admin在2015-11-16 12:38登录了后台', '1', '1447648686');
INSERT INTO `bm_action_log` VALUES ('857', '1', '1', '-1062731381', 'member', '1', 'admin在2015-11-16 12:42登录了后台', '1', '1447648946');
INSERT INTO `bm_action_log` VALUES ('858', '1', '1', '-1062731381', 'member', '1', 'admin在2015-11-16 12:42登录了后台', '1', '1447648960');
INSERT INTO `bm_action_log` VALUES ('859', '1', '1', '-1062731381', 'member', '1', 'admin在2015-11-16 12:42登录了后台', '1', '1447648978');
INSERT INTO `bm_action_log` VALUES ('860', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-16 14:05登录了后台', '1', '1447653908');
INSERT INTO `bm_action_log` VALUES ('861', '8', '1', '2130706433', 'attribute', '37', '操作url：/Admin/Attribute/update.html', '1', '1447654387');
INSERT INTO `bm_action_log` VALUES ('862', '8', '1', '2130706433', 'attribute', '211', '操作url：/Admin/Attribute/update.html', '1', '1447654543');
INSERT INTO `bm_action_log` VALUES ('863', '8', '1', '2130706433', 'attribute', '121', '操作url：/Admin/Attribute/update.html', '1', '1447654658');
INSERT INTO `bm_action_log` VALUES ('864', '8', '1', '2130706433', 'attribute', '12', '操作url：/Admin/Attribute/update.html', '1', '1447654915');
INSERT INTO `bm_action_log` VALUES ('865', '1', '1', '-1062731414', 'member', '1', 'admin在2015-11-17 10:43登录了后台', '1', '1447728239');
INSERT INTO `bm_action_log` VALUES ('866', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-17 11:59登录了后台', '1', '1447732795');
INSERT INTO `bm_action_log` VALUES ('867', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-17 12:47登录了后台', '1', '1447735628');
INSERT INTO `bm_action_log` VALUES ('868', '1', '1', '-1062731324', 'member', '1', 'admin在2015-11-17 18:11登录了后台', '1', '1447755096');
INSERT INTO `bm_action_log` VALUES ('869', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-20 11:48登录了后台', '1', '1447991310');
INSERT INTO `bm_action_log` VALUES ('870', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-25 14:54登录了后台', '1', '1448434452');
INSERT INTO `bm_action_log` VALUES ('871', '1', '1', '2130706433', 'member', '1', 'admin在2015-11-27 16:43登录了后台', '1', '1448613834');
INSERT INTO `bm_action_log` VALUES ('872', '1', '1', '2130706433', 'member', '1', 'admin在2015-12-03 15:38登录了后台', '1', '1449128325');
INSERT INTO `bm_action_log` VALUES ('873', '1', '1', '2130706433', 'member', '1', 'admin在2015-12-04 12:23登录了后台', '1', '1449202993');
INSERT INTO `bm_action_log` VALUES ('874', '1', '1', '2130706433', 'member', '1', 'admin在2015-12-07 15:11登录了后台', '1', '1449472315');
INSERT INTO `bm_action_log` VALUES ('875', '1', '1', '2130706433', 'member', '1', 'admin在2015-12-11 16:01登录了后台', '1', '1449820890');
INSERT INTO `bm_action_log` VALUES ('876', '1', '1', '2130706433', 'member', '1', 'admin在2015-12-11 16:05登录了后台', '1', '1449821138');
INSERT INTO `bm_action_log` VALUES ('877', '1', '1', '2130706433', 'member', '1', 'admin在2015-12-11 16:17登录了后台', '1', '1449821868');
INSERT INTO `bm_action_log` VALUES ('878', '1', '1', '2130706433', 'member', '1', 'admin在2015-12-13 16:32登录了后台', '1', '1449995548');
INSERT INTO `bm_action_log` VALUES ('879', '1', '1', '2130706433', 'member', '1', 'admin在2015-12-13 16:45登录了后台', '1', '1449996353');
INSERT INTO `bm_action_log` VALUES ('880', '1', '1', '2130706433', 'member', '1', 'admin在2015-12-13 17:34登录了后台', '1', '1449999275');
INSERT INTO `bm_action_log` VALUES ('881', '1', '1', '-1062731418', 'member', '1', 'admin在2015-12-14 13:11登录了后台', '1', '1450069876');
INSERT INTO `bm_action_log` VALUES ('882', '1', '1', '2130706433', 'member', '1', 'admin在2015-12-31 09:50登录了后台', '1', '1451526629');
INSERT INTO `bm_action_log` VALUES ('883', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-04 11:18登录了后台', '1', '1451877516');
INSERT INTO `bm_action_log` VALUES ('884', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-04 14:50登录了后台', '1', '1451890230');
INSERT INTO `bm_action_log` VALUES ('885', '8', '1', '2130706433', 'attribute', '214', '操作url：/admin/attribute/update.html', '1', '1451894071');
INSERT INTO `bm_action_log` VALUES ('886', '7', '1', '2130706433', 'model', '17', '操作url：/admin/model/update.html', '1', '1451894088');
INSERT INTO `bm_action_log` VALUES ('887', '8', '1', '2130706433', 'attribute', '214', '操作url：/admin/attribute/update.html', '1', '1451894154');
INSERT INTO `bm_action_log` VALUES ('888', '1', '1', '-1062731416', 'member', '1', 'admin在2016-01-05 14:56登录了后台', '1', '1451976961');
INSERT INTO `bm_action_log` VALUES ('889', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-05 15:21登录了后台', '1', '1451978513');
INSERT INTO `bm_action_log` VALUES ('890', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-06 09:47登录了后台', '1', '1452044825');
INSERT INTO `bm_action_log` VALUES ('891', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-06 15:03登录了后台', '1', '1452063785');
INSERT INTO `bm_action_log` VALUES ('892', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-06 20:32登录了后台', '1', '1452083569');
INSERT INTO `bm_action_log` VALUES ('893', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-07 09:54登录了后台', '1', '1452131669');
INSERT INTO `bm_action_log` VALUES ('894', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-08 10:36登录了后台', '1', '1452220611');
INSERT INTO `bm_action_log` VALUES ('895', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-11 10:07登录了后台', '1', '1452478042');
INSERT INTO `bm_action_log` VALUES ('896', '8', '1', '2130706433', 'attribute', '215', '操作url：/admin/attribute/update.html', '1', '1452480598');
INSERT INTO `bm_action_log` VALUES ('897', '8', '1', '2130706433', 'attribute', '216', '操作url：/admin/attribute/update.html', '1', '1452480620');
INSERT INTO `bm_action_log` VALUES ('898', '8', '1', '2130706433', 'attribute', '215', '操作url：/admin/attribute/update.html', '1', '1452480629');
INSERT INTO `bm_action_log` VALUES ('899', '8', '1', '2130706433', 'attribute', '217', '操作url：/admin/attribute/update.html', '1', '1452480669');
INSERT INTO `bm_action_log` VALUES ('900', '8', '1', '2130706433', 'attribute', '218', '操作url：/admin/attribute/update.html', '1', '1452480692');
INSERT INTO `bm_action_log` VALUES ('901', '8', '1', '2130706433', 'attribute', '219', '操作url：/admin/attribute/update.html', '1', '1452480756');
INSERT INTO `bm_action_log` VALUES ('902', '8', '1', '2130706433', 'attribute', '220', '操作url：/admin/attribute/update.html', '1', '1452480814');
INSERT INTO `bm_action_log` VALUES ('903', '8', '1', '2130706433', 'attribute', '221', '操作url：/admin/attribute/update.html', '1', '1452480835');
INSERT INTO `bm_action_log` VALUES ('904', '8', '1', '2130706433', 'attribute', '222', '操作url：/admin/attribute/update.html', '1', '1452481031');
INSERT INTO `bm_action_log` VALUES ('905', '8', '1', '2130706433', 'attribute', '219', '操作url：/admin/attribute/update.html', '1', '1452483789');
INSERT INTO `bm_action_log` VALUES ('906', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-11 14:07登录了后台', '1', '1452492470');
INSERT INTO `bm_action_log` VALUES ('907', '8', '1', '2130706433', 'attribute', '215', '操作url：/admin/attribute/update.html', '1', '1452495500');
INSERT INTO `bm_action_log` VALUES ('908', '8', '1', '2130706433', 'attribute', '216', '操作url：/admin/attribute/update.html', '1', '1452495507');
INSERT INTO `bm_action_log` VALUES ('909', '8', '1', '2130706433', 'attribute', '218', '操作url：/admin/attribute/update.html', '1', '1452495521');
INSERT INTO `bm_action_log` VALUES ('910', '8', '1', '2130706433', 'attribute', '219', '操作url：/admin/attribute/update.html', '1', '1452495531');
INSERT INTO `bm_action_log` VALUES ('911', '8', '1', '2130706433', 'attribute', '220', '操作url：/admin/attribute/update.html', '1', '1452495539');
INSERT INTO `bm_action_log` VALUES ('912', '8', '1', '2130706433', 'attribute', '221', '操作url：/admin/attribute/update.html', '1', '1452495545');
INSERT INTO `bm_action_log` VALUES ('913', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-12 12:00登录了后台', '1', '1452571224');
INSERT INTO `bm_action_log` VALUES ('914', '8', '1', '2130706433', 'attribute', '223', '操作url：/admin/attribute/update.html', '1', '1452572350');
INSERT INTO `bm_action_log` VALUES ('915', '8', '1', '2130706433', 'attribute', '224', '操作url：/admin/attribute/update.html', '1', '1452572433');
INSERT INTO `bm_action_log` VALUES ('916', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-12 14:28登录了后台', '1', '1452580097');
INSERT INTO `bm_action_log` VALUES ('917', '8', '1', '2130706433', 'attribute', '225', '操作url：/admin/attribute/update.html', '1', '1452596645');
INSERT INTO `bm_action_log` VALUES ('918', '8', '1', '2130706433', 'attribute', '226', '操作url：/admin/attribute/update.html', '1', '1452596757');
INSERT INTO `bm_action_log` VALUES ('919', '8', '1', '2130706433', 'attribute', '226', '操作url：/admin/attribute/update.html', '1', '1452596773');
INSERT INTO `bm_action_log` VALUES ('920', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-13 10:07登录了后台', '1', '1452650870');
INSERT INTO `bm_action_log` VALUES ('921', '10', '1', '2130706433', 'Menu', '163', '操作url：/admin/menu/add.html', '1', '1452650973');
INSERT INTO `bm_action_log` VALUES ('922', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-13 15:18登录了后台', '1', '1452669513');
INSERT INTO `bm_action_log` VALUES ('923', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-14 09:48登录了后台', '1', '1452736110');
INSERT INTO `bm_action_log` VALUES ('924', '10', '1', '2130706433', 'Menu', '155', '操作url：/admin/menu/edit.html', '1', '1452736789');
INSERT INTO `bm_action_log` VALUES ('925', '10', '1', '2130706433', 'Menu', '164', '操作url：/admin/menu/add.html', '1', '1452736868');
INSERT INTO `bm_action_log` VALUES ('926', '10', '1', '2130706433', 'Menu', '165', '操作url：/admin/menu/add.html', '1', '1452737681');
INSERT INTO `bm_action_log` VALUES ('927', '10', '1', '2130706433', 'Menu', '166', '操作url：/admin/menu/add.html', '1', '1452738500');
INSERT INTO `bm_action_log` VALUES ('928', '10', '1', '2130706433', 'Menu', '167', '操作url：/admin/menu/add.html', '1', '1452739207');
INSERT INTO `bm_action_log` VALUES ('929', '10', '1', '2130706433', 'Menu', '167', '操作url：/admin/menu/edit.html', '1', '1452739307');
INSERT INTO `bm_action_log` VALUES ('930', '10', '1', '2130706433', 'Menu', '167', '操作url：/admin/menu/edit.html', '1', '1452739353');
INSERT INTO `bm_action_log` VALUES ('931', '10', '1', '2130706433', 'Menu', '168', '操作url：/admin/menu/add.html', '1', '1452739395');
INSERT INTO `bm_action_log` VALUES ('932', '7', '1', '2130706433', 'model', '22', '操作url：/admin/model/update.html', '1', '1452742320');
INSERT INTO `bm_action_log` VALUES ('933', '7', '1', '2130706433', 'model', '22', '操作url：/admin/model/update.html', '1', '1452753003');
INSERT INTO `bm_action_log` VALUES ('934', '7', '1', '2130706433', 'model', '22', '操作url：/admin/model/update.html', '1', '1452753035');
INSERT INTO `bm_action_log` VALUES ('935', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-15 10:32登录了后台', '1', '1452825153');
INSERT INTO `bm_action_log` VALUES ('936', '10', '1', '2130706433', 'Menu', '169', '操作url：/admin/menu/add.html', '1', '1452830995');
INSERT INTO `bm_action_log` VALUES ('937', '10', '1', '2130706433', 'Menu', '169', '操作url：/admin/menu/edit.html', '1', '1452831029');
INSERT INTO `bm_action_log` VALUES ('938', '10', '1', '2130706433', 'Menu', '170', '操作url：/admin/menu/add.html', '1', '1452831123');
INSERT INTO `bm_action_log` VALUES ('939', '10', '1', '2130706433', 'Menu', '170', '操作url：/admin/menu/edit.html', '1', '1452831223');
INSERT INTO `bm_action_log` VALUES ('940', '10', '1', '2130706433', 'Menu', '170', '操作url：/admin/menu/edit.html', '1', '1452831347');
INSERT INTO `bm_action_log` VALUES ('941', '10', '1', '2130706433', 'Menu', '169', '操作url：/admin/menu/edit.html', '1', '1452831596');
INSERT INTO `bm_action_log` VALUES ('942', '10', '1', '2130706433', 'Menu', '169', '操作url：/admin/menu/edit.html', '1', '1452831631');
INSERT INTO `bm_action_log` VALUES ('943', '10', '1', '2130706433', 'Menu', '170', '操作url：/admin/menu/edit.html', '1', '1452831657');
INSERT INTO `bm_action_log` VALUES ('944', '10', '1', '2130706433', 'Menu', '169', '操作url：/admin/menu/edit.html', '1', '1452831701');
INSERT INTO `bm_action_log` VALUES ('945', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del/id/170.html', '1', '1452831727');
INSERT INTO `bm_action_log` VALUES ('946', '10', '1', '2130706433', 'Menu', '171', '操作url：/admin/menu/add.html', '1', '1452831750');
INSERT INTO `bm_action_log` VALUES ('947', '10', '1', '2130706433', 'Menu', '169', '操作url：/admin/menu/edit.html', '1', '1452831972');
INSERT INTO `bm_action_log` VALUES ('948', '10', '1', '2130706433', 'Menu', '171', '操作url：/admin/menu/edit.html', '1', '1452832010');
INSERT INTO `bm_action_log` VALUES ('949', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del/id/171.html', '1', '1452838102');
INSERT INTO `bm_action_log` VALUES ('950', '10', '1', '2130706433', 'Menu', '169', '操作url：/admin/menu/edit.html', '1', '1452838113');
INSERT INTO `bm_action_log` VALUES ('951', '7', '1', '2130706433', 'model', '26', '操作url：/admin/model/update.html', '1', '1452838245');
INSERT INTO `bm_action_log` VALUES ('952', '8', '1', '2130706433', 'attribute', '227', '操作url：/admin/attribute/update.html', '1', '1452838306');
INSERT INTO `bm_action_log` VALUES ('953', '8', '1', '2130706433', 'attribute', '228', '操作url：/admin/attribute/update.html', '1', '1452838374');
INSERT INTO `bm_action_log` VALUES ('954', '8', '1', '2130706433', 'attribute', '229', '操作url：/admin/attribute/update.html', '1', '1452838417');
INSERT INTO `bm_action_log` VALUES ('955', '8', '1', '2130706433', 'attribute', '230', '操作url：/admin/attribute/update.html', '1', '1452838458');
INSERT INTO `bm_action_log` VALUES ('956', '8', '1', '2130706433', 'attribute', '231', '操作url：/admin/attribute/update.html', '1', '1452838686');
INSERT INTO `bm_action_log` VALUES ('957', '7', '1', '2130706433', 'model', '27', '操作url：/admin/model/update.html', '1', '1452843221');
INSERT INTO `bm_action_log` VALUES ('958', '8', '1', '2130706433', 'attribute', '232', '操作url：/admin/attribute/update.html', '1', '1452843261');
INSERT INTO `bm_action_log` VALUES ('959', '8', '1', '2130706433', 'attribute', '233', '操作url：/admin/attribute/update.html', '1', '1452843312');
INSERT INTO `bm_action_log` VALUES ('960', '8', '1', '2130706433', 'attribute', '234', '操作url：/admin/attribute/update.html', '1', '1452843400');
INSERT INTO `bm_action_log` VALUES ('961', '8', '1', '2130706433', 'attribute', '235', '操作url：/admin/attribute/update.html', '1', '1452843535');
INSERT INTO `bm_action_log` VALUES ('962', '8', '1', '2130706433', 'attribute', '236', '操作url：/admin/attribute/update.html', '1', '1452843439');
INSERT INTO `bm_action_log` VALUES ('963', '8', '1', '2130706433', 'attribute', '237', '操作url：/admin/attribute/update.html', '1', '1452843583');
INSERT INTO `bm_action_log` VALUES ('964', '10', '1', '2130706433', 'Menu', '172', '操作url：/admin/menu/add.html', '1', '1452844790');
INSERT INTO `bm_action_log` VALUES ('965', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-15 17:50登录了后台', '1', '1452851425');
INSERT INTO `bm_action_log` VALUES ('966', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-18 09:39登录了后台', '1', '1453081188');
INSERT INTO `bm_action_log` VALUES ('967', '8', '1', '2130706433', 'attribute', '238', '操作url：/Admin/Attribute/update.html', '1', '1453082288');
INSERT INTO `bm_action_log` VALUES ('968', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-18 10:02登录了后台', '1', '1453082540');
INSERT INTO `bm_action_log` VALUES ('969', '8', '1', '2130706433', 'attribute', '239', '操作url：/Admin/Attribute/update.html', '1', '1453086005');
INSERT INTO `bm_action_log` VALUES ('970', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-18 12:07登录了后台', '1', '1453090052');
INSERT INTO `bm_action_log` VALUES ('971', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-18 14:09登录了后台', '1', '1453097393');
INSERT INTO `bm_action_log` VALUES ('972', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-18 15:09登录了后台', '1', '1453100952');
INSERT INTO `bm_action_log` VALUES ('973', '7', '1', '2130706433', 'model', '21', '操作url：/admin/model/update.html', '1', '1453106182');
INSERT INTO `bm_action_log` VALUES ('974', '10', '1', '2130706433', 'Menu', '173', '操作url：/Admin/Menu/add.html', '1', '1453108906');
INSERT INTO `bm_action_log` VALUES ('975', '10', '1', '2130706433', 'Menu', '174', '操作url：/Admin/Menu/add.html', '1', '1453108919');
INSERT INTO `bm_action_log` VALUES ('976', '10', '1', '2130706433', 'Menu', '173', '操作url：/Admin/Menu/edit.html', '1', '1453108943');
INSERT INTO `bm_action_log` VALUES ('977', '10', '1', '2130706433', 'Menu', '174', '操作url：/Admin/Menu/edit.html', '1', '1453108981');
INSERT INTO `bm_action_log` VALUES ('978', '10', '1', '2130706433', 'Menu', '174', '操作url：/Admin/Menu/edit.html', '1', '1453109053');
INSERT INTO `bm_action_log` VALUES ('979', '10', '1', '2130706433', 'Menu', '174', '操作url：/Admin/Menu/edit.html', '1', '1453109080');
INSERT INTO `bm_action_log` VALUES ('980', '10', '1', '2130706433', 'Menu', '173', '操作url：/Admin/Menu/edit.html', '1', '1453109108');
INSERT INTO `bm_action_log` VALUES ('981', '10', '1', '2130706433', 'Menu', '173', '操作url：/Admin/Menu/edit.html', '1', '1453109196');
INSERT INTO `bm_action_log` VALUES ('982', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del.html', '1', '1453109206');
INSERT INTO `bm_action_log` VALUES ('983', '10', '1', '2130706433', 'Menu', '158', '操作url：/admin/menu/edit.html', '1', '1453110888');
INSERT INTO `bm_action_log` VALUES ('984', '10', '1', '2130706433', 'Menu', '175', '操作url：/admin/menu/add.html', '1', '1453110959');
INSERT INTO `bm_action_log` VALUES ('985', '10', '1', '2130706433', 'Menu', '176', '操作url：/admin/menu/add.html', '1', '1453111015');
INSERT INTO `bm_action_log` VALUES ('986', '10', '1', '2130706433', 'Menu', '158', '操作url：/admin/menu/edit.html', '1', '1453111046');
INSERT INTO `bm_action_log` VALUES ('987', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-19 09:41登录了后台', '1', '1453167713');
INSERT INTO `bm_action_log` VALUES ('988', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-19 09:43登录了后台', '1', '1453167802');
INSERT INTO `bm_action_log` VALUES ('989', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-19 14:10登录了后台', '1', '1453183826');
INSERT INTO `bm_action_log` VALUES ('990', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-19 14:27登录了后台', '1', '1453184854');
INSERT INTO `bm_action_log` VALUES ('991', '10', '1', '2130706433', 'Menu', '177', '操作url：/admin/menu/add.html', '1', '1453196225');
INSERT INTO `bm_action_log` VALUES ('992', '10', '1', '2130706433', 'Menu', '178', '操作url：/Admin/Menu/add.html', '1', '1453196309');
INSERT INTO `bm_action_log` VALUES ('993', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-20 09:24登录了后台', '1', '1453253076');
INSERT INTO `bm_action_log` VALUES ('994', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-20 09:39登录了后台', '1', '1453253950');
INSERT INTO `bm_action_log` VALUES ('995', '10', '1', '2130706433', 'Menu', '179', '操作url：/Admin/Menu/add.html', '1', '1453262460');
INSERT INTO `bm_action_log` VALUES ('996', '10', '1', '2130706433', 'Menu', '177', '操作url：/Admin/Menu/edit.html', '1', '1453262779');
INSERT INTO `bm_action_log` VALUES ('997', '10', '1', '2130706433', 'Menu', '155', '操作url：/Admin/Menu/edit.html', '1', '1453262843');
INSERT INTO `bm_action_log` VALUES ('998', '10', '1', '2130706433', 'Menu', '164', '操作url：/Admin/Menu/edit.html', '1', '1453262870');
INSERT INTO `bm_action_log` VALUES ('999', '10', '1', '2130706433', 'Menu', '172', '操作url：/Admin/Menu/edit.html', '1', '1453262934');
INSERT INTO `bm_action_log` VALUES ('1000', '10', '1', '2130706433', 'Menu', '168', '操作url：/Admin/Menu/edit.html', '1', '1453262960');
INSERT INTO `bm_action_log` VALUES ('1001', '10', '1', '2130706433', 'Menu', '167', '操作url：/Admin/Menu/edit.html', '1', '1453262976');
INSERT INTO `bm_action_log` VALUES ('1002', '10', '1', '2130706433', 'Menu', '166', '操作url：/Admin/Menu/edit.html', '1', '1453262991');
INSERT INTO `bm_action_log` VALUES ('1003', '10', '1', '2130706433', 'Menu', '165', '操作url：/Admin/Menu/edit.html', '1', '1453263020');
INSERT INTO `bm_action_log` VALUES ('1004', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-21 10:15登录了后台', '1', '1453342534');
INSERT INTO `bm_action_log` VALUES ('1005', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del/id/165.html', '1', '1453344835');
INSERT INTO `bm_action_log` VALUES ('1006', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del/id/166.html', '1', '1453344842');
INSERT INTO `bm_action_log` VALUES ('1007', '10', '1', '2130706433', 'Menu', '155', '操作url：/admin/menu/edit.html', '1', '1453344850');
INSERT INTO `bm_action_log` VALUES ('1008', '7', '1', '2130706433', 'model', '21', '操作url：/Admin/Model/update.html', '1', '1453366233');
INSERT INTO `bm_action_log` VALUES ('1009', '7', '1', '2130706433', 'model', '21', '操作url：/Admin/Model/update.html', '1', '1453366686');
INSERT INTO `bm_action_log` VALUES ('1010', '7', '1', '2130706433', 'model', '21', '操作url：/Admin/Model/update.html', '1', '1453366821');
INSERT INTO `bm_action_log` VALUES ('1011', '7', '1', '2130706433', 'model', '21', '操作url：/Admin/Model/update.html', '1', '1453367261');
INSERT INTO `bm_action_log` VALUES ('1012', '7', '1', '2130706433', 'model', '21', '操作url：/Admin/Model/update.html', '1', '1453368880');
INSERT INTO `bm_action_log` VALUES ('1013', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-22 09:48登录了后台', '1', '1453427321');
INSERT INTO `bm_action_log` VALUES ('1014', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-22 10:36登录了后台', '1', '1453430178');
INSERT INTO `bm_action_log` VALUES ('1015', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-25 16:19登录了后台', '1', '1453709953');
INSERT INTO `bm_action_log` VALUES ('1016', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-26 16:43登录了后台', '1', '1453797783');
INSERT INTO `bm_action_log` VALUES ('1017', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-27 10:15登录了后台', '1', '1453860920');
INSERT INTO `bm_action_log` VALUES ('1018', '8', '1', '2130706433', 'attribute', '240', '操作url：/admin/attribute/update.html', '1', '1453862134');
INSERT INTO `bm_action_log` VALUES ('1019', '7', '1', '2130706433', 'model', '23', '操作url：/admin/model/update.html', '1', '1453862151');
INSERT INTO `bm_action_log` VALUES ('1020', '7', '1', '2130706433', 'model', '23', '操作url：/admin/model/update.html', '1', '1453862235');
INSERT INTO `bm_action_log` VALUES ('1021', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-28 10:52登录了后台', '1', '1453949524');
INSERT INTO `bm_action_log` VALUES ('1022', '10', '1', '2130706433', 'Menu', '158', '操作url：/admin/menu/edit.html', '1', '1453970697');
INSERT INTO `bm_action_log` VALUES ('1023', '10', '1', '2130706433', 'Menu', '164', '操作url：/admin/menu/edit.html', '1', '1453970746');
INSERT INTO `bm_action_log` VALUES ('1024', '10', '1', '2130706433', 'Menu', '167', '操作url：/admin/menu/edit.html', '1', '1453970765');
INSERT INTO `bm_action_log` VALUES ('1025', '10', '1', '2130706433', 'Menu', '168', '操作url：/admin/menu/edit.html', '1', '1453970780');
INSERT INTO `bm_action_log` VALUES ('1026', '10', '1', '2130706433', 'Menu', '172', '操作url：/admin/menu/edit.html', '1', '1453970789');
INSERT INTO `bm_action_log` VALUES ('1027', '10', '1', '2130706433', 'Menu', '179', '操作url：/admin/menu/edit.html', '1', '1453970812');
INSERT INTO `bm_action_log` VALUES ('1028', '10', '1', '2130706433', 'Menu', '158', '操作url：/admin/menu/edit.html', '1', '1453970831');
INSERT INTO `bm_action_log` VALUES ('1029', '10', '1', '2130706433', 'Menu', '175', '操作url：/admin/menu/edit.html', '1', '1453970848');
INSERT INTO `bm_action_log` VALUES ('1030', '10', '1', '2130706433', 'Menu', '176', '操作url：/admin/menu/edit.html', '1', '1453970858');
INSERT INTO `bm_action_log` VALUES ('1031', '10', '1', '2130706433', 'Menu', '176', '操作url：/admin/menu/edit.html', '1', '1453970868');
INSERT INTO `bm_action_log` VALUES ('1032', '10', '1', '2130706433', 'Menu', '177', '操作url：/admin/menu/edit.html', '1', '1453970888');
INSERT INTO `bm_action_log` VALUES ('1033', '10', '1', '2130706433', 'Menu', '177', '操作url：/admin/menu/edit.html', '1', '1453970895');
INSERT INTO `bm_action_log` VALUES ('1034', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-29 10:11登录了后台', '1', '1454033495');
INSERT INTO `bm_action_log` VALUES ('1035', '1', '1', '2130706433', 'member', '1', 'admin在2016-01-29 14:20登录了后台', '1', '1454048417');
INSERT INTO `bm_action_log` VALUES ('1036', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-02 15:26登录了后台', '1', '1454397983');
INSERT INTO `bm_action_log` VALUES ('1037', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-02 15:29登录了后台', '1', '1454398144');
INSERT INTO `bm_action_log` VALUES ('1038', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-02 16:52登录了后台', '1', '1454403151');
INSERT INTO `bm_action_log` VALUES ('1039', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-02 17:09登录了后台', '1', '1454404180');
INSERT INTO `bm_action_log` VALUES ('1040', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-02 17:15登录了后台', '1', '1454404505');
INSERT INTO `bm_action_log` VALUES ('1041', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-02 20:12登录了后台', '1', '1454415124');
INSERT INTO `bm_action_log` VALUES ('1042', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-02 20:20登录了后台', '1', '1454415657');
INSERT INTO `bm_action_log` VALUES ('1043', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-02 20:23登录了后台', '1', '1454415792');
INSERT INTO `bm_action_log` VALUES ('1044', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-02 20:33登录了后台', '1', '1454416416');
INSERT INTO `bm_action_log` VALUES ('1045', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-03 09:40登录了后台', '1', '1454463634');
INSERT INTO `bm_action_log` VALUES ('1046', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-03 10:59登录了后台', '1', '1454468340');
INSERT INTO `bm_action_log` VALUES ('1047', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-03 11:27登录了后台', '1', '1454470059');
INSERT INTO `bm_action_log` VALUES ('1048', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-03 14:23登录了后台', '1', '1454480619');
INSERT INTO `bm_action_log` VALUES ('1049', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-03 14:24登录了后台', '1', '1454480671');
INSERT INTO `bm_action_log` VALUES ('1050', '10', '1', '2130706433', 'Menu', '69', '操作url：/admin/menu/edit.html', '1', '1454481682');
INSERT INTO `bm_action_log` VALUES ('1051', '10', '1', '2130706433', 'Menu', '162', '操作url：/admin/menu/edit.html', '1', '1454481887');
INSERT INTO `bm_action_log` VALUES ('1052', '7', '1', '2130706433', 'model', '25', '操作url：/admin/model/update.html', '1', '1454481938');
INSERT INTO `bm_action_log` VALUES ('1053', '8', '1', '2130706433', 'attribute', '211', '操作url：/admin/attribute/update.html', '1', '1454481955');
INSERT INTO `bm_action_log` VALUES ('1054', '8', '1', '2130706433', 'attribute', '213', '操作url：/admin/attribute/update.html', '1', '1454481969');
INSERT INTO `bm_action_log` VALUES ('1055', '8', '1', '2130706433', 'attribute', '213', '操作url：/admin/attribute/update.html', '1', '1454481979');
INSERT INTO `bm_action_log` VALUES ('1056', '8', '1', '2130706433', 'attribute', '210', '操作url：/admin/attribute/update.html', '1', '1454481990');
INSERT INTO `bm_action_log` VALUES ('1057', '8', '1', '2130706433', 'attribute', '207', '操作url：/admin/attribute/update.html', '1', '1454482378');
INSERT INTO `bm_action_log` VALUES ('1058', '8', '1', '2130706433', 'attribute', '208', '操作url：/admin/attribute/update.html', '1', '1454482399');
INSERT INTO `bm_action_log` VALUES ('1059', '8', '1', '2130706433', 'attribute', '209', '操作url：/admin/attribute/update.html', '1', '1454482411');
INSERT INTO `bm_action_log` VALUES ('1060', '8', '1', '2130706433', 'attribute', '241', '操作url：/admin/attribute/update.html', '1', '1454482495');
INSERT INTO `bm_action_log` VALUES ('1061', '10', '1', '2130706433', 'Menu', '151', '操作url：/admin/menu/edit.html', '1', '1454482539');
INSERT INTO `bm_action_log` VALUES ('1062', '7', '1', '2130706433', 'model', '25', '操作url：/admin/model/update.html', '1', '1454482597');
INSERT INTO `bm_action_log` VALUES ('1063', '8', '1', '2130706433', 'attribute', '242', '操作url：/admin/attribute/update.html', '1', '1454482722');
INSERT INTO `bm_action_log` VALUES ('1064', '8', '1', '2130706433', 'attribute', '242', '操作url：/admin/attribute/update.html', '1', '1454482784');
INSERT INTO `bm_action_log` VALUES ('1065', '10', '1', '2130706433', 'Menu', '124', '操作url：/admin/menu/edit.html', '1', '1454483223');
INSERT INTO `bm_action_log` VALUES ('1066', '10', '1', '2130706433', 'Menu', '125', '操作url：/admin/menu/edit.html', '1', '1454483238');
INSERT INTO `bm_action_log` VALUES ('1067', '10', '1', '2130706433', 'Menu', '132', '操作url：/admin/menu/edit.html', '1', '1454483245');
INSERT INTO `bm_action_log` VALUES ('1068', '10', '1', '2130706433', 'Menu', '126', '操作url：/admin/menu/edit.html', '1', '1454483279');
INSERT INTO `bm_action_log` VALUES ('1069', '10', '1', '2130706433', 'Menu', '133', '操作url：/admin/menu/edit.html', '1', '1454483299');
INSERT INTO `bm_action_log` VALUES ('1070', '8', '1', '2130706433', 'attribute', '243', '操作url：/admin/attribute/update.html', '1', '1454483387');
INSERT INTO `bm_action_log` VALUES ('1071', '8', '1', '2130706433', 'attribute', '243', '操作url：/admin/attribute/update.html', '1', '1454483439');
INSERT INTO `bm_action_log` VALUES ('1072', '7', '1', '2130706433', 'model', '25', '操作url：/admin/model/update.html', '1', '1454483480');
INSERT INTO `bm_action_log` VALUES ('1073', '10', '1', '2130706433', 'Menu', '68', '操作url：/admin/menu/edit.html', '1', '1454483523');
INSERT INTO `bm_action_log` VALUES ('1074', '10', '1', '2130706433', 'Menu', '150', '操作url：/admin/menu/edit.html', '1', '1454483610');
INSERT INTO `bm_action_log` VALUES ('1075', '10', '1', '2130706433', 'Menu', '162', '操作url：/admin/menu/edit.html', '1', '1454483627');
INSERT INTO `bm_action_log` VALUES ('1076', '10', '1', '2130706433', 'Menu', '58', '操作url：/admin/menu/edit.html', '1', '1454483643');
INSERT INTO `bm_action_log` VALUES ('1077', '10', '1', '2130706433', 'Menu', '75', '操作url：/admin/menu/edit.html', '1', '1454483650');
INSERT INTO `bm_action_log` VALUES ('1078', '10', '1', '2130706433', 'Menu', '163', '操作url：/admin/menu/edit.html', '1', '1454483658');
INSERT INTO `bm_action_log` VALUES ('1079', '8', '1', '2130706433', 'attribute', '244', '操作url：/admin/attribute/update.html', '1', '1454483731');
INSERT INTO `bm_action_log` VALUES ('1080', '7', '1', '2130706433', 'model', '25', '操作url：/admin/model/update.html', '1', '1454483743');
INSERT INTO `bm_action_log` VALUES ('1081', '10', '1', '2130706433', 'Menu', '180', '操作url：/admin/menu/add.html', '1', '1454484157');
INSERT INTO `bm_action_log` VALUES ('1082', '10', '1', '2130706433', 'Menu', '180', '操作url：/admin/menu/edit.html', '1', '1454484230');
INSERT INTO `bm_action_log` VALUES ('1083', '10', '1', '2130706433', 'Menu', '180', '操作url：/admin/menu/edit.html', '1', '1454484307');
INSERT INTO `bm_action_log` VALUES ('1084', '10', '1', '2130706433', 'Menu', '180', '操作url：/admin/menu/edit.html', '1', '1454484421');
INSERT INTO `bm_action_log` VALUES ('1085', '10', '1', '2130706433', 'Menu', '180', '操作url：/admin/menu/edit.html', '1', '1454485007');
INSERT INTO `bm_action_log` VALUES ('1086', '10', '1', '2130706433', 'Menu', '158', '操作url：/admin/menu/edit.html', '1', '1454485141');
INSERT INTO `bm_action_log` VALUES ('1087', '10', '1', '2130706433', 'Menu', '175', '操作url：/admin/menu/edit.html', '1', '1454485147');
INSERT INTO `bm_action_log` VALUES ('1088', '10', '1', '2130706433', 'Menu', '176', '操作url：/admin/menu/edit.html', '1', '1454485153');
INSERT INTO `bm_action_log` VALUES ('1089', '10', '1', '2130706433', 'Menu', '177', '操作url：/admin/menu/edit.html', '1', '1454485157');
INSERT INTO `bm_action_log` VALUES ('1090', '10', '1', '2130706433', 'Menu', '104', '操作url：/admin/menu/edit.html', '1', '1454486312');
INSERT INTO `bm_action_log` VALUES ('1091', '10', '1', '2130706433', 'Menu', '105', '操作url：/admin/menu/edit.html', '1', '1454486329');
INSERT INTO `bm_action_log` VALUES ('1092', '10', '1', '2130706433', 'Menu', '104', '操作url：/admin/menu/edit.html', '1', '1454486337');
INSERT INTO `bm_action_log` VALUES ('1093', '10', '1', '2130706433', 'Menu', '104', '操作url：/admin/menu/edit.html', '1', '1454486392');
INSERT INTO `bm_action_log` VALUES ('1094', '10', '1', '2130706433', 'Menu', '105', '操作url：/admin/menu/edit.html', '1', '1454486403');
INSERT INTO `bm_action_log` VALUES ('1095', '8', '1', '2130706433', 'attribute', '212', '操作url：/admin/attribute/update.html', '1', '1454486681');
INSERT INTO `bm_action_log` VALUES ('1096', '7', '1', '2130706433', 'model', '14', '操作url：/admin/model/update.html', '1', '1454493182');
INSERT INTO `bm_action_log` VALUES ('1097', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-18 22:03登录了后台', '1', '1455804191');
INSERT INTO `bm_action_log` VALUES ('1098', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-19 09:48登录了后台', '1', '1455846539');
INSERT INTO `bm_action_log` VALUES ('1099', '10', '1', '2130706433', 'Menu', '2', '操作url：/admin/menu/edit.html', '1', '1455847317');
INSERT INTO `bm_action_log` VALUES ('1100', '7', '1', '2130706433', 'model', '28', '操作url：/admin/model/update.html', '1', '1455847447');
INSERT INTO `bm_action_log` VALUES ('1101', '8', '1', '2130706433', 'attribute', '245', '操作url：/admin/attribute/update.html', '1', '1455847492');
INSERT INTO `bm_action_log` VALUES ('1102', '8', '1', '2130706433', 'attribute', '246', '操作url：/admin/attribute/update.html', '1', '1455847651');
INSERT INTO `bm_action_log` VALUES ('1103', '8', '1', '2130706433', 'attribute', '247', '操作url：/admin/attribute/update.html', '1', '1455847686');
INSERT INTO `bm_action_log` VALUES ('1104', '8', '1', '2130706433', 'attribute', '248', '操作url：/admin/attribute/update.html', '1', '1455847752');
INSERT INTO `bm_action_log` VALUES ('1105', '8', '1', '2130706433', 'attribute', '248', '操作url：/admin/attribute/update.html', '1', '1455847899');
INSERT INTO `bm_action_log` VALUES ('1106', '10', '1', '2130706433', 'Menu', '137', '操作url：/admin/menu/edit.html', '1', '1455848027');
INSERT INTO `bm_action_log` VALUES ('1107', '10', '1', '2130706433', 'Menu', '140', '操作url：/admin/menu/edit.html', '1', '1455848037');
INSERT INTO `bm_action_log` VALUES ('1108', '7', '1', '2130706433', 'model', '28', '操作url：/admin/model/update.html', '1', '1455848738');
INSERT INTO `bm_action_log` VALUES ('1109', '10', '1', '2130706433', 'Menu', '181', '操作url：/admin/menu/add.html', '1', '1455849453');
INSERT INTO `bm_action_log` VALUES ('1110', '10', '1', '2130706433', 'Menu', '182', '操作url：/admin/menu/add.html', '1', '1455849517');
INSERT INTO `bm_action_log` VALUES ('1111', '7', '1', '2130706433', 'model', '28', '操作url：/admin/model/update.html', '1', '1455849571');
INSERT INTO `bm_action_log` VALUES ('1112', '7', '1', '2130706433', 'model', '28', '操作url：/admin/model/update.html', '1', '1455849868');
INSERT INTO `bm_action_log` VALUES ('1113', '7', '1', '2130706433', 'model', '28', '操作url：/admin/model/update.html', '1', '1455849920');
INSERT INTO `bm_action_log` VALUES ('1114', '7', '1', '2130706433', 'model', '28', '操作url：/admin/model/update.html', '1', '1455850241');
INSERT INTO `bm_action_log` VALUES ('1115', '7', '1', '2130706433', 'model', '28', '操作url：/admin/model/update.html', '1', '1455850305');
INSERT INTO `bm_action_log` VALUES ('1116', '7', '1', '2130706433', 'model', '28', '操作url：/admin/model/update.html', '1', '1455850459');
INSERT INTO `bm_action_log` VALUES ('1117', '7', '1', '2130706433', 'model', '28', '操作url：/admin/model/update.html', '1', '1455850496');
INSERT INTO `bm_action_log` VALUES ('1118', '8', '1', '2130706433', 'attribute', '249', '操作url：/admin/attribute/update.html', '1', '1455850848');
INSERT INTO `bm_action_log` VALUES ('1119', '8', '1', '2130706433', 'attribute', '249', '操作url：/admin/attribute/update.html', '1', '1455850949');
INSERT INTO `bm_action_log` VALUES ('1120', '7', '1', '2130706433', 'model', '28', '操作url：/admin/model/update.html', '1', '1455850971');
INSERT INTO `bm_action_log` VALUES ('1121', '7', '1', '2130706433', 'model', '28', '操作url：/admin/model/update.html', '1', '1455851093');
INSERT INTO `bm_action_log` VALUES ('1122', '7', '1', '2130706433', 'model', '28', '操作url：/admin/model/update.html', '1', '1455851904');
INSERT INTO `bm_action_log` VALUES ('1123', '7', '1', '2130706433', 'model', '6', '操作url：/admin/model/update.html', '1', '1455863125');
INSERT INTO `bm_action_log` VALUES ('1124', '7', '1', '2130706433', 'model', '6', '操作url：/admin/model/update.html', '1', '1455864579');
INSERT INTO `bm_action_log` VALUES ('1125', '8', '1', '2130706433', 'attribute', '73', '操作url：/admin/attribute/remove/id/73.html', '1', '1455869393');
INSERT INTO `bm_action_log` VALUES ('1126', '8', '1', '2130706433', 'attribute', '76', '操作url：/admin/attribute/remove/id/76.html', '1', '1455869405');
INSERT INTO `bm_action_log` VALUES ('1127', '7', '1', '2130706433', 'model', '14', '操作url：/admin/model/update.html', '1', '1455870160');
INSERT INTO `bm_action_log` VALUES ('1128', '8', '1', '2130706433', 'attribute', '79', '操作url：/admin/attribute/remove/id/79.html', '1', '1455870301');
INSERT INTO `bm_action_log` VALUES ('1129', '8', '1', '2130706433', 'attribute', '88', '操作url：/admin/attribute/remove/id/88.html', '1', '1455870309');
INSERT INTO `bm_action_log` VALUES ('1130', '8', '1', '2130706433', 'attribute', '98', '操作url：/admin/attribute/remove/id/98.html', '1', '1455870318');
INSERT INTO `bm_action_log` VALUES ('1131', '8', '1', '2130706433', 'attribute', '95', '操作url：/admin/attribute/update.html', '1', '1455870378');
INSERT INTO `bm_action_log` VALUES ('1132', '8', '1', '2130706433', 'attribute', '85', '操作url：/admin/attribute/remove/id/85.html', '1', '1455870396');
INSERT INTO `bm_action_log` VALUES ('1133', '8', '1', '2130706433', 'attribute', '84', '操作url：/admin/attribute/remove/id/84.html', '1', '1455870402');
INSERT INTO `bm_action_log` VALUES ('1134', '8', '1', '2130706433', 'attribute', '83', '操作url：/admin/attribute/remove/id/83.html', '1', '1455870409');
INSERT INTO `bm_action_log` VALUES ('1135', '8', '1', '2130706433', 'attribute', '82', '操作url：/admin/attribute/remove/id/82.html', '1', '1455870417');
INSERT INTO `bm_action_log` VALUES ('1136', '8', '1', '2130706433', 'attribute', '81', '操作url：/admin/attribute/remove/id/81.html', '1', '1455870428');
INSERT INTO `bm_action_log` VALUES ('1137', '8', '1', '2130706433', 'attribute', '80', '操作url：/admin/attribute/remove/id/80.html', '1', '1455870438');
INSERT INTO `bm_action_log` VALUES ('1138', '8', '1', '2130706433', 'attribute', '78', '操作url：/admin/attribute/remove/id/78.html', '1', '1455870447');
INSERT INTO `bm_action_log` VALUES ('1139', '7', '1', '2130706433', 'model', '14', '操作url：/admin/model/update.html', '1', '1455870565');
INSERT INTO `bm_action_log` VALUES ('1140', '7', '1', '2130706433', 'model', '14', '操作url：/admin/model/update.html', '1', '1455870625');
INSERT INTO `bm_action_log` VALUES ('1141', '8', '1', '2130706433', 'attribute', '95', '操作url：/admin/attribute/update.html', '1', '1455871094');
INSERT INTO `bm_action_log` VALUES ('1142', '8', '1', '2130706433', 'attribute', '250', '操作url：/admin/attribute/update.html', '1', '1455872249');
INSERT INTO `bm_action_log` VALUES ('1143', '7', '1', '2130706433', 'model', '15', '操作url：/admin/model/update.html', '1', '1455872290');
INSERT INTO `bm_action_log` VALUES ('1144', '10', '1', '2130706433', 'Menu', '148', '操作url：/admin/menu/edit.html', '1', '1455872436');
INSERT INTO `bm_action_log` VALUES ('1145', '8', '1', '2130706433', 'attribute', '251', '操作url：/admin/attribute/update.html', '1', '1455874161');
INSERT INTO `bm_action_log` VALUES ('1146', '8', '1', '2130706433', 'attribute', '251', '操作url：/admin/attribute/remove/id/251.html', '1', '1455874302');
INSERT INTO `bm_action_log` VALUES ('1147', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-20 14:18登录了后台', '1', '1455949081');
INSERT INTO `bm_action_log` VALUES ('1148', '8', '1', '2130706433', 'attribute', '74', '操作url：/admin/attribute/update.html', '1', '1455949347');
INSERT INTO `bm_action_log` VALUES ('1149', '7', '1', '2130706433', 'model', '15', '操作url：/admin/model/update.html', '1', '1455951260');
INSERT INTO `bm_action_log` VALUES ('1150', '7', '1', '2130706433', 'model', '15', '操作url：/admin/model/update.html', '1', '1455951680');
INSERT INTO `bm_action_log` VALUES ('1151', '10', '1', '2130706433', 'Menu', '160', '操作url：/admin/menu/edit.html', '1', '1455953011');
INSERT INTO `bm_action_log` VALUES ('1152', '7', '1', '2130706433', 'model', '23', '操作url：/admin/model/update.html', '1', '1455953042');
INSERT INTO `bm_action_log` VALUES ('1153', '8', '1', '2130706433', 'attribute', '193', '操作url：/admin/attribute/remove/id/193.html', '1', '1455953069');
INSERT INTO `bm_action_log` VALUES ('1154', '8', '1', '2130706433', 'attribute', '194', '操作url：/admin/attribute/remove/id/194.html', '1', '1455953074');
INSERT INTO `bm_action_log` VALUES ('1155', '8', '1', '2130706433', 'attribute', '195', '操作url：/admin/attribute/remove/id/195.html', '1', '1455953078');
INSERT INTO `bm_action_log` VALUES ('1156', '8', '1', '2130706433', 'attribute', '197', '操作url：/admin/attribute/update.html', '1', '1455953099');
INSERT INTO `bm_action_log` VALUES ('1157', '8', '1', '2130706433', 'attribute', '196', '操作url：/admin/attribute/remove/id/196.html', '1', '1455953109');
INSERT INTO `bm_action_log` VALUES ('1158', '8', '1', '2130706433', 'attribute', '252', '操作url：/admin/attribute/update.html', '1', '1455953392');
INSERT INTO `bm_action_log` VALUES ('1159', '8', '1', '2130706433', 'attribute', '253', '操作url：/admin/attribute/update.html', '1', '1455953431');
INSERT INTO `bm_action_log` VALUES ('1160', '7', '1', '2130706433', 'model', '23', '操作url：/admin/model/update.html', '1', '1455953456');
INSERT INTO `bm_action_log` VALUES ('1161', '8', '1', '2130706433', 'attribute', '108', '操作url：/admin/attribute/update.html', '1', '1455953542');
INSERT INTO `bm_action_log` VALUES ('1162', '7', '1', '2130706433', 'model', '15', '操作url：/admin/model/update.html', '1', '1455953572');
INSERT INTO `bm_action_log` VALUES ('1163', '7', '1', '2130706433', 'model', '15', '操作url：/Admin/Model/update.html', '1', '1455953651');
INSERT INTO `bm_action_log` VALUES ('1164', '7', '1', '2130706433', 'model', '15', '操作url：/Admin/Model/update.html', '1', '1455953764');
INSERT INTO `bm_action_log` VALUES ('1165', '8', '1', '2130706433', 'attribute', '252', '操作url：/Admin/Attribute/update.html', '1', '1455953834');
INSERT INTO `bm_action_log` VALUES ('1166', '7', '1', '2130706433', 'model', '23', '操作url：/Admin/Model/update.html', '1', '1455953890');
INSERT INTO `bm_action_log` VALUES ('1167', '7', '1', '2130706433', 'model', '23', '操作url：/Admin/Model/update.html', '1', '1455953928');
INSERT INTO `bm_action_log` VALUES ('1168', '8', '1', '2130706433', 'attribute', '254', '操作url：/Admin/Attribute/update.html', '1', '1455953999');
INSERT INTO `bm_action_log` VALUES ('1169', '7', '1', '2130706433', 'model', '23', '操作url：/Admin/Model/update.html', '1', '1455954033');
INSERT INTO `bm_action_log` VALUES ('1170', '7', '1', '2130706433', 'model', '23', '操作url：/Admin/Model/update.html', '1', '1455954145');
INSERT INTO `bm_action_log` VALUES ('1171', '7', '1', '2130706433', 'model', '23', '操作url：/Admin/Model/update.html', '1', '1455954332');
INSERT INTO `bm_action_log` VALUES ('1172', '7', '1', '2130706433', 'model', '15', '操作url：/Admin/Model/update.html', '1', '1455954377');
INSERT INTO `bm_action_log` VALUES ('1173', '8', '1', '2130706433', 'attribute', '255', '操作url：/Admin/Attribute/update.html', '1', '1455954738');
INSERT INTO `bm_action_log` VALUES ('1174', '7', '1', '2130706433', 'model', '23', '操作url：/Admin/Model/update.html', '1', '1455954787');
INSERT INTO `bm_action_log` VALUES ('1175', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1455958621');
INSERT INTO `bm_action_log` VALUES ('1176', '8', '1', '2130706433', 'attribute', '256', '操作url：/Admin/Attribute/update.html', '1', '1455958668');
INSERT INTO `bm_action_log` VALUES ('1177', '8', '1', '2130706433', 'attribute', '257', '操作url：/Admin/Attribute/update.html', '1', '1455959157');
INSERT INTO `bm_action_log` VALUES ('1178', '8', '1', '2130706433', 'attribute', '258', '操作url：/Admin/Attribute/update.html', '1', '1455959220');
INSERT INTO `bm_action_log` VALUES ('1179', '8', '1', '2130706433', 'attribute', '259', '操作url：/Admin/Attribute/update.html', '1', '1455959542');
INSERT INTO `bm_action_log` VALUES ('1180', '8', '1', '2130706433', 'attribute', '260', '操作url：/Admin/Attribute/update.html', '1', '1455959710');
INSERT INTO `bm_action_log` VALUES ('1181', '8', '1', '2130706433', 'attribute', '261', '操作url：/Admin/Attribute/update.html', '1', '1455959757');
INSERT INTO `bm_action_log` VALUES ('1182', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-23 09:26登录了后台', '1', '1456190764');
INSERT INTO `bm_action_log` VALUES ('1183', '8', '1', '2130706433', 'attribute', '260', '操作url：/admin/attribute/remove/id/260.html', '1', '1456192854');
INSERT INTO `bm_action_log` VALUES ('1184', '8', '1', '2130706433', 'attribute', '261', '操作url：/admin/attribute/remove/id/261.html', '1', '1456192859');
INSERT INTO `bm_action_log` VALUES ('1185', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1456193238');
INSERT INTO `bm_action_log` VALUES ('1186', '8', '1', '2130706433', 'attribute', '262', '操作url：/admin/attribute/update.html', '1', '1456193281');
INSERT INTO `bm_action_log` VALUES ('1187', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1456193463');
INSERT INTO `bm_action_log` VALUES ('1188', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1456193485');
INSERT INTO `bm_action_log` VALUES ('1189', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1456193607');
INSERT INTO `bm_action_log` VALUES ('1190', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1456193748');
INSERT INTO `bm_action_log` VALUES ('1191', '10', '1', '2130706433', 'Menu', '183', '操作url：/admin/menu/add.html', '1', '1456193986');
INSERT INTO `bm_action_log` VALUES ('1192', '10', '1', '2130706433', 'Menu', '183', '操作url：/admin/menu/edit.html', '1', '1456194007');
INSERT INTO `bm_action_log` VALUES ('1193', '10', '1', '2130706433', 'Menu', '184', '操作url：/admin/menu/add.html', '1', '1456194080');
INSERT INTO `bm_action_log` VALUES ('1194', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1456194191');
INSERT INTO `bm_action_log` VALUES ('1195', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1456194211');
INSERT INTO `bm_action_log` VALUES ('1196', '10', '1', '2130706433', 'Menu', '185', '操作url：/admin/menu/add.html', '1', '1456194313');
INSERT INTO `bm_action_log` VALUES ('1197', '10', '1', '2130706433', 'Menu', '186', '操作url：/admin/menu/add.html', '1', '1456194331');
INSERT INTO `bm_action_log` VALUES ('1198', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del/id/186.html', '1', '1456194387');
INSERT INTO `bm_action_log` VALUES ('1199', '10', '1', '2130706433', 'Menu', '187', '操作url：/admin/menu/add.html', '1', '1456194425');
INSERT INTO `bm_action_log` VALUES ('1200', '8', '1', '2130706433', 'attribute', '257', '操作url：/admin/attribute/update.html', '1', '1456209670');
INSERT INTO `bm_action_log` VALUES ('1201', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1456209735');
INSERT INTO `bm_action_log` VALUES ('1202', '7', '1', '2130706433', 'model', '30', '操作url：/Admin/Model/update.html', '1', '1456213830');
INSERT INTO `bm_action_log` VALUES ('1203', '8', '1', '2130706433', 'attribute', '263', '操作url：/Admin/Attribute/update.html', '1', '1456213870');
INSERT INTO `bm_action_log` VALUES ('1204', '8', '1', '2130706433', 'attribute', '264', '操作url：/Admin/Attribute/update.html', '1', '1456213898');
INSERT INTO `bm_action_log` VALUES ('1205', '8', '1', '2130706433', 'attribute', '265', '操作url：/Admin/Attribute/update.html', '1', '1456213943');
INSERT INTO `bm_action_log` VALUES ('1206', '7', '1', '2130706433', 'model', '30', '操作url：/Admin/Model/update.html', '1', '1456214074');
INSERT INTO `bm_action_log` VALUES ('1207', '7', '1', '2130706433', 'model', '30', '操作url：/Admin/Model/update.html', '1', '1456214279');
INSERT INTO `bm_action_log` VALUES ('1208', '8', '1', '2130706433', 'attribute', '266', '操作url：/Admin/Attribute/update.html', '1', '1456214328');
INSERT INTO `bm_action_log` VALUES ('1209', '7', '1', '2130706433', 'model', '30', '操作url：/Admin/Model/update.html', '1', '1456214402');
INSERT INTO `bm_action_log` VALUES ('1210', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1456214945');
INSERT INTO `bm_action_log` VALUES ('1211', '10', '1', '2130706433', 'Menu', '188', '操作url：/Admin/Menu/add.html', '1', '1456215079');
INSERT INTO `bm_action_log` VALUES ('1212', '7', '1', '2130706433', 'model', '30', '操作url：/Admin/Model/update.html', '1', '1456215123');
INSERT INTO `bm_action_log` VALUES ('1213', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1456215320');
INSERT INTO `bm_action_log` VALUES ('1214', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1456215393');
INSERT INTO `bm_action_log` VALUES ('1215', '10', '1', '2130706433', 'Menu', '189', '操作url：/Admin/Menu/add.html', '1', '1456215613');
INSERT INTO `bm_action_log` VALUES ('1216', '10', '1', '2130706433', 'Menu', '190', '操作url：/Admin/Menu/add.html', '1', '1456215649');
INSERT INTO `bm_action_log` VALUES ('1217', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/161.html', '1', '1456215676');
INSERT INTO `bm_action_log` VALUES ('1218', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/160.html', '1', '1456215692');
INSERT INTO `bm_action_log` VALUES ('1219', '10', '1', '2130706433', 'Menu', '149', '操作url：/Admin/Menu/edit.html', '1', '1456216175');
INSERT INTO `bm_action_log` VALUES ('1220', '10', '1', '2130706433', 'Menu', '191', '操作url：/Admin/Menu/add.html', '1', '1456216221');
INSERT INTO `bm_action_log` VALUES ('1221', '10', '1', '2130706433', 'Menu', '192', '操作url：/Admin/Menu/add.html', '1', '1456216248');
INSERT INTO `bm_action_log` VALUES ('1222', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/149.html', '1', '1456216253');
INSERT INTO `bm_action_log` VALUES ('1223', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/148.html', '1', '1456216261');
INSERT INTO `bm_action_log` VALUES ('1224', '7', '1', '2130706433', 'model', '30', '操作url：/Admin/Model/update.html', '1', '1456216435');
INSERT INTO `bm_action_log` VALUES ('1225', '6', '1', '2130706433', 'config', '25', '操作url：/Admin/Config/edit.html', '1', '1456216811');
INSERT INTO `bm_action_log` VALUES ('1226', '6', '1', '2130706433', 'config', '25', '操作url：/Admin/Config/edit.html', '1', '1456216841');
INSERT INTO `bm_action_log` VALUES ('1227', '6', '1', '2130706433', 'config', '25', '操作url：/Admin/Config/edit.html', '1', '1456216877');
INSERT INTO `bm_action_log` VALUES ('1228', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-24 09:48登录了后台', '1', '1456278482');
INSERT INTO `bm_action_log` VALUES ('1229', '10', '1', '2130706433', 'Menu', '191', '操作url：/Admin/Menu/edit.html', '1', '1456278524');
INSERT INTO `bm_action_log` VALUES ('1230', '10', '1', '2130706433', 'Menu', '155', '操作url：/Admin/Menu/edit.html', '1', '1456282129');
INSERT INTO `bm_action_log` VALUES ('1231', '10', '1', '2130706433', 'Menu', '155', '操作url：/Admin/Menu/edit.html', '1', '1456282142');
INSERT INTO `bm_action_log` VALUES ('1232', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1456282363');
INSERT INTO `bm_action_log` VALUES ('1233', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1456282440');
INSERT INTO `bm_action_log` VALUES ('1234', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1456283074');
INSERT INTO `bm_action_log` VALUES ('1235', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1456283478');
INSERT INTO `bm_action_log` VALUES ('1236', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1456284031');
INSERT INTO `bm_action_log` VALUES ('1237', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1456284067');
INSERT INTO `bm_action_log` VALUES ('1238', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1456295346');
INSERT INTO `bm_action_log` VALUES ('1239', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1456295418');
INSERT INTO `bm_action_log` VALUES ('1240', '7', '1', '2130706433', 'model', '22', '操作url：/Admin/Model/update.html', '1', '1456296770');
INSERT INTO `bm_action_log` VALUES ('1241', '10', '1', '2130706433', 'Menu', '167', '操作url：/Admin/Menu/edit.html', '1', '1456298580');
INSERT INTO `bm_action_log` VALUES ('1242', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-24 17:13登录了后台', '1', '1456305185');
INSERT INTO `bm_action_log` VALUES ('1243', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-24 17:39登录了后台', '1', '1456306755');
INSERT INTO `bm_action_log` VALUES ('1244', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-24 17:40登录了后台', '1', '1456306840');
INSERT INTO `bm_action_log` VALUES ('1245', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-25 09:51登录了后台', '1', '1456365067');
INSERT INTO `bm_action_log` VALUES ('1246', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/172.html', '1', '1456382088');
INSERT INTO `bm_action_log` VALUES ('1247', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-26 09:55登录了后台', '1', '1456451721');
INSERT INTO `bm_action_log` VALUES ('1248', '1', '1', '2130706433', 'member', '1', 'admin在2016-02-29 09:34登录了后台', '1', '1456709678');
INSERT INTO `bm_action_log` VALUES ('1249', '7', '1', '2130706433', 'model', '22', '操作url：/admin/model/update.html', '1', '1456712563');
INSERT INTO `bm_action_log` VALUES ('1250', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-01 09:41登录了后台', '1', '1456796497');
INSERT INTO `bm_action_log` VALUES ('1251', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-02 09:35登录了后台', '1', '1456882530');
INSERT INTO `bm_action_log` VALUES ('1252', '7', '1', '2130706433', 'model', '31', '操作url：/admin/model/update.html', '1', '1456900882');
INSERT INTO `bm_action_log` VALUES ('1253', '8', '1', '2130706433', 'attribute', '267', '操作url：/admin/attribute/update.html', '1', '1456900932');
INSERT INTO `bm_action_log` VALUES ('1254', '8', '1', '2130706433', 'attribute', '268', '操作url：/admin/attribute/update.html', '1', '1456900972');
INSERT INTO `bm_action_log` VALUES ('1255', '8', '1', '2130706433', 'attribute', '267', '操作url：/admin/attribute/update.html', '1', '1456900988');
INSERT INTO `bm_action_log` VALUES ('1256', '7', '1', '2130706433', 'model', '31', '操作url：/admin/model/update.html', '1', '1456901162');
INSERT INTO `bm_action_log` VALUES ('1257', '10', '1', '2130706433', 'Menu', '193', '操作url：/admin/menu/add.html', '1', '1456901450');
INSERT INTO `bm_action_log` VALUES ('1258', '10', '1', '2130706433', 'Menu', '194', '操作url：/admin/menu/add.html', '1', '1456901473');
INSERT INTO `bm_action_log` VALUES ('1259', '10', '1', '2130706433', 'Menu', '195', '操作url：/admin/menu/add.html', '1', '1456901508');
INSERT INTO `bm_action_log` VALUES ('1260', '7', '1', '2130706433', 'model', '32', '操作url：/admin/model/update.html', '1', '1456902244');
INSERT INTO `bm_action_log` VALUES ('1261', '8', '1', '2130706433', 'attribute', '269', '操作url：/admin/attribute/update.html', '1', '1456902316');
INSERT INTO `bm_action_log` VALUES ('1262', '8', '1', '2130706433', 'attribute', '270', '操作url：/admin/attribute/update.html', '1', '1456902360');
INSERT INTO `bm_action_log` VALUES ('1263', '8', '1', '2130706433', 'attribute', '271', '操作url：/admin/attribute/update.html', '1', '1456902394');
INSERT INTO `bm_action_log` VALUES ('1264', '7', '1', '2130706433', 'model', '32', '操作url：/admin/model/update.html', '1', '1456902680');
INSERT INTO `bm_action_log` VALUES ('1265', '7', '1', '2130706433', 'model', '32', '操作url：/admin/model/update.html', '1', '1456902709');
INSERT INTO `bm_action_log` VALUES ('1266', '7', '1', '2130706433', 'model', '33', '操作url：/admin/model/update.html', '1', '1456902957');
INSERT INTO `bm_action_log` VALUES ('1267', '8', '1', '2130706433', 'attribute', '272', '操作url：/admin/attribute/update.html', '1', '1456903314');
INSERT INTO `bm_action_log` VALUES ('1268', '8', '1', '2130706433', 'attribute', '273', '操作url：/admin/attribute/update.html', '1', '1456903348');
INSERT INTO `bm_action_log` VALUES ('1269', '8', '1', '2130706433', 'attribute', '274', '操作url：/admin/attribute/update.html', '1', '1456903381');
INSERT INTO `bm_action_log` VALUES ('1270', '8', '1', '2130706433', 'attribute', '275', '操作url：/admin/attribute/update.html', '1', '1456903432');
INSERT INTO `bm_action_log` VALUES ('1271', '7', '1', '2130706433', 'model', '30', '操作url：/admin/model/update.html', '1', '1456903847');
INSERT INTO `bm_action_log` VALUES ('1272', '7', '1', '2130706433', 'model', '33', '操作url：/admin/model/update.html', '1', '1456904010');
INSERT INTO `bm_action_log` VALUES ('1273', '7', '1', '2130706433', 'model', '32', '操作url：/admin/model/update.html', '1', '1456905079');
INSERT INTO `bm_action_log` VALUES ('1274', '10', '1', '2130706433', 'Menu', '196', '操作url：/admin/menu/add.html', '1', '1456905161');
INSERT INTO `bm_action_log` VALUES ('1275', '10', '1', '2130706433', 'Menu', '197', '操作url：/admin/menu/add.html', '1', '1456905230');
INSERT INTO `bm_action_log` VALUES ('1276', '7', '1', '2130706433', 'model', '32', '操作url：/admin/model/update.html', '1', '1456905278');
INSERT INTO `bm_action_log` VALUES ('1277', '7', '1', '2130706433', 'model', '33', '操作url：/admin/model/update.html', '1', '1456905308');
INSERT INTO `bm_action_log` VALUES ('1278', '10', '1', '2130706433', 'Menu', '173', '操作url：/admin/menu/edit.html', '1', '1456905402');
INSERT INTO `bm_action_log` VALUES ('1279', '10', '1', '2130706433', 'Menu', '178', '操作url：/admin/menu/edit.html', '1', '1456905408');
INSERT INTO `bm_action_log` VALUES ('1280', '10', '1', '2130706433', 'Menu', '198', '操作url：/admin/menu/add.html', '1', '1456905472');
INSERT INTO `bm_action_log` VALUES ('1281', '10', '1', '2130706433', 'Menu', '199', '操作url：/admin/menu/add.html', '1', '1456905508');
INSERT INTO `bm_action_log` VALUES ('1282', '10', '1', '2130706433', 'Menu', '199', '操作url：/admin/menu/edit.html', '1', '1456905518');
INSERT INTO `bm_action_log` VALUES ('1283', '10', '1', '2130706433', 'Menu', '199', '操作url：/admin/menu/edit.html', '1', '1456905566');
INSERT INTO `bm_action_log` VALUES ('1284', '10', '1', '2130706433', 'Menu', '169', '操作url：/Admin/Menu/edit.html', '1', '1456906259');
INSERT INTO `bm_action_log` VALUES ('1285', '7', '1', '2130706433', 'model', '34', '操作url：/Admin/Model/update.html', '1', '1456907688');
INSERT INTO `bm_action_log` VALUES ('1286', '7', '1', '2130706433', 'model', '35', '操作url：/Admin/Model/update.html', '1', '1456907715');
INSERT INTO `bm_action_log` VALUES ('1287', '8', '1', '2130706433', 'attribute', '276', '操作url：/Admin/Attribute/update.html', '1', '1456907752');
INSERT INTO `bm_action_log` VALUES ('1288', '8', '1', '2130706433', 'attribute', '277', '操作url：/Admin/Attribute/update.html', '1', '1456907820');
INSERT INTO `bm_action_log` VALUES ('1289', '8', '1', '2130706433', 'attribute', '278', '操作url：/Admin/Attribute/update.html', '1', '1456907854');
INSERT INTO `bm_action_log` VALUES ('1290', '8', '1', '2130706433', 'attribute', '279', '操作url：/Admin/Attribute/update.html', '1', '1456907900');
INSERT INTO `bm_action_log` VALUES ('1291', '8', '1', '2130706433', 'attribute', '279', '操作url：/Admin/Attribute/update.html', '1', '1456907919');
INSERT INTO `bm_action_log` VALUES ('1292', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-03 14:22登录了后台', '1', '1456986169');
INSERT INTO `bm_action_log` VALUES ('1293', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-03 17:44登录了后台', '1', '1456998285');
INSERT INTO `bm_action_log` VALUES ('1294', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-03 20:29登录了后台', '1', '1457008144');
INSERT INTO `bm_action_log` VALUES ('1295', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-07 18:26登录了后台', '1', '1457346372');
INSERT INTO `bm_action_log` VALUES ('1296', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-14 16:41登录了后台', '1', '1457944901');
INSERT INTO `bm_action_log` VALUES ('1297', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-15 15:47登录了后台', '1', '1458028053');
INSERT INTO `bm_action_log` VALUES ('1298', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-16 09:56登录了后台', '1', '1458093371');
INSERT INTO `bm_action_log` VALUES ('1299', '8', '1', '2130706433', 'attribute', '268', '操作url：/admin/attribute/update.html', '1', '1458093509');
INSERT INTO `bm_action_log` VALUES ('1300', '8', '1', '2130706433', 'attribute', '280', '操作url：/admin/attribute/update.html', '1', '1458093570');
INSERT INTO `bm_action_log` VALUES ('1301', '7', '1', '2130706433', 'model', '31', '操作url：/admin/model/update.html', '1', '1458093643');
INSERT INTO `bm_action_log` VALUES ('1302', '7', '1', '2130706433', 'model', '36', '操作url：/admin/model/update.html', '1', '1458094200');
INSERT INTO `bm_action_log` VALUES ('1303', '7', '1', '2130706433', 'model', '37', '操作url：/admin/model/update.html', '1', '1458094265');
INSERT INTO `bm_action_log` VALUES ('1304', '8', '1', '2130706433', 'attribute', '281', '操作url：/admin/attribute/update.html', '1', '1458094303');
INSERT INTO `bm_action_log` VALUES ('1305', '8', '1', '2130706433', 'attribute', '282', '操作url：/admin/attribute/update.html', '1', '1458094334');
INSERT INTO `bm_action_log` VALUES ('1306', '8', '1', '2130706433', 'attribute', '283', '操作url：/admin/attribute/update.html', '1', '1458094357');
INSERT INTO `bm_action_log` VALUES ('1307', '8', '1', '2130706433', 'attribute', '284', '操作url：/admin/attribute/update.html', '1', '1458094423');
INSERT INTO `bm_action_log` VALUES ('1308', '8', '1', '2130706433', 'attribute', '285', '操作url：/admin/attribute/update.html', '1', '1458094449');
INSERT INTO `bm_action_log` VALUES ('1309', '8', '1', '2130706433', 'attribute', '286', '操作url：/admin/attribute/update.html', '1', '1458094474');
INSERT INTO `bm_action_log` VALUES ('1310', '7', '1', '2130706433', 'model', '38', '操作url：/admin/model/update.html', '1', '1458095678');
INSERT INTO `bm_action_log` VALUES ('1311', '8', '1', '2130706433', 'attribute', '287', '操作url：/admin/attribute/update.html', '1', '1458095752');
INSERT INTO `bm_action_log` VALUES ('1312', '8', '1', '2130706433', 'attribute', '288', '操作url：/admin/attribute/update.html', '1', '1458095786');
INSERT INTO `bm_action_log` VALUES ('1313', '8', '1', '2130706433', 'attribute', '289', '操作url：/admin/attribute/update.html', '1', '1458095865');
INSERT INTO `bm_action_log` VALUES ('1314', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-17 10:07登录了后台', '1', '1458180422');
INSERT INTO `bm_action_log` VALUES ('1315', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-17 18:23登录了后台', '1', '1458210181');
INSERT INTO `bm_action_log` VALUES ('1316', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-18 16:07登录了后台', '1', '1458288435');
INSERT INTO `bm_action_log` VALUES ('1317', '7', '1', '2130706433', 'model', '39', '操作url：/admin/model/update.html', '1', '1458289123');
INSERT INTO `bm_action_log` VALUES ('1318', '8', '1', '2130706433', 'attribute', '290', '操作url：/admin/attribute/update.html', '1', '1458289176');
INSERT INTO `bm_action_log` VALUES ('1319', '8', '1', '2130706433', 'attribute', '291', '操作url：/admin/attribute/update.html', '1', '1458289239');
INSERT INTO `bm_action_log` VALUES ('1320', '8', '1', '2130706433', 'attribute', '291', '操作url：/admin/attribute/update.html', '1', '1458289255');
INSERT INTO `bm_action_log` VALUES ('1321', '8', '1', '2130706433', 'attribute', '292', '操作url：/admin/attribute/update.html', '1', '1458289277');
INSERT INTO `bm_action_log` VALUES ('1322', '8', '1', '2130706433', 'attribute', '293', '操作url：/admin/attribute/update.html', '1', '1458289352');
INSERT INTO `bm_action_log` VALUES ('1323', '8', '1', '2130706433', 'attribute', '294', '操作url：/admin/attribute/update.html', '1', '1458289501');
INSERT INTO `bm_action_log` VALUES ('1324', '8', '1', '2130706433', 'attribute', '218', '操作url：/admin/attribute/update.html', '1', '1458289583');
INSERT INTO `bm_action_log` VALUES ('1325', '8', '1', '2130706433', 'attribute', '221', '操作url：/admin/attribute/update.html', '1', '1458289617');
INSERT INTO `bm_action_log` VALUES ('1326', '8', '1', '2130706433', 'attribute', '220', '操作url：/admin/attribute/update.html', '1', '1458289624');
INSERT INTO `bm_action_log` VALUES ('1327', '8', '1', '2130706433', 'attribute', '215', '操作url：/admin/attribute/update.html', '1', '1458289648');
INSERT INTO `bm_action_log` VALUES ('1328', '8', '1', '2130706433', 'attribute', '295', '操作url：/admin/attribute/update.html', '1', '1458289826');
INSERT INTO `bm_action_log` VALUES ('1329', '7', '1', '2130706433', 'model', '22', '操作url：/admin/model/update.html', '1', '1458290670');
INSERT INTO `bm_action_log` VALUES ('1330', '8', '1', '2130706433', 'attribute', '296', '操作url：/admin/attribute/update.html', '1', '1458290723');
INSERT INTO `bm_action_log` VALUES ('1331', '8', '1', '2130706433', 'attribute', '297', '操作url：/admin/attribute/update.html', '1', '1458291654');
INSERT INTO `bm_action_log` VALUES ('1332', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-21 14:46登录了后台', '1', '1458542776');
INSERT INTO `bm_action_log` VALUES ('1333', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-21 14:49登录了后台', '1', '1458542940');
INSERT INTO `bm_action_log` VALUES ('1334', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-22 09:35登录了后台', '1', '1458610512');
INSERT INTO `bm_action_log` VALUES ('1335', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-22 14:51登录了后台', '1', '1458629475');
INSERT INTO `bm_action_log` VALUES ('1336', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-28 14:07登录了后台', '1', '1459145273');
INSERT INTO `bm_action_log` VALUES ('1337', '7', '1', '2130706433', 'model', '40', '操作url：/admin/model/update.html', '1', '1459152334');
INSERT INTO `bm_action_log` VALUES ('1338', '8', '1', '2130706433', 'attribute', '298', '操作url：/admin/attribute/update.html', '1', '1459152368');
INSERT INTO `bm_action_log` VALUES ('1339', '8', '1', '2130706433', 'attribute', '299', '操作url：/admin/attribute/update.html', '1', '1459152393');
INSERT INTO `bm_action_log` VALUES ('1340', '8', '1', '2130706433', 'attribute', '300', '操作url：/admin/attribute/update.html', '1', '1459152425');
INSERT INTO `bm_action_log` VALUES ('1341', '8', '1', '2130706433', 'attribute', '301', '操作url：/admin/attribute/update.html', '1', '1459152507');
INSERT INTO `bm_action_log` VALUES ('1342', '8', '1', '2130706433', 'attribute', '301', '操作url：/admin/attribute/update.html', '1', '1459152868');
INSERT INTO `bm_action_log` VALUES ('1343', '8', '1', '2130706433', 'attribute', '302', '操作url：/admin/attribute/update.html', '1', '1459152917');
INSERT INTO `bm_action_log` VALUES ('1344', '8', '1', '2130706433', 'attribute', '303', '操作url：/admin/attribute/update.html', '1', '1459152978');
INSERT INTO `bm_action_log` VALUES ('1345', '8', '1', '2130706433', 'attribute', '304', '操作url：/admin/attribute/update.html', '1', '1459152998');
INSERT INTO `bm_action_log` VALUES ('1346', '8', '1', '2130706433', 'attribute', '305', '操作url：/admin/attribute/update.html', '1', '1459153029');
INSERT INTO `bm_action_log` VALUES ('1347', '8', '1', '2130706433', 'attribute', '306', '操作url：/admin/attribute/update.html', '1', '1459153126');
INSERT INTO `bm_action_log` VALUES ('1348', '8', '1', '2130706433', 'attribute', '307', '操作url：/admin/attribute/update.html', '1', '1459153150');
INSERT INTO `bm_action_log` VALUES ('1349', '8', '1', '2130706433', 'attribute', '308', '操作url：/admin/attribute/update.html', '1', '1459153182');
INSERT INTO `bm_action_log` VALUES ('1350', '8', '1', '2130706433', 'attribute', '309', '操作url：/admin/attribute/update.html', '1', '1459153342');
INSERT INTO `bm_action_log` VALUES ('1351', '8', '1', '2130706433', 'attribute', '309', '操作url：/admin/attribute/remove/id/309.html', '1', '1459153393');
INSERT INTO `bm_action_log` VALUES ('1352', '10', '1', '2130706433', 'Menu', '200', '操作url：/admin/menu/add.html', '1', '1459154346');
INSERT INTO `bm_action_log` VALUES ('1353', '10', '1', '2130706433', 'Menu', '200', '操作url：/admin/menu/edit.html', '1', '1459154530');
INSERT INTO `bm_action_log` VALUES ('1354', '7', '1', '2130706433', 'model', '40', '操作url：/admin/model/update.html', '1', '1459155639');
INSERT INTO `bm_action_log` VALUES ('1355', '7', '1', '2130706433', 'model', '40', '操作url：/admin/model/update.html', '1', '1459155683');
INSERT INTO `bm_action_log` VALUES ('1356', '8', '1', '2130706433', 'attribute', '310', '操作url：/admin/attribute/update.html', '1', '1459157068');
INSERT INTO `bm_action_log` VALUES ('1357', '8', '1', '2130706433', 'attribute', '310', '操作url：/admin/attribute/remove/id/310.html', '1', '1459157279');
INSERT INTO `bm_action_log` VALUES ('1358', '10', '1', '2130706433', 'Menu', '200', '操作url：/admin/menu/edit.html', '1', '1459157879');
INSERT INTO `bm_action_log` VALUES ('1359', '7', '1', '2130706433', 'model', '13', '操作url：/admin/model/update.html', '1', '1459158540');
INSERT INTO `bm_action_log` VALUES ('1360', '7', '1', '2130706433', 'model', '13', '操作url：/admin/model/update.html', '1', '1459159335');
INSERT INTO `bm_action_log` VALUES ('1361', '10', '1', '2130706433', 'Menu', '201', '操作url：/admin/menu/add.html', '1', '1459159395');
INSERT INTO `bm_action_log` VALUES ('1362', '7', '1', '2130706433', 'model', '13', '操作url：/admin/model/update.html', '1', '1459159509');
INSERT INTO `bm_action_log` VALUES ('1363', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-28 18:39登录了后台', '1', '1459161545');
INSERT INTO `bm_action_log` VALUES ('1364', '7', '1', '2130706433', 'model', '13', '操作url：/admin/model/update.html', '1', '1459161677');
INSERT INTO `bm_action_log` VALUES ('1365', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-29 09:46登录了后台', '1', '1459215992');
INSERT INTO `bm_action_log` VALUES ('1366', '1', '1', '2130706433', 'member', '1', 'admin在2016-03-29 14:07登录了后台', '1', '1459231632');
INSERT INTO `bm_action_log` VALUES ('1367', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-03 21:17登录了后台', '1', '1459689459');
INSERT INTO `bm_action_log` VALUES ('1368', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-04 13:34登录了后台', '1', '1459748042');
INSERT INTO `bm_action_log` VALUES ('1369', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-04 14:49登录了后台', '1', '1459752582');
INSERT INTO `bm_action_log` VALUES ('1370', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-04 14:55登录了后台', '1', '1459752929');
INSERT INTO `bm_action_log` VALUES ('1371', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-04 15:02登录了后台', '1', '1459753334');
INSERT INTO `bm_action_log` VALUES ('1372', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-04 15:32登录了后台', '1', '1459755152');
INSERT INTO `bm_action_log` VALUES ('1373', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-04 15:38登录了后台', '1', '1459755492');
INSERT INTO `bm_action_log` VALUES ('1374', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-04 16:23登录了后台', '1', '1459758189');
INSERT INTO `bm_action_log` VALUES ('1375', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-04 16:55登录了后台', '1', '1459760134');
INSERT INTO `bm_action_log` VALUES ('1376', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-04 17:04登录了后台', '1', '1459760664');
INSERT INTO `bm_action_log` VALUES ('1377', '10', '1', '2130706433', 'Menu', '202', '操作url：/admin/menu/add.html', '1', '1459761257');
INSERT INTO `bm_action_log` VALUES ('1378', '10', '1', '2130706433', 'Menu', '202', '操作url：/admin/menu/edit.html', '1', '1459761310');
INSERT INTO `bm_action_log` VALUES ('1379', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-04 19:54登录了后台', '1', '1459770894');
INSERT INTO `bm_action_log` VALUES ('1380', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-04 20:57登录了后台', '1', '1459774627');
INSERT INTO `bm_action_log` VALUES ('1381', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-04 21:58登录了后台', '1', '1459778304');
INSERT INTO `bm_action_log` VALUES ('1382', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-07 21:08登录了后台', '1', '1460034516');
INSERT INTO `bm_action_log` VALUES ('1383', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-07 21:17登录了后台', '1', '1460035069');
INSERT INTO `bm_action_log` VALUES ('1384', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-14 19:17登录了后台', '1', '1460632678');
INSERT INTO `bm_action_log` VALUES ('1385', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-14 20:03登录了后台', '1', '1460635383');
INSERT INTO `bm_action_log` VALUES ('1386', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-14 20:09登录了后台', '1', '1460635774');
INSERT INTO `bm_action_log` VALUES ('1387', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-16 00:59登录了后台', '1', '1460739593');
INSERT INTO `bm_action_log` VALUES ('1388', '8', '1', '2130706433', 'attribute', '311', '操作url：/admin/attribute/update.html', '1', '1460740791');
INSERT INTO `bm_action_log` VALUES ('1389', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1460741483');
INSERT INTO `bm_action_log` VALUES ('1390', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-16 01:35登录了后台', '1', '1460741736');
INSERT INTO `bm_action_log` VALUES ('1391', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-16 14:27登录了后台', '1', '1460788021');
INSERT INTO `bm_action_log` VALUES ('1392', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1460799122');
INSERT INTO `bm_action_log` VALUES ('1393', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1460799304');
INSERT INTO `bm_action_log` VALUES ('1394', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1460799358');
INSERT INTO `bm_action_log` VALUES ('1395', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1460799382');
INSERT INTO `bm_action_log` VALUES ('1396', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1460799409');
INSERT INTO `bm_action_log` VALUES ('1397', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1460799444');
INSERT INTO `bm_action_log` VALUES ('1398', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1460804838');
INSERT INTO `bm_action_log` VALUES ('1399', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1460805250');
INSERT INTO `bm_action_log` VALUES ('1400', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1460805591');
INSERT INTO `bm_action_log` VALUES ('1401', '8', '1', '2130706433', 'attribute', '311', '操作url：/Admin/Attribute/update.html', '1', '1460806086');
INSERT INTO `bm_action_log` VALUES ('1402', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-16 20:38登录了后台', '1', '1460810306');
INSERT INTO `bm_action_log` VALUES ('1403', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-16 20:44登录了后台', '1', '1460810699');
INSERT INTO `bm_action_log` VALUES ('1404', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-16 21:04登录了后台', '1', '1460811857');
INSERT INTO `bm_action_log` VALUES ('1405', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-16 21:06登录了后台', '1', '1460812007');
INSERT INTO `bm_action_log` VALUES ('1406', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-16 21:11登录了后台', '1', '1460812280');
INSERT INTO `bm_action_log` VALUES ('1407', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-16 21:16登录了后台', '1', '1460812579');
INSERT INTO `bm_action_log` VALUES ('1408', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-16 21:18登录了后台', '1', '1460812701');
INSERT INTO `bm_action_log` VALUES ('1409', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-16 21:53登录了后台', '1', '1460814784');
INSERT INTO `bm_action_log` VALUES ('1410', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-16 22:17登录了后台', '1', '1460816259');
INSERT INTO `bm_action_log` VALUES ('1411', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-17 00:29登录了后台', '1', '1460824183');
INSERT INTO `bm_action_log` VALUES ('1412', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-17 00:37登录了后台', '1', '1460824635');
INSERT INTO `bm_action_log` VALUES ('1413', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-17 01:17登录了后台', '1', '1460827058');
INSERT INTO `bm_action_log` VALUES ('1414', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-17 01:36登录了后台', '1', '1460828188');
INSERT INTO `bm_action_log` VALUES ('1415', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-17 01:59登录了后台', '1', '1460829576');
INSERT INTO `bm_action_log` VALUES ('1416', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-17 02:27登录了后台', '1', '1460831263');
INSERT INTO `bm_action_log` VALUES ('1417', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-17 14:22登录了后台', '1', '1460874164');
INSERT INTO `bm_action_log` VALUES ('1418', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-17 15:03登录了后台', '1', '1460876593');
INSERT INTO `bm_action_log` VALUES ('1419', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-17 15:14登录了后台', '1', '1460877272');
INSERT INTO `bm_action_log` VALUES ('1420', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-17 15:16登录了后台', '1', '1460877387');
INSERT INTO `bm_action_log` VALUES ('1421', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-17 15:47登录了后台', '1', '1460879238');
INSERT INTO `bm_action_log` VALUES ('1422', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-17 19:48登录了后台', '1', '1460893699');
INSERT INTO `bm_action_log` VALUES ('1423', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-17 19:53登录了后台', '1', '1460894022');
INSERT INTO `bm_action_log` VALUES ('1424', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-17 20:01登录了后台', '1', '1460894494');
INSERT INTO `bm_action_log` VALUES ('1425', '8', '1', '2130706433', 'attribute', '312', '操作url：/admin/attribute/update.html', '1', '1460899846');
INSERT INTO `bm_action_log` VALUES ('1426', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1460899911');
INSERT INTO `bm_action_log` VALUES ('1427', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1460902816');
INSERT INTO `bm_action_log` VALUES ('1428', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-17 22:22登录了后台', '1', '1460902921');
INSERT INTO `bm_action_log` VALUES ('1429', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-18 14:19登录了后台', '1', '1460960373');
INSERT INTO `bm_action_log` VALUES ('1430', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-18 21:06登录了后台', '1', '1460984786');
INSERT INTO `bm_action_log` VALUES ('1431', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-18 21:43登录了后台', '1', '1460986990');
INSERT INTO `bm_action_log` VALUES ('1432', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-18 21:45登录了后台', '1', '1460987106');
INSERT INTO `bm_action_log` VALUES ('1433', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-18 21:53登录了后台', '1', '1460987627');
INSERT INTO `bm_action_log` VALUES ('1434', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-18 22:21登录了后台', '1', '1460989267');
INSERT INTO `bm_action_log` VALUES ('1435', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-19 00:37登录了后台', '1', '1460997473');
INSERT INTO `bm_action_log` VALUES ('1436', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-19 09:39登录了后台', '1', '1461029995');
INSERT INTO `bm_action_log` VALUES ('1437', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-19 12:12登录了后台', '1', '1461039131');
INSERT INTO `bm_action_log` VALUES ('1438', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-19 12:22登录了后台', '1', '1461039751');
INSERT INTO `bm_action_log` VALUES ('1439', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-19 12:38登录了后台', '1', '1461040724');
INSERT INTO `bm_action_log` VALUES ('1440', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-19 15:30登录了后台', '1', '1461051034');
INSERT INTO `bm_action_log` VALUES ('1441', '8', '1', '2130706433', 'attribute', '313', '操作url：/Admin/Attribute/update.html', '1', '1461060115');
INSERT INTO `bm_action_log` VALUES ('1442', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1461060135');
INSERT INTO `bm_action_log` VALUES ('1443', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-19 19:10登录了后台', '1', '1461064208');
INSERT INTO `bm_action_log` VALUES ('1444', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-19 19:42登录了后台', '1', '1461066130');
INSERT INTO `bm_action_log` VALUES ('1445', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-20 09:46登录了后台', '1', '1461116779');
INSERT INTO `bm_action_log` VALUES ('1446', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-20 09:58登录了后台', '1', '1461117532');
INSERT INTO `bm_action_log` VALUES ('1447', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-20 10:33登录了后台', '1', '1461119613');
INSERT INTO `bm_action_log` VALUES ('1448', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-21 19:31登录了后台', '1', '1461238302');
INSERT INTO `bm_action_log` VALUES ('1449', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-21 19:35登录了后台', '1', '1461238556');
INSERT INTO `bm_action_log` VALUES ('1450', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-23 01:21登录了后台', '1', '1461345697');
INSERT INTO `bm_action_log` VALUES ('1451', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-23 02:27登录了后台', '1', '1461349672');
INSERT INTO `bm_action_log` VALUES ('1452', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-23 18:42登录了后台', '1', '1461408178');
INSERT INTO `bm_action_log` VALUES ('1453', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-24 01:35登录了后台', '1', '1461432923');
INSERT INTO `bm_action_log` VALUES ('1454', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-26 21:21登录了后台', '1', '1461676908');
INSERT INTO `bm_action_log` VALUES ('1455', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-26 22:19登录了后台', '1', '1461680393');
INSERT INTO `bm_action_log` VALUES ('1456', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-26 23:36登录了后台', '1', '1461684987');
INSERT INTO `bm_action_log` VALUES ('1457', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-29 19:29登录了后台', '1', '1461929351');
INSERT INTO `bm_action_log` VALUES ('1458', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-30 20:16登录了后台', '1', '1462018597');
INSERT INTO `bm_action_log` VALUES ('1459', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-30 20:55登录了后台', '1', '1462020912');
INSERT INTO `bm_action_log` VALUES ('1460', '1', '1', '2130706433', 'member', '1', 'admin在2016-04-30 21:13登录了后台', '1', '1462022026');
INSERT INTO `bm_action_log` VALUES ('1461', '1', '1', '2130706433', 'member', '1', 'admin在2016-05-02 12:04登录了后台', '1', '1462161878');
INSERT INTO `bm_action_log` VALUES ('1462', '1', '1', '2130706433', 'member', '1', 'admin在2016-05-05 22:23登录了后台', '1', '1462458223');
INSERT INTO `bm_action_log` VALUES ('1463', '1', '1', '2130706433', 'member', '1', 'admin在2016-05-06 09:59登录了后台', '1', '1462499964');
INSERT INTO `bm_action_log` VALUES ('1464', '10', '1', '2130706433', 'Menu', '201', '操作url：/admin/menu/edit.html', '1', '1462500246');
INSERT INTO `bm_action_log` VALUES ('1465', '1', '1', '2130706433', 'member', '1', 'admin在2016-05-06 11:50登录了后台', '1', '1462506622');
INSERT INTO `bm_action_log` VALUES ('1466', '1', '1', '2130706433', 'member', '1', 'admin在2016-05-06 11:53登录了后台', '1', '1462506819');
INSERT INTO `bm_action_log` VALUES ('1467', '1', '1', '2130706433', 'member', '1', 'admin在2016-05-06 12:21登录了后台', '1', '1462508514');
INSERT INTO `bm_action_log` VALUES ('1468', '1', '1', '2130706433', 'member', '1', 'admin在2016-05-06 12:27登录了后台', '1', '1462508832');
INSERT INTO `bm_action_log` VALUES ('1469', '1', '1', '2130706433', 'member', '1', 'admin在2016-05-06 12:27登录了后台', '1', '1462508846');
INSERT INTO `bm_action_log` VALUES ('1470', '1', '1', '2130706433', 'member', '1', 'admin在2016-05-06 12:33登录了后台', '1', '1462509214');
INSERT INTO `bm_action_log` VALUES ('1471', '1', '1', '2130706433', 'member', '1', 'admin在2016-05-06 14:09登录了后台', '1', '1462514946');
INSERT INTO `bm_action_log` VALUES ('1472', '10', '1', '2130706433', 'Menu', '68', '操作url：/admin/menu/edit.html', '1', '1462515140');
INSERT INTO `bm_action_log` VALUES ('1473', '10', '1', '2130706433', 'Menu', '68', '操作url：/admin/menu/edit.html', '1', '1462515155');
INSERT INTO `bm_action_log` VALUES ('1474', '10', '1', '2130706433', 'Menu', '152', '操作url：/admin/menu/edit.html', '1', '1462515169');
INSERT INTO `bm_action_log` VALUES ('1475', '10', '1', '2130706433', 'Menu', '169', '操作url：/admin/menu/edit.html', '1', '1462515397');
INSERT INTO `bm_action_log` VALUES ('1476', '10', '1', '2130706433', 'Menu', '183', '操作url：/admin/menu/edit.html', '1', '1462515411');
INSERT INTO `bm_action_log` VALUES ('1477', '10', '1', '2130706433', 'Menu', '123', '操作url：/admin/menu/edit.html', '1', '1462515446');
INSERT INTO `bm_action_log` VALUES ('1478', '10', '1', '2130706433', 'Menu', '146', '操作url：/admin/menu/edit.html', '1', '1462516058');
INSERT INTO `bm_action_log` VALUES ('1479', '10', '1', '2130706433', 'Menu', '193', '操作url：/admin/menu/edit.html', '1', '1462516095');
INSERT INTO `bm_action_log` VALUES ('1480', '10', '1', '2130706433', 'Menu', '195', '操作url：/admin/menu/edit.html', '1', '1462516102');
INSERT INTO `bm_action_log` VALUES ('1481', '10', '1', '2130706433', 'Menu', '68', '操作url：/admin/menu/edit.html', '1', '1462516150');
INSERT INTO `bm_action_log` VALUES ('1482', '10', '1', '2130706433', 'Menu', '69', '操作url：/admin/menu/edit.html', '1', '1462516223');
INSERT INTO `bm_action_log` VALUES ('1483', '10', '1', '2130706433', 'Menu', '69', '操作url：/admin/menu/edit.html', '1', '1462516273');
INSERT INTO `bm_action_log` VALUES ('1484', '10', '1', '2130706433', 'Menu', '150', '操作url：/admin/menu/edit.html', '1', '1462516370');
INSERT INTO `bm_action_log` VALUES ('1485', '10', '1', '2130706433', 'Menu', '162', '操作url：/admin/menu/edit.html', '1', '1462516378');
INSERT INTO `bm_action_log` VALUES ('1486', '10', '1', '2130706433', 'Menu', '163', '操作url：/admin/menu/edit.html', '1', '1462516394');
INSERT INTO `bm_action_log` VALUES ('1487', '10', '1', '2130706433', 'Menu', '200', '操作url：/admin/menu/edit.html', '1', '1462516429');
INSERT INTO `bm_action_log` VALUES ('1488', '10', '1', '2130706433', 'Menu', '201', '操作url：/admin/menu/edit.html', '1', '1462516440');
INSERT INTO `bm_action_log` VALUES ('1489', '1', '1', '2130706433', 'member', '1', 'admin在2016-05-06 14:36登录了后台', '1', '1462516579');
INSERT INTO `bm_action_log` VALUES ('1490', '1', '1', '2130706433', 'member', '1', 'admin在2016-05-06 14:39登录了后台', '1', '1462516746');
INSERT INTO `bm_action_log` VALUES ('1491', '1', '1', '2130706433', 'member', '1', 'admin在2016-05-06 14:42登录了后台', '1', '1462516962');
INSERT INTO `bm_action_log` VALUES ('1492', '10', '1', '2130706433', 'Menu', '68', '操作url：/admin/menu/edit.html', '1', '1462517748');
INSERT INTO `bm_action_log` VALUES ('1493', '10', '1', '2130706433', 'Menu', '150', '操作url：/admin/menu/edit.html', '1', '1462518465');
INSERT INTO `bm_action_log` VALUES ('1494', '10', '1', '2130706433', 'Menu', '183', '操作url：/admin/menu/edit.html', '1', '1466403648');
INSERT INTO `bm_action_log` VALUES ('1495', '10', '1', '2130706433', 'Menu', '201', '操作url：/admin/menu/edit.html', '1', '1466403707');
INSERT INTO `bm_action_log` VALUES ('1496', '10', '1', '2130706433', 'Menu', '200', '操作url：/admin/menu/edit.html', '1', '1466403716');
INSERT INTO `bm_action_log` VALUES ('1497', '10', '1', '2130706433', 'Menu', '201', '操作url：/admin/menu/edit.html', '1', '1466404026');
INSERT INTO `bm_action_log` VALUES ('1498', '1', '1', '2130706433', 'member', '1', 'admin在2016-06-29 15:44登录了后台', '1', '1467186242');
INSERT INTO `bm_action_log` VALUES ('1499', '10', '1', '2130706433', 'Menu', '169', '操作url：/admin/menu/edit.html', '1', '1468314313');
INSERT INTO `bm_action_log` VALUES ('1500', '1', '1', '2130706433', 'member', '1', 'admin在2016-07-15 16:37登录了后台', '1', '1468571842');
INSERT INTO `bm_action_log` VALUES ('1501', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-01 14:42登录了后台', '1', '1472712176');
INSERT INTO `bm_action_log` VALUES ('1502', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-06 10:00登录了后台', '1', '1473127249');
INSERT INTO `bm_action_log` VALUES ('1503', '10', '1', '2130706433', 'Menu', '75', '操作url：/admin/menu/edit.html', '1', '1473127306');
INSERT INTO `bm_action_log` VALUES ('1504', '10', '1', '2130706433', 'Menu', '58', '操作url：/admin/menu/edit.html', '1', '1473127320');
INSERT INTO `bm_action_log` VALUES ('1505', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del/id/162.html', '1', '1473130477');
INSERT INTO `bm_action_log` VALUES ('1506', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del/id/151.html', '1', '1473130500');
INSERT INTO `bm_action_log` VALUES ('1507', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del.html', '1', '1473130557');
INSERT INTO `bm_action_log` VALUES ('1508', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del.html', '1', '1473130589');
INSERT INTO `bm_action_log` VALUES ('1509', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del.html', '1', '1473131308');
INSERT INTO `bm_action_log` VALUES ('1510', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del.html', '1', '1473131318');
INSERT INTO `bm_action_log` VALUES ('1511', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del.html', '1', '1473131323');
INSERT INTO `bm_action_log` VALUES ('1512', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del.html', '1', '1473131328');
INSERT INTO `bm_action_log` VALUES ('1513', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del.html', '1', '1473131337');
INSERT INTO `bm_action_log` VALUES ('1514', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del.html', '1', '1473131343');
INSERT INTO `bm_action_log` VALUES ('1515', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del.html', '1', '1473131349');
INSERT INTO `bm_action_log` VALUES ('1516', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del.html', '1', '1473131356');
INSERT INTO `bm_action_log` VALUES ('1517', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del.html', '1', '1473131362');
INSERT INTO `bm_action_log` VALUES ('1518', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del/id/123.html', '1', '1473131378');
INSERT INTO `bm_action_log` VALUES ('1519', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1473133478');
INSERT INTO `bm_action_log` VALUES ('1520', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1473133583');
INSERT INTO `bm_action_log` VALUES ('1521', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1473133642');
INSERT INTO `bm_action_log` VALUES ('1522', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del/id/124.html', '1', '1473153907');
INSERT INTO `bm_action_log` VALUES ('1523', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del/id/169.html', '1', '1473153915');
INSERT INTO `bm_action_log` VALUES ('1524', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del/id/93.html', '1', '1473153940');
INSERT INTO `bm_action_log` VALUES ('1525', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/menu/del/id/152.html', '1', '1473153947');
INSERT INTO `bm_action_log` VALUES ('1526', '10', '1', '2130706433', 'Menu', '76', '操作url：/admin/menu/edit.html', '1', '1473153993');
INSERT INTO `bm_action_log` VALUES ('1527', '10', '1', '2130706433', 'Menu', '76', '操作url：/admin/menu/edit.html', '1', '1473154017');
INSERT INTO `bm_action_log` VALUES ('1528', '10', '1', '2130706433', 'Menu', '80', '操作url：/admin/menu/edit.html', '1', '1473154036');
INSERT INTO `bm_action_log` VALUES ('1529', '10', '1', '2130706433', 'Menu', '80', '操作url：/admin/menu/edit.html', '1', '1473154056');
INSERT INTO `bm_action_log` VALUES ('1530', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-06 20:05登录了后台', '1', '1473163526');
INSERT INTO `bm_action_log` VALUES ('1531', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1473163802');
INSERT INTO `bm_action_log` VALUES ('1532', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1473164297');
INSERT INTO `bm_action_log` VALUES ('1533', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1473164661');
INSERT INTO `bm_action_log` VALUES ('1534', '8', '1', '2130706433', 'attribute', '115', '操作url：/admin/attribute/update.html', '1', '1473166679');
INSERT INTO `bm_action_log` VALUES ('1535', '8', '1', '2130706433', 'attribute', '114', '操作url：/admin/attribute/update.html', '1', '1473166686');
INSERT INTO `bm_action_log` VALUES ('1536', '8', '1', '2130706433', 'attribute', '113', '操作url：/admin/attribute/update.html', '1', '1473166696');
INSERT INTO `bm_action_log` VALUES ('1537', '8', '1', '2130706433', 'attribute', '112', '操作url：/admin/attribute/update.html', '1', '1473166705');
INSERT INTO `bm_action_log` VALUES ('1538', '7', '1', '2130706433', 'model', '41', '操作url：/admin/model/update.html', '1', '1473176903');
INSERT INTO `bm_action_log` VALUES ('1539', '8', '1', '2130706433', 'attribute', '314', '操作url：/admin/attribute/update.html', '1', '1473176953');
INSERT INTO `bm_action_log` VALUES ('1540', '8', '1', '2130706433', 'attribute', '315', '操作url：/admin/attribute/update.html', '1', '1473177046');
INSERT INTO `bm_action_log` VALUES ('1541', '8', '1', '2130706433', 'attribute', '316', '操作url：/admin/attribute/update.html', '1', '1473177075');
INSERT INTO `bm_action_log` VALUES ('1542', '8', '1', '2130706433', 'attribute', '317', '操作url：/admin/attribute/update.html', '1', '1473177111');
INSERT INTO `bm_action_log` VALUES ('1543', '10', '1', '2130706433', 'Menu', '203', '操作url：/admin/menu/add.html', '1', '1473178926');
INSERT INTO `bm_action_log` VALUES ('1544', '10', '1', '2130706433', 'Menu', '203', '操作url：/admin/menu/edit.html', '1', '1473178957');
INSERT INTO `bm_action_log` VALUES ('1545', '10', '1', '2130706433', 'Menu', '203', '操作url：/admin/menu/edit.html', '1', '1473178981');
INSERT INTO `bm_action_log` VALUES ('1546', '10', '1', '2130706433', 'Menu', '183', '操作url：/admin/menu/edit.html', '1', '1473179002');
INSERT INTO `bm_action_log` VALUES ('1547', '10', '1', '2130706433', 'Menu', '204', '操作url：/admin/menu/add.html', '1', '1473179069');
INSERT INTO `bm_action_log` VALUES ('1548', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-07 09:37登录了后台', '1', '1473212226');
INSERT INTO `bm_action_log` VALUES ('1549', '10', '1', '2130706433', 'Menu', '68', '操作url：/Admin/Menu/edit.html', '1', '1473212511');
INSERT INTO `bm_action_log` VALUES ('1550', '7', '1', '2130706433', 'model', '42', '操作url：/Admin/Model/update.html', '1', '1473212946');
INSERT INTO `bm_action_log` VALUES ('1551', '8', '1', '2130706433', 'attribute', '318', '操作url：/Admin/Attribute/update.html', '1', '1473212986');
INSERT INTO `bm_action_log` VALUES ('1552', '8', '1', '2130706433', 'attribute', '319', '操作url：/Admin/Attribute/update.html', '1', '1473213042');
INSERT INTO `bm_action_log` VALUES ('1553', '8', '1', '2130706433', 'attribute', '320', '操作url：/Admin/Attribute/update.html', '1', '1473213071');
INSERT INTO `bm_action_log` VALUES ('1554', '10', '1', '2130706433', 'Menu', '205', '操作url：/Admin/Menu/add.html', '1', '1473214098');
INSERT INTO `bm_action_log` VALUES ('1555', '7', '1', '2130706433', 'model', '42', '操作url：/Admin/Model/update.html', '1', '1473214358');
INSERT INTO `bm_action_log` VALUES ('1556', '7', '1', '2130706433', 'model', '42', '操作url：/Admin/Model/update.html', '1', '1473214497');
INSERT INTO `bm_action_log` VALUES ('1557', '7', '1', '2130706433', 'model', '42', '操作url：/Admin/Model/update.html', '1', '1473214560');
INSERT INTO `bm_action_log` VALUES ('1558', '7', '1', '2130706433', 'model', '42', '操作url：/Admin/Model/update.html', '1', '1473214649');
INSERT INTO `bm_action_log` VALUES ('1559', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1473232485');
INSERT INTO `bm_action_log` VALUES ('1560', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1473232704');
INSERT INTO `bm_action_log` VALUES ('1561', '7', '1', '2130706433', 'model', '43', '操作url：/Admin/Model/update.html', '1', '1473233205');
INSERT INTO `bm_action_log` VALUES ('1562', '8', '1', '2130706433', 'attribute', '321', '操作url：/Admin/Attribute/update.html', '1', '1473233245');
INSERT INTO `bm_action_log` VALUES ('1563', '8', '1', '2130706433', 'attribute', '322', '操作url：/Admin/Attribute/update.html', '1', '1473233279');
INSERT INTO `bm_action_log` VALUES ('1564', '8', '1', '2130706433', 'attribute', '323', '操作url：/Admin/Attribute/update.html', '1', '1473233531');
INSERT INTO `bm_action_log` VALUES ('1565', '8', '1', '2130706433', 'attribute', '324', '操作url：/Admin/Attribute/update.html', '1', '1473233711');
INSERT INTO `bm_action_log` VALUES ('1566', '8', '1', '2130706433', 'attribute', '325', '操作url：/Admin/Attribute/update.html', '1', '1473233757');
INSERT INTO `bm_action_log` VALUES ('1567', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-08 09:46登录了后台', '1', '1473299214');
INSERT INTO `bm_action_log` VALUES ('1568', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1473321206');
INSERT INTO `bm_action_log` VALUES ('1569', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1473325778');
INSERT INTO `bm_action_log` VALUES ('1570', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1473331252');
INSERT INTO `bm_action_log` VALUES ('1571', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-08 19:47登录了后台', '1', '1473335270');
INSERT INTO `bm_action_log` VALUES ('1572', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1473339660');
INSERT INTO `bm_action_log` VALUES ('1573', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-08 21:18登录了后台', '1', '1473340718');
INSERT INTO `bm_action_log` VALUES ('1574', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1473354020');
INSERT INTO `bm_action_log` VALUES ('1575', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1473354094');
INSERT INTO `bm_action_log` VALUES ('1576', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-09 10:25登录了后台', '1', '1473387934');
INSERT INTO `bm_action_log` VALUES ('1577', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-09 11:55登录了后台', '1', '1473393318');
INSERT INTO `bm_action_log` VALUES ('1578', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1473395343');
INSERT INTO `bm_action_log` VALUES ('1579', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-09 14:26登录了后台', '1', '1473402365');
INSERT INTO `bm_action_log` VALUES ('1580', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-09 17:05登录了后台', '1', '1473411926');
INSERT INTO `bm_action_log` VALUES ('1581', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-12 09:38登录了后台', '1', '1473644307');
INSERT INTO `bm_action_log` VALUES ('1582', '8', '1', '2130706433', 'attribute', '314', '操作url：/Admin/Attribute/update.html', '1', '1473672139');
INSERT INTO `bm_action_log` VALUES ('1583', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-13 09:44登录了后台', '1', '1473731087');
INSERT INTO `bm_action_log` VALUES ('1584', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-18 11:37登录了后台', '1', '1474169856');
INSERT INTO `bm_action_log` VALUES ('1585', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-18 12:04登录了后台', '1', '1474171456');
INSERT INTO `bm_action_log` VALUES ('1586', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-18 12:06登录了后台', '1', '1474171565');
INSERT INTO `bm_action_log` VALUES ('1587', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-18 12:12登录了后台', '1', '1474171923');
INSERT INTO `bm_action_log` VALUES ('1588', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-18 12:13登录了后台', '1', '1474171986');
INSERT INTO `bm_action_log` VALUES ('1589', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-18 12:13登录了后台', '1', '1474172019');
INSERT INTO `bm_action_log` VALUES ('1590', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-18 14:28登录了后台', '1', '1474180082');
INSERT INTO `bm_action_log` VALUES ('1591', '8', '1', '2130706433', 'attribute', '326', '操作url：/admin/attribute/update.html', '1', '1474185466');
INSERT INTO `bm_action_log` VALUES ('1592', '8', '1', '2130706433', 'attribute', '326', '操作url：/admin/attribute/remove/id/326.html', '1', '1474185493');
INSERT INTO `bm_action_log` VALUES ('1593', '8', '1', '2130706433', 'attribute', '327', '操作url：/admin/attribute/update.html', '1', '1474185521');
INSERT INTO `bm_action_log` VALUES ('1594', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1474187565');
INSERT INTO `bm_action_log` VALUES ('1595', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-19 11:03登录了后台', '1', '1474254190');
INSERT INTO `bm_action_log` VALUES ('1596', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-20 11:21登录了后台', '1', '1474341667');
INSERT INTO `bm_action_log` VALUES ('1597', '7', '1', '2130706433', 'model', '44', '操作url：/admin/model/update.html', '1', '1474358835');
INSERT INTO `bm_action_log` VALUES ('1598', '10', '1', '2130706433', 'Menu', '68', '操作url：/admin/menu/edit.html', '1', '1474364100');
INSERT INTO `bm_action_log` VALUES ('1599', '10', '1', '2130706433', 'Menu', '206', '操作url：/admin/menu/add.html', '1', '1474364139');
INSERT INTO `bm_action_log` VALUES ('1600', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-21 09:37登录了后台', '1', '1474421872');
INSERT INTO `bm_action_log` VALUES ('1601', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-21 10:47登录了后台', '1', '1474426035');
INSERT INTO `bm_action_log` VALUES ('1602', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-21 11:00登录了后台', '1', '1474426808');
INSERT INTO `bm_action_log` VALUES ('1603', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-21 12:09登录了后台', '1', '1474430950');
INSERT INTO `bm_action_log` VALUES ('1604', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-21 16:40登录了后台', '1', '1474447233');
INSERT INTO `bm_action_log` VALUES ('1605', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-21 17:17登录了后台', '1', '1474449425');
INSERT INTO `bm_action_log` VALUES ('1606', '7', '1', '2130706433', 'model', '13', '操作url：/admin/model/update.html', '1', '1474512327');
INSERT INTO `bm_action_log` VALUES ('1607', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-22 12:22登录了后台', '1', '1474518128');
INSERT INTO `bm_action_log` VALUES ('1608', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-22 12:27登录了后台', '1', '1474518453');
INSERT INTO `bm_action_log` VALUES ('1609', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-27 10:09登录了后台', '1', '1474942150');
INSERT INTO `bm_action_log` VALUES ('1610', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-28 11:38登录了后台', '1', '1475033922');
INSERT INTO `bm_action_log` VALUES ('1611', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-28 15:30登录了后台', '1', '1475047857');
INSERT INTO `bm_action_log` VALUES ('1612', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-29 10:30登录了后台', '1', '1475116251');
INSERT INTO `bm_action_log` VALUES ('1613', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1475119436');
INSERT INTO `bm_action_log` VALUES ('1614', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1475119956');
INSERT INTO `bm_action_log` VALUES ('1615', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1475120611');
INSERT INTO `bm_action_log` VALUES ('1616', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1475120814');
INSERT INTO `bm_action_log` VALUES ('1617', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-29 12:30登录了后台', '1', '1475123435');
INSERT INTO `bm_action_log` VALUES ('1618', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-30 12:31登录了后台', '1', '1475209898');
INSERT INTO `bm_action_log` VALUES ('1619', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-10 09:53登录了后台', '1', '1476064397');
INSERT INTO `bm_action_log` VALUES ('1620', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-10 16:33登录了后台', '1', '1476088397');
INSERT INTO `bm_action_log` VALUES ('1621', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1476090419');
INSERT INTO `bm_action_log` VALUES ('1622', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1476090428');
INSERT INTO `bm_action_log` VALUES ('1623', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1476090436');
INSERT INTO `bm_action_log` VALUES ('1624', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-11 10:06登录了后台', '1', '1476151604');
INSERT INTO `bm_action_log` VALUES ('1625', '8', '1', '2130706433', 'attribute', '328', '操作url：/Admin/Attribute/update.html', '1', '1476153014');
INSERT INTO `bm_action_log` VALUES ('1626', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1476153072');
INSERT INTO `bm_action_log` VALUES ('1627', '7', '1', '2130706433', 'model', '40', '操作url：/Admin/Model/update.html', '1', '1476153358');
INSERT INTO `bm_action_log` VALUES ('1628', '7', '1', '2130706433', 'model', '41', '操作url：/Admin/Model/update.html', '1', '1476158763');
INSERT INTO `bm_action_log` VALUES ('1629', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-11 13:32登录了后台', '1', '1476163955');
INSERT INTO `bm_action_log` VALUES ('1630', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-12 09:52登录了后台', '1', '1476237177');
INSERT INTO `bm_action_log` VALUES ('1631', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1476237528');
INSERT INTO `bm_action_log` VALUES ('1632', '7', '1', '2130706433', 'model', '41', '操作url：/admin/model/update.html', '1', '1476237572');
INSERT INTO `bm_action_log` VALUES ('1633', '7', '1', '2130706433', 'model', '41', '操作url：/admin/model/update.html', '1', '1476239364');
INSERT INTO `bm_action_log` VALUES ('1634', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1476239384');
INSERT INTO `bm_action_log` VALUES ('1635', '7', '1', '2130706433', 'model', '41', '操作url：/admin/model/update.html', '1', '1476239410');
INSERT INTO `bm_action_log` VALUES ('1636', '7', '1', '2130706433', 'model', '41', '操作url：/admin/model/update.html', '1', '1476257655');
INSERT INTO `bm_action_log` VALUES ('1637', '7', '1', '2130706433', 'model', '41', '操作url：/admin/model/update.html', '1', '1476257717');
INSERT INTO `bm_action_log` VALUES ('1638', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-12 20:20登录了后台', '1', '1476274832');
INSERT INTO `bm_action_log` VALUES ('1639', '8', '1', '2130706433', 'attribute', '329', '操作url：/admin/attribute/update.html', '1', '1476278325');
INSERT INTO `bm_action_log` VALUES ('1640', '8', '1', '2130706433', 'attribute', '330', '操作url：/admin/attribute/update.html', '1', '1476278369');
INSERT INTO `bm_action_log` VALUES ('1641', '8', '1', '2130706433', 'attribute', '331', '操作url：/admin/attribute/update.html', '1', '1476278468');
INSERT INTO `bm_action_log` VALUES ('1642', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-14 09:58登录了后台', '1', '1476410292');
INSERT INTO `bm_action_log` VALUES ('1643', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-14 22:13登录了后台', '1', '1476454420');
INSERT INTO `bm_action_log` VALUES ('1644', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-15 17:58登录了后台', '1', '1476525512');
INSERT INTO `bm_action_log` VALUES ('1645', '8', '1', '2130706433', 'attribute', '332', '操作url：/admin/attribute/update.html', '1', '1476555157');
INSERT INTO `bm_action_log` VALUES ('1646', '8', '1', '2130706433', 'attribute', '332', '操作url：/admin/attribute/remove/id/332.html', '1', '1476555539');
INSERT INTO `bm_action_log` VALUES ('1647', '8', '1', '2130706433', 'attribute', '333', '操作url：/admin/attribute/update.html', '1', '1476555621');
INSERT INTO `bm_action_log` VALUES ('1648', '8', '1', '2130706433', 'attribute', '333', '操作url：/admin/attribute/update.html', '1', '1476555839');
INSERT INTO `bm_action_log` VALUES ('1649', '8', '1', '2130706433', 'attribute', '333', '操作url：/admin/attribute/remove/id/333.html', '1', '1476559661');
INSERT INTO `bm_action_log` VALUES ('1650', '8', '1', '2130706433', 'attribute', '334', '操作url：/admin/attribute/update.html', '1', '1476559714');
INSERT INTO `bm_action_log` VALUES ('1651', '8', '1', '2130706433', 'attribute', '334', '操作url：/admin/attribute/update.html', '1', '1476559768');
INSERT INTO `bm_action_log` VALUES ('1652', '8', '1', '2130706433', 'attribute', '334', '操作url：/admin/attribute/remove/id/334.html', '1', '1476559843');
INSERT INTO `bm_action_log` VALUES ('1653', '8', '1', '2130706433', 'attribute', '335', '操作url：/admin/attribute/update.html', '1', '1476559942');
INSERT INTO `bm_action_log` VALUES ('1654', '8', '1', '2130706433', 'attribute', '335', '操作url：/admin/attribute/remove/id/335.html', '1', '1476560004');
INSERT INTO `bm_action_log` VALUES ('1655', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-16 13:08登录了后台', '1', '1476594484');
INSERT INTO `bm_action_log` VALUES ('1656', '7', '1', '2130706433', 'model', '45', '操作url：/admin/model/update.html', '1', '1476609334');
INSERT INTO `bm_action_log` VALUES ('1657', '8', '1', '2130706433', 'attribute', '336', '操作url：/admin/attribute/update.html', '1', '1476609450');
INSERT INTO `bm_action_log` VALUES ('1658', '8', '1', '2130706433', 'attribute', '337', '操作url：/admin/attribute/update.html', '1', '1476609533');
INSERT INTO `bm_action_log` VALUES ('1659', '8', '1', '2130706433', 'attribute', '336', '操作url：/admin/attribute/update.html', '1', '1476609556');
INSERT INTO `bm_action_log` VALUES ('1660', '8', '1', '2130706433', 'attribute', '338', '操作url：/admin/attribute/update.html', '1', '1476609603');
INSERT INTO `bm_action_log` VALUES ('1661', '8', '1', '2130706433', 'attribute', '339', '操作url：/admin/attribute/update.html', '1', '1476609656');
INSERT INTO `bm_action_log` VALUES ('1662', '8', '1', '2130706433', 'attribute', '340', '操作url：/admin/attribute/update.html', '1', '1476609706');
INSERT INTO `bm_action_log` VALUES ('1663', '8', '1', '2130706433', 'attribute', '341', '操作url：/admin/attribute/update.html', '1', '1476609755');
INSERT INTO `bm_action_log` VALUES ('1664', '8', '1', '2130706433', 'attribute', '342', '操作url：/admin/attribute/update.html', '1', '1476609801');
INSERT INTO `bm_action_log` VALUES ('1665', '8', '1', '2130706433', 'attribute', '343', '操作url：/admin/attribute/update.html', '1', '1476609835');
INSERT INTO `bm_action_log` VALUES ('1666', '8', '1', '2130706433', 'attribute', '344', '操作url：/admin/attribute/update.html', '1', '1476609856');
INSERT INTO `bm_action_log` VALUES ('1667', '8', '1', '2130706433', 'attribute', '345', '操作url：/admin/attribute/update.html', '1', '1476609880');
INSERT INTO `bm_action_log` VALUES ('1668', '8', '1', '2130706433', 'attribute', '346', '操作url：/admin/attribute/update.html', '1', '1476609902');
INSERT INTO `bm_action_log` VALUES ('1669', '8', '1', '2130706433', 'attribute', '347', '操作url：/admin/attribute/update.html', '1', '1476609939');
INSERT INTO `bm_action_log` VALUES ('1670', '8', '1', '2130706433', 'attribute', '348', '操作url：/admin/attribute/update.html', '1', '1476609968');
INSERT INTO `bm_action_log` VALUES ('1671', '7', '1', '2130706433', 'model', '45', '操作url：/admin/model/update.html', '1', '1476610296');
INSERT INTO `bm_action_log` VALUES ('1672', '10', '1', '2130706433', 'Menu', '207', '操作url：/admin/menu/add.html', '1', '1476610512');
INSERT INTO `bm_action_log` VALUES ('1673', '10', '1', '2130706433', 'Menu', '208', '操作url：/admin/menu/add.html', '1', '1476610551');
INSERT INTO `bm_action_log` VALUES ('1674', '10', '1', '2130706433', 'Menu', '209', '操作url：/admin/menu/add.html', '1', '1476610583');
INSERT INTO `bm_action_log` VALUES ('1675', '10', '1', '2130706433', 'Menu', '207', '操作url：/admin/menu/edit.html', '1', '1476610639');
INSERT INTO `bm_action_log` VALUES ('1676', '7', '1', '2130706433', 'model', '45', '操作url：/admin/model/update.html', '1', '1476611702');
INSERT INTO `bm_action_log` VALUES ('1677', '8', '1', '2130706433', 'attribute', '336', '操作url：/admin/attribute/update.html', '1', '1476612445');
INSERT INTO `bm_action_log` VALUES ('1678', '8', '1', '2130706433', 'attribute', '337', '操作url：/admin/attribute/update.html', '1', '1476612458');
INSERT INTO `bm_action_log` VALUES ('1679', '8', '1', '2130706433', 'attribute', '338', '操作url：/admin/attribute/update.html', '1', '1476612470');
INSERT INTO `bm_action_log` VALUES ('1680', '8', '1', '2130706433', 'attribute', '339', '操作url：/admin/attribute/update.html', '1', '1476612485');
INSERT INTO `bm_action_log` VALUES ('1681', '8', '1', '2130706433', 'attribute', '340', '操作url：/admin/attribute/update.html', '1', '1476612495');
INSERT INTO `bm_action_log` VALUES ('1682', '8', '1', '2130706433', 'attribute', '341', '操作url：/admin/attribute/update.html', '1', '1476612507');
INSERT INTO `bm_action_log` VALUES ('1683', '7', '1', '2130706433', 'model', '45', '操作url：/admin/model/update.html', '1', '1476612793');
INSERT INTO `bm_action_log` VALUES ('1684', '7', '1', '2130706433', 'model', '29', '操作url：/admin/model/update.html', '1', '1476623651');
INSERT INTO `bm_action_log` VALUES ('1685', '7', '1', '2130706433', 'model', '46', '操作url：/admin/model/update.html', '1', '1476626326');
INSERT INTO `bm_action_log` VALUES ('1686', '8', '1', '2130706433', 'attribute', '349', '操作url：/admin/attribute/update.html', '1', '1476626348');
INSERT INTO `bm_action_log` VALUES ('1687', '8', '1', '2130706433', 'attribute', '350', '操作url：/admin/attribute/update.html', '1', '1476626464');
INSERT INTO `bm_action_log` VALUES ('1688', '8', '1', '2130706433', 'attribute', '351', '操作url：/admin/attribute/update.html', '1', '1476626619');
INSERT INTO `bm_action_log` VALUES ('1689', '1', '1', '2130706433', 'member', '1', 'admin在2017-02-24 10:55登录了后台', '1', '1487904928');
INSERT INTO `bm_action_log` VALUES ('1690', '1', '1', '2130706433', 'member', '1', 'admin在2017-02-24 10:58登录了后台', '1', '1487905128');
INSERT INTO `bm_action_log` VALUES ('1691', '1', '1', '2130706433', 'member', '1', 'admin在2017-02-28 12:19登录了后台', '1', '1488255555');
INSERT INTO `bm_action_log` VALUES ('1692', '10', '1', '2130706433', 'Menu', '210', '操作url：/Admin/Menu/add.html', '1', '1488255834');
INSERT INTO `bm_action_log` VALUES ('1693', '1', '1', '2130706433', 'member', '1', 'admin在2017-02-28 17:31登录了后台', '1', '1488274310');
INSERT INTO `bm_action_log` VALUES ('1694', '10', '1', '2130706433', 'Menu', '1', '操作url：/Admin/Menu/edit.html', '1', '1488274323');
INSERT INTO `bm_action_log` VALUES ('1695', '1', '1', '2130706433', 'member', '1', 'admin在2017-03-01 11:55登录了后台', '1', '1488340547');
INSERT INTO `bm_action_log` VALUES ('1696', '1', '1', '2130706433', 'member', '1', 'admin在2017-03-12 17:02登录了后台', '1', '1489309378');
INSERT INTO `bm_action_log` VALUES ('1697', '1', '1', '2130706433', 'member', '1', 'admin在2017-03-27 12:16登录了后台', '1', '1490588164');
INSERT INTO `bm_action_log` VALUES ('1698', '1', '1', '2130706433', 'member', '1', 'admin在2017-04-10 11:08登录了后台', '1', '1491793713');
INSERT INTO `bm_action_log` VALUES ('1699', '1', '1', '2130706433', 'member', '1', 'admin在2017-04-10 11:13登录了后台', '1', '1491794024');
INSERT INTO `bm_action_log` VALUES ('1700', '1', '1', '2130706433', 'member', '1', 'admin在2017-04-18 11:29登录了后台', '1', '1492486178');
INSERT INTO `bm_action_log` VALUES ('1701', '1', '1', '2130706433', 'member', '1', 'admin在2017-04-18 12:06登录了后台', '1', '1492488393');
INSERT INTO `bm_action_log` VALUES ('1702', '1', '1', '2130706433', 'member', '1', 'admin在2017-04-18 19:47登录了后台', '1', '1492516055');
INSERT INTO `bm_action_log` VALUES ('1703', '1', '1', '2130706433', 'member', '1', 'admin在2017-04-20 20:00登录了后台', '1', '1492689625');
INSERT INTO `bm_action_log` VALUES ('1704', '1', '1', '2130706433', 'member', '1', 'admin在2017-04-21 15:51登录了后台', '1', '1492761092');
INSERT INTO `bm_action_log` VALUES ('1705', '1', '1', '2130706433', 'member', '1', 'admin在2017-04-24 12:03登录了后台', '1', '1493006612');
INSERT INTO `bm_action_log` VALUES ('1706', '1', '1', '2130706433', 'member', '1', 'admin在2017-04-24 14:26登录了后台', '1', '1493015213');
INSERT INTO `bm_action_log` VALUES ('1707', '1', '1', '2130706433', 'member', '1', 'admin在2017-05-20 18:23登录了后台', '1', '1495275789');
INSERT INTO `bm_action_log` VALUES ('1708', '1', '1', '2130706433', 'member', '1', 'admin在2017-05-22 15:43登录了后台', '1', '1495439029');
INSERT INTO `bm_action_log` VALUES ('1709', '1', '1', '2130706433', 'member', '1', 'admin在2017-05-24 10:49登录了后台', '1', '1495594188');
INSERT INTO `bm_action_log` VALUES ('1710', '1', '1', '2130706433', 'member', '1', 'admin在2017-07-06 17:57登录了后台', '1', '1499335068');
INSERT INTO `bm_action_log` VALUES ('1711', '1', '1', '2130706433', 'member', '1', 'admin在2017-07-21 11:25登录了后台', '1', '1500607545');
INSERT INTO `bm_action_log` VALUES ('1712', '1', '1', '2130706433', 'member', '1', 'admin在2017-07-25 16:49登录了后台', '1', '1500972584');
INSERT INTO `bm_action_log` VALUES ('1713', '1', '1', '2130706433', 'member', '1', 'admin在2017-07-27 14:52登录了后台', '1', '1501138337');
INSERT INTO `bm_action_log` VALUES ('1714', '1', '1', '2130706433', 'member', '1', 'admin在2017-07-31 15:38登录了后台', '1', '1501486732');
INSERT INTO `bm_action_log` VALUES ('1715', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1501494120');
INSERT INTO `bm_action_log` VALUES ('1716', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1501494142');
INSERT INTO `bm_action_log` VALUES ('1717', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1501494158');
INSERT INTO `bm_action_log` VALUES ('1718', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1501494192');
INSERT INTO `bm_action_log` VALUES ('1719', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1501494303');
INSERT INTO `bm_action_log` VALUES ('1720', '7', '1', '2130706433', 'model', '29', '操作url：/Admin/Model/update.html', '1', '1501494325');
INSERT INTO `bm_action_log` VALUES ('1721', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-01 11:26登录了后台', '1', '1501557960');
INSERT INTO `bm_action_log` VALUES ('1722', '10', '1', '2130706433', 'Menu', '183', '操作url：/Admin/Menu/edit.html', '1', '1501560610');
INSERT INTO `bm_action_log` VALUES ('1723', '8', '1', '2130706433', 'attribute', '328', '操作url：/Admin/Attribute/remove/id/328.html', '1', '1501560797');
INSERT INTO `bm_action_log` VALUES ('1724', '8', '1', '2130706433', 'attribute', '327', '操作url：/Admin/Attribute/remove/id/327.html', '1', '1501560800');
INSERT INTO `bm_action_log` VALUES ('1725', '8', '1', '2130706433', 'attribute', '313', '操作url：/Admin/Attribute/remove/id/313.html', '1', '1501560805');
INSERT INTO `bm_action_log` VALUES ('1726', '8', '1', '2130706433', 'attribute', '312', '操作url：/Admin/Attribute/remove/id/312.html', '1', '1501560808');
INSERT INTO `bm_action_log` VALUES ('1727', '8', '1', '2130706433', 'attribute', '311', '操作url：/Admin/Attribute/remove/id/311.html', '1', '1501560812');
INSERT INTO `bm_action_log` VALUES ('1728', '8', '1', '2130706433', 'attribute', '262', '操作url：/Admin/Attribute/remove/id/262.html', '1', '1501560816');
INSERT INTO `bm_action_log` VALUES ('1729', '8', '1', '2130706433', 'attribute', '259', '操作url：/Admin/Attribute/remove/id/259.html', '1', '1501560820');
INSERT INTO `bm_action_log` VALUES ('1730', '8', '1', '2130706433', 'attribute', '258', '操作url：/Admin/Attribute/remove/id/258.html', '1', '1501560838');
INSERT INTO `bm_action_log` VALUES ('1731', '8', '1', '2130706433', 'attribute', '257', '操作url：/Admin/Attribute/remove/id/257.html', '1', '1501560841');
INSERT INTO `bm_action_log` VALUES ('1732', '8', '1', '2130706433', 'attribute', '256', '操作url：/Admin/Attribute/remove/id/256.html', '1', '1501560845');
INSERT INTO `bm_action_log` VALUES ('1733', '8', '1', '2130706433', 'attribute', '336', '操作url：/Admin/Attribute/remove/id/336.html', '1', '1501560878');
INSERT INTO `bm_action_log` VALUES ('1734', '8', '1', '2130706433', 'attribute', '337', '操作url：/Admin/Attribute/remove/id/337.html', '1', '1501560882');
INSERT INTO `bm_action_log` VALUES ('1735', '8', '1', '2130706433', 'attribute', '338', '操作url：/Admin/Attribute/remove/id/338.html', '1', '1501560886');
INSERT INTO `bm_action_log` VALUES ('1736', '8', '1', '2130706433', 'attribute', '339', '操作url：/Admin/Attribute/remove/id/339.html', '1', '1501560891');
INSERT INTO `bm_action_log` VALUES ('1737', '8', '1', '2130706433', 'attribute', '348', '操作url：/Admin/Attribute/remove/id/348.html', '1', '1501560898');
INSERT INTO `bm_action_log` VALUES ('1738', '8', '1', '2130706433', 'attribute', '347', '操作url：/Admin/Attribute/remove/id/347.html', '1', '1501560902');
INSERT INTO `bm_action_log` VALUES ('1739', '8', '1', '2130706433', 'attribute', '346', '操作url：/Admin/Attribute/remove/id/346.html', '1', '1501560906');
INSERT INTO `bm_action_log` VALUES ('1740', '8', '1', '2130706433', 'attribute', '345', '操作url：/Admin/Attribute/remove/id/345.html', '1', '1501560911');
INSERT INTO `bm_action_log` VALUES ('1741', '8', '1', '2130706433', 'attribute', '344', '操作url：/Admin/Attribute/remove/id/344.html', '1', '1501560915');
INSERT INTO `bm_action_log` VALUES ('1742', '8', '1', '2130706433', 'attribute', '343', '操作url：/Admin/Attribute/remove/id/343.html', '1', '1501560919');
INSERT INTO `bm_action_log` VALUES ('1743', '8', '1', '2130706433', 'attribute', '342', '操作url：/Admin/Attribute/remove/id/342.html', '1', '1501560925');
INSERT INTO `bm_action_log` VALUES ('1744', '8', '1', '2130706433', 'attribute', '341', '操作url：/Admin/Attribute/remove/id/341.html', '1', '1501560930');
INSERT INTO `bm_action_log` VALUES ('1745', '8', '1', '2130706433', 'attribute', '340', '操作url：/Admin/Attribute/remove/id/340.html', '1', '1501560933');
INSERT INTO `bm_action_log` VALUES ('1746', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/187.html', '1', '1501560999');
INSERT INTO `bm_action_log` VALUES ('1747', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/185.html', '1', '1501561007');
INSERT INTO `bm_action_log` VALUES ('1748', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/184.html', '1', '1501561013');
INSERT INTO `bm_action_log` VALUES ('1749', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/183.html', '1', '1501561023');
INSERT INTO `bm_action_log` VALUES ('1750', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/209.html', '1', '1501561049');
INSERT INTO `bm_action_log` VALUES ('1751', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/208.html', '1', '1501561053');
INSERT INTO `bm_action_log` VALUES ('1752', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/207.html', '1', '1501561064');
INSERT INTO `bm_action_log` VALUES ('1753', '8', '1', '2130706433', 'attribute', '314', '操作url：/Admin/Attribute/remove/id/314.html', '1', '1501561555');
INSERT INTO `bm_action_log` VALUES ('1754', '8', '1', '2130706433', 'attribute', '315', '操作url：/Admin/Attribute/remove/id/315.html', '1', '1501561559');
INSERT INTO `bm_action_log` VALUES ('1755', '8', '1', '2130706433', 'attribute', '316', '操作url：/Admin/Attribute/remove/id/316.html', '1', '1501561563');
INSERT INTO `bm_action_log` VALUES ('1756', '8', '1', '2130706433', 'attribute', '317', '操作url：/Admin/Attribute/remove/id/317.html', '1', '1501561566');
INSERT INTO `bm_action_log` VALUES ('1757', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/204.html', '1', '1501561607');
INSERT INTO `bm_action_log` VALUES ('1758', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/203.html', '1', '1501561613');
INSERT INTO `bm_action_log` VALUES ('1759', '7', '1', '2130706433', 'model', '47', '操作url：/Admin/Model/update.html', '1', '1501567525');
INSERT INTO `bm_action_log` VALUES ('1760', '8', '1', '2130706433', 'attribute', '352', '操作url：/Admin/Attribute/update.html', '1', '1501567600');
INSERT INTO `bm_action_log` VALUES ('1761', '8', '1', '2130706433', 'attribute', '353', '操作url：/Admin/Attribute/update.html', '1', '1501567633');
INSERT INTO `bm_action_log` VALUES ('1762', '8', '1', '2130706433', 'attribute', '354', '操作url：/Admin/Attribute/update.html', '1', '1501567678');
INSERT INTO `bm_action_log` VALUES ('1763', '10', '1', '2130706433', 'Menu', '211', '操作url：/Admin/Menu/add.html', '1', '1501567794');
INSERT INTO `bm_action_log` VALUES ('1764', '10', '1', '2130706433', 'Menu', '212', '操作url：/Admin/Menu/add.html', '1', '1501567840');
INSERT INTO `bm_action_log` VALUES ('1765', '7', '1', '2130706433', 'model', '47', '操作url：/Admin/Model/update.html', '1', '1501567928');
INSERT INTO `bm_action_log` VALUES ('1766', '10', '1', '2130706433', 'Menu', '211', '操作url：/Admin/Menu/edit.html', '1', '1501567967');
INSERT INTO `bm_action_log` VALUES ('1767', '10', '1', '2130706433', 'Menu', '211', '操作url：/Admin/Menu/edit.html', '1', '1501568030');
INSERT INTO `bm_action_log` VALUES ('1768', '7', '1', '2130706433', 'model', '48', '操作url：/Admin/Model/update.html', '1', '1501568342');
INSERT INTO `bm_action_log` VALUES ('1769', '8', '1', '2130706433', 'attribute', '355', '操作url：/Admin/Attribute/update.html', '1', '1501568393');
INSERT INTO `bm_action_log` VALUES ('1770', '8', '1', '2130706433', 'attribute', '356', '操作url：/Admin/Attribute/update.html', '1', '1501568417');
INSERT INTO `bm_action_log` VALUES ('1771', '8', '1', '2130706433', 'attribute', '357', '操作url：/Admin/Attribute/update.html', '1', '1501568448');
INSERT INTO `bm_action_log` VALUES ('1772', '7', '1', '2130706433', 'model', '48', '操作url：/Admin/Model/update.html', '1', '1501568636');
INSERT INTO `bm_action_log` VALUES ('1773', '10', '1', '2130706433', 'Menu', '213', '操作url：/Admin/Menu/add.html', '1', '1501568806');
INSERT INTO `bm_action_log` VALUES ('1774', '10', '1', '2130706433', 'Menu', '214', '操作url：/Admin/Menu/add.html', '1', '1501568828');
INSERT INTO `bm_action_log` VALUES ('1775', '10', '1', '2130706433', 'Menu', '215', '操作url：/Admin/Menu/add.html', '1', '1501568849');
INSERT INTO `bm_action_log` VALUES ('1776', '10', '1', '2130706433', 'Menu', '212', '操作url：/Admin/Menu/edit.html', '1', '1501568880');
INSERT INTO `bm_action_log` VALUES ('1777', '10', '1', '2130706433', 'Menu', '212', '操作url：/Admin/Menu/edit.html', '1', '1501568936');
INSERT INTO `bm_action_log` VALUES ('1778', '10', '1', '2130706433', 'Menu', '213', '操作url：/Admin/Menu/edit.html', '1', '1501568943');
INSERT INTO `bm_action_log` VALUES ('1779', '7', '1', '2130706433', 'model', '49', '操作url：/Admin/Model/update.html', '1', '1501571251');
INSERT INTO `bm_action_log` VALUES ('1780', '8', '1', '2130706433', 'attribute', '358', '操作url：/Admin/Attribute/update.html', '1', '1501571467');
INSERT INTO `bm_action_log` VALUES ('1781', '7', '1', '2130706433', 'model', '48', '操作url：/Admin/Model/update.html', '1', '1501571518');
INSERT INTO `bm_action_log` VALUES ('1782', '8', '1', '2130706433', 'attribute', '359', '操作url：/Admin/Attribute/update.html', '1', '1501571566');
INSERT INTO `bm_action_log` VALUES ('1783', '8', '1', '2130706433', 'attribute', '360', '操作url：/Admin/Attribute/update.html', '1', '1501571609');
INSERT INTO `bm_action_log` VALUES ('1784', '8', '1', '2130706433', 'attribute', '361', '操作url：/Admin/Attribute/update.html', '1', '1501571630');
INSERT INTO `bm_action_log` VALUES ('1785', '7', '1', '2130706433', 'model', '49', '操作url：/Admin/Model/update.html', '1', '1501571725');
INSERT INTO `bm_action_log` VALUES ('1786', '10', '1', '2130706433', 'Menu', '216', '操作url：/Admin/Menu/add.html', '1', '1501571760');
INSERT INTO `bm_action_log` VALUES ('1787', '10', '1', '2130706433', 'Menu', '217', '操作url：/Admin/Menu/add.html', '1', '1501571779');
INSERT INTO `bm_action_log` VALUES ('1788', '10', '1', '2130706433', 'Menu', '218', '操作url：/Admin/Menu/add.html', '1', '1501571797');
INSERT INTO `bm_action_log` VALUES ('1789', '10', '1', '2130706433', 'Menu', '216', '操作url：/Admin/Menu/edit.html', '1', '1501571816');
INSERT INTO `bm_action_log` VALUES ('1790', '10', '1', '2130706433', 'Menu', '216', '操作url：/Admin/Menu/edit.html', '1', '1501571936');
INSERT INTO `bm_action_log` VALUES ('1791', '7', '1', '2130706433', 'model', '50', '操作url：/Admin/Model/update.html', '1', '1501572857');
INSERT INTO `bm_action_log` VALUES ('1792', '8', '1', '2130706433', 'attribute', '362', '操作url：/Admin/Attribute/update.html', '1', '1501572909');
INSERT INTO `bm_action_log` VALUES ('1793', '8', '1', '2130706433', 'attribute', '363', '操作url：/Admin/Attribute/update.html', '1', '1501572973');
INSERT INTO `bm_action_log` VALUES ('1794', '8', '1', '2130706433', 'attribute', '364', '操作url：/Admin/Attribute/update.html', '1', '1501572994');
INSERT INTO `bm_action_log` VALUES ('1795', '7', '1', '2130706433', 'model', '50', '操作url：/Admin/Model/update.html', '1', '1501573092');
INSERT INTO `bm_action_log` VALUES ('1796', '7', '1', '2130706433', 'model', '51', '操作url：/Admin/Model/update.html', '1', '1501573331');
INSERT INTO `bm_action_log` VALUES ('1797', '8', '1', '2130706433', 'attribute', '365', '操作url：/Admin/Attribute/update.html', '1', '1501573427');
INSERT INTO `bm_action_log` VALUES ('1798', '8', '1', '2130706433', 'attribute', '366', '操作url：/Admin/Attribute/update.html', '1', '1501573448');
INSERT INTO `bm_action_log` VALUES ('1799', '8', '1', '2130706433', 'attribute', '367', '操作url：/Admin/Attribute/update.html', '1', '1501573466');
INSERT INTO `bm_action_log` VALUES ('1800', '8', '1', '2130706433', 'attribute', '368', '操作url：/Admin/Attribute/update.html', '1', '1501573495');
INSERT INTO `bm_action_log` VALUES ('1801', '7', '1', '2130706433', 'model', '51', '操作url：/Admin/Model/update.html', '1', '1501573852');
INSERT INTO `bm_action_log` VALUES ('1802', '7', '1', '2130706433', 'model', '51', '操作url：/Admin/Model/update.html', '1', '1501574233');
INSERT INTO `bm_action_log` VALUES ('1803', '7', '1', '2130706433', 'model', '52', '操作url：/Admin/Model/update.html', '1', '1501574349');
INSERT INTO `bm_action_log` VALUES ('1804', '8', '1', '2130706433', 'attribute', '369', '操作url：/Admin/Attribute/update.html', '1', '1501574738');
INSERT INTO `bm_action_log` VALUES ('1805', '8', '1', '2130706433', 'attribute', '370', '操作url：/Admin/Attribute/update.html', '1', '1501574773');
INSERT INTO `bm_action_log` VALUES ('1806', '8', '1', '2130706433', 'attribute', '371', '操作url：/Admin/Attribute/update.html', '1', '1501574803');
INSERT INTO `bm_action_log` VALUES ('1807', '7', '1', '2130706433', 'model', '52', '操作url：/Admin/Model/update.html', '1', '1501574894');
INSERT INTO `bm_action_log` VALUES ('1808', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-02 09:38登录了后台', '1', '1501637927');
INSERT INTO `bm_action_log` VALUES ('1809', '7', '1', '2130706433', 'model', '53', '操作url：/Admin/Model/update.html', '1', '1501638111');
INSERT INTO `bm_action_log` VALUES ('1810', '8', '1', '2130706433', 'attribute', '372', '操作url：/Admin/Attribute/update.html', '1', '1501638154');
INSERT INTO `bm_action_log` VALUES ('1811', '8', '1', '2130706433', 'attribute', '373', '操作url：/Admin/Attribute/update.html', '1', '1501638187');
INSERT INTO `bm_action_log` VALUES ('1812', '8', '1', '2130706433', 'attribute', '374', '操作url：/Admin/Attribute/update.html', '1', '1501638213');
INSERT INTO `bm_action_log` VALUES ('1813', '8', '1', '2130706433', 'attribute', '375', '操作url：/Admin/Attribute/update.html', '1', '1501638232');
INSERT INTO `bm_action_log` VALUES ('1814', '8', '1', '2130706433', 'attribute', '376', '操作url：/Admin/Attribute/update.html', '1', '1501638266');
INSERT INTO `bm_action_log` VALUES ('1815', '8', '1', '2130706433', 'attribute', '377', '操作url：/Admin/Attribute/update.html', '1', '1501638288');
INSERT INTO `bm_action_log` VALUES ('1816', '8', '1', '2130706433', 'attribute', '378', '操作url：/Admin/Attribute/update.html', '1', '1501638322');
INSERT INTO `bm_action_log` VALUES ('1817', '7', '1', '2130706433', 'model', '54', '操作url：/Admin/Model/update.html', '1', '1501638410');
INSERT INTO `bm_action_log` VALUES ('1818', '8', '1', '2130706433', 'attribute', '379', '操作url：/Admin/Attribute/update.html', '1', '1501638438');
INSERT INTO `bm_action_log` VALUES ('1819', '8', '1', '2130706433', 'attribute', '380', '操作url：/Admin/Attribute/update.html', '1', '1501638468');
INSERT INTO `bm_action_log` VALUES ('1820', '8', '1', '2130706433', 'attribute', '381', '操作url：/Admin/Attribute/update.html', '1', '1501638490');
INSERT INTO `bm_action_log` VALUES ('1821', '8', '1', '2130706433', 'attribute', '382', '操作url：/Admin/Attribute/update.html', '1', '1501638572');
INSERT INTO `bm_action_log` VALUES ('1822', '7', '1', '2130706433', 'model', '54', '操作url：/Admin/Model/update.html', '1', '1501638689');
INSERT INTO `bm_action_log` VALUES ('1823', '7', '1', '2130706433', 'model', '55', '操作url：/Admin/Model/update.html', '1', '1501638761');
INSERT INTO `bm_action_log` VALUES ('1824', '8', '1', '2130706433', 'attribute', '383', '操作url：/Admin/Attribute/update.html', '1', '1501638816');
INSERT INTO `bm_action_log` VALUES ('1825', '8', '1', '2130706433', 'attribute', '384', '操作url：/Admin/Attribute/update.html', '1', '1501638833');
INSERT INTO `bm_action_log` VALUES ('1826', '8', '1', '2130706433', 'attribute', '385', '操作url：/Admin/Attribute/update.html', '1', '1501638905');
INSERT INTO `bm_action_log` VALUES ('1827', '8', '1', '2130706433', 'attribute', '386', '操作url：/Admin/Attribute/update.html', '1', '1501638925');
INSERT INTO `bm_action_log` VALUES ('1828', '7', '1', '2130706433', 'model', '55', '操作url：/Admin/Model/update.html', '1', '1501639003');
INSERT INTO `bm_action_log` VALUES ('1829', '7', '1', '2130706433', 'model', '56', '操作url：/Admin/Model/update.html', '1', '1501640903');
INSERT INTO `bm_action_log` VALUES ('1830', '8', '1', '2130706433', 'attribute', '387', '操作url：/Admin/Attribute/update.html', '1', '1501640932');
INSERT INTO `bm_action_log` VALUES ('1831', '8', '1', '2130706433', 'attribute', '388', '操作url：/Admin/Attribute/update.html', '1', '1501640953');
INSERT INTO `bm_action_log` VALUES ('1832', '8', '1', '2130706433', 'attribute', '389', '操作url：/Admin/Attribute/update.html', '1', '1501640994');
INSERT INTO `bm_action_log` VALUES ('1833', '8', '1', '2130706433', 'attribute', '387', '操作url：/Admin/Attribute/update.html', '1', '1501641008');
INSERT INTO `bm_action_log` VALUES ('1834', '8', '1', '2130706433', 'attribute', '390', '操作url：/Admin/Attribute/update.html', '1', '1501641023');
INSERT INTO `bm_action_log` VALUES ('1835', '7', '1', '2130706433', 'model', '55', '操作url：/Admin/Model/update.html', '1', '1501641101');
INSERT INTO `bm_action_log` VALUES ('1836', '7', '1', '2130706433', 'model', '56', '操作url：/Admin/Model/update.html', '1', '1501641129');
INSERT INTO `bm_action_log` VALUES ('1837', '7', '1', '2130706433', 'model', '57', '操作url：/Admin/Model/update.html', '1', '1501641251');
INSERT INTO `bm_action_log` VALUES ('1838', '8', '1', '2130706433', 'attribute', '391', '操作url：/Admin/Attribute/update.html', '1', '1501641287');
INSERT INTO `bm_action_log` VALUES ('1839', '8', '1', '2130706433', 'attribute', '392', '操作url：/Admin/Attribute/update.html', '1', '1501641327');
INSERT INTO `bm_action_log` VALUES ('1840', '8', '1', '2130706433', 'attribute', '393', '操作url：/Admin/Attribute/update.html', '1', '1501641345');
INSERT INTO `bm_action_log` VALUES ('1841', '8', '1', '2130706433', 'attribute', '394', '操作url：/Admin/Attribute/update.html', '1', '1501641381');
INSERT INTO `bm_action_log` VALUES ('1842', '7', '1', '2130706433', 'model', '58', '操作url：/Admin/Model/update.html', '1', '1501641429');
INSERT INTO `bm_action_log` VALUES ('1843', '8', '1', '2130706433', 'attribute', '395', '操作url：/Admin/Attribute/update.html', '1', '1501641518');
INSERT INTO `bm_action_log` VALUES ('1844', '10', '1', '2130706433', 'Menu', '219', '操作url：/Admin/Menu/add.html', '1', '1501642734');
INSERT INTO `bm_action_log` VALUES ('1845', '10', '1', '2130706433', 'Menu', '220', '操作url：/Admin/Menu/add.html', '1', '1501642763');
INSERT INTO `bm_action_log` VALUES ('1846', '10', '1', '2130706433', 'Menu', '219', '操作url：/Admin/Menu/edit.html', '1', '1501642795');
INSERT INTO `bm_action_log` VALUES ('1847', '10', '1', '2130706433', 'Menu', '221', '操作url：/Admin/Menu/add.html', '1', '1501644713');
INSERT INTO `bm_action_log` VALUES ('1848', '10', '1', '2130706433', 'Menu', '221', '操作url：/Admin/Menu/edit.html', '1', '1501644737');
INSERT INTO `bm_action_log` VALUES ('1849', '10', '1', '2130706433', 'Menu', '221', '操作url：/Admin/Menu/edit.html', '1', '1501644755');
INSERT INTO `bm_action_log` VALUES ('1850', '10', '1', '2130706433', 'Menu', '1', '操作url：/Admin/Menu/edit.html', '1', '1501644875');
INSERT INTO `bm_action_log` VALUES ('1851', '10', '1', '2130706433', 'Menu', '222', '操作url：/Admin/Menu/add.html', '1', '1501644900');
INSERT INTO `bm_action_log` VALUES ('1852', '10', '1', '2130706433', 'Menu', '211', '操作url：/Admin/Menu/edit.html', '1', '1501644920');
INSERT INTO `bm_action_log` VALUES ('1853', '10', '1', '2130706433', 'Menu', '219', '操作url：/Admin/Menu/edit.html', '1', '1501644926');
INSERT INTO `bm_action_log` VALUES ('1854', '10', '1', '2130706433', 'Menu', '222', '操作url：/Admin/Menu/edit.html', '1', '1501644937');
INSERT INTO `bm_action_log` VALUES ('1855', '10', '1', '2130706433', 'Menu', '223', '操作url：/Admin/Menu/add.html', '1', '1501644994');
INSERT INTO `bm_action_log` VALUES ('1856', '10', '1', '2130706433', 'Menu', '224', '操作url：/Admin/Menu/add.html', '1', '1501645012');
INSERT INTO `bm_action_log` VALUES ('1857', '10', '1', '2130706433', 'Menu', '225', '操作url：/Admin/Menu/add.html', '1', '1501645026');
INSERT INTO `bm_action_log` VALUES ('1858', '10', '1', '2130706433', 'Menu', '226', '操作url：/Admin/Menu/add.html', '1', '1501645057');
INSERT INTO `bm_action_log` VALUES ('1859', '10', '1', '2130706433', 'Menu', '227', '操作url：/Admin/Menu/add.html', '1', '1501645068');
INSERT INTO `bm_action_log` VALUES ('1860', '10', '1', '2130706433', 'Menu', '228', '操作url：/Admin/Menu/add.html', '1', '1501645080');
INSERT INTO `bm_action_log` VALUES ('1861', '10', '1', '2130706433', 'Menu', '229', '操作url：/Admin/Menu/add.html', '1', '1501645126');
INSERT INTO `bm_action_log` VALUES ('1862', '10', '1', '2130706433', 'Menu', '230', '操作url：/Admin/Menu/add.html', '1', '1501645203');
INSERT INTO `bm_action_log` VALUES ('1863', '10', '1', '2130706433', 'Menu', '231', '操作url：/Admin/Menu/add.html', '1', '1501645304');
INSERT INTO `bm_action_log` VALUES ('1864', '10', '1', '2130706433', 'Menu', '232', '操作url：/Admin/Menu/add.html', '1', '1501645317');
INSERT INTO `bm_action_log` VALUES ('1865', '10', '1', '2130706433', 'Menu', '233', '操作url：/Admin/Menu/add.html', '1', '1501645329');
INSERT INTO `bm_action_log` VALUES ('1866', '10', '1', '2130706433', 'Menu', '234', '操作url：/Admin/Menu/add.html', '1', '1501645382');
INSERT INTO `bm_action_log` VALUES ('1867', '10', '1', '2130706433', 'Menu', '235', '操作url：/Admin/Menu/add.html', '1', '1501645396');
INSERT INTO `bm_action_log` VALUES ('1868', '10', '1', '2130706433', 'Menu', '236', '操作url：/Admin/Menu/add.html', '1', '1501645411');
INSERT INTO `bm_action_log` VALUES ('1869', '10', '1', '2130706433', 'Menu', '237', '操作url：/Admin/Menu/add.html', '1', '1501645565');
INSERT INTO `bm_action_log` VALUES ('1870', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-03 09:37登录了后台', '1', '1501724267');
INSERT INTO `bm_action_log` VALUES ('1871', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-07 09:36登录了后台', '1', '1502069815');
INSERT INTO `bm_action_log` VALUES ('1872', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-08 10:56登录了后台', '1', '1502161018');
INSERT INTO `bm_action_log` VALUES ('1873', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-09 09:33登录了后台', '1', '1502242389');
INSERT INTO `bm_action_log` VALUES ('1874', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-09 14:05登录了后台', '1', '1502258734');
INSERT INTO `bm_action_log` VALUES ('1875', '8', '1', '2130706433', 'attribute', '396', '操作url：/Admin/Attribute/update.html', '1', '1502270923');
INSERT INTO `bm_action_log` VALUES ('1876', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-10 09:57登录了后台', '1', '1502330238');
INSERT INTO `bm_action_log` VALUES ('1877', '7', '1', '2130706433', 'model', '59', '操作url：/Admin/Model/update.html', '1', '1502335534');
INSERT INTO `bm_action_log` VALUES ('1878', '8', '1', '2130706433', 'attribute', '397', '操作url：/Admin/Attribute/update.html', '1', '1502335573');
INSERT INTO `bm_action_log` VALUES ('1879', '8', '1', '2130706433', 'attribute', '398', '操作url：/Admin/Attribute/update.html', '1', '1502335595');
INSERT INTO `bm_action_log` VALUES ('1880', '8', '1', '2130706433', 'attribute', '399', '操作url：/Admin/Attribute/update.html', '1', '1502335612');
INSERT INTO `bm_action_log` VALUES ('1881', '8', '1', '2130706433', 'attribute', '400', '操作url：/Admin/Attribute/update.html', '1', '1502335630');
INSERT INTO `bm_action_log` VALUES ('1882', '7', '1', '2130706433', 'model', '59', '操作url：/Admin/Model/update.html', '1', '1502335924');
INSERT INTO `bm_action_log` VALUES ('1883', '10', '1', '2130706433', 'Menu', '238', '操作url：/Admin/Menu/add.html', '1', '1502336049');
INSERT INTO `bm_action_log` VALUES ('1884', '7', '1', '2130706433', 'model', '59', '操作url：/Admin/Model/update.html', '1', '1502336113');
INSERT INTO `bm_action_log` VALUES ('1885', '10', '1', '2130706433', 'Menu', '238', '操作url：/Admin/Menu/edit.html', '1', '1502336142');
INSERT INTO `bm_action_log` VALUES ('1886', '10', '1', '2130706433', 'Menu', '239', '操作url：/Admin/Menu/add.html', '1', '1502336189');
INSERT INTO `bm_action_log` VALUES ('1887', '7', '1', '2130706433', 'model', '59', '操作url：/Admin/Model/update.html', '1', '1502336323');
INSERT INTO `bm_action_log` VALUES ('1888', '7', '1', '2130706433', 'model', '47', '操作url：/Admin/Model/update.html', '1', '1502343882');
INSERT INTO `bm_action_log` VALUES ('1889', '10', '1', '2130706433', 'Menu', '211', '操作url：/Admin/Menu/edit.html', '1', '1502343889');
INSERT INTO `bm_action_log` VALUES ('1890', '10', '1', '2130706433', 'Menu', '212', '操作url：/Admin/Menu/edit.html', '1', '1502343899');
INSERT INTO `bm_action_log` VALUES ('1891', '7', '1', '2130706433', 'model', '47', '操作url：/Admin/Model/update.html', '1', '1502344093');
INSERT INTO `bm_action_log` VALUES ('1892', '7', '1', '2130706433', 'model', '48', '操作url：/Admin/Model/update.html', '1', '1502344355');
INSERT INTO `bm_action_log` VALUES ('1893', '7', '1', '2130706433', 'model', '50', '操作url：/Admin/Model/update.html', '1', '1502344827');
INSERT INTO `bm_action_log` VALUES ('1894', '7', '1', '2130706433', 'model', '50', '操作url：/Admin/Model/update.html', '1', '1502344896');
INSERT INTO `bm_action_log` VALUES ('1895', '7', '1', '2130706433', 'model', '53', '操作url：/Admin/Model/update.html', '1', '1502345897');
INSERT INTO `bm_action_log` VALUES ('1896', '10', '1', '2130706433', 'Menu', '220', '操作url：/Admin/Menu/edit.html', '1', '1502345914');
INSERT INTO `bm_action_log` VALUES ('1897', '10', '1', '2130706433', 'Menu', '219', '操作url：/Admin/Menu/edit.html', '1', '1502345935');
INSERT INTO `bm_action_log` VALUES ('1898', '7', '1', '2130706433', 'model', '56', '操作url：/Admin/Model/update.html', '1', '1502346398');
INSERT INTO `bm_action_log` VALUES ('1899', '7', '1', '2130706433', 'model', '56', '操作url：/Admin/Model/update.html', '1', '1502346438');
INSERT INTO `bm_action_log` VALUES ('1900', '7', '1', '2130706433', 'model', '56', '操作url：/Admin/Model/update.html', '1', '1502346510');
INSERT INTO `bm_action_log` VALUES ('1901', '10', '1', '2130706433', 'Menu', '220', '操作url：/Admin/Menu/edit.html', '1', '1502346900');
INSERT INTO `bm_action_log` VALUES ('1902', '10', '1', '2130706433', 'Menu', '219', '操作url：/Admin/Menu/edit.html', '1', '1502346916');
INSERT INTO `bm_action_log` VALUES ('1903', '10', '1', '2130706433', 'Menu', '219', '操作url：/Admin/Menu/edit.html', '1', '1502346923');
INSERT INTO `bm_action_log` VALUES ('1904', '10', '1', '2130706433', 'Menu', '231', '操作url：/Admin/Menu/edit.html', '1', '1502346981');
INSERT INTO `bm_action_log` VALUES ('1905', '7', '1', '2130706433', 'model', '51', '操作url：/Admin/Model/update.html', '1', '1502347346');
INSERT INTO `bm_action_log` VALUES ('1906', '7', '1', '2130706433', 'model', '52', '操作url：/Admin/Model/update.html', '1', '1502347624');
INSERT INTO `bm_action_log` VALUES ('1907', '7', '1', '2130706433', 'model', '60', '操作url：/Admin/Model/update.html', '1', '1502348439');
INSERT INTO `bm_action_log` VALUES ('1908', '8', '1', '2130706433', 'attribute', '401', '操作url：/Admin/Attribute/update.html', '1', '1502348481');
INSERT INTO `bm_action_log` VALUES ('1909', '8', '1', '2130706433', 'attribute', '402', '操作url：/Admin/Attribute/update.html', '1', '1502348499');
INSERT INTO `bm_action_log` VALUES ('1910', '8', '1', '2130706433', 'attribute', '392', '操作url：/Admin/Attribute/update.html', '1', '1502348756');
INSERT INTO `bm_action_log` VALUES ('1911', '8', '1', '2130706433', 'attribute', '403', '操作url：/Admin/Attribute/update.html', '1', '1502348784');
INSERT INTO `bm_action_log` VALUES ('1912', '7', '1', '2130706433', 'model', '57', '操作url：/Admin/Model/update.html', '1', '1502348815');
INSERT INTO `bm_action_log` VALUES ('1913', '7', '1', '2130706433', 'model', '60', '操作url：/Admin/Model/update.html', '1', '1502349308');
INSERT INTO `bm_action_log` VALUES ('1914', '7', '1', '2130706433', 'model', '60', '操作url：/Admin/Model/update.html', '1', '1502349347');
INSERT INTO `bm_action_log` VALUES ('1915', '10', '1', '2130706433', 'Menu', '240', '操作url：/Admin/Menu/add.html', '1', '1502349400');
INSERT INTO `bm_action_log` VALUES ('1916', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-14 09:43登录了后台', '1', '1502674991');
INSERT INTO `bm_action_log` VALUES ('1917', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-14 12:14登录了后台', '1', '1502684077');
INSERT INTO `bm_action_log` VALUES ('1918', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-14 13:42登录了后台', '1', '1502689350');
INSERT INTO `bm_action_log` VALUES ('1919', '1', '1', '-1062731597', 'member', '1', 'admin在2017-08-14 15:39登录了后台', '1', '1502696386');
INSERT INTO `bm_action_log` VALUES ('1920', '1', '1', '-1062731597', 'member', '1', 'admin在2017-08-14 17:03登录了后台', '1', '1502701428');
INSERT INTO `bm_action_log` VALUES ('1921', '7', '1', '2130706433', 'model', '59', '操作url：/Admin/Model/update.html', '1', '1502705157');
INSERT INTO `bm_action_log` VALUES ('1922', '1', '1', '-1062727548', 'member', '1', 'admin在2017-08-15 09:56登录了后台', '1', '1502762174');
INSERT INTO `bm_action_log` VALUES ('1923', '8', '1', '2130706433', 'attribute', '382', '操作url：/Admin/Attribute/update.html', '1', '1502762439');
INSERT INTO `bm_action_log` VALUES ('1924', '8', '1', '2130706433', 'attribute', '385', '操作url：/Admin/Attribute/update.html', '1', '1502762482');
INSERT INTO `bm_action_log` VALUES ('1925', '8', '1', '2130706433', 'attribute', '389', '操作url：/Admin/Attribute/update.html', '1', '1502762518');
INSERT INTO `bm_action_log` VALUES ('1926', '8', '1', '2130706433', 'attribute', '388', '操作url：/Admin/Attribute/update.html', '1', '1502762535');
INSERT INTO `bm_action_log` VALUES ('1927', '8', '1', '2130706433', 'attribute', '367', '操作url：/Admin/Attribute/update.html', '1', '1502762703');
INSERT INTO `bm_action_log` VALUES ('1928', '8', '1', '2130706433', 'attribute', '395', '操作url：/Admin/Attribute/update.html', '1', '1502762893');
INSERT INTO `bm_action_log` VALUES ('1929', '8', '1', '2130706433', 'attribute', '376', '操作url：/Admin/Attribute/update.html', '1', '1502762979');
INSERT INTO `bm_action_log` VALUES ('1930', '8', '1', '2130706433', 'attribute', '378', '操作url：/Admin/Attribute/update.html', '1', '1502762987');
INSERT INTO `bm_action_log` VALUES ('1931', '8', '1', '2130706433', 'attribute', '376', '操作url：/Admin/Attribute/update.html', '1', '1502763004');
INSERT INTO `bm_action_log` VALUES ('1932', '8', '1', '2130706433', 'attribute', '374', '操作url：/Admin/Attribute/update.html', '1', '1502763011');
INSERT INTO `bm_action_log` VALUES ('1933', '8', '1', '2130706433', 'attribute', '372', '操作url：/Admin/Attribute/update.html', '1', '1502763018');
INSERT INTO `bm_action_log` VALUES ('1934', '1', '1', '-1062727548', 'member', '1', 'admin在2017-08-15 10:11登录了后台', '1', '1502763088');
INSERT INTO `bm_action_log` VALUES ('1935', '1', '8', '2130706433', 'member', '8', 'user在2017-08-15 10:47登录了后台', '1', '1502765244');
INSERT INTO `bm_action_log` VALUES ('1936', '8', '1', '2130706433', 'attribute', '354', '操作url：/Admin/Attribute/update.html', '1', '1502766469');
INSERT INTO `bm_action_log` VALUES ('1937', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-15 11:13登录了后台', '1', '1502766820');
INSERT INTO `bm_action_log` VALUES ('1938', '1', '8', '2130706433', 'member', '8', 'user在2017-08-15 11:14登录了后台', '1', '1502766878');
INSERT INTO `bm_action_log` VALUES ('1939', '1', '1', '-1062731597', 'member', '1', 'admin在2017-08-15 11:15登录了后台', '1', '1502766945');
INSERT INTO `bm_action_log` VALUES ('1940', '1', '10', '-1062731597', 'member', '10', 'test1在2017-08-15 11:21登录了后台', '1', '1502767271');
INSERT INTO `bm_action_log` VALUES ('1941', '1', '10', '-1062731597', 'member', '10', 'test1在2017-08-15 11:25登录了后台', '1', '1502767533');
INSERT INTO `bm_action_log` VALUES ('1942', '1', '10', '-1062731597', 'member', '10', 'test1在2017-08-15 11:26登录了后台', '1', '1502767566');
INSERT INTO `bm_action_log` VALUES ('1943', '1', '8', '-1062731597', 'member', '8', 'user在2017-08-15 11:26登录了后台', '1', '1502767593');
INSERT INTO `bm_action_log` VALUES ('1944', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-15 11:26登录了后台', '1', '1502767599');
INSERT INTO `bm_action_log` VALUES ('1945', '1', '1', '-1062731597', 'member', '1', 'admin在2017-08-15 11:27登录了后台', '1', '1502767638');
INSERT INTO `bm_action_log` VALUES ('1946', '1', '8', '-1062731597', 'member', '8', 'user在2017-08-15 11:28登录了后台', '1', '1502767685');
INSERT INTO `bm_action_log` VALUES ('1947', '10', '8', '-1062731597', 'Menu', '241', '操作url：/Admin/Menu/add.html', '1', '1502767880');
INSERT INTO `bm_action_log` VALUES ('1948', '1', '1', '-1062727548', 'member', '1', 'admin在2017-08-15 11:31登录了后台', '1', '1502767909');
INSERT INTO `bm_action_log` VALUES ('1949', '1', '8', '-1062731597', 'member', '8', 'user在2017-08-15 11:32登录了后台', '1', '1502767943');
INSERT INTO `bm_action_log` VALUES ('1950', '1', '8', '-1062731597', 'member', '8', 'user在2017-08-15 11:35登录了后台', '1', '1502768122');
INSERT INTO `bm_action_log` VALUES ('1951', '1', '8', '2130706433', 'member', '8', 'user在2017-08-15 11:38登录了后台', '1', '1502768324');
INSERT INTO `bm_action_log` VALUES ('1952', '1', '8', '2130706433', 'member', '8', 'user在2017-08-15 11:40登录了后台', '1', '1502768440');
INSERT INTO `bm_action_log` VALUES ('1953', '1', '1', '-1062731597', 'member', '1', 'admin在2017-08-15 11:42登录了后台', '1', '1502768530');
INSERT INTO `bm_action_log` VALUES ('1954', '1', '8', '2130706433', 'member', '8', 'user在2017-08-15 11:42登录了后台', '1', '1502768544');
INSERT INTO `bm_action_log` VALUES ('1955', '1', '10', '-1062731597', 'member', '10', 'test1在2017-08-15 11:45登录了后台', '1', '1502768733');
INSERT INTO `bm_action_log` VALUES ('1956', '1', '8', '2130706433', 'member', '8', 'user在2017-08-15 11:46登录了后台', '1', '1502768796');
INSERT INTO `bm_action_log` VALUES ('1957', '1', '8', '2130706433', 'member', '8', 'user在2017-08-15 11:49登录了后台', '1', '1502768947');
INSERT INTO `bm_action_log` VALUES ('1958', '1', '8', '2130706433', 'member', '8', 'user在2017-08-15 11:50登录了后台', '1', '1502769008');
INSERT INTO `bm_action_log` VALUES ('1959', '1', '1', '-1062731597', 'member', '1', 'admin在2017-08-15 11:50登录了后台', '1', '1502769051');
INSERT INTO `bm_action_log` VALUES ('1960', '1', '8', '2130706433', 'member', '8', 'user在2017-08-15 11:52登录了后台', '1', '1502769179');
INSERT INTO `bm_action_log` VALUES ('1961', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-15 12:00登录了后台', '1', '1502769624');
INSERT INTO `bm_action_log` VALUES ('1962', '1', '1', '-1062731597', 'member', '1', 'admin在2017-08-15 12:03登录了后台', '1', '1502769797');
INSERT INTO `bm_action_log` VALUES ('1963', '1', '9', '2130706433', 'member', '9', 'user在2017-08-15 12:04登录了后台', '1', '1502769868');
INSERT INTO `bm_action_log` VALUES ('1964', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-15 12:04登录了后台', '1', '1502769884');
INSERT INTO `bm_action_log` VALUES ('1965', '1', '9', '2130706433', 'member', '9', 'user在2017-08-15 12:05登录了后台', '1', '1502769925');
INSERT INTO `bm_action_log` VALUES ('1966', '1', '10', '-1062731597', 'member', '10', 'test1在2017-08-15 12:14登录了后台', '1', '1502770456');
INSERT INTO `bm_action_log` VALUES ('1967', '1', '10', '-1062731597', 'member', '10', 'test1在2017-08-15 12:16登录了后台', '1', '1502770596');
INSERT INTO `bm_action_log` VALUES ('1968', '1', '10', '-1062731597', 'member', '10', 'test1在2017-08-15 12:17登录了后台', '1', '1502770648');
INSERT INTO `bm_action_log` VALUES ('1969', '1', '10', '-1062731597', 'member', '10', 'test1在2017-08-15 12:18登录了后台', '1', '1502770709');
INSERT INTO `bm_action_log` VALUES ('1970', '1', '10', '-1062731597', 'member', '10', 'test1在2017-08-15 12:19登录了后台', '1', '1502770778');
INSERT INTO `bm_action_log` VALUES ('1971', '1', '1', '-1062731597', 'member', '1', 'admin在2017-08-15 12:21登录了后台', '1', '1502770914');
INSERT INTO `bm_action_log` VALUES ('1972', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-15 14:43登录了后台', '1', '1502779394');
INSERT INTO `bm_action_log` VALUES ('1973', '10', '1', '2130706433', 'Menu', '68', '操作url：/Admin/Menu/edit.html', '1', '1502779500');
INSERT INTO `bm_action_log` VALUES ('1974', '7', '1', '2130706433', 'model', '57', '操作url：/Admin/Model/update.html', '1', '1502779693');
INSERT INTO `bm_action_log` VALUES ('1975', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-15 15:39登录了后台', '1', '1502782770');
INSERT INTO `bm_action_log` VALUES ('1976', '1', '1', '-1062731597', 'member', '1', 'admin在2017-08-15 16:27登录了后台', '1', '1502785632');
INSERT INTO `bm_action_log` VALUES ('1977', '1', '1', '-1062727532', 'member', '1', 'admin在2017-08-16 16:34登录了后台', '1', '1502872479');
INSERT INTO `bm_action_log` VALUES ('1978', '1', '1', '-1062727532', 'member', '1', 'admin在2017-08-16 17:41登录了后台', '1', '1502876471');
INSERT INTO `bm_action_log` VALUES ('1979', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-17 10:40登录了后台', '1', '1502937644');
INSERT INTO `bm_action_log` VALUES ('1980', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-17 13:02登录了后台', '1', '1502946160');
INSERT INTO `bm_action_log` VALUES ('1981', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-17 13:02登录了后台', '1', '1502946177');
INSERT INTO `bm_action_log` VALUES ('1982', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-17 13:03登录了后台', '1', '1502946213');
INSERT INTO `bm_action_log` VALUES ('1983', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-17 13:03登录了后台', '1', '1502946239');
INSERT INTO `bm_action_log` VALUES ('1984', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-17 13:11登录了后台', '1', '1502946672');
INSERT INTO `bm_action_log` VALUES ('1985', '1', '1', '2130706433', 'member', '1', 'admin在2017-08-17 13:11登录了后台', '1', '1502946707');
INSERT INTO `bm_action_log` VALUES ('1986', '1', '1', '2130706433', 'member', '1', 'admin在2018-03-13 22:33登录了后台', '1', '1520951632');
INSERT INTO `bm_action_log` VALUES ('1987', '1', '1', '2130706433', 'member', '1', 'admin在2018-03-19 13:13登录了后台', '1', '1521436424');
INSERT INTO `bm_action_log` VALUES ('1988', '10', '1', '2130706433', 'Menu', '242', '操作url：/Admin/Menu/add.html', '1', '1521441117');
INSERT INTO `bm_action_log` VALUES ('1989', '10', '1', '2130706433', 'Menu', '242', '操作url：/Admin/Menu/edit.html', '1', '1521441291');
INSERT INTO `bm_action_log` VALUES ('1990', '10', '1', '2130706433', 'Menu', '242', '操作url：/Admin/Menu/edit.html', '1', '1521441886');
INSERT INTO `bm_action_log` VALUES ('1991', '1', '1', '2130706433', 'member', '1', 'admin在2018-03-19 14:45登录了后台', '1', '1521441955');
INSERT INTO `bm_action_log` VALUES ('1992', '10', '1', '2130706433', 'Menu', '242', '操作url：/Admin/Menu/edit.html', '1', '1521444705');
INSERT INTO `bm_action_log` VALUES ('1993', '10', '1', '2130706433', 'Menu', '242', '操作url：/Admin/Menu/edit.html', '1', '1521444763');
INSERT INTO `bm_action_log` VALUES ('1994', '1', '1', '2130706433', 'member', '1', 'admin在2018-03-21 21:56登录了后台', '1', '1521640605');
INSERT INTO `bm_action_log` VALUES ('1995', '7', '1', '2130706433', 'model', '61', '操作url：/Admin/Model/update.html', '1', '1521642215');
INSERT INTO `bm_action_log` VALUES ('1996', '1', '1', '2130706433', 'member', '1', 'admin在2018-03-21 22:39登录了后台', '1', '1521643198');
INSERT INTO `bm_action_log` VALUES ('1997', '1', '1', '2130706433', 'member', '1', 'admin在2018-03-26 09:44登录了后台', '1', '1522028644');
INSERT INTO `bm_action_log` VALUES ('1998', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/242.html', '1', '1522031620');
INSERT INTO `bm_action_log` VALUES ('1999', '10', '1', '2130706433', 'Menu', '243', '操作url：/Admin/Menu/add.html', '1', '1522031721');
INSERT INTO `bm_action_log` VALUES ('2000', '1', '1', '2130706433', 'member', '1', 'admin在2018-03-26 10:46登录了后台', '1', '1522032375');
INSERT INTO `bm_action_log` VALUES ('2001', '1', '1', '2130706433', 'member', '1', 'admin在2018-03-26 10:56登录了后台', '1', '1522033017');
INSERT INTO `bm_action_log` VALUES ('2002', '1', '1', '2130706433', 'member', '1', 'admin在2018-03-26 15:31登录了后台', '1', '1522049467');
INSERT INTO `bm_action_log` VALUES ('2003', '10', '1', '2130706433', 'Menu', '213', '操作url：/Admin/Menu/edit.html', '1', '1522050229');
INSERT INTO `bm_action_log` VALUES ('2004', '8', '1', '2130706433', 'attribute', '404', '操作url：/Admin/Attribute/update.html', '1', '1522052062');
INSERT INTO `bm_action_log` VALUES ('2005', '8', '1', '2130706433', 'attribute', '405', '操作url：/Admin/Attribute/update.html', '1', '1522052184');
INSERT INTO `bm_action_log` VALUES ('2006', '10', '1', '2130706433', 'Menu', '238', '操作url：/Admin/Menu/edit.html', '1', '1522052465');
INSERT INTO `bm_action_log` VALUES ('2007', '10', '1', '2130706433', 'Menu', '219', '操作url：/Admin/Menu/edit.html', '1', '1522052478');
INSERT INTO `bm_action_log` VALUES ('2008', '10', '1', '2130706433', 'Menu', '68', '操作url：/Admin/Menu/edit.html', '1', '1522052490');
INSERT INTO `bm_action_log` VALUES ('2009', '10', '1', '2130706433', 'Menu', '68', '操作url：/Admin/Menu/edit.html', '1', '1522052499');
INSERT INTO `bm_action_log` VALUES ('2010', '10', '1', '2130706433', 'Menu', '244', '操作url：/Admin/Menu/add.html', '1', '1522052567');
INSERT INTO `bm_action_log` VALUES ('2011', '7', '1', '2130706433', 'model', '62', '操作url：/Admin/Model/update.html', '1', '1522052660');
INSERT INTO `bm_action_log` VALUES ('2012', '8', '1', '2130706433', 'attribute', '410', '操作url：/Admin/Attribute/update.html', '1', '1522052919');
INSERT INTO `bm_action_log` VALUES ('2013', '8', '1', '2130706433', 'attribute', '411', '操作url：/Admin/Attribute/update.html', '1', '1522052975');
INSERT INTO `bm_action_log` VALUES ('2014', '8', '1', '2130706433', 'attribute', '412', '操作url：/Admin/Attribute/update.html', '1', '1522053057');
INSERT INTO `bm_action_log` VALUES ('2015', '10', '1', '2130706433', 'Menu', '245', '操作url：/Admin/Menu/add.html', '1', '1522053277');
INSERT INTO `bm_action_log` VALUES ('2016', '8', '1', '2130706433', 'attribute', '412', '操作url：/Admin/Attribute/update.html', '1', '1522054556');
INSERT INTO `bm_action_log` VALUES ('2017', '7', '1', '2130706433', 'model', '52', '操作url：/Admin/Model/update.html', '1', '1522054766');
INSERT INTO `bm_action_log` VALUES ('2018', '7', '1', '2130706433', 'model', '62', '操作url：/Admin/Model/update.html', '1', '1522056995');
INSERT INTO `bm_action_log` VALUES ('2019', '7', '1', '2130706433', 'model', '62', '操作url：/Admin/Model/update.html', '1', '1522057168');
INSERT INTO `bm_action_log` VALUES ('2020', '7', '1', '2130706433', 'model', '62', '操作url：/Admin/Model/update.html', '1', '1522057322');
INSERT INTO `bm_action_log` VALUES ('2021', '10', '1', '2130706433', 'Menu', '238', '操作url：/Admin/Menu/edit.html', '1', '1522057756');
INSERT INTO `bm_action_log` VALUES ('2022', '7', '1', '2130706433', 'model', '62', '操作url：/Admin/Model/update.html', '1', '1522057852');
INSERT INTO `bm_action_log` VALUES ('2023', '7', '1', '2130706433', 'model', '63', '操作url：/Admin/Model/update.html', '1', '1522072219');
INSERT INTO `bm_action_log` VALUES ('2024', '8', '1', '2130706433', 'attribute', '413', '操作url：/Admin/Attribute/update.html', '1', '1522072654');
INSERT INTO `bm_action_log` VALUES ('2025', '8', '1', '2130706433', 'attribute', '414', '操作url：/Admin/Attribute/update.html', '1', '1522072705');
INSERT INTO `bm_action_log` VALUES ('2026', '8', '1', '2130706433', 'attribute', '415', '操作url：/Admin/Attribute/update.html', '1', '1522072768');
INSERT INTO `bm_action_log` VALUES ('2027', '8', '1', '2130706433', 'attribute', '416', '操作url：/Admin/Attribute/update.html', '1', '1522072819');
INSERT INTO `bm_action_log` VALUES ('2028', '8', '1', '2130706433', 'attribute', '415', '操作url：/Admin/Attribute/update.html', '1', '1522072845');
INSERT INTO `bm_action_log` VALUES ('2029', '8', '1', '2130706433', 'attribute', '416', '操作url：/Admin/Attribute/update.html', '1', '1522072861');
INSERT INTO `bm_action_log` VALUES ('2030', '8', '1', '2130706433', 'attribute', '417', '操作url：/Admin/Attribute/update.html', '1', '1522072905');
INSERT INTO `bm_action_log` VALUES ('2031', '7', '1', '2130706433', 'model', '63', '操作url：/Admin/Model/update.html', '1', '1522073305');
INSERT INTO `bm_action_log` VALUES ('2032', '10', '1', '2130706433', 'Menu', '246', '操作url：/Admin/Menu/add.html', '1', '1522073423');
INSERT INTO `bm_action_log` VALUES ('2033', '8', '1', '2130706433', 'attribute', '417', '操作url：/Admin/Attribute/update.html', '1', '1522073684');
INSERT INTO `bm_action_log` VALUES ('2034', '7', '1', '2130706433', 'model', '63', '操作url：/Admin/Model/update.html', '1', '1522074034');
INSERT INTO `bm_action_log` VALUES ('2035', '6', '1', '2130706433', 'config', '38', '操作url：/Admin/Config/edit.html', '1', '1522075012');
INSERT INTO `bm_action_log` VALUES ('2036', '6', '1', '2130706433', 'config', '38', '操作url：/Admin/Config/edit.html', '1', '1522075083');
INSERT INTO `bm_action_log` VALUES ('2037', '7', '1', '2130706433', 'model', '63', '操作url：/Admin/Model/update.html', '1', '1522075324');
INSERT INTO `bm_action_log` VALUES ('2038', '7', '1', '2130706433', 'model', '63', '操作url：/Admin/Model/update.html', '1', '1522075374');
INSERT INTO `bm_action_log` VALUES ('2039', '10', '1', '2130706433', 'Menu', '212', '操作url：/Admin/Menu/edit.html', '1', '1522075492');
INSERT INTO `bm_action_log` VALUES ('2040', '7', '1', '2130706433', 'model', '64', '操作url：/Admin/Model/update.html', '1', '1522075706');
INSERT INTO `bm_action_log` VALUES ('2041', '8', '1', '2130706433', 'attribute', '413', '操作url：/Admin/Attribute/update.html', '1', '1522076790');
INSERT INTO `bm_action_log` VALUES ('2042', '8', '1', '2130706433', 'attribute', '413', '操作url：/Admin/Attribute/update.html', '1', '1522076860');
INSERT INTO `bm_action_log` VALUES ('2043', '8', '1', '2130706433', 'attribute', '413', '操作url：/Admin/Attribute/update.html', '1', '1522076901');
INSERT INTO `bm_action_log` VALUES ('2044', '8', '1', '2130706433', 'attribute', '413', '操作url：/Admin/Attribute/update.html', '1', '1522076946');
INSERT INTO `bm_action_log` VALUES ('2045', '8', '1', '2130706433', 'attribute', '413', '操作url：/Admin/Attribute/update.html', '1', '1522077277');
INSERT INTO `bm_action_log` VALUES ('2046', '8', '1', '2130706433', 'attribute', '413', '操作url：/Admin/Attribute/update.html', '1', '1522077314');
INSERT INTO `bm_action_log` VALUES ('2047', '8', '1', '2130706433', 'attribute', '413', '操作url：/Admin/Attribute/update.html', '1', '1522077330');
INSERT INTO `bm_action_log` VALUES ('2048', '8', '1', '2130706433', 'attribute', '413', '操作url：/Admin/Attribute/update.html', '1', '1522077352');
INSERT INTO `bm_action_log` VALUES ('2049', '1', '1', '2130706433', 'member', '1', 'admin在2018-04-02 08:19登录了后台', '1', '1522628343');
INSERT INTO `bm_action_log` VALUES ('2050', '10', '1', '2130706433', 'Menu', '226', '操作url：/Admin/Menu/edit.html', '1', '1522629445');
INSERT INTO `bm_action_log` VALUES ('2051', '10', '1', '2130706433', 'Menu', '0', '操作url：/Admin/Menu/del/id/243.html', '1', '1522629478');
INSERT INTO `bm_action_log` VALUES ('2052', '10', '1', '2130706433', 'Menu', '229', '操作url：/Admin/Menu/edit.html', '1', '1522629496');
INSERT INTO `bm_action_log` VALUES ('2053', '10', '1', '2130706433', 'Menu', '246', '操作url：/Admin/Menu/edit.html', '1', '1522629508');
INSERT INTO `bm_action_log` VALUES ('2054', '1', '1', '2130706433', 'member', '1', 'admin在2018-04-02 12:02登录了后台', '1', '1522641740');
INSERT INTO `bm_action_log` VALUES ('2055', '8', '1', '2130706433', 'attribute', '418', '操作url：/Admin/Attribute/update.html', '1', '1522648348');
INSERT INTO `bm_action_log` VALUES ('2056', '7', '1', '2130706433', 'model', '62', '操作url：/Admin/Model/update.html', '1', '1522648693');
INSERT INTO `bm_action_log` VALUES ('2057', '7', '1', '2130706433', 'model', '62', '操作url：/Admin/Model/update.html', '1', '1522649820');
INSERT INTO `bm_action_log` VALUES ('2058', '7', '1', '2130706433', 'model', '62', '操作url：/Admin/Model/update.html', '1', '1522649862');
INSERT INTO `bm_action_log` VALUES ('2059', '7', '1', '2130706433', 'model', '63', '操作url：/Admin/Model/update.html', '1', '1522652571');
INSERT INTO `bm_action_log` VALUES ('2060', '1', '1', '2130706433', 'member', '1', 'admin在2018-04-03 22:30登录了后台', '1', '1522765803');
INSERT INTO `bm_action_log` VALUES ('2061', '7', '1', '2130706433', 'model', '65', '操作url：/Admin/Model/update.html', '1', '1522767383');
INSERT INTO `bm_action_log` VALUES ('2062', '8', '1', '2130706433', 'attribute', '419', '操作url：/Admin/Attribute/update.html', '1', '1522767517');
INSERT INTO `bm_action_log` VALUES ('2063', '1', '1', '2130706433', 'member', '1', 'admin在2018-04-05 18:57登录了后台', '1', '1522925832');
INSERT INTO `bm_action_log` VALUES ('2064', '8', '1', '2130706433', 'attribute', '420', '操作url：/Admin/Attribute/update.html', '1', '1522926836');
INSERT INTO `bm_action_log` VALUES ('2065', '8', '1', '2130706433', 'attribute', '421', '操作url：/Admin/Attribute/update.html', '1', '1522926884');
INSERT INTO `bm_action_log` VALUES ('2066', '8', '1', '2130706433', 'attribute', '422', '操作url：/Admin/Attribute/update.html', '1', '1522926974');
INSERT INTO `bm_action_log` VALUES ('2067', '7', '1', '2130706433', 'model', '65', '操作url：/Admin/Model/update.html', '1', '1522927135');
INSERT INTO `bm_action_log` VALUES ('2068', '6', '1', '2130706433', 'config', '39', '操作url：/Admin/Config/edit.html', '1', '1522927449');
INSERT INTO `bm_action_log` VALUES ('2069', '10', '1', '2130706433', 'Menu', '247', '操作url：/Admin/Menu/add.html', '1', '1522927797');
INSERT INTO `bm_action_log` VALUES ('2070', '8', '1', '2130706433', 'attribute', '422', '操作url：/Admin/Attribute/update.html', '1', '1522927884');
INSERT INTO `bm_action_log` VALUES ('2071', '1', '1', '2130706433', 'member', '1', 'admin在2018-04-05 20:16登录了后台', '1', '1522930583');
INSERT INTO `bm_action_log` VALUES ('2072', '8', '1', '2130706433', 'attribute', '423', '操作url：/Admin/Attribute/update.html', '1', '1522930940');
INSERT INTO `bm_action_log` VALUES ('2073', '7', '1', '2130706433', 'model', '65', '操作url：/Admin/Model/update.html', '1', '1522931367');
INSERT INTO `bm_action_log` VALUES ('2074', '1', '1', '2130706433', 'member', '1', 'admin在2018-04-05 20:59登录了后台', '1', '1522933169');
INSERT INTO `bm_action_log` VALUES ('2075', '8', '1', '2130706433', 'attribute', '424', '操作url：/Admin/Attribute/update.html', '1', '1522933325');
INSERT INTO `bm_action_log` VALUES ('2076', '8', '1', '2130706433', 'attribute', '425', '操作url：/Admin/Attribute/update.html', '1', '1522933354');
INSERT INTO `bm_action_log` VALUES ('2077', '8', '1', '2130706433', 'attribute', '426', '操作url：/Admin/Attribute/update.html', '1', '1522933381');
INSERT INTO `bm_action_log` VALUES ('2078', '8', '1', '2130706433', 'attribute', '427', '操作url：/Admin/Attribute/update.html', '1', '1522933421');
INSERT INTO `bm_action_log` VALUES ('2079', '8', '1', '2130706433', 'attribute', '428', '操作url：/Admin/Attribute/update.html', '1', '1522933473');
INSERT INTO `bm_action_log` VALUES ('2080', '7', '1', '2130706433', 'model', '59', '操作url：/Admin/Model/update.html', '1', '1522933590');
INSERT INTO `bm_action_log` VALUES ('2081', '7', '1', '2130706433', 'model', '59', '操作url：/Admin/Model/update.html', '1', '1522934446');
INSERT INTO `bm_action_log` VALUES ('2082', '8', '1', '2130706433', 'attribute', '428', '操作url：/Admin/Attribute/update.html', '1', '1522934547');

-- ----------------------------
-- Table structure for bm_addons
-- ----------------------------
DROP TABLE IF EXISTS `bm_addons`;
CREATE TABLE `bm_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of bm_addons
-- ----------------------------
INSERT INTO `bm_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `bm_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '0', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"4\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `bm_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '0', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0');
INSERT INTO `bm_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"4\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `bm_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"150px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `bm_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `bm_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');
INSERT INTO `bm_addons` VALUES ('16', 'baidushare', '百度分享', '用户将网站内容分享到第三方网站，第三方网站的用户点击专有的分享链接，从第三方网站带来社会化流量。', '1', '{\"openbutton\":\"0\",\"buttonlist\":[\"mshare\",\"qzone\",\"tsina\",\"renren\",\"tqq\",\"tieba\"],\"button_size\":\"24\",\"openimg\":\"0\",\"imglist\":[\"mshare\",\"qzone\",\"tsina\",\"renren\",\"tqq\",\"tieba\"],\"openselect\":\"0\",\"selectlist\":[\"mshare\",\"qzone\",\"tsina\",\"renren\",\"tqq\",\"tieba\"]}', 'jesuspan', '0.1', '1444200960', '0');

-- ----------------------------
-- Table structure for bm_adv
-- ----------------------------
DROP TABLE IF EXISTS `bm_adv`;
CREATE TABLE `bm_adv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `adv_title` varchar(255) DEFAULT NULL COMMENT '广告标题',
  `adv_url` varchar(255) DEFAULT NULL COMMENT '广告链接',
  `adv_pic` int(10) unsigned DEFAULT NULL COMMENT '广告图',
  `adv_sort` int(10) unsigned DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_adv
-- ----------------------------
INSERT INTO `bm_adv` VALUES ('1', '路演厅', 'https://www.baidu.com/', '227', '4');
INSERT INTO `bm_adv` VALUES ('2', '简易厨房', 'https://www.baidu.com/', '228', '3');
INSERT INTO `bm_adv` VALUES ('3', '过道', 'https://www.baidu.com/', '224', '2');
INSERT INTO `bm_adv` VALUES ('4', '茶水间', 'https://www.baidu.com/', '225', '1');

-- ----------------------------
-- Table structure for bm_attachment
-- ----------------------------
DROP TABLE IF EXISTS `bm_attachment`;
CREATE TABLE `bm_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of bm_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for bm_attribute
-- ----------------------------
DROP TABLE IF EXISTS `bm_attribute`;
CREATE TABLE `bm_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=429 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of bm_attribute
-- ----------------------------
INSERT INTO `bm_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bm_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '0', '', '1', '0', '1', '1443260756', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `bm_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bm_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bm_attribute` VALUES ('5', 'description', '描述', 'char(150) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1444208662', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `bm_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bm_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bm_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bm_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '0', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1444057717', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `bm_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '1:子页面推荐\r\n2:首页推荐', '1', '0', '1', '1446545726', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `bm_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '0', '', '1', '0', '1', '1444122987', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `bm_attribute` VALUES ('12', 'picture_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '图片规格：160X100', '1', '', '1', '0', '1', '1447654915', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `bm_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '0', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1444122977', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `bm_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '0', '', '1', '0', '1', '1444122969', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `bm_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `bm_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1444122946', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `bm_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1444122920', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `bm_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bm_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '0', '', '1', '0', '1', '1444122903', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `bm_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bm_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bm_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `bm_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `bm_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `bm_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '0', '', '2', '0', '1', '1444123226', '1383891243', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `bm_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '2', '0', '1', '1444123237', '1383891243', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `bm_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `bm_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `bm_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `bm_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `bm_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `bm_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `bm_attribute` VALUES ('67', 'path', '图片地址', 'varchar(255)', 'string', '', '', '1', '', '13', '0', '1', '1441695501', '1441695501', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('68', 'url', '图片网址', 'varchar(255)', 'string', '', '', '1', '', '13', '0', '1', '1441695523', '1441695523', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('69', 'md5', 'md5', 'char(32)', 'md5', '', '', '1', '', '13', '0', '1', '1441695799', '1441695799', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('70', 'sha1', 'sha1', 'char(40)', 'sha1', '', '', '1', '', '13', '0', '1', '1441695827', '1441695827', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('71', 'status', '状态', 'tinyint(2)', 'bool', '', '', '1', '', '13', '0', '1', '1441695866', '1441695866', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('72', 'create_time', '创建时间', 'int(10)', 'datetime', '', '', '1', '', '13', '0', '1', '1441695888', '1441695888', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('372', 'contact_phone_ico', '联系电话图标', 'int(10) UNSIGNED', 'picture', '', '图片规格 80x80', '1', '', '53', '0', '1', '1502763018', '1501638154', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('369', 'history_tile', '事迹标题', 'varchar(255)', 'string', '', '', '1', '', '52', '0', '1', '1501574738', '1501574738', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('370', 'history_time', '事迹时间', 'int(10)', 'datetime', '', '', '1', '', '52', '0', '1', '1501574773', '1501574773', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('371', 'history_content', '事迹内容', 'text', 'textarea', '', '', '1', '', '52', '0', '1', '1501574803', '1501574803', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('99', 'picture_name', '图片名称', 'varchar(255)', 'string', '', '', '1', '', '13', '0', '1', '1443190890', '1442297117', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('100', 'type', '文件类型', 'varchar(255)', 'string', '', '', '1', '', '13', '0', '1', '1442297252', '1442297252', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('101', 'ext', '文件后缀', 'varchar(255)', 'string', '', '', '1', '', '13', '0', '1', '1442297332', '1442297332', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('102', 'size', '文件大小', 'int(10) UNSIGNED', 'num', '', '', '1', '', '13', '0', '1', '1442297489', '1442297427', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('104', 'savename', '保存文件名', 'varchar(255)', 'string', '', '', '1', '', '13', '0', '1', '1442298966', '1442298966', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('105', 'savepath', '保存路径', 'varchar(255)', 'string', '', '', '1', '', '13', '0', '1', '1442299016', '1442299016', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('112', 'mailbox_host', '邮件主机', 'varchar(255)', 'string', '', '', '1', '', '16', '1', '1', '1473166705', '1442319899', '/(https?:\\/\\/)?([\\da-z-\\.]+)\\.([a-z]{2,6})([\\/\\w \\.-?&%-]*)*\\/?/', '3', '请填写正确的邮箱主机 比如smtp.qq.com', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('113', 'mailbox_port', '邮件端口', 'int(10) UNSIGNED', 'num', '', '', '1', '', '16', '1', '1', '1473166696', '1442319941', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('114', 'mailbox_from', '发送邮箱', 'varchar(255)', 'string', '', '', '1', '', '16', '1', '1', '1473166686', '1442320171', '/([a-z0-9]*[-_.]?[a-z0-9]+)*@([a-z0-9]*[-_]?[a-z0-9]+)+[.][a-z]{2,3}([.][a-z]{2})?/i', '3', '邮箱格式不正确', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('115', 'mailbox_pwd', '邮箱密码', 'varchar(255)', 'pwd', '', '', '1', '', '16', '1', '1', '1473166679', '1442320524', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('298', 'name', '文件名', 'varchar(255)', 'string', '', '', '1', '', '40', '0', '1', '1459152368', '1459152368', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('299', 'savename', '文档保存名称', 'varchar(255)', 'string', '', '', '1', '', '40', '0', '1', '1459152393', '1459152393', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('300', 'savepath', '文档保存路径', 'varchar(255)', 'string', '', '', '1', '', '40', '0', '1', '1459152425', '1459152425', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('301', 'ext', '文件后缀', 'char(40)', 'char', '', '', '1', '', '40', '0', '1', '1459152868', '1459152507', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('302', 'mime', '内容类型', 'char(40)', 'char', '', '', '1', '', '40', '0', '1', '1459152917', '1459152917', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('303', 'size', '文件大小', 'int(10) UNSIGNED', 'num', '', '', '1', '', '40', '0', '1', '1459152978', '1459152978', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('304', 'md5', 'md5', 'char(32)', 'md5', '', '', '1', '', '40', '0', '1', '1459152998', '1459152998', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('305', 'sha1', 'sha1', 'char(40)', 'sha1', '', '', '1', '', '40', '0', '1', '1459153029', '1459153029', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('306', 'location', '位置', 'tinyint(3)', 'bool', '', '', '1', '', '40', '0', '1', '1459153126', '1459153126', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('307', 'url', '统一地址', 'varchar(255)', 'string', '', '', '1', '', '40', '0', '1', '1459153150', '1459153150', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('308', 'create_time', '创建时间', 'int(10)', 'datetime', '', '', '1', '', '40', '0', '1', '1459153182', '1459153182', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('373', 'contact_phone', '联系电话', 'varchar(255)', 'string', '', '', '1', '', '53', '0', '1', '1501638187', '1501638187', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('374', 'contact_email_ico', '邮箱图标', 'int(10) UNSIGNED', 'picture', '', '图片规格 80x80', '1', '', '53', '0', '1', '1502763011', '1501638213', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('375', 'contact_email', '联系邮箱', 'varchar(255)', 'string', '', '', '1', '', '53', '0', '1', '1501638232', '1501638232', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('355', 'worker_name', '名称', 'varchar(255)', 'string', '', '', '1', '', '48', '0', '1', '1501568394', '1501568394', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('354', 'aboutus_pics', '图片组', 'varchar(100)', 'pictures', '', '图片规格 350x200 jpg格式', '1', '', '47', '0', '1', '1502766469', '1501567679', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('353', 'aboutus_content', '内容', 'text', 'editor', '', '', '1', '', '47', '0', '1', '1501567634', '1501567634', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('352', 'aboutus_title', '标题', 'varchar(255)', 'string', '', '', '1', '', '47', '0', '1', '1501567600', '1501567600', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('318', 'lang_name', '语言名称', 'varchar(255)', 'string', '', '', '1', '', '42', '0', '1', '1473212986', '1473212986', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('319', 'lang_tag', '语言标签', 'varchar(255)', 'string', '', '', '1', '', '42', '0', '1', '1473213042', '1473213042', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('320', 'lang_ico', '语言图标', 'int(10) UNSIGNED', 'picture', '', '', '1', '', '42', '0', '1', '1473213071', '1473213071', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('321', 'translate_concern_id', '文章或分类的id', 'int(10) UNSIGNED', 'num', '', '', '1', '', '43', '0', '1', '1473233245', '1473233245', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('322', 'translate_lang_id', '语言的id', 'int(10) UNSIGNED', 'num', '', '', '1', '', '43', '0', '1', '1473233279', '1473233279', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('323', 'translate_lang_tag', '翻译的语言标签', 'varchar(255)', 'string', '', '', '1', '', '43', '0', '1', '1473233531', '1473233531', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('324', 'translate_type', '翻译的类型', 'int(10) UNSIGNED', 'num', '', '1:文章 2:类别', '1', '', '43', '0', '1', '1473233711', '1473233711', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('325', 'translate_content', '翻译内容', 'varchar(500)', 'string', '', '', '1', '', '43', '0', '1', '1473233757', '1473233757', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('376', 'contact_adr_ico', '联系地址图标', 'int(10) UNSIGNED', 'picture', '', '图片规格 80x80', '1', '', '53', '0', '1', '1502763004', '1501638266', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('329', 'nav_name', '菜单名称', 'varchar(255)', 'string', '', '', '1', '', '44', '0', '1', '1476278325', '1476278325', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('330', 'nav_pos_lang', '菜单位置语言', 'varchar(15)', 'string', '', '', '1', '', '44', '0', '1', '1476278369', '1476278369', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('331', 'nav_content', '菜单构造', 'text', 'strings', '', '', '1', '', '44', '0', '1', '1476278468', '1476278468', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('368', 'act_time', '活动时间', 'int(10)', 'datetime', '', '', '1', '', '51', '0', '1', '1501573495', '1501573495', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('367', 'act_pic', '活动展示图', 'int(10) UNSIGNED', 'picture', '', '图片规格 420x300 jpg格式 不超过1M', '1', '', '51', '0', '1', '1502762703', '1501573466', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('366', 'act_content', '活动内容', 'text', 'textarea', '', '', '1', '', '51', '0', '1', '1501573448', '1501573448', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('365', 'act_title', '活动标题', 'varchar(255)', 'string', '', '', '1', '', '51', '0', '1', '1501573427', '1501573427', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('356', 'worker_img', '相片', 'int(10) UNSIGNED', 'picture', '', '', '1', '', '48', '0', '1', '1501568417', '1501568417', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('357', 'worker_brief', '简介', 'text', 'textarea', '', '', '1', '', '48', '0', '1', '1501568448', '1501568448', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('358', 'worker_sort', '排序', 'int(10) UNSIGNED', 'num', '', '', '1', '', '48', '0', '1', '1501571467', '1501571467', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('359', 'partner_name', '合作伙伴名称', 'varchar(255)', 'string', '', '', '1', '', '49', '0', '1', '1501571566', '1501571566', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('360', 'partner_img', '合作伙伴图标', 'int(10) UNSIGNED', 'picture', '', '', '1', '', '49', '0', '1', '1501571609', '1501571609', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('361', 'partner_sort', '排序', 'int(10) UNSIGNED', 'num', '', '', '1', '', '49', '0', '1', '1501571630', '1501571630', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('362', 'links_name', '链接名称', 'varchar(255)', 'string', '', '', '1', '', '50', '0', '1', '1501572909', '1501572909', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('363', 'links_url', '链接url', 'varchar(255)', 'string', '', '比如输入https://www.baidu.com/', '1', '', '50', '0', '1', '1501572973', '1501572973', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('364', 'links_sort', '排序', 'int(10) UNSIGNED', 'num', '', '', '1', '', '50', '0', '1', '1501572994', '1501572994', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('349', 'forms_name', '表单名称', 'varchar(255)', 'string', '', '', '1', '', '46', '0', '1', '1476626348', '1476626348', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('350', 'forms_struct', '表单结构', 'text', 'strings', '', '', '1', '', '46', '0', '1', '1476626464', '1476626464', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('351', 'forms_lang', '表单语言', 'int(10) UNSIGNED', 'num', '', '', '1', '', '46', '0', '1', '1476626619', '1476626619', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('377', 'contact_adr', '联系地址', 'varchar(255)', 'string', '', '', '1', '', '53', '0', '1', '1501638288', '1501638288', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('378', 'contact_adr_map', '联系地址地图', 'int(10) UNSIGNED', 'picture', '', '图片规格 1600x450 jpg格式不超过1M', '1', '', '53', '0', '1', '1502762987', '1501638322', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('379', 'banner_name', 'banner图名称', 'varchar(255)', 'string', '', '', '1', '', '54', '0', '1', '1501638439', '1501638439', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('380', 'banner_url', 'banner图链接', 'varchar(255)', 'string', '', '', '1', '', '54', '0', '1', '1501638468', '1501638468', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('381', 'banner_sort', 'banner图排序', 'int(10) UNSIGNED', 'num', '', '', '1', '', '54', '0', '1', '1501638491', '1501638491', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('382', 'banner_pic', 'banner图', 'int(10) UNSIGNED', 'picture', '', '图片规格 1600x450 jpg格式 不超过1M', '1', '', '54', '0', '1', '1502762439', '1501638573', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('383', 'adv_title', '广告标题', 'varchar(255)', 'string', '', '', '1', '', '55', '0', '1', '1501638816', '1501638816', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('384', 'adv_url', '广告链接', 'varchar(255)', 'string', '', '', '1', '', '55', '0', '1', '1501638833', '1501638833', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('385', 'adv_pic', '广告图', 'int(10) UNSIGNED', 'picture', '', '图片规格 1600x380 最好jpg格式不超过1M', '1', '', '55', '0', '1', '1502762482', '1501638905', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('386', 'adv_sort', '排序', 'int(10) UNSIGNED', 'num', '', '', '1', '', '55', '0', '1', '1501638925', '1501638925', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('387', 'spaceshow_title', '空间展示标题', 'varchar(255)', 'string', '', '', '1', '', '56', '0', '1', '1501641008', '1501640932', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('388', 'spaceshow_url', '空间展示链接', 'varchar(255)', 'string', '', '', '0', '', '56', '0', '1', '1502762535', '1501640953', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('389', 'spaceshow_pic', '空间展示图', 'int(10) UNSIGNED', 'picture', '', '图片规格 300x200 jpg格式 不超过1M', '1', '', '56', '0', '1', '1502762518', '1501640994', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('390', 'spaceshow_sort', '排序', 'int(10) UNSIGNED', 'num', '', '', '1', '', '56', '0', '1', '1501641023', '1501641023', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('391', 'webcontent_logo', '网站logo', 'int(10) UNSIGNED', 'picture', '', '', '1', '', '57', '0', '1', '1501641287', '1501641287', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('392', 'webcontent_law', '法律说明(中文)', 'text', 'editor', '', '', '1', '', '57', '0', '1', '1502348756', '1501641327', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('393', 'webcontent_rcode', '网站二维码', 'int(10) UNSIGNED', 'picture', '', '', '1', '', '57', '0', '1', '1501641345', '1501641345', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('394', 'webcontent_tel', '电话客服', 'varchar(255)', 'string', '', '', '1', '', '57', '0', '1', '1501641381', '1501641381', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('395', 'bespoke_pic', '预约底部图', 'int(10) UNSIGNED', 'picture', '', '图片规格 1600x450 jpg格式 不超过1M', '1', '', '58', '0', '1', '1502762893', '1501641518', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('396', 'spaceshow_content', '展示空间', 'text NOT NULL', 'editor', '', '', '1', '', '56', '0', '1', '1502270923', '1502270923', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('397', 'book_time', '预定时间', 'int(10)', 'datetime', '', '', '1', '', '59', '0', '1', '1502335573', '1502335573', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('398', 'book_times', '预定时间段', 'int(10)', 'num', '', '', '1', '', '59', '0', '1', '1502335595', '1502335595', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('399', 'book_name', '预定人', 'varchar(255)', 'string', '', '', '1', '', '59', '0', '1', '1502335612', '1502335612', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('400', 'book_mobile', '联系电话', 'varchar(255)', 'string', '', '', '1', '', '59', '0', '1', '1502335630', '1502335630', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('401', 'trans_key', '关键词', 'varchar(255)', 'string', '', '', '1', '', '60', '0', '1', '1502348481', '1502348481', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('402', 'trans_value', '关键值', 'varchar(255)', 'string', '', '', '1', '', '60', '0', '1', '1502348499', '1502348499', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('403', 'webcontent_law_en', '法律说明(英文)', 'text', 'editor', '', '', '1', '', '57', '0', '1', '1502348784', '1502348784', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('404', 'secondary_title', '二级标题', 'varchar(255) NOT NULL', 'string', '', '团队精英中的二级标题', '1', '', '48', '1', '1', '1522052062', '1522052062', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('405', 'woker_record', '二级标题详细内容', 'text NOT NULL', 'editor', '', '二级标题详细内容', '1', '', '48', '0', '1', '1522052184', '1522052184', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('410', 'info_title', '资讯标题', 'varchar(255) NOT NULL', 'string', '', '资讯标题', '1', '', '62', '1', '1', '1522052919', '1522052919', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('411', 'info_add_time', '发布时间', 'int(10) NOT NULL', 'datetime', '', '发布时间', '1', '', '62', '1', '1', '1522052975', '1522052975', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('412', 'info_content', '资讯内容', 'text NOT NULL', 'editor', '', '资讯内容', '1', '', '62', '0', '1', '1522054556', '1522053057', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('413', 'sec_type', 'banner类型', 'char(10) NOT NULL', 'radio', '1', 'banner类型', '1', '1:联系我们\r\n2:空间展示\r\n3:关于我们\r\n4:精英团队\r\n5:资讯中心\r\n6:团队入驻', '63', '1', '1', '1522077352', '1522072654', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('414', 'sec_add_time', '添加/修改时间', 'int(10) NOT NULL', 'datetime', '', '添加/修改时间', '1', '', '63', '1', '1', '1522072705', '1522072705', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('415', 'sec_title_chinese', 'banner标题[中]', 'varchar(255) NOT NULL', 'string', '', 'banner标题[中]', '1', '', '63', '1', '1', '1522072845', '1522072768', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('416', 'sec_title_english', '二级banner[en]', 'varchar(255) NOT NULL', 'string', '', '二级banner[en]', '1', '', '63', '1', '1', '1522072861', '1522072819', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('417', 'second_img_url', '图片链接', 'int(10) UNSIGNED NOT NULL', 'picture', '', '图片链接', '1', '', '63', '1', '1', '1522073684', '1522072905', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('418', 'info_img', '资讯封面图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '资讯表面图片', '1', '', '62', '0', '1', '1522648348', '1522648348', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('419', 'team_title', '文案标题', 'varchar(255) NOT NULL', 'string', '', '文案标题', '1', '', '65', '1', '1', '1522767517', '1522767517', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('420', 'team_type', '说明类型', 'char(10) NOT NULL', 'radio', '', '说明类型', '1', '1:入驻条件\r\n2:入驻流程', '65', '1', '1', '1522926836', '1522926836', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('421', 'add_time', '添加时间', 'int(10) NOT NULL', 'datetime', '', '添加时间', '1', '', '65', '1', '1', '1522926884', '1522926884', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('422', 'team_content', '文本内容', 'text NOT NULL', 'editor', '', '文本内容', '1', '', '65', '0', '1', '1522927884', '1522926974', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('423', 'team_img', '文案配图', 'int(10) UNSIGNED NOT NULL', 'picture', '', '文案配图', '1', '', '65', '0', '1', '1522930940', '1522930940', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('424', 'space', '城市', 'varchar(255) NOT NULL', 'string', '', '城市', '1', '', '59', '0', '1', '1522933325', '1522933325', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('425', 'email', '邮箱', 'varchar(255) NOT NULL', 'string', '', '邮箱', '1', '', '59', '0', '1', '1522933355', '1522933355', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('426', 'company_name', '公司名称', 'varchar(255) NOT NULL', 'string', '', '公司名称', '1', '', '59', '0', '1', '1522933381', '1522933381', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('427', 'company_count', '公司人数', 'int(10) UNSIGNED NOT NULL', 'num', '', '公司人数', '1', '', '59', '0', '1', '1522933421', '1522933421', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `bm_attribute` VALUES ('428', 'company_desc', '公司简介', 'text NOT NULL', 'textarea', '', 'company_desc', '1', '', '59', '0', '1', '1522934547', '1522933473', '', '3', '', 'regex', '', '3', 'function');

-- ----------------------------
-- Table structure for bm_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `bm_auth_extend`;
CREATE TABLE `bm_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of bm_auth_extend
-- ----------------------------
INSERT INTO `bm_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `bm_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `bm_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `bm_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `bm_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `bm_auth_extend` VALUES ('1', '39', '1');

-- ----------------------------
-- Table structure for bm_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `bm_auth_group`;
CREATE TABLE `bm_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` text NOT NULL COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bm_auth_group
-- ----------------------------
INSERT INTO `bm_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '默认用户', '1', '1,3,4,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,100,102,103,105,106,107,108,109,110,111,205,206,207,208,209,210,211,212,213,214,215,216,243,253,254,255,259,273,274,275,276,290,291,292,294,296,297,299,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325');
INSERT INTO `bm_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,3,4,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,100,102,103,105,106,107,108,109,110,111,205,206,207,208,209,210,211,212,213,214,215,216,217,243,245,253,254,255,259,273,274,275,276,290,291,292,294,296,297,299,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324');
INSERT INTO `bm_auth_group` VALUES ('3', 'admin', '1', 'test', '', '-1', '');
INSERT INTO `bm_auth_group` VALUES ('4', 'admin', '1', 'test', '', '-1', '');
INSERT INTO `bm_auth_group` VALUES ('5', 'admin', '1', 'test', '', '-1', '');

-- ----------------------------
-- Table structure for bm_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `bm_auth_group_access`;
CREATE TABLE `bm_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bm_auth_group_access
-- ----------------------------
INSERT INTO `bm_auth_group_access` VALUES ('2', '1');
INSERT INTO `bm_auth_group_access` VALUES ('3', '1');
INSERT INTO `bm_auth_group_access` VALUES ('4', '1');
INSERT INTO `bm_auth_group_access` VALUES ('4', '2');
INSERT INTO `bm_auth_group_access` VALUES ('6', '1');
INSERT INTO `bm_auth_group_access` VALUES ('6', '2');
INSERT INTO `bm_auth_group_access` VALUES ('8', '1');
INSERT INTO `bm_auth_group_access` VALUES ('8', '2');
INSERT INTO `bm_auth_group_access` VALUES ('9', '1');
INSERT INTO `bm_auth_group_access` VALUES ('9', '2');
INSERT INTO `bm_auth_group_access` VALUES ('10', '1');
INSERT INTO `bm_auth_group_access` VALUES ('10', '2');

-- ----------------------------
-- Table structure for bm_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `bm_auth_rule`;
CREATE TABLE `bm_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=327 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bm_auth_rule
-- ----------------------------
INSERT INTO `bm_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '仪表盘', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '资讯', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统设置', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('17', 'admin', '1', 'Admin/Article/index', '文档列表', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('18', 'admin', '1', 'Admin/Article/recycle', '回收站', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '资讯分类授权', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('111', 'admin', '2', 'Admin/Article/index', '资讯', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('217', 'admin', '1', 'Admin/User/setStatus?Model=action&status=-1', '用户行为删除', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('218', 'admin', '2', 'Admin/Product/index', '商品', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('219', 'admin', '1', 'Admin/Hotline/lists', '在线客服列表', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('220', 'admin', '2', 'Admin/Hotline/lists', '其他', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('221', 'admin', '1', 'Admin/Friendlinks/lists', '友情链接列表', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('222', 'admin', '1', 'Admin/Hotline/add', '在线客服添加', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('223', 'admin', '1', 'Admin/Hotline/edit', '在线客服修改', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('224', 'admin', '1', 'Admin/Friendlinks/edit', '友情链接修改', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('225', 'admin', '1', 'Admin/Friendlinks/add', '友情链接添加', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('226', 'admin', '1', 'Admin/Goodcates/index', '商品分类', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('227', 'admin', '1', 'Admin/Goodcates/add', '商品类别新增', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('228', 'admin', '1', 'Admin/Goodcates/edit', '商品类别编辑', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('229', 'admin', '1', 'Admin/Solvent/lists', '溶剂管理', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('230', 'admin', '1', 'Admin/Solvent/add', '溶剂添加', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('231', 'admin', '1', 'Admin/Solvent/edit', '溶剂编辑', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('232', 'admin', '1', 'Admin/Apply/lists', '应用领域管理', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('233', 'admin', '1', 'Admin/Apply/add', '应用领域添加', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('234', 'admin', '1', 'Admin/Apply/edit', '应用领域编辑', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('235', 'admin', '2', 'Admin/Goodcates/index', '商品', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('236', 'admin', '1', 'Admin/Good/lists', '商品列表', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('237', 'admin', '1', 'Admin/Good/add', '商品新增', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('238', 'admin', '1', 'Admin/Good/edit', '商品编辑', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('239', 'admin', '1', 'Admin/Member/lists', '会员信息', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('240', 'admin', '1', 'Admin/Member/edit', '编辑会员', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('241', 'admin', '1', 'Admin/Demand/lists', '会员留言列表', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('242', 'admin', '1', 'Admin/Demand/edit', '留言回复', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('243', 'admin', '1', 'Admin/Mailbox/index', '邮箱设置', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('244', 'admin', '1', 'Admin/Contact/index', '联系信息设置', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('245', 'admin', '2', 'Admin/Mailbox/index', '系统设置', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('246', 'admin', '1', 'Admin/Sample/lists', '取样审核列表', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('247', 'admin', '1', 'Admin/Sample/edit', '取样详情编辑', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('248', 'admin', '2', 'Admin/Sample/lists', '订单', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('249', 'admin', '1', 'Admin/Order/lists', '订单待付款列表', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('250', 'admin', '1', 'Admin/Order/orderexpress', '订单物流详情', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('251', 'admin', '1', 'Admin/Order/edit', '订单详情编辑', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('252', 'admin', '2', 'Admin/Order/lists', '订单', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('253', 'admin', '1', 'Admin/Banner/lists', 'banner图', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('254', 'admin', '1', 'Admin/Banner/edit', '编辑', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('255', 'admin', '1', 'Admin/Banner/add', '添加', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('256', 'admin', '1', 'Admin/Feedback/lists', '缺货登记列表', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('257', 'admin', '1', 'Admin/Feedback/edit', '留言查看', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('258', 'admin', '1', 'Admin/Company/index', '平台信息设置', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('259', 'admin', '1', 'Admin/cache/del', '清除缓存', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('260', 'admin', '1', 'Admin/Order/cancellist', '订单取消列表', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('261', 'admin', '1', 'Admin/Order/isnotpass', '订单审核未通过列表', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('262', 'admin', '1', 'Admin/Order/passlist', '订单审核通过列表', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('263', 'admin', '1', 'Admin/Order/undeliveredlist', '订单待发货列表', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('264', 'admin', '1', 'Admin/Order/deliveredlist', '订单已发货列表', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('265', 'admin', '1', 'Admin/Order/receiptlist', '订单确认收货列表', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('266', 'admin', '2', 'Admin/Count/lists', '统计', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('267', 'admin', '1', 'Admin/Count/lists', '统计详情', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('268', 'admin', '1', 'Admin/Sample/undeliveredlists', '取样未发货列表', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('269', 'admin', '1', 'Admin/Sample/deliveredlists', '取样发货列表', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('270', 'admin', '1', 'Admin/History/index', '历史统计查询', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('271', 'admin', '1', 'Admin/Order/finishlist', '订单完成列表', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('272', 'admin', '1', 'Admin/Sample/finishlists', '取样完结列表', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('273', 'admin', '1', 'Admin/think/lists', '数据', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('274', 'admin', '2', 'Admin/Banner/lists', '首页', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('275', 'admin', '1', 'Admin/Partner/lists', '合作伙伴', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('276', 'admin', '1', 'Admin/Partner/add', '添加', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('277', 'admin', '1', 'Admin/Essay/lists', '资讯内容列表', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('278', 'admin', '1', 'Admin/Essay/edit', '资讯内容修改', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('279', 'admin', '1', 'Admin/Essay/add', '资讯内容添加', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('280', 'admin', '1', 'Admin/Comment/lists', '评论列表', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('281', 'admin', '2', 'Admin/Essay/lists', '内容管理', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('282', 'admin', '1', 'Admin/Grade/lists', '会员等级列表', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('283', 'admin', '1', 'Admin/Grade/edit', '会员等级修改', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('284', 'admin', '1', 'Admin/Grade/add', '会员等级添加', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('285', 'admin', '1', 'Admin/Threads/lists', '商友圈内容列表', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('286', 'admin', '1', 'Admin/Threadcomment/lists', '圈友评论内容列表', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('287', 'admin', '1', 'Admin/Orderstatics/index', '订单统计', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('288', 'admin', '1', 'Admin/Orderstongji/index', '用户订单统计', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('289', 'admin', '2', 'Admin/Orderstatics/index', '统计', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('290', 'admin', '1', 'Admin/File/lists', '文档管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('291', 'admin', '1', 'Admin/Picture/lists', '图片管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('292', 'admin', '1', 'Admin/Picture/edit', '图片编辑', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('293', 'admin', '1', 'Admin/Belong/lists', '分类列表', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('294', 'admin', '1', 'Admin/Lang/lists', '语言管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('295', 'admin', '2', 'Admin/Belong/lists', '文章分类', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('296', 'admin', '1', 'Admin/Nav/index', '导航管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('297', 'admin', '1', 'Admin/Contact/lists', '联系我们', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('298', 'admin', '1', 'Admin/Contact/add', '联系我们添加', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('299', 'admin', '1', 'Admin/Forms/index', '表单设置', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('300', 'admin', '2', 'Admin/Contact/lists', '联系我们', '-1', '');
INSERT INTO `bm_auth_rule` VALUES ('301', 'admin', '1', 'Admin/Partner/edit', '编辑', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('302', 'admin', '1', 'Admin/Aboutus/lists', '关于我们', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('303', 'admin', '1', 'Admin/Worker/lists', '精英团队', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('304', 'admin', '1', 'Admin/Worker/edit', '成员编辑', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('305', 'admin', '1', 'Admin/Worker/add', '成员添加', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('306', 'admin', '1', 'Admin/Adv/lists', '广告图管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('307', 'admin', '1', 'Admin/Adv/edit', '编辑', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('308', 'admin', '1', 'Admin/Adv/add', '添加', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('309', 'admin', '1', 'Admin/Spaceshow/lists', '空间展示管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('310', 'admin', '1', 'Admin/Links/lists', '友情链接', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('311', 'admin', '1', 'Admin/Act/index', '近期活动管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('312', 'admin', '1', 'Admin/Act/edit', '编辑', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('313', 'admin', '1', 'Admin/Act/add', '添加', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('314', 'admin', '1', 'Admin/History/lists', '重大事件管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('315', 'admin', '1', 'Admin/History/edit', '编辑', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('316', 'admin', '1', 'Admin/History/add', '添加', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('317', 'admin', '1', 'Admin/Webcontent/index', '网站内容管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('318', 'admin', '1', 'Admin/Book/lists', '预约列表', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('319', 'admin', '1', 'Admin/Trans/lists', '字符串翻译', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('320', 'admin', '1', 'Admin/Bespoke/index', '预约背景图设置', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('321', 'admin', '2', 'Admin/Aboutus/lists', '关于我们', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('322', 'admin', '2', 'Admin/Book/lists', '预约参观', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('323', 'admin', '2', 'Admin/Links/lists', '底部导航', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('324', 'admin', '2', 'Admin/Picture/popimg', '图片选择', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('325', 'admin', '1', 'Admin/Service/lists', '服务管理', '1', '');
INSERT INTO `bm_auth_rule` VALUES ('326', 'admin', '2', 'Admin/Webcontent/index', '系统设置', '1', '');

-- ----------------------------
-- Table structure for bm_banner
-- ----------------------------
DROP TABLE IF EXISTS `bm_banner`;
CREATE TABLE `bm_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `banner_name` varchar(255) DEFAULT NULL COMMENT 'banner图名称',
  `banner_url` varchar(255) DEFAULT NULL COMMENT 'banner图链接',
  `banner_sort` int(10) unsigned DEFAULT NULL COMMENT 'banner图排序',
  `banner_pic` int(10) unsigned DEFAULT NULL COMMENT 'banner图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_banner
-- ----------------------------
INSERT INTO `bm_banner` VALUES ('1', '路演厅', '#', '4', '227');
INSERT INTO `bm_banner` VALUES ('2', '简易厨房', '#', '3', '228');
INSERT INTO `bm_banner` VALUES ('3', '过道', '', '2', '224');
INSERT INTO `bm_banner` VALUES ('4', '茶水间', '', '1', '225');
INSERT INTO `bm_banner` VALUES ('5', '前台', '', '5', '226');
INSERT INTO `bm_banner` VALUES ('6', '微信图片', '', '6', '231');
INSERT INTO `bm_banner` VALUES ('8', '总经理室', '', '8', '229');

-- ----------------------------
-- Table structure for bm_bespoke
-- ----------------------------
DROP TABLE IF EXISTS `bm_bespoke`;
CREATE TABLE `bm_bespoke` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bespoke_pic` int(10) unsigned DEFAULT NULL COMMENT '预约底部图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_bespoke
-- ----------------------------
INSERT INTO `bm_bespoke` VALUES ('1', '186');

-- ----------------------------
-- Table structure for bm_book
-- ----------------------------
DROP TABLE IF EXISTS `bm_book`;
CREATE TABLE `bm_book` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_time` int(10) DEFAULT NULL COMMENT '预定时间',
  `book_times` int(10) DEFAULT NULL COMMENT '预定时间段',
  `book_name` varchar(255) DEFAULT NULL COMMENT '预定人',
  `book_mobile` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `space` varchar(255) NOT NULL COMMENT '城市',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `company_name` varchar(255) NOT NULL COMMENT '公司名称',
  `company_count` int(10) unsigned NOT NULL COMMENT '公司人数',
  `company_desc` text NOT NULL COMMENT '公司简介',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_book
-- ----------------------------
INSERT INTO `bm_book` VALUES ('17', '1502726400', '1', 'test', '13800138000', '', '', '', '0', '');
INSERT INTO `bm_book` VALUES ('18', '1503504000', '4', 'test1', '13800138000', '', '', '', '0', '');
INSERT INTO `bm_book` VALUES ('16', '1502640000', '1', 'test2', '123', '', '', '', '0', '');
INSERT INTO `bm_book` VALUES ('20', '1522934345', null, '张慧源', '18321226592', '上海', 'turing_zhy@163.com', 'hello world工作室', '4', '可以介绍您的软对人数、团队优势可以介绍您的软对人数、团队优势可以介绍您的软对人数、团队优势可以介绍您的软对人数、团队优势可以介绍您的软对人数、团队优势可以介绍您的软对人数、团队优势');

-- ----------------------------
-- Table structure for bm_category
-- ----------------------------
DROP TABLE IF EXISTS `bm_category`;
CREATE TABLE `bm_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of bm_category
-- ----------------------------
INSERT INTO `bm_category` VALUES ('1', 'blog', '资讯管理', '0', '0', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '0', '1', '0', '0', '1', '', '1379474947', '1445744423', '1', '0');
INSERT INTO `bm_category` VALUES ('2', 'z', '最新行情', '1', '1', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '1', '1', '1', '1', '1', '', '1379475028', '1445393187', '1', '31');
INSERT INTO `bm_category` VALUES ('39', 's', '市场资讯', '1', '0', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '1', '1', '1', '0', '', '', '1440490826', '1445393185', '1', '0');
INSERT INTO `bm_category` VALUES ('41', 'j', '交易排行', '1', '2', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '1', '1', '1', '0', '', '', '1443186345', '1443194464', '1', '0');
INSERT INTO `bm_category` VALUES ('42', 'c', '产品动态', '1', '3', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '1', '1', '1', '0', '', '', '1443186369', '1443194480', '1', '0');
INSERT INTO `bm_category` VALUES ('43', 'q', '企业新闻', '1', '4', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '1', '1', '1', '0', '', '', '1443186398', '1443194488', '1', '0');
INSERT INTO `bm_category` VALUES ('44', 'g', '公告', '1', '5', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '1', '1', '1', '0', '', '', '1443186418', '1443194496', '1', '0');
INSERT INTO `bm_category` VALUES ('45', 'qt', '其他', '1', '6', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '1', '1', '1', '0', '', '', '1443186436', '1443194503', '1', '0');
INSERT INTO `bm_category` VALUES ('48', 'bz', '帮助中心', '0', '2', '10', '', '', '', '', '', '', '', '2', '2', '0', '0', '1', '1', '0', '', '', '1445602511', '1445602537', '1', '0');
INSERT INTO `bm_category` VALUES ('49', 'zcxg', '注册相关', '48', '0', '10', '', '', '', '', '', '', '', '2', '2', '0', '1', '1', '1', '0', '', '', '1445602573', '1445602772', '1', '0');
INSERT INTO `bm_category` VALUES ('50', 'wym', '我要买', '48', '1', '10', '', '', '', '', '', '', '', '2', '2', '0', '1', '1', '1', '0', '', '', '1445602595', '1445602773', '1', '0');
INSERT INTO `bm_category` VALUES ('51', 'jyzn', '交易指南', '48', '2', '10', '', '', '', '', '', '', '', '2', '2', '0', '1', '1', '1', '0', '', '', '1445602623', '1445602778', '1', '0');
INSERT INTO `bm_category` VALUES ('52', 'cjwt', '常见问题', '48', '3', '10', '', '', '', '', '', '', '', '2', '2', '0', '1', '1', '1', '0', '', '', '1445602646', '1445602781', '1', '0');
INSERT INTO `bm_category` VALUES ('53', 'gsxg', '公司相关', '48', '4', '10', '', '', '', '', '', '', '', '2', '2', '0', '1', '1', '1', '0', '', '', '1445746270', '1445746277', '1', '0');

-- ----------------------------
-- Table structure for bm_channel
-- ----------------------------
DROP TABLE IF EXISTS `bm_channel`;
CREATE TABLE `bm_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bm_channel
-- ----------------------------
INSERT INTO `bm_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '0');
INSERT INTO `bm_channel` VALUES ('2', '0', '博客', 'Article/index?category=blog', '2', '1379475131', '1379483713', '1', '0');
INSERT INTO `bm_channel` VALUES ('3', '0', '官网', 'http://www.onethink.cn', '3', '1379475154', '1387163458', '1', '0');

-- ----------------------------
-- Table structure for bm_config
-- ----------------------------
DROP TABLE IF EXISTS `bm_config`;
CREATE TABLE `bm_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bm_config
-- ----------------------------
INSERT INTO `bm_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', '众创科技有限公司', '0');
INSERT INTO `bm_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', '拓普科技有限公司', '1');
INSERT INTO `bm_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', '内容管理系统', '8');
INSERT INTO `bm_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `bm_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `bm_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9');
INSERT INTO `bm_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '3');
INSERT INTO `bm_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `bm_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'any_color:多彩', '后台颜色风格', '1379122533', '1440494950', '0', 'any_color', '10');
INSERT INTO `bm_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组\r\n2:内容\r\n3:用户\r\n4:系统', '1379228036', '1447637475', '1', '1:基本', '4');
INSERT INTO `bm_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `bm_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `bm_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '0', '1');
INSERT INTO `bm_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `bm_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1456216877', '1', '0', '40');
INSERT INTO `bm_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `bm_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `bm_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `bm_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `bm_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `bm_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `bm_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `bm_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `bm_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `bm_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '0');
INSERT INTO `bm_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `bm_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');
INSERT INTO `bm_config` VALUES ('38', 'SEC_TYPE', '3', '二级banner类型', '0', '1:联系我们\r\n2:空间展示\r\n3:关于我们\r\n4:精英团队\r\n5:资讯中心\r\n6:团队入驻', '二级banner类型', '1522074460', '1522075083', '1', '1:联系我们\r\n2:空间展示\r\n3:关于我们\r\n4:精英团队\r\n5:资讯中心\r\n6:团队入驻', '41');
INSERT INTO `bm_config` VALUES ('39', 'TEAM_TYPE', '3', '团队入驻说明类型', '0', '1:入驻条件\r\n2:入驻流程', '团队入驻说明类型', '1522927414', '1522927449', '1', '1:入驻条件\r\n2:入驻流程', '42');

-- ----------------------------
-- Table structure for bm_contact
-- ----------------------------
DROP TABLE IF EXISTS `bm_contact`;
CREATE TABLE `bm_contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `contact_phone_ico` int(10) unsigned DEFAULT NULL COMMENT '联系电话图标',
  `contact_phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `contact_email_ico` int(10) unsigned DEFAULT NULL COMMENT '邮箱图标',
  `contact_email` varchar(255) DEFAULT NULL COMMENT '联系邮箱',
  `contact_adr_ico` int(10) unsigned DEFAULT NULL COMMENT '联系地址图标',
  `contact_adr` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `contact_adr_map` int(10) unsigned DEFAULT NULL COMMENT '联系地址地图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_contact
-- ----------------------------
INSERT INTO `bm_contact` VALUES ('1', '182', '13076800347', '180', '1584114708@qq.com', '181', '龙华清湖梅龙大道政商写字楼232', '0');
INSERT INTO `bm_contact` VALUES ('2', '182', '13727262209', '180', 'Cooli@chuangyeyihao.com', '181', '惠州市大亚湾西区创新花园8栋2层 ', '223');
INSERT INTO `bm_contact` VALUES ('3', '182', '13076800140', '180', '154878@qq.com', '181', 'longhuaqinghu', '209');

-- ----------------------------
-- Table structure for bm_document
-- ----------------------------
DROP TABLE IF EXISTS `bm_document`;
CREATE TABLE `bm_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(150) NOT NULL COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `picture_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of bm_document
-- ----------------------------
INSERT INTO `bm_document` VALUES ('1', '1', '', 'Think1.0正式版发布', '2', '大家期待的OneThink正式版发布', '0', '0', '2', '2', '3', '0', '0', '1', '0', '0', '14', '0', '0', '0', '1387260660', '1447058113', '1');
INSERT INTO `bm_document` VALUES ('45', '1', '', 'Think1.0正式版发布', '44', '大家期待的OneThink正式版发布', '0', '0', '2', '2', '3', '0', '0', '1', '0', '0', '14', '0', '0', '0', '1447226100', '1447736754', '1');
INSERT INTO `bm_document` VALUES ('47', '1', '', 'test', '2', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1449129780', '1449129811', '1');
INSERT INTO `bm_document` VALUES ('28', '1', '', '如何注册', '49', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1445602740', '1445602821', '1');
INSERT INTO `bm_document` VALUES ('29', '1', '', '忘记密码', '49', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1445602800', '1445602856', '1');
INSERT INTO `bm_document` VALUES ('30', '1', '', '修改账户', '49', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1445602860', '1445602876', '1');
INSERT INTO `bm_document` VALUES ('31', '1', '', '如何快速找货', '50', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1445602860', '1445602925', '1');
INSERT INTO `bm_document` VALUES ('32', '1', '', '查看订单', '50', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1445602920', '1445602963', '1');
INSERT INTO `bm_document` VALUES ('33', '1', '', '查看快递', '50', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1445602920', '1445602987', '1');
INSERT INTO `bm_document` VALUES ('34', '1', '', '购买流程', '51', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1445602980', '1445603012', '1');
INSERT INTO `bm_document` VALUES ('35', '1', '', '物流配送', '51', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1445603030', '1445603030', '1');
INSERT INTO `bm_document` VALUES ('36', '1', '', '仓库自提', '51', '仓库自提', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1445602980', '1446539172', '1');
INSERT INTO `bm_document` VALUES ('37', '1', '', '注册流程', '52', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1445603076', '1445603076', '1');
INSERT INTO `bm_document` VALUES ('38', '1', '', '忘记密码', '52', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1445603093', '1445603093', '1');
INSERT INTO `bm_document` VALUES ('39', '1', '', '资料修改', '52', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1445603100', '1445603112', '1');
INSERT INTO `bm_document` VALUES ('40', '1', '', '友情链接', '53', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1445746380', '1445746435', '1');
INSERT INTO `bm_document` VALUES ('41', '1', '', '联系我们', '53', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1445746440', '1445746459', '1');
INSERT INTO `bm_document` VALUES ('42', '1', '', '法律声明', '53', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1445746440', '1445746481', '1');
INSERT INTO `bm_document` VALUES ('43', '1', '', '关于我们', '53', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1445746440', '1445746507', '1');

-- ----------------------------
-- Table structure for bm_document_article
-- ----------------------------
DROP TABLE IF EXISTS `bm_document_article`;
CREATE TABLE `bm_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of bm_document_article
-- ----------------------------
INSERT INTO `bm_document_article` VALUES ('1', '0', '<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	<img src=\"/Uploads/Editor/2015-11-09/56405abf7f8dd.png\" alt=\"\" />\r\n</p>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013</strong> \r\n</p>', '', '0');
INSERT INTO `bm_document_article` VALUES ('28', '0', '如何注册', '', '0');
INSERT INTO `bm_document_article` VALUES ('29', '0', '忘记密码', '', '0');
INSERT INTO `bm_document_article` VALUES ('30', '0', '修改账户', '', '0');
INSERT INTO `bm_document_article` VALUES ('31', '0', '如何快速找货', '', '0');
INSERT INTO `bm_document_article` VALUES ('32', '0', '查看订单', '', '0');
INSERT INTO `bm_document_article` VALUES ('33', '0', '查看快递', '', '0');
INSERT INTO `bm_document_article` VALUES ('34', '0', '购买流程', '', '0');
INSERT INTO `bm_document_article` VALUES ('35', '0', '物流配送', '', '0');
INSERT INTO `bm_document_article` VALUES ('36', '0', '仓库自提', '', '0');
INSERT INTO `bm_document_article` VALUES ('37', '0', '注册流程', '', '0');
INSERT INTO `bm_document_article` VALUES ('38', '0', '忘记密码', '', '0');
INSERT INTO `bm_document_article` VALUES ('39', '0', '资料修改', '', '0');
INSERT INTO `bm_document_article` VALUES ('40', '0', '友情链接', '', '0');
INSERT INTO `bm_document_article` VALUES ('41', '0', '联系我们', '', '0');
INSERT INTO `bm_document_article` VALUES ('42', '0', '法律声明', '', '0');
INSERT INTO `bm_document_article` VALUES ('43', '0', '关于我们', '', '0');
INSERT INTO `bm_document_article` VALUES ('47', '0', '', '', '0');
INSERT INTO `bm_document_article` VALUES ('45', '0', '<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	<img src=\"/Uploads/Editor/2015-11-17/564ab5a8d801d.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013</strong> \r\n</p>', '', '0');

-- ----------------------------
-- Table structure for bm_document_download
-- ----------------------------
DROP TABLE IF EXISTS `bm_document_download`;
CREATE TABLE `bm_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of bm_document_download
-- ----------------------------

-- ----------------------------
-- Table structure for bm_file
-- ----------------------------
DROP TABLE IF EXISTS `bm_file`;
CREATE TABLE `bm_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `savename` varchar(255) DEFAULT NULL COMMENT '文档保存名称',
  `savepath` varchar(255) DEFAULT NULL COMMENT '文档保存路径',
  `ext` char(40) DEFAULT NULL COMMENT '文件后缀',
  `mime` char(40) DEFAULT NULL COMMENT '内容类型',
  `size` int(10) unsigned DEFAULT NULL COMMENT '文件大小',
  `md5` char(32) DEFAULT NULL COMMENT 'md5',
  `sha1` char(40) DEFAULT NULL COMMENT 'sha1',
  `location` tinyint(3) DEFAULT NULL COMMENT '位置',
  `url` varchar(255) DEFAULT NULL COMMENT '统一地址',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_file
-- ----------------------------

-- ----------------------------
-- Table structure for bm_forms
-- ----------------------------
DROP TABLE IF EXISTS `bm_forms`;
CREATE TABLE `bm_forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forms_name` varchar(255) DEFAULT NULL COMMENT '表单名称',
  `forms_struct` text COMMENT '表单结构',
  `forms_lang` int(10) unsigned DEFAULT NULL COMMENT '表单语言',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_forms
-- ----------------------------

-- ----------------------------
-- Table structure for bm_history
-- ----------------------------
DROP TABLE IF EXISTS `bm_history`;
CREATE TABLE `bm_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `history_tile` varchar(255) DEFAULT NULL COMMENT '事迹标题',
  `history_time` int(10) DEFAULT NULL COMMENT '事迹时间',
  `history_content` text COMMENT '事迹内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_history
-- ----------------------------
INSERT INTO `bm_history` VALUES ('6', '“创业壹号“创客生态圈', '1370328420', '参加惠州市大亚湾区产业项目签约仪式，携手世纪投资、高弘投资、元古资本，共建大亚湾“创业壹号“创客生态圈。');
INSERT INTO `bm_history` VALUES ('7', '\"Pioneering one\" create a customer ecosystem', '1370069280', 'In the industry of Dayawan District of Huizhou city project signing ceremony, hand in hand, Gao Hong, three Century Investment investment capital, the construction of Dayawan \"one\" hit off the entrepreneurial ecosystem.');
INSERT INTO `bm_history` VALUES ('9', 'Strategic cooperation agreement', '1501120800', 'Signed a strategic cooperation agreement with Huizhou\'s exposing youth \"');
INSERT INTO `bm_history` VALUES ('10', '战略合作协议', '1296525600', '与“惠州揭商青联”签订战略合作协议');

-- ----------------------------
-- Table structure for bm_hooks
-- ----------------------------
DROP TABLE IF EXISTS `bm_hooks`;
CREATE TABLE `bm_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bm_hooks
-- ----------------------------
INSERT INTO `bm_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '');
INSERT INTO `bm_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop');
INSERT INTO `bm_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment');
INSERT INTO `bm_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment,baidushare');
INSERT INTO `bm_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '');
INSERT INTO `bm_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment');
INSERT INTO `bm_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor');
INSERT INTO `bm_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin');
INSERT INTO `bm_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam');
INSERT INTO `bm_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor');
INSERT INTO `bm_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '');

-- ----------------------------
-- Table structure for bm_infomation
-- ----------------------------
DROP TABLE IF EXISTS `bm_infomation`;
CREATE TABLE `bm_infomation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `info_title` varchar(255) NOT NULL COMMENT '资讯标题',
  `info_add_time` int(10) NOT NULL COMMENT '发布时间',
  `info_content` text NOT NULL COMMENT '资讯内容',
  `info_img` int(10) unsigned NOT NULL COMMENT '资讯封面图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_infomation
-- ----------------------------
INSERT INTO `bm_infomation` VALUES ('1', 'test', '1522054800', 'testtesttesttesttesttesttest', '0');
INSERT INTO `bm_infomation` VALUES ('2', '111111111', '1522143420', '1111111111111111111', '0');
INSERT INTO `bm_infomation` VALUES ('3', '测试资讯', '1523339580', '测试资讯测试资讯测试资讯测试资讯测试资讯测试资讯测试资讯测试资讯', '231');
INSERT INTO `bm_infomation` VALUES ('4', '测试资讯2', '1522821540', '测试资讯2测试资讯2测试资讯2测试资讯2测试资讯2', '230');
INSERT INTO `bm_infomation` VALUES ('5', '测试资讯3', '1522648740', '测试资讯2测试资讯2测试资讯2测试资讯2测试资讯2测试资讯2测试资讯2', '226');
INSERT INTO `bm_infomation` VALUES ('6', '测试资讯4', '1522648800', '测试资讯2测试资讯2测试资讯2测试资讯2测试资讯2测试资讯2', '225');
INSERT INTO `bm_infomation` VALUES ('7', '资讯测试5', '1522822620', '资讯测试5资讯测试5资讯测试5资讯测试5资讯测试5资讯测试5资讯测试5资讯测试5资讯测试5资讯测试5资讯测试5资讯测试5资讯测试5资讯测试5资讯测试5', '231');

-- ----------------------------
-- Table structure for bm_lang
-- ----------------------------
DROP TABLE IF EXISTS `bm_lang`;
CREATE TABLE `bm_lang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `lang_name` varchar(255) DEFAULT NULL COMMENT '语言名称',
  `lang_tag` varchar(255) DEFAULT NULL COMMENT '语言标签',
  `lang_ico` int(10) unsigned DEFAULT NULL COMMENT '语言图标',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_lang
-- ----------------------------
INSERT INTO `bm_lang` VALUES ('1', '简体', 'zh_CN', '166');
INSERT INTO `bm_lang` VALUES ('10', 'EN', 'en_US', '0');

-- ----------------------------
-- Table structure for bm_links
-- ----------------------------
DROP TABLE IF EXISTS `bm_links`;
CREATE TABLE `bm_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `links_name` varchar(255) DEFAULT NULL COMMENT '链接名称',
  `links_url` varchar(255) DEFAULT NULL COMMENT '链接url',
  `links_sort` int(10) unsigned DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_links
-- ----------------------------
INSERT INTO `bm_links` VALUES ('4', '百度', 'https://www.baidu.com/', '1');
INSERT INTO `bm_links` VALUES ('5', 'baidu', 'https://www.baidu.com/', '1');

-- ----------------------------
-- Table structure for bm_mailbox
-- ----------------------------
DROP TABLE IF EXISTS `bm_mailbox`;
CREATE TABLE `bm_mailbox` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mailbox_host` varchar(255) DEFAULT NULL COMMENT '邮件主机',
  `mailbox_port` int(10) unsigned DEFAULT NULL COMMENT '邮件端口',
  `mailbox_from` varchar(255) DEFAULT NULL COMMENT '发送邮箱',
  `mailbox_pwd` varchar(255) DEFAULT NULL COMMENT '邮箱密码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_mailbox
-- ----------------------------
INSERT INTO `bm_mailbox` VALUES ('1', 'smtp.qq.com', '110', '1584114809@qq.com', 'kui@441522$');

-- ----------------------------
-- Table structure for bm_member
-- ----------------------------
DROP TABLE IF EXISTS `bm_member`;
CREATE TABLE `bm_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of bm_member
-- ----------------------------
INSERT INTO `bm_member` VALUES ('1', 'admin', '0', '0000-00-00', '', '1080', '515', '0', '1440409998', '2130706433', '1522933169', '1');
INSERT INTO `bm_member` VALUES ('9', 'user', '0', '0000-00-00', '', '10', '2', '0', '0', '2130706433', '1502769925', '1');
INSERT INTO `bm_member` VALUES ('10', 'jj', '0', '0000-00-00', '', '0', '5', '0', '0', '3232235699', '1502770778', '1');
INSERT INTO `bm_member` VALUES ('11', 'test1', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for bm_menu
-- ----------------------------
DROP TABLE IF EXISTS `bm_menu`;
CREATE TABLE `bm_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=248 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bm_menu
-- ----------------------------
INSERT INTO `bm_menu` VALUES ('1', '仪表盘', '0', '1', 'Index/index', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('2', '资讯', '0', '2', 'Article/index', '1', '', '', '0');
INSERT INTO `bm_menu` VALUES ('3', '文档列表', '2', '0', 'Article/index', '1', '', '内容', '0');
INSERT INTO `bm_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('13', '回收站', '2', '0', 'Article/recycle', '1', '', '内容', '0');
INSERT INTO `bm_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('16', '用户', '0', '3', 'User/index', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0');
INSERT INTO `bm_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0');
INSERT INTO `bm_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '1', '', '行为管理', '0');
INSERT INTO `bm_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0');
INSERT INTO `bm_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0');
INSERT INTO `bm_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0');
INSERT INTO `bm_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0');
INSERT INTO `bm_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0');
INSERT INTO `bm_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0');
INSERT INTO `bm_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0');
INSERT INTO `bm_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0');
INSERT INTO `bm_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0');
INSERT INTO `bm_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0');
INSERT INTO `bm_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0');
INSERT INTO `bm_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0');
INSERT INTO `bm_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0');
INSERT INTO `bm_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0');
INSERT INTO `bm_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0');
INSERT INTO `bm_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0');
INSERT INTO `bm_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0');
INSERT INTO `bm_menu` VALUES ('39', '资讯分类授权', '27', '0', 'AuthManager/category', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `bm_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0');
INSERT INTO `bm_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `bm_menu` VALUES ('43', '扩展', '0', '9', 'Addons/index', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0');
INSERT INTO `bm_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0');
INSERT INTO `bm_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0');
INSERT INTO `bm_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0');
INSERT INTO `bm_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0');
INSERT INTO `bm_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0');
INSERT INTO `bm_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0');
INSERT INTO `bm_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0');
INSERT INTO `bm_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0');
INSERT INTO `bm_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0');
INSERT INTO `bm_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0');
INSERT INTO `bm_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0');
INSERT INTO `bm_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0');
INSERT INTO `bm_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '0');
INSERT INTO `bm_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '0', '网站属性配置。', '', '0');
INSERT INTO `bm_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('68', '系统设置', '0', '10', 'Webcontent/index', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0');
INSERT INTO `bm_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0');
INSERT INTO `bm_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0');
INSERT INTO `bm_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0');
INSERT INTO `bm_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0');
INSERT INTO `bm_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0');
INSERT INTO `bm_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0');
INSERT INTO `bm_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '1', '', '系统设置', '0');
INSERT INTO `bm_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('80', '分类管理', '68', '2', 'Category/index', '1', '', '系统设置', '0');
INSERT INTO `bm_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0');
INSERT INTO `bm_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0');
INSERT INTO `bm_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0');
INSERT INTO `bm_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0');
INSERT INTO `bm_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0');
INSERT INTO `bm_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '1', '', '数据备份', '0');
INSERT INTO `bm_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0');
INSERT INTO `bm_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0');
INSERT INTO `bm_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0');
INSERT INTO `bm_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '1', '', '数据备份', '0');
INSERT INTO `bm_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0');
INSERT INTO `bm_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0');
INSERT INTO `bm_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0');
INSERT INTO `bm_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('104', '下载管理', '68', '0', 'Think/lists?model=download', '1', '', '店铺设置', '0');
INSERT INTO `bm_menu` VALUES ('105', '配置管理', '68', '0', 'Think/lists?model=config', '1', '', '店铺设置', '0');
INSERT INTO `bm_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '1', '', '行为管理', '0');
INSERT INTO `bm_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0');
INSERT INTO `bm_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0');
INSERT INTO `bm_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0');
INSERT INTO `bm_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0');
INSERT INTO `bm_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0');
INSERT INTO `bm_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0');
INSERT INTO `bm_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0');
INSERT INTO `bm_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0');
INSERT INTO `bm_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0');
INSERT INTO `bm_menu` VALUES ('122', '用户行为删除', '19', '0', 'User/setStatus?Model=action&status=-1', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('125', '在线客服列表', '124', '0', 'Hotline/lists', '1', '', '在线客服管理', '0');
INSERT INTO `bm_menu` VALUES ('220', '联系我们', '219', '1', 'Contact/lists', '0', '', '底部导航', '0');
INSERT INTO `bm_menu` VALUES ('132', '在线客服添加', '124', '0', 'Hotline/add', '1', '', '在线客服管理', '0');
INSERT INTO `bm_menu` VALUES ('129', '在线客服修改', '125', '0', 'Hotline/edit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('221', '预约背景图设置', '211', '2', 'Bespoke/index', '0', '', '关于我们', '0');
INSERT INTO `bm_menu` VALUES ('219', '底部导航', '0', '8', 'Links/lists', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('147', '编辑会员', '146', '0', 'Member/edit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('150', '邮箱设置', '68', '0', 'Mailbox/index', '1', '', '系统设置', '0');
INSERT INTO `bm_menu` VALUES ('158', '取样审核列表', '152', '6', 'Sample/lists', '1', '', '取样管理', '0');
INSERT INTO `bm_menu` VALUES ('155', '订单待付款列表', '152', '0', 'Order/lists', '0', '', '订单管理', '0');
INSERT INTO `bm_menu` VALUES ('156', '订单物流详情', '155', '0', 'Order/orderexpress', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('157', '订单详情编辑', '155', '0', 'Order/edit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('159', '取样详情编辑', '158', '0', 'Sample/edit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('192', '留言回复', '191', '0', 'Demand/edit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('163', '清除缓存', '68', '0', 'cache/del', '0', '', '系统设置', '0');
INSERT INTO `bm_menu` VALUES ('164', '订单取消列表', '152', '1', 'Order/cancellist', '0', '', '订单管理', '0');
INSERT INTO `bm_menu` VALUES ('167', '订单待发货列表', '152', '2', 'Order/undeliveredlist', '0', '', '订单管理', '0');
INSERT INTO `bm_menu` VALUES ('168', '订单已发货列表', '152', '3', 'Order/deliveredlist', '0', '', '订单管理', '0');
INSERT INTO `bm_menu` VALUES ('173', '统计详情', '169', '0', 'Count/lists', '1', '', '前端流量统计', '0');
INSERT INTO `bm_menu` VALUES ('175', '取样未发货列表', '152', '7', 'Sample/undeliveredlists', '1', '', '取样管理', '0');
INSERT INTO `bm_menu` VALUES ('177', '取样完结列表', '152', '9', 'Sample/finishlists', '1', '', '取样管理', '0');
INSERT INTO `bm_menu` VALUES ('176', '取样发货列表', '152', '8', 'Sample/deliveredlists', '1', '', '取样管理', '0');
INSERT INTO `bm_menu` VALUES ('178', '历史统计查询', '169', '0', 'History/index', '1', '', '前端流量统计', '0');
INSERT INTO `bm_menu` VALUES ('179', '订单完成列表', '152', '5', 'Order/finishlist', '0', '', '订单管理', '0');
INSERT INTO `bm_menu` VALUES ('180', '数据', '58', '0', 'think/lists', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('222', '首页', '0', '4', 'Banner/lists', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('216', '合作伙伴', '211', '1', 'Partner/lists', '0', '', '关于我们', '0');
INSERT INTO `bm_menu` VALUES ('217', '编辑', '216', '0', 'Partner/edit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('218', '添加', '216', '0', 'Partner/add', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('190', '留言查看', '189', '0', 'Feedback/edit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('194', '会员等级修改', '193', '0', 'Grade/edit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('198', '订单统计', '169', '0', 'Orderstatics/index', '0', '', '订单统计管理', '0');
INSERT INTO `bm_menu` VALUES ('199', '用户订单统计', '169', '0', 'Orderstongji/index', '0', '', '订单统计管理', '0');
INSERT INTO `bm_menu` VALUES ('200', '文档管理', '68', '0', 'File/lists', '1', '', '多媒体管理', '0');
INSERT INTO `bm_menu` VALUES ('201', '图片管理', '68', '0', 'Picture/lists', '1', '', '多媒体管理', '0');
INSERT INTO `bm_menu` VALUES ('202', '图片编辑', '201', '0', 'Picture/edit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('211', '关于我们', '0', '5', 'Aboutus/lists', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('212', '公司简介', '211', '0', 'Aboutus/lists', '0', '公司简介', '关于我们', '0');
INSERT INTO `bm_menu` VALUES ('205', '语言管理', '68', '0', 'Lang/lists', '1', '', '系统设置', '0');
INSERT INTO `bm_menu` VALUES ('206', '导航管理', '68', '0', 'Nav/index', '1', '', '系统设置', '0');
INSERT INTO `bm_menu` VALUES ('213', '精英团队', '211', '0', 'Worker/lists', '0', '', '关于我们', '0');
INSERT INTO `bm_menu` VALUES ('214', '成员编辑', '213', '0', 'Worker/edit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('210', '表单设置', '68', '0', 'Forms/index', '0', '', '系统设置', '0');
INSERT INTO `bm_menu` VALUES ('215', '成员添加', '213', '0', 'Worker/add', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('223', 'banner图', '222', '0', 'Banner/lists', '0', '', '图片管理', '0');
INSERT INTO `bm_menu` VALUES ('224', '编辑', '223', '0', 'Banner/edit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('225', '添加', '223', '0', 'Banner/add', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('226', '企业风采', '222', '0', 'Adv/lists', '0', '企业风采', '图片管理', '0');
INSERT INTO `bm_menu` VALUES ('227', '编辑', '226', '0', 'Adv/edit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('228', '添加', '226', '0', 'Adv/add', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('229', '空间展示', '222', '0', 'Spaceshow/lists', '0', '空间展示', '图片管理', '0');
INSERT INTO `bm_menu` VALUES ('230', '友情链接', '219', '0', 'Links/lists', '0', '', '底部导航', '0');
INSERT INTO `bm_menu` VALUES ('231', '近期活动管理', '222', '0', 'Act/index', '0', '', '公司活动', '0');
INSERT INTO `bm_menu` VALUES ('232', '编辑', '231', '0', 'Act/edit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('233', '添加', '231', '0', 'Act/add', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('234', '重大事件管理', '222', '0', 'History/lists', '0', '', '公司事件', '0');
INSERT INTO `bm_menu` VALUES ('235', '编辑', '234', '0', 'History/edit', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('236', '添加', '234', '0', 'History/add', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('237', '网站内容管理', '68', '0', 'Webcontent/index', '0', '', '系统设置', '0');
INSERT INTO `bm_menu` VALUES ('238', '团队入驻', '0', '7', 'Book/lists', '0', '', '', '0');
INSERT INTO `bm_menu` VALUES ('239', '预约列表', '238', '0', 'Book/lists', '0', '', '列表管理', '0');
INSERT INTO `bm_menu` VALUES ('240', '字符串翻译', '68', '0', 'Trans/lists', '1', '', '系统设置', '0');
INSERT INTO `bm_menu` VALUES ('241', '图片选择', '0', '0', 'Picture/popimg', '1', '', '', '0');
INSERT INTO `bm_menu` VALUES ('247', '入驻文案', '238', '1', 'Process/lists', '0', '列表管理', '列表管理', '0');
INSERT INTO `bm_menu` VALUES ('244', '资讯中心', '0', '6', 'Infomation/index', '0', '资讯中心', '资讯中心', '0');
INSERT INTO `bm_menu` VALUES ('245', '资讯中心', '244', '0', 'Infomation/index', '0', '资讯中心', '资讯中心', '0');
INSERT INTO `bm_menu` VALUES ('246', '二级页面', '222', '1', 'SecondBanner/lists', '0', '二级页面', '图片管理', '0');

-- ----------------------------
-- Table structure for bm_model
-- ----------------------------
DROP TABLE IF EXISTS `bm_model`;
CREATE TABLE `bm_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `join_grid` text,
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  `join` varchar(255) DEFAULT NULL,
  `front_grid` text,
  `union_tables` text COMMENT '连接多个表',
  `union_grid` text COMMENT '接连列表',
  `pop_union_tables` text,
  `pop_union_grid` text,
  `pop_list_tables` text,
  `pop_list_grid` text,
  `lang_support` int(10) DEFAULT NULL,
  `lang_flag` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of bm_model
-- ----------------------------
INSERT INTO `bm_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"3\",\"5\",\"10\",\"12\",\"20\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', '7', '', '', '1383891233', '1444976548', '1', '', 'MyISAM', 'picture', 'id:编号\r\ntitle:标题\r\ncreate_time:创建时间\r\ndescription:描述', null, null, null, null, null, null, null, null);
INSERT INTO `bm_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"20\",\"10\",\"12\",\"5\",\"24\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', '0', '', '', '1383891243', '1444115229', '1', '', 'MyISAM', '', '', null, null, null, null, null, null, null, null);
INSERT INTO `bm_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', '0', '', '', '1383891252', '1387260449', '1', null, 'MyISAM', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bm_model` VALUES ('13', 'picture', '图片', '0', '', '1', '{\"1\":[\"105\",\"104\",\"102\",\"101\",\"100\",\"99\",\"67\",\"68\",\"69\",\"70\",\"71\",\"72\"]}', '1:基础', '', '', '', '', 'picture_name:名称\r\npath|get_img:图片\r\nsavename:保存文件名\r\next:图片后缀\r\ncreate_time|time_format:上传时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '9', 'picture_name:图片名称', '', '1441695466', '1474512327', '1', 'picture.path:图片', 'MyISAM', '', '', '', '', '', '', null, '', null, null);
INSERT INTO `bm_model` VALUES ('16', 'mailbox', '邮箱设置', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1442319835', '1442319835', '1', null, 'MyISAM', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bm_model` VALUES ('40', 'file', '文档管理', '0', '', '1', '{\"1\":[\"298\",\"299\",\"300\",\"301\",\"302\",\"303\",\"304\",\"305\",\"306\",\"307\",\"308\"]}', '1:基础', '', '', '', '', 'name:文档名称\r\nsavename:文档保存名\r\next:文件后缀\r\ncreate_time|time_format:上传时间\r\nid:操作:[DELETE]|删除', '10', 'name:文档名称', '', '1459152334', '1476153358', '1', '', 'MyISAM', '', '', '', '', '', 'name:文档名称\r\nsavename:文档保存名\r\next:文件后缀\r\ncreate_time|time_format:上传时间\r\nid:操作:[SELECT]|选择', '', '', '0', '0');
INSERT INTO `bm_model` VALUES ('50', 'links', '友情链接', '0', '', '1', '{\"1\":[\"362\",\"363\",\"364\"]}', '1:基础', '', '', '', '', 'links_name:链接', '10', 'links_name:链接', '', '1501572857', '1502344896', '1', null, 'MyISAM', null, null, 'left join bm_translate on bm_translate.translate_concern_id = bm_links.id\r\nleft join bm_lang on bm_lang.id = bm_translate.translate_lang_id', 'links_name:名称\r\nlinks_sort:排序\r\nlang_name:语言\r\nid:操作:[DELETE]|删除\r\ntranslate_content|get_translate_href:多语言', '', '', '', '', '1', '3');
INSERT INTO `bm_model` VALUES ('51', 'act', '近期活动', '0', '', '1', '{\"1\":[\"365\",\"368\",\"367\",\"366\"]}', '1:基础', '', '', '', '', 'act_title:标题', '10', 'act_title:活动标题', '', '1501573331', '1502347346', '1', null, 'MyISAM', null, null, 'left join bm_picture on bm_picture.id = bm_act.act_pic\r\nleft join bm_translate on bm_translate.translate_concern_id = bm_act.id\r\nleft join bm_lang on bm_lang.id = bm_translate.translate_lang_id', 'act_title:活动标题\r\npath|get_img:活动封面\r\nact_time|time_format:活动时间\r\nlang_name:语言\r\nid:操作:[DELETE]|删除\r\ntranslate_content|get_translate_href:多语言', '', '', '', '', '1', '6');
INSERT INTO `bm_model` VALUES ('52', 'history', '公司历史事迹', '0', '', '1', '{\"1\":[\"369\",\"370\",\"371\"]}', '1:基础', '', '', '', '', 'history_tile:标题', '10', 'history_tile:标题', '', '1501574349', '1522054766', '1', null, 'MyISAM', null, null, 'left join bm_translate on bm_translate.translate_concern_id = bm_history.id\r\nleft join bm_lang on bm_lang.id = bm_translate.translate_lang_id', 'history_tile:事迹标题\r\nhistory_time|time_format:活动时间\r\nlang_name:语言\r\nid:操作:[DELETE]|删除\r\ntranslate_content|get_translate_href:多语言', '', '', '', '', '1', '7');
INSERT INTO `bm_model` VALUES ('53', 'contact', '联系', '0', '', '1', '{\"1\":[\"372\",\"373\",\"374\",\"375\",\"376\",\"377\",\"378\"]}', '1:基础', '', '', '', '', 'aboutus_title:标题名称', '10', 'contact_phone:联系电话', '', '1501638111', '1502345897', '1', null, 'MyISAM', null, null, 'left join bm_translate on bm_translate.translate_concern_id = bm_contact.id\r\nleft join bm_lang on bm_lang.id = bm_translate.translate_lang_id', 'contact_phone:联系电话\r\ncontact_adr:联系地址\r\ncontact_email:联系邮箱\r\nlang_name:语言\r\nid:操作:[DELETE]|删除\r\ntranslate_content|get_translate_href:多语言', '', '', '', '', '1', '4');
INSERT INTO `bm_model` VALUES ('54', 'banner', 'banner图', '0', '', '1', '{\"1\":[\"379\",\"380\",\"381\",\"382\"]}', '1:基础', '', '', '', '', 'banner_name:banner标题', '10', 'banner_name:banner标题', '', '1501638410', '1501638689', '1', null, 'MyISAM', null, null, 'left join bm_picture on bm_picture.id = bm_banner.banner_pic', 'banner_name:banner标题\r\npath|get_img:banner面\r\nbanner_sort:排序\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '', '', '', '', '0', '0');
INSERT INTO `bm_model` VALUES ('43', 'translate', '翻译关联表', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1473233205', '1473233205', '1', null, 'MyISAM', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bm_model` VALUES ('47', 'aboutus', '关于我们', '0', '', '1', '{\"1\":[\"352\",\"354\",\"353\"]}', '1:基础', '', '', '', '', 'aboutus_title:标题名称', '10', 'aboutus_title:标题名称', '', '1501567525', '1502344093', '1', null, 'MyISAM', null, null, 'left join bm_translate on bm_translate.translate_concern_id = bm_aboutus.id\r\nleft join bm_lang on bm_lang.id = bm_translate.translate_lang_id', 'aboutus_title:标题名称\r\nlang_name:语言\r\nid:操作:[DELETE]|删除\r\ntranslate_content|get_translate_href:多语言', '', '', '', '', '1', '1');
INSERT INTO `bm_model` VALUES ('42', 'lang', '语言', '0', '', '1', '{\"1\":[\"318\",\"320\",\"319\"]}', '1:基础', '', '', '', '', 'lang_name:语言名称\r\nlang_tag:语言标签\r\n', '10', 'lang_name:语言名称', '', '1473212946', '1473214649', '1', null, 'MyISAM', null, null, 'left join bm_picture on bm_picture.id = bm_lang.lang_ico', 'lang_name:语言名称\r\npath|get_img:语言图标\r\nlang_tag:语言标签\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '', '', null, '', null, null);
INSERT INTO `bm_model` VALUES ('44', 'nav', '导航', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1474358835', '1474358835', '1', null, 'MyISAM', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bm_model` VALUES ('48', 'worker', '同事', '0', '', '1', '{\"1\":[\"355\",\"358\",\"356\",\"357\"]}', '1:基础', '', '', '', '', 'worker_name:名称', '10', 'worker_name:名称', '', '1501568342', '1502344355', '1', null, 'MyISAM', null, null, 'left join bm_picture on bm_picture.id = bm_worker.worker_img\r\nleft join bm_translate on bm_translate.translate_concern_id = bm_worker.id\r\nleft join bm_lang on bm_lang.id = bm_translate.translate_lang_id', 'worker_name:名称\r\npath|get_img:内容封面\r\nworker_sort:排序\r\nlang_name:语言\r\nid:操作:[DELETE]|删除\r\ntranslate_content|get_translate_href:多语言', '', '', '', '', '1', '2');
INSERT INTO `bm_model` VALUES ('49', 'partner', '合作伙伴', '0', '', '1', '{\"1\":[\"359\",\"360\",\"361\"]}', '1:基础', '', '', '', '', 'partner_name:名称', '10', 'partner_name:合作伙伴名称', '', '1501571251', '1501571725', '1', null, 'MyISAM', null, null, 'left join bm_picture on bm_picture.id = bm_partner.partner_img', 'partner_name:名称\r\npath|get_img:内容封面\r\npartner_sort:排序\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '', '', '', '', '0', '0');
INSERT INTO `bm_model` VALUES ('46', 'forms', '表单', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1476626326', '1476626326', '1', null, 'MyISAM', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bm_model` VALUES ('55', 'adv', '广告图', '0', '', '1', '{\"1\":[\"383\",\"384\",\"385\",\"386\"]}', '1:基础', '', '', '', '', 'adv_title:广告标题', '10', 'adv_title:广告标题', '', '1501638761', '1501641101', '1', null, 'MyISAM', null, null, 'left join bm_picture on bm_picture.id = bm_adv.adv_pic', 'adv_title:广告标题\r\npath|get_img:广告封面\r\nadv_sort:排序\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '', '', '', '', '0', '0');
INSERT INTO `bm_model` VALUES ('56', 'spaceshow', '空间展示', '0', '', '1', '{\"1\":[\"387\",\"388\",\"389\",\"390\",\"396\"]}', '1:基础', '', '', '', '', 'spaceshow_title:空间展示标题\r\n', '10', 'spaceshow_title:空间展示标题', '', '1501640903', '1502346510', '1', null, 'MyISAM', null, null, 'left join bm_picture on bm_picture.id = bm_spaceshow.spaceshow_pic\r\nleft join bm_translate on bm_translate.translate_concern_id = bm_spaceshow.id\r\nleft join bm_lang on bm_lang.id = bm_translate.translate_lang_id', 'spaceshow_title:空间展示标题\r\npath|get_img:展示图\r\nspaceshow_sort:排序\r\nlang_name:语言\r\nid:操作:[DELETE]|删除\r\ntranslate_content|get_translate_href:多语言', '', '', '', '', '1', '5');
INSERT INTO `bm_model` VALUES ('57', 'webcontent', '网站内容', '0', '', '1', '{\"1\":[\"391\",\"393\",\"392\",\"403\",\"394\"]}', '1:基础', '', '', '', '', '142', '10', '', '', '1501641251', '1502779693', '1', null, 'MyISAM', null, null, '', '', '', '', '', '', '0', '0');
INSERT INTO `bm_model` VALUES ('58', 'bespoke', '预约图设置', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1501641429', '1501641429', '1', null, 'MyISAM', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bm_model` VALUES ('59', 'book', '预定', '0', '', '1', '{\"1\":[\"428\",\"427\",\"426\",\"425\",\"424\",\"397\",\"398\",\"399\",\"400\"]}', '1:基础', '', '', '', '', 'book_name:预订人\r\nbook_mobile:联系手机\r\nspace:空间\r\nemail:邮箱\r\ncompany_name:公司名称\r\ncompany_count:公司人数\r\nbook_time|get_time_date:预约时间\r\nbook_times|_get_time:预约时间段\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'book_name|book_mobile:预订人或手机号', '', '1502335534', '1522934446', '1', null, 'MyISAM', null, null, '', '', '', '', '', '', '0', '0');
INSERT INTO `bm_model` VALUES ('60', 'trans', '字符串翻译', '0', '', '1', '{\"1\":[\"401\",\"402\"]}', '1:基础', '', '', '', '', 'trans_key:关键词', '10', 'trans_key:关键词', '', '1502348439', '1502349347', '1', null, 'MyISAM', null, null, 'left join bm_translate on bm_translate.translate_concern_id = bm_trans.id\r\nleft join bm_lang on bm_lang.id = bm_translate.translate_lang_id', 'trans_key:关键词\r\ntrans_value:翻译值\r\nlang_name:语言\r\nid:操作:[DELETE]|删除\r\ntranslate_content|get_translate_href:多语言', '', '', '', '', '1', '8');
INSERT INTO `bm_model` VALUES ('62', 'infomation', '资讯中心', '0', '', '1', '{\"1\":[\"418\",\"410\",\"411\",\"412\"]}', '1:基础', '', '', '', '', 'info_title:资讯标题\r\ninfo_add_time|time_format:发布时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'info_title', '', '1522052660', '1522649862', '1', null, 'MyISAM', null, null, 'left join bm_picture on bm_picture.id = bm_infomation.info_img\r\nleft join bm_translate on bm_translate.translate_concern_id = bm_infomation.id\r\nleft join bm_lang on bm_lang.id = bm_translate.translate_lang_id', 'info_title:资讯标题\r\ninfo_add_time|time_format:发布时间\r\npath|get_img:活动封面\r\nlang_name:语言\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '', '', '', '', '1', '9');
INSERT INTO `bm_model` VALUES ('63', 'secondbanner', '二级页面banner', '0', '', '1', '{\"1\":[\"413\",\"414\",\"415\",\"416\",\"417\"]}', '1:基础', '', '', '', '', 'sec_type:banner类型\r\nsec_add_time|time_format:添加/修改时间\r\nsec_title_chinese:中文标题\r\nsec_title_english:english_title\r\nsecond_img_url|get_img:banner图片\r\nid:操作:[EDIT]|编辑,[DELETE]|删除\r\n', '10', 'sec_title_chinese:中文标题', '', '1522072219', '1522652571', '1', null, 'MyISAM', null, null, 'left join bm_picture on bm_picture.id = bm_secondbanner.second_img_url', 'sec_type:banner类型\r\nsec_add_time|time_format:添加/修改时间\r\nsec_title_chinese:中文标题\r\nsec_title_english:english_title\r\npath|get_img:banner图片\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '', '', '', '', '0', '0');
INSERT INTO `bm_model` VALUES ('64', 'elegant', '企业风采', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1522075706', '1522075706', '1', null, 'MyISAM', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `bm_model` VALUES ('65', 'process', '团队入驻流程', '0', '', '1', '{\"1\":[\"423\",\"419\",\"420\",\"421\",\"422\"]}', '1:基础', '', '', '', '', 'team_title:说明标题\r\nteam_type:说明类型\r\nadd_time|time_format:添加/修改时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'team_title:说明标题', '', '1522767383', '1522931367', '1', null, 'MyISAM', null, null, '', '', '', '', '', '', '1', '10');

-- ----------------------------
-- Table structure for bm_nav
-- ----------------------------
DROP TABLE IF EXISTS `bm_nav`;
CREATE TABLE `bm_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nav_name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `nav_pos_lang` varchar(15) DEFAULT NULL COMMENT '菜单位置语言',
  `nav_content` text COMMENT '菜单构造',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_nav
-- ----------------------------
INSERT INTO `bm_nav` VALUES ('4', '主菜单', '1_1', '[{\"id\":\"1\",\"nav_url\":\"/Index/index\",\"nav_name\":\"首页\",\"nav_target\":0,\"nav_type\":\"link\",\"concern_id\":\"\",\"nav_remark\":\"自定义链接\"},{\"id\":\"2\",\"nav_url\":\"/About/index\",\"nav_name\":\"关于我们\",\"nav_target\":0,\"nav_type\":\"link\",\"concern_id\":\"\",\"nav_remark\":\"自定义链接\"}]');
INSERT INTO `bm_nav` VALUES ('5', '主菜单', '10_1', '[{\"id\":\"1\",\"nav_url\":\"/Index/index\",\"nav_name\":\"Home\",\"nav_target\":0,\"nav_type\":\"link\",\"concern_id\":\"\",\"nav_remark\":\"自定义链接\"},{\"id\":\"2\",\"nav_url\":\"/About/index\",\"nav_name\":\"AboutUs\",\"nav_target\":0,\"nav_type\":\"link\",\"concern_id\":\"\",\"nav_remark\":\"自定义链接\"}]');

-- ----------------------------
-- Table structure for bm_partner
-- ----------------------------
DROP TABLE IF EXISTS `bm_partner`;
CREATE TABLE `bm_partner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `partner_name` varchar(255) DEFAULT NULL COMMENT '合作伙伴名称',
  `partner_img` int(10) unsigned DEFAULT NULL COMMENT '合作伙伴图标',
  `partner_sort` int(10) unsigned DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_partner
-- ----------------------------
INSERT INTO `bm_partner` VALUES ('1', 'test1', '207', '1');
INSERT INTO `bm_partner` VALUES ('2', 'test2', '204', '2');
INSERT INTO `bm_partner` VALUES ('3', '3', '207', '3');
INSERT INTO `bm_partner` VALUES ('4', '4', '204', '4');
INSERT INTO `bm_partner` VALUES ('5', '5', '207', '5');
INSERT INTO `bm_partner` VALUES ('6', '6', '204', '6');
INSERT INTO `bm_partner` VALUES ('7', '7', '207', '7');
INSERT INTO `bm_partner` VALUES ('8', '8', '204', '8');
INSERT INTO `bm_partner` VALUES ('9', '9', '207', '9');
INSERT INTO `bm_partner` VALUES ('10', '10', '204', '10');
INSERT INTO `bm_partner` VALUES ('11', '11', '207', '11');
INSERT INTO `bm_partner` VALUES ('12', '12', '204', '12');
INSERT INTO `bm_partner` VALUES ('13', '13', '207', '13');
INSERT INTO `bm_partner` VALUES ('14', '14', '204', '14');
INSERT INTO `bm_partner` VALUES ('15', '15', '207', '15');
INSERT INTO `bm_partner` VALUES ('16', '16', '204', '16');
INSERT INTO `bm_partner` VALUES ('17', '17', '207', '17');
INSERT INTO `bm_partner` VALUES ('18', '18', '204', '18');
INSERT INTO `bm_partner` VALUES ('19', '19', '207', '19');
INSERT INTO `bm_partner` VALUES ('20', '20', '204', '0');
INSERT INTO `bm_partner` VALUES ('21', '21', '207', '21');
INSERT INTO `bm_partner` VALUES ('22', '22', '204', '22');
INSERT INTO `bm_partner` VALUES ('23', '23', '207', '23');
INSERT INTO `bm_partner` VALUES ('24', '24', '204', '24');
INSERT INTO `bm_partner` VALUES ('25', '25', '207', '25');
INSERT INTO `bm_partner` VALUES ('26', '26', '204', '26');
INSERT INTO `bm_partner` VALUES ('27', '27', '207', '27');
INSERT INTO `bm_partner` VALUES ('28', '28', '204', '28');
INSERT INTO `bm_partner` VALUES ('29', '29', '207', '29');
INSERT INTO `bm_partner` VALUES ('30', '30', '204', '30');
INSERT INTO `bm_partner` VALUES ('31', 'test', '208', '31');
INSERT INTO `bm_partner` VALUES ('32', '合作伙伴', '186', '32');
INSERT INTO `bm_partner` VALUES ('33', '123', '209', '40');

-- ----------------------------
-- Table structure for bm_picture
-- ----------------------------
DROP TABLE IF EXISTS `bm_picture`;
CREATE TABLE `bm_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `path` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `url` varchar(255) DEFAULT NULL COMMENT '图片网址',
  `md5` char(32) DEFAULT NULL COMMENT 'md5',
  `sha1` char(40) DEFAULT NULL COMMENT 'sha1',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `picture_name` varchar(255) DEFAULT NULL COMMENT '图片名称',
  `type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `ext` varchar(255) DEFAULT NULL COMMENT '文件后缀',
  `size` int(10) unsigned DEFAULT NULL COMMENT '文件大小',
  `savename` varchar(255) DEFAULT NULL COMMENT '保存文件名',
  `savepath` varchar(255) DEFAULT NULL COMMENT '保存路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=237 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_picture
-- ----------------------------
INSERT INTO `bm_picture` VALUES ('177', '/Uploads/Picture/2017-08-08/59896f07ec82e.jpg', null, 'ab9f109be6af4a16278b3274acf829ae', 'ebfa483a9e00dd0e7d8eb96aefae78a3d75698b4', '1', '1502179079', '1502178779(1).jpg', 'image/png', 'jpg', '64992', '59896f07ec82e.jpg', '2017-08-08/');
INSERT INTO `bm_picture` VALUES ('178', '/Uploads/Picture/2017-08-08/59896f083567e.jpg', null, 'ebce2cf4e8fe7506dde06b759c544a98', 'eb062192db36df87a25f312871b411a00885cef2', '1', '1502179080', '1502178779(2).jpg', 'image/png', 'jpg', '69893', '59896f083567e.jpg', '2017-08-08/');
INSERT INTO `bm_picture` VALUES ('179', '/Uploads/Picture/2017-08-08/59896f085e69e.jpg', null, '2fffe4deb8b5bb37430358da9e26e871', 'f5355f97ffbe7af729fa92848cf701944f3a1c9c', '1', '1502179080', '1502178779.jpg', 'image/png', 'jpg', '54222', '59896f085e69e.jpg', '2017-08-08/');
INSERT INTO `bm_picture` VALUES ('180', '/Uploads/Picture/2017-08-09/598a6cd506ea0.png', null, 'c9aba23f10d39e7487d1c7848b4789d2', '34a7b410dcef82327e6629a41b26e0a7bf22f32f', '1', '1502244052', 'e-mial.png', 'image/png', 'png', '2475', '598a6cd506ea0.png', '2017-08-09/');
INSERT INTO `bm_picture` VALUES ('181', '/Uploads/Picture/2017-08-09/598a6cd52c588.png', null, 'e007291f213100a974d45a0676ef1e97', '3bac09b6aa64430e9077d4727468a1b1baf6f29d', '1', '1502244053', '地址-(3).png', 'image/png', 'png', '2528', '598a6cd52c588.png', '2017-08-09/');
INSERT INTO `bm_picture` VALUES ('182', '/Uploads/Picture/2017-08-09/598a6cd553354.png', null, '1c6bd15b14e032edebce265631137848', '7a8a163ef5b7fc6515093c86d2aa8fc0485be709', '1', '1502244053', '电话.png', 'image/png', 'png', '2617', '598a6cd553354.png', '2017-08-09/');
INSERT INTO `bm_picture` VALUES ('183', '/Uploads/Picture/2017-08-09/598a6d935bca8.jpg', null, '19fabffe5ccd1563a235f07fbbe37b6a', '8999f0b689eaf70c6799da3448654b58033726c9', '1', '1502244243', 'qrcode.jpg', 'image/png', 'jpg', '33877', '598a6d935bca8.jpg', '2017-08-09/');
INSERT INTO `bm_picture` VALUES ('184', '/Uploads/Picture/2017-08-09/598a6dad0dd40.jpg', null, '90fb145aa7b2be0c785199774d821d6a', '6e7342a43979e964c4cc1d618cddec57994df06e', '1', '1502244268', 'logo.jpg', 'image/png', 'jpg', '11092', '598a6dad0dd40.jpg', '2017-08-09/');
INSERT INTO `bm_picture` VALUES ('185', '/Uploads/Picture/2017-08-09/598a6f6500f42.jpg', null, 'ea44aa381f5a6622ba4c2fd26cd49691', '3c9bbab3f157e9b37d6b81408a2adf1739e19d7d', '1', '1502244708', '9612b3a2fcd8d73446c8858a60168808.jpg', 'image/jpeg', 'jpg', '786867', '598a6f6500f42.jpg', '2017-08-09/');
INSERT INTO `bm_picture` VALUES ('186', '/Uploads/Picture/2017-08-09/598a6f6545db4.jpg', null, 'a018e1d90dc346208a229ab3ecc8d458', '9ed9bbceb0ce00f00924d80a19f577d15b7131cf', '1', '1502244709', '千库网60b06d60224193fa8ebfaa184ab67d58.jpg', 'image/jpeg', 'jpg', '206566', '598a6f6545db4.jpg', '2017-08-09/');
INSERT INTO `bm_picture` VALUES ('187', '/Uploads/Picture/2017-08-09/598a71f2be050.jpg', null, 'c7c95e56109da76c3acde3d58c6d45d5', 'dee121ee515baa25026c9dede7febea5f00e995c', '1', '1502245362', '1257e0db1298530.jpg', 'image/jpeg', 'jpg', '159944', '598a71f2be050.jpg', '2017-08-09/');
INSERT INTO `bm_picture` VALUES ('188', '/Uploads/Picture/2017-08-09/598a71f2de71c.jpg', null, '3746f2304e4ff93a8c0c0a79885878c9', '159e21ad0a3ffdf5d88e9ea97f14065aa9487728', '1', '1502245362', '665823dbfe73f3d.jpg', 'image/jpeg', 'jpg', '75890', '598a71f2de71c.jpg', '2017-08-09/');
INSERT INTO `bm_picture` VALUES ('189', '/Uploads/Picture/2017-08-09/598a7324863ac.jpg', null, '43d19d44fcc29009856b6c110353a882', '7e67b1d326f3e2b23b97382004c4cd53fdfb78c5', '1', '1502245668', '595811b11d5ceca.jpg', 'image/jpeg', 'jpg', '60156', '598a7324863ac.jpg', '2017-08-09/');
INSERT INTO `bm_picture` VALUES ('190', '/Uploads/Picture/2017-08-09/598a732a29b92.jpg', null, 'ffe356218294d5156f00834542a30f4a', '0b85532def6fac9c25c6189aa9b9c8360f506e9e', '1', '1502245674', '10597183c49fe7b.jpg', 'image/jpeg', 'jpg', '133548', '598a732a29b92.jpg', '2017-08-09/');
INSERT INTO `bm_picture` VALUES ('191', '/Uploads/Picture/2017-08-09/598a74ea23c34.jpg', null, '2431fc5b62152aa4695a8408089f51e2', 'c4c4a0949b92b75612147b7879677167432451d4', '1', '1502246122', 'about2.jpg', 'image/jpeg', 'jpg', '102759', '598a74ea23c34.jpg', '2017-08-09/');
INSERT INTO `bm_picture` VALUES ('192', '/Uploads/Picture/2017-08-09/598a74ea44e72.jpg', null, '4de76c519b4baff0d9daf266d7e83b52', 'cce94523fedb740ca53e86b2a95ed58dec4e97b1', '1', '1502246122', 'about3.jpg', 'image/jpeg', 'jpg', '100539', '598a74ea44e72.jpg', '2017-08-09/');
INSERT INTO `bm_picture` VALUES ('193', '/Uploads/Picture/2017-08-09/598a8fb76edd5.jpg', null, '956880dd7e420e9064e6ebfbd3f8f60e', 'c6208e908a85b30c0a23fd0948bbc6ef5a67165b', '1', '1502252983', 'A-4.jpg', 'image/jpeg', 'jpg', '64203', '598a8fb76edd5.jpg', '2017-08-09/');
INSERT INTO `bm_picture` VALUES ('194', '/Uploads/Picture/2017-08-09/598a8fb78e930.jpg', null, 'b80f0458ff62e720f2494b1683e5a3a2', '213023d2a1cec622b8ffba8350c651bb6dc4b4eb', '1', '1502252983', 'B-1.jpg', 'image/jpeg', 'jpg', '20687', '598a8fb78e930.jpg', '2017-08-09/');
INSERT INTO `bm_picture` VALUES ('195', '/Uploads/Picture/2017-08-09/598a8fb7be050.jpg', null, '0d6db98c872a0f70ef0a1e08c8b5bd67', '0b8aba37d373ef1f2400987a3b09aad4930269b4', '1', '1502252983', 'C-1.jpg', 'image/jpeg', 'jpg', '54462', '598a8fb7be050.jpg', '2017-08-09/');
INSERT INTO `bm_picture` VALUES ('196', '/Uploads/Picture/2017-08-09/598a8fb7e612e.jpg', null, 'ab53d4223af6910fded1317804098d7b', '16f77f164e790e034fc31230125f6916707356ed', '1', '1502252983', 'E-2.jpg', 'image/jpeg', 'jpg', '69944', '598a8fb7e612e.jpg', '2017-08-09/');
INSERT INTO `bm_picture` VALUES ('197', '/Uploads/Picture/2017-08-14/59915473ec08c.jpg', null, '06249cb2788e23287090363689671802', '16f422da44f104f9a22a3179afec2f7f6ada5660', '1', '1502696563', 't0109f899da3b950d40.jpg', 'image/jpeg', 'jpg', '178192', '59915473ec08c.jpg', '2017-08-14/');
INSERT INTO `bm_picture` VALUES ('198', '/Uploads/Picture/2017-08-14/599157a338be5.jpg', null, '898e35badc82ca9527474e910b55640e', 'e61c64bd060a93f4bd81544aa8e13b74cb6474a1', '1', '1502697379', '4f4a35f.jpg', 'image/jpeg', 'jpg', '95018', '599157a338be5.jpg', '2017-08-14/');
INSERT INTO `bm_picture` VALUES ('199', '/Uploads/Picture/2017-08-14/599157a37c375.jpg', null, '518ef3999f2026c4778716ff955293c4', '9ae17b46dd0549d561a3779c76bbab1a7648bf3d', '1', '1502697379', 't012d9859df1a8ffc97.jpg', 'image/jpeg', 'jpg', '289773', '599157a37c375.jpg', '2017-08-14/');
INSERT INTO `bm_picture` VALUES ('200', '/Uploads/Picture/2017-08-14/599158b5b6ddf.jpg', null, '075e79d1528a83ca36ce8f4e25d14150', '707003999d666f098e00c972a3a4149a7bcb530c', '1', '1502697653', '3548569577839352.jpg', 'image/jpeg', 'jpg', '324217', '599158b5b6ddf.jpg', '2017-08-14/');
INSERT INTO `bm_picture` VALUES ('201', '/Uploads/Picture/2017-08-14/599158b5dfa2f.jpg', null, 'f153fc9ef12ca56e5af082c5156f91e9', 'eb77b85504fa5bc49134571bb15e8cc9caddad5f', '1', '1502697653', '23916584118000678.jpg', 'image/jpeg', 'jpg', '312464', '599158b5dfa2f.jpg', '2017-08-14/');
INSERT INTO `bm_picture` VALUES ('202', '/Uploads/Picture/2017-08-14/599158b61b2e0.jpg', null, '2bdf8903e0ff8ab1bf45ae6cf9841e98', 'c5aaf3dcda54200ae34b111bf2a9c9be8ab37675', '1', '1502697654', '219887148965932101.jpg', 'image/jpeg', 'jpg', '728804', '599158b61b2e0.jpg', '2017-08-14/');
INSERT INTO `bm_picture` VALUES ('203', '/Uploads/Picture/2017-08-14/599158b9903e4.jpg', null, 'f927d1e2743b4809d369660ca9679fdd', 'f725ea688e99da94d2f6788eb93222b0f57eb4da', '1', '1502697657', '667222533947879032.jpg', 'image/jpeg', 'jpg', '244898', '599158b9903e4.jpg', '2017-08-14/');
INSERT INTO `bm_picture` VALUES ('204', '/Uploads/Picture/2017-08-14/599158b9c7516.jpg', null, '7e84252e1f44d7a1895d2c0244f0b471', '7a62dd06cb37baeef0f331634faf82bfd179c08c', '1', '1502697657', '816143095359304662.jpg', 'image/jpeg', 'jpg', '368481', '599158b9c7516.jpg', '2017-08-14/');
INSERT INTO `bm_picture` VALUES ('205', '/Uploads/Picture/2017-08-14/599158ba6ea05.jpg', null, '692ed2c4674a328fd739de9847d016bb', 'b33363196c2ca12fc8eab2808e06dc3c541f8749', '1', '1502697657', '820828077163398281.jpg', 'image/jpeg', 'jpg', '850805', '599158ba6ea05.jpg', '2017-08-14/');
INSERT INTO `bm_picture` VALUES ('206', '/Uploads/Picture/2017-08-14/599158ba8d9ee.jpg', null, 'b7da1009a5f22ee092013d86dc20cc5f', '0eded5d332ffe4b5035855944d0753f52aedc881', '1', '1502697658', '841364266169419974.jpg', 'image/jpeg', 'jpg', '293660', '599158ba8d9ee.jpg', '2017-08-14/');
INSERT INTO `bm_picture` VALUES ('207', '/Uploads/Picture/2017-08-14/599158bab0ab0.jpg', null, '8d50dfd9aa7d9421397b54b71f87677f', '06cc287afe683ec7b0acca37d91a04f1fdc1b25a', '1', '1502697658', 'bbb6f2dbf39189ad8f26cd1b33cf306a.jpeg@300w_70q_1l_1x.jpg', 'image/jpeg', 'jpg', '14830', '599158bab0ab0.jpg', '2017-08-14/');
INSERT INTO `bm_picture` VALUES ('208', '/Uploads/Picture/2017-08-14/599158bb3a2c9.jpg', null, '00b1763f4f4a147f67315b727a6be65a', 'b656fae5d0d268a13c6ca1ec2650ce4fa7d2308f', '1', '1502697658', '喵.jpg', 'image/jpeg', 'jpg', '1235777', '599158bb3a2c9.jpg', '2017-08-14/');
INSERT INTO `bm_picture` VALUES ('209', '/Uploads/Picture/2017-08-14/59915d6f9f067.png', null, 'fcb1e881f409d0e503d19b3cf49ed8c6', '1e907ecd78031f79caea89ab25cb2527470c14b7', '1', '1502698863', '地图.png', 'image/png', 'png', '927058', '59915d6f9f067.png', '2017-08-14/');
INSERT INTO `bm_picture` VALUES ('210', '/Uploads/Picture/2017-08-15/59925881c9f0c.png', null, 'fbbf9653957e2eee8e9d6d2f800b18b9', 'b32a0982fcc7ee7b13339702ac132a326c3e9231', '1', '1502763137', '微信图片_20170724155318.png', 'image/png', 'png', '54007', '59925881c9f0c.png', '2017-08-15/');
INSERT INTO `bm_picture` VALUES ('234', '/Uploads/Picture/2017-08-16/5994136503d09.jpg', null, '3e820f53dd7f78994e9cf931c5cba545', '7dd3c3af50700ba60eddde69258d6ae8087e3bf5', '1', '1502876516', '总经理室1.jpg', 'image/jpeg', 'jpg', '316601', '5994136503d09.jpg', '2017-08-16/');
INSERT INTO `bm_picture` VALUES ('232', '/Uploads/Picture/2017-08-16/5994040357f9f.jpg', null, '4161c2af0c888410234596c830e7b43f', '589f5cf79b3a7f0da98e1627995feb70a85ef93a', '1', '1502872579', '茶水间1.jpg', 'image/jpeg', 'jpg', '383303', '5994040357f9f.jpg', '2017-08-16/');
INSERT INTO `bm_picture` VALUES ('223', '/Uploads/Picture/2017-08-15/599294d327d0d.png', null, 'b269e8c146b36b8192436c4a03f1c116', '1b65ef52efc96de88335852153ffecab178b69f3', '1', '1502778579', '众创空间地址.png', 'image/png', 'png', '243786', '599294d327d0d.png', '2017-08-15/');
INSERT INTO `bm_picture` VALUES ('224', '/Uploads/Picture/2017-08-15/59929ddcb47b9.png', null, 'ac284b2d5a05e295e0a54f843a29699f', 'f371d557984493771219e8b438660956836739eb', '1', '1502780892', 'LB8@~S4}EZCMR))NVQPO161.png', 'image/png', 'png', '906265', '59929ddcb47b9.png', '2017-08-15/');
INSERT INTO `bm_picture` VALUES ('225', '/Uploads/Picture/2017-08-15/59929e479f067.png', null, 'b3893b0ce79efda413235a14083b41c0', '92e2aaf4aa82cd7d2838721ea99184bff3a1bb57', '1', '1502780999', '[BRCF3J%IN27T}_MT]W9)ON.png', 'image/png', 'png', '927224', '59929e479f067.png', '2017-08-15/');
INSERT INTO `bm_picture` VALUES ('226', '/Uploads/Picture/2017-08-15/59929f1923493.png', null, '5b9a7a6dfc453cb8428df1b1a8188980', 'f10d435c3eb80cb5c11d8a5e74af7c0cc31a41b3', '1', '1502781208', '%%YE{D4ET)A}V1~SN~UZCPW.png', 'image/png', 'png', '906849', '59929f1923493.png', '2017-08-15/');
INSERT INTO `bm_picture` VALUES ('227', '/Uploads/Picture/2017-08-15/59929fa72f34f.png', null, '245f25c60078949d802bd32360a39b9b', '351c4e1b4ee718ba61b2d45b58f1d44c514546e1', '1', '1502781350', ')9]V4124P)XVACM$H@~Z~91.png', 'image/png', 'png', '1024348', '59929fa72f34f.png', '2017-08-15/');
INSERT INTO `bm_picture` VALUES ('228', '/Uploads/Picture/2017-08-15/5992a03a81f02.png', null, 'e583e3b650bc9d3b36051e20327223c5', '3a31659aa005eedf1ce93f507c22e2de69e5fef0', '1', '1502781498', 'AH~R~YJSN[H~F2F[__@UUCE.png', 'image/png', 'png', '925651', '5992a03a81f02.png', '2017-08-15/');
INSERT INTO `bm_picture` VALUES ('229', '/Uploads/Picture/2017-08-15/5992a09b66c22.png', null, '480cb58f677761ff995cf1252aba2c1b', '45a815b0970cd8501d1c7c8bae3168de7cee599d', '1', '1502781595', '@0V5J6YKQT9`E24P%~I438E.png', 'image/png', 'png', '968276', '5992a09b66c22.png', '2017-08-15/');
INSERT INTO `bm_picture` VALUES ('230', '/Uploads/Picture/2017-08-15/5992a125afb6e.png', null, '0dcd2c4045708247cadfff4e7d68ac03', 'a61e895a635a8509d81bb69b4496da614a6f0f24', '1', '1502781733', '%ENHDA1F(V55FI$EXP{@`OM.png', 'image/png', 'png', '192390', '5992a125afb6e.png', '2017-08-15/');
INSERT INTO `bm_picture` VALUES ('231', '/Uploads/Picture/2017-08-15/5992a170e9696.png', null, 'f0ff6f22e339b1899f501903cf369d65', '29e3c244ca58392f8a59441f58f87f27c3da1314', '1', '1502781808', '5HJNF4`VZI2A]X37AEP$TYE.png', 'image/png', 'png', '994631', '5992a170e9696.png', '2017-08-15/');
INSERT INTO `bm_picture` VALUES ('235', '/Uploads/Picture/2018-04-05/5ac6093a10fcb.jpg', null, '88108445e734fe94a9ac438cc2788792', '0b269f56deeae0ffaf5981004655ab1b7c7ed48e', '1', '1522927929', 'Bitmap.jpg', 'image/jpeg', 'jpg', '452341', '5ac6093a10fcb.jpg', '2018-04-05/');
INSERT INTO `bm_picture` VALUES ('236', '/Uploads/Picture/2018-04-05/5ac60a0deeb23.jpg', null, 'b45f5109b382285ba395ddf633a89639', '9797015ce331ad0536a2c6f98237223f1b978f61', '1', '1522928141', 'banner_join_mobile.jpg', 'application/octet-stream', 'jpg', '149488', '5ac60a0deeb23.jpg', '2018-04-05/');

-- ----------------------------
-- Table structure for bm_process
-- ----------------------------
DROP TABLE IF EXISTS `bm_process`;
CREATE TABLE `bm_process` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `team_title` varchar(255) NOT NULL COMMENT '文案标题',
  `team_type` char(10) NOT NULL COMMENT '说明类型',
  `add_time` int(10) NOT NULL COMMENT '添加时间',
  `team_content` text NOT NULL COMMENT '文本内容',
  `team_img` int(10) unsigned NOT NULL COMMENT '文案配图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_process
-- ----------------------------
INSERT INTO `bm_process` VALUES ('3', '入驻条件', '1', '1522931460', '<div class=\"__kindeditor_paste__\">\r\n	<span style=\"color:#999999;font-family:MicrosoftYaHei;font-size:14px;background-color:#FFFFFF;\">惠州市大亚湾众创空间投资管理有限公司是一家为创客提供创业场地、设施及配套服务全流程一站式的企业。公司以打造“中国领先的众创空间及孵化器运营机构”为目标，致力于众创空间与孵化器的开发、运营、管理及孵化体系建设，重点聚焦互联网、电子商务、大数据、商业智能、科技金融、文化内容、健康医疗等新兴产业园区的开发建设及产业孵化服务体系搭建，打造产业创新驱动平台，孵化创新创业企业。 创业壹号 PREMIER MAKER SPACE，隶属于惠州市大亚湾众创空间投资管理有限公司。是惠州市大亚湾经济技术开发区首家以“互联网</span> \r\n</div>', '235');
INSERT INTO `bm_process` VALUES ('4', '入驻流程', '2', '1522931580', '<div class=\"__kindeditor_paste__\">\r\n	<span style=\"color:#999999;font-family:MicrosoftYaHei;font-size:14px;background-color:#FFFFFF;\">惠州市大亚湾众创空间投资管理有限公司是一家为创客提供创业场地、设施及配套服务全流程一站式的企业。公司以打造“中国领先的众创空间及孵化器运营机构”为目标，致力于众创空间与孵化器的开发、运营、管理及孵化体系建设，重点聚焦互联网、电子商务、大数据、商业智能、科技金融、文化内容、健康医疗等新兴产业园区的开发建设及产业孵化服务体系搭建，打造产业创新驱动平台，孵化创新创业企业。 创业壹号 PREMIER MAKER SPACE，隶属于惠州市大亚湾众创空间投资管理有限公司。是惠州市大亚湾经济技术开发区首家以“互联网</span> \r\n</div>', '235');

-- ----------------------------
-- Table structure for bm_secondbanner
-- ----------------------------
DROP TABLE IF EXISTS `bm_secondbanner`;
CREATE TABLE `bm_secondbanner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sec_type` char(10) NOT NULL DEFAULT '1' COMMENT 'banner类型',
  `sec_add_time` int(10) NOT NULL COMMENT '添加/修改时间',
  `sec_title_chinese` varchar(255) NOT NULL COMMENT 'banner标题[中]',
  `sec_title_english` varchar(255) NOT NULL COMMENT '二级banner[en]',
  `second_img_url` int(10) unsigned NOT NULL COMMENT '图片链接',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_secondbanner
-- ----------------------------
INSERT INTO `bm_secondbanner` VALUES ('1', '1', '1522073640', '联系我们', 'CONTACT', '231');
INSERT INTO `bm_secondbanner` VALUES ('2', '2', '1522652220', '空间展示', '空间展示', '194');
INSERT INTO `bm_secondbanner` VALUES ('3', '3', '1522678500', '关于我们', '关于我们', '195');
INSERT INTO `bm_secondbanner` VALUES ('4', '5', '1522684800', '资讯中心', '资讯中心', '234');
INSERT INTO `bm_secondbanner` VALUES ('5', '1', '1524067260', '联系我们', '联系我们', '196');
INSERT INTO `bm_secondbanner` VALUES ('6', '6', '1522928100', '团队入驻', '团队入驻', '236');

-- ----------------------------
-- Table structure for bm_spaceshow
-- ----------------------------
DROP TABLE IF EXISTS `bm_spaceshow`;
CREATE TABLE `bm_spaceshow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `spaceshow_title` varchar(255) DEFAULT NULL COMMENT '空间展示标题',
  `spaceshow_url` varchar(255) DEFAULT NULL COMMENT '空间展示链接',
  `spaceshow_pic` int(10) unsigned DEFAULT NULL COMMENT '空间展示图',
  `spaceshow_sort` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `spaceshow_content` text NOT NULL COMMENT '展示空间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_spaceshow
-- ----------------------------
INSERT INTO `bm_spaceshow` VALUES ('4', '空间1', '#', '196', '2', '空间1');
INSERT INTO `bm_spaceshow` VALUES ('5', 'space first', '#', '196', '1', 'space1');
INSERT INTO `bm_spaceshow` VALUES ('6', '总经理室', '#', '194', '3', '<p class=\"MsoNormal\">\r\n	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;惠州市大亚湾众创空间投资管理有限公司\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span>我们是一家为创客提供创业场地、设施及配套服务全流程一站式的企业。公司以打造</span>“中国领先的众创空间及孵化器运营机构”为目标，致力于众创空间与孵化器的开发、运营、管理及孵化体系建设，重点聚焦互联网、电子商务、大数据、商业智能、科技金融、文化内容、健康医疗等新兴产业园的开发建设及产业孵化服务体系搭建，打造产业创新驱动平台，孵化创新创业企业。\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/Uploads/Picture/2017-08-16/5994136503d09.jpg\" alt=\"\" />\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"/Uploads/Picture/2017-08-16/599404ed9b72e.jpg\" alt=\"\" /> \r\n</p>');
INSERT INTO `bm_spaceshow` VALUES ('7', '01', '', '207', '1', '01');
INSERT INTO `bm_spaceshow` VALUES ('8', '2', '', '205', '2', '');
INSERT INTO `bm_spaceshow` VALUES ('9', '3', '', '204', '3', '');
INSERT INTO `bm_spaceshow` VALUES ('10', '4', '', '203', '4', '4');
INSERT INTO `bm_spaceshow` VALUES ('11', '5', '', '200', '5', '5');
INSERT INTO `bm_spaceshow` VALUES ('12', '6', '', '199', '6', '6');
INSERT INTO `bm_spaceshow` VALUES ('13', '茶水间', '', '195', '7', '7<img src=\"/Uploads/Picture/2017-08-16/5994040357f9f.jpg\" alt=\"\" />');
INSERT INTO `bm_spaceshow` VALUES ('14', '3', '', '204', '3', '3');

-- ----------------------------
-- Table structure for bm_trans
-- ----------------------------
DROP TABLE IF EXISTS `bm_trans`;
CREATE TABLE `bm_trans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `trans_key` varchar(255) DEFAULT NULL COMMENT '关键词',
  `trans_value` varchar(255) DEFAULT NULL COMMENT '关键值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_trans
-- ----------------------------
INSERT INTO `bm_trans` VALUES ('1', 'concern', '关注我们');
INSERT INTO `bm_trans` VALUES ('2', 'concern', 'FollowUs');
INSERT INTO `bm_trans` VALUES ('3', 'bespoke', '预约参观');
INSERT INTO `bm_trans` VALUES ('4', 'bespoke', ' bespoke');
INSERT INTO `bm_trans` VALUES ('5', 'adv', '广告模块');
INSERT INTO `bm_trans` VALUES ('6', 'adv', 'adv module');
INSERT INTO `bm_trans` VALUES ('7', 'qrcode', '公众号二维码');
INSERT INTO `bm_trans` VALUES ('8', 'qrcode', 'wechat qrcode');
INSERT INTO `bm_trans` VALUES ('9', 'member', '公司成员');
INSERT INTO `bm_trans` VALUES ('10', 'member', 'company member');
INSERT INTO `bm_trans` VALUES ('11', 'partner', '合作伙伴');
INSERT INTO `bm_trans` VALUES ('12', 'partner', 'partner');
INSERT INTO `bm_trans` VALUES ('13', 'contact', '联系我们');
INSERT INTO `bm_trans` VALUES ('14', 'contact', 'contact us');
INSERT INTO `bm_trans` VALUES ('15', 'intro', '公司介绍');
INSERT INTO `bm_trans` VALUES ('16', 'intro', 'introduction');
INSERT INTO `bm_trans` VALUES ('17', 'act', '近期活动');
INSERT INTO `bm_trans` VALUES ('18', 'act', 'activities');
INSERT INTO `bm_trans` VALUES ('19', 'link', '友情链接');
INSERT INTO `bm_trans` VALUES ('20', 'link', 'links');
INSERT INTO `bm_trans` VALUES ('21', 'cus', '客服电话');
INSERT INTO `bm_trans` VALUES ('22', 'cus', 'customer service');
INSERT INTO `bm_trans` VALUES ('23', 'law', '法律说明');
INSERT INTO `bm_trans` VALUES ('24', 'law', 'law');

-- ----------------------------
-- Table structure for bm_translate
-- ----------------------------
DROP TABLE IF EXISTS `bm_translate`;
CREATE TABLE `bm_translate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `translate_concern_id` int(10) unsigned DEFAULT NULL COMMENT '文章或分类的id',
  `translate_lang_id` int(10) unsigned DEFAULT NULL COMMENT '语言的id',
  `translate_lang_tag` varchar(255) DEFAULT NULL COMMENT '翻译的语言标签',
  `translate_type` int(10) unsigned DEFAULT NULL COMMENT '翻译的类型',
  `translate_content` varchar(500) DEFAULT NULL COMMENT '翻译内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_translate
-- ----------------------------
INSERT INTO `bm_translate` VALUES ('78', '2', '1', 'zh_CN', '1', '{\"1\":2,\"10\":3}');
INSERT INTO `bm_translate` VALUES ('79', '3', '10', 'en_US', '1', '{\"1\":2,\"10\":3}');
INSERT INTO `bm_translate` VALUES ('81', '5', '10', 'en_US', '2', '{\"10\":5,\"1\":6}');
INSERT INTO `bm_translate` VALUES ('118', '6', '1', 'zh_CN', '5', '{\"1\":6,\"10\":14}');
INSERT INTO `bm_translate` VALUES ('84', '4', '1', 'zh_CN', '3', '{\"1\":4,\"10\":5}');
INSERT INTO `bm_translate` VALUES ('85', '5', '10', 'en_US', '3', '{\"1\":4,\"10\":5}');
INSERT INTO `bm_translate` VALUES ('86', '2', '1', 'zh_CN', '4', '{\"1\":2,\"10\":3}');
INSERT INTO `bm_translate` VALUES ('87', '3', '10', 'en_US', '4', '{\"1\":2,\"10\":3}');
INSERT INTO `bm_translate` VALUES ('88', '4', '1', 'zh_CN', '5', '{\"1\":4,\"10\":5}');
INSERT INTO `bm_translate` VALUES ('89', '5', '10', 'en_US', '5', '{\"1\":4,\"10\":5}');
INSERT INTO `bm_translate` VALUES ('90', '3', '1', 'zh_CN', '6', '{\"1\":3,\"10\":4}');
INSERT INTO `bm_translate` VALUES ('91', '4', '10', 'en_US', '6', '{\"1\":3,\"10\":4}');
INSERT INTO `bm_translate` VALUES ('92', '6', '1', 'zh_CN', '7', '{\"1\":6,\"10\":7}');
INSERT INTO `bm_translate` VALUES ('93', '7', '10', 'en_US', '7', '{\"1\":6,\"10\":7}');
INSERT INTO `bm_translate` VALUES ('94', '1', '1', 'zh_CN', '8', '{\"1\":1,\"10\":2}');
INSERT INTO `bm_translate` VALUES ('95', '2', '10', 'en_US', '8', '{\"1\":1,\"10\":2}');
INSERT INTO `bm_translate` VALUES ('96', '3', '1', 'zh_CN', '8', '{\"1\":3,\"10\":4}');
INSERT INTO `bm_translate` VALUES ('97', '4', '10', 'en_US', '8', '{\"1\":3,\"10\":4}');
INSERT INTO `bm_translate` VALUES ('98', '5', '1', 'zh_CN', '8', '{\"1\":5,\"10\":6}');
INSERT INTO `bm_translate` VALUES ('99', '6', '10', 'en_US', '8', '{\"1\":5,\"10\":6}');
INSERT INTO `bm_translate` VALUES ('100', '7', '1', 'zh_CN', '8', '{\"1\":7,\"10\":8}');
INSERT INTO `bm_translate` VALUES ('101', '8', '10', 'en_US', '8', '{\"1\":7,\"10\":8}');
INSERT INTO `bm_translate` VALUES ('102', '9', '1', 'zh_CN', '8', '{\"1\":9,\"10\":10}');
INSERT INTO `bm_translate` VALUES ('103', '10', '10', 'en_US', '8', '{\"1\":9,\"10\":10}');
INSERT INTO `bm_translate` VALUES ('104', '11', '1', 'zh_CN', '8', '{\"1\":11,\"10\":12}');
INSERT INTO `bm_translate` VALUES ('105', '12', '10', 'en_US', '8', '{\"1\":11,\"10\":12}');
INSERT INTO `bm_translate` VALUES ('106', '13', '1', 'zh_CN', '8', '{\"1\":13,\"10\":14}');
INSERT INTO `bm_translate` VALUES ('107', '14', '10', 'en_US', '8', '{\"1\":13,\"10\":14}');
INSERT INTO `bm_translate` VALUES ('108', '15', '1', 'zh_CN', '8', '{\"1\":15,\"10\":16}');
INSERT INTO `bm_translate` VALUES ('109', '16', '10', 'en_US', '8', '{\"1\":15,\"10\":16}');
INSERT INTO `bm_translate` VALUES ('110', '17', '1', 'zh_CN', '8', '{\"1\":17,\"10\":18}');
INSERT INTO `bm_translate` VALUES ('111', '18', '10', 'en_US', '8', '{\"1\":17,\"10\":18}');
INSERT INTO `bm_translate` VALUES ('112', '19', '1', 'zh_CN', '8', '{\"1\":19,\"10\":20}');
INSERT INTO `bm_translate` VALUES ('113', '20', '10', 'en_US', '8', '{\"1\":19,\"10\":20}');
INSERT INTO `bm_translate` VALUES ('114', '21', '1', 'zh_CN', '8', '{\"1\":21,\"10\":22}');
INSERT INTO `bm_translate` VALUES ('115', '22', '10', 'en_US', '8', '{\"1\":21,\"10\":22}');
INSERT INTO `bm_translate` VALUES ('116', '23', '1', 'zh_CN', '8', '{\"1\":23,\"10\":24}');
INSERT INTO `bm_translate` VALUES ('117', '24', '10', 'en_US', '8', '{\"1\":23,\"10\":24}');
INSERT INTO `bm_translate` VALUES ('119', '6', '1', 'zh_CN', '2', '{\"10\":5,\"1\":6}');
INSERT INTO `bm_translate` VALUES ('120', '7', '1', 'zh_CN', '5', '{\"1\":7}');
INSERT INTO `bm_translate` VALUES ('121', '8', '1', 'zh_CN', '5', '{\"1\":8}');
INSERT INTO `bm_translate` VALUES ('122', '9', '1', 'zh_CN', '5', '{\"1\":9}');
INSERT INTO `bm_translate` VALUES ('123', '10', '1', 'zh_CN', '5', '{\"1\":10}');
INSERT INTO `bm_translate` VALUES ('124', '11', '1', 'zh_CN', '5', '{\"1\":11}');
INSERT INTO `bm_translate` VALUES ('125', '12', '1', 'zh_CN', '5', '{\"1\":12}');
INSERT INTO `bm_translate` VALUES ('126', '13', '1', 'zh_CN', '5', '{\"1\":13}');
INSERT INTO `bm_translate` VALUES ('127', '14', '10', 'en_US', '5', '{\"1\":6,\"10\":14}');
INSERT INTO `bm_translate` VALUES ('132', '6', '10', 'en_US', '6', '{\"1\":5,\"10\":6}');
INSERT INTO `bm_translate` VALUES ('131', '5', '1', 'zh_CN', '6', '{\"1\":5,\"10\":6}');
INSERT INTO `bm_translate` VALUES ('135', '10', '1', 'zh_CN', '7', '{\"10\":9,\"1\":10}');
INSERT INTO `bm_translate` VALUES ('134', '9', '10', 'en_US', '7', '{\"10\":9,\"1\":10}');
INSERT INTO `bm_translate` VALUES ('136', '7', '10', 'en_US', '6', '{\"10\":7,\"1\":12}');
INSERT INTO `bm_translate` VALUES ('139', '10', '1', 'zh_CN', '6', '{\"1\":10,\"10\":11}');
INSERT INTO `bm_translate` VALUES ('140', '11', '10', 'en_US', '6', '{\"1\":10,\"10\":11}');
INSERT INTO `bm_translate` VALUES ('141', '12', '1', 'zh_CN', '6', '{\"10\":7,\"1\":12}');
INSERT INTO `bm_translate` VALUES ('144', '3', '1', 'zh_CN', '9', '{\"1\":3}');
INSERT INTO `bm_translate` VALUES ('145', '4', '1', 'zh_CN', '9', '{\"1\":4}');
INSERT INTO `bm_translate` VALUES ('146', '5', '1', 'zh_CN', '9', '{\"1\":5}');
INSERT INTO `bm_translate` VALUES ('147', '6', '1', 'zh_CN', '9', '{\"1\":6}');
INSERT INTO `bm_translate` VALUES ('148', '7', '1', 'zh_CN', '9', '{\"1\":7}');
INSERT INTO `bm_translate` VALUES ('149', '3', '1', 'zh_CN', '10', '{\"1\":3}');
INSERT INTO `bm_translate` VALUES ('150', '4', '1', 'zh_CN', '10', '{\"1\":4}');

-- ----------------------------
-- Table structure for bm_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `bm_ucenter_admin`;
CREATE TABLE `bm_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of bm_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for bm_ucenter_app
-- ----------------------------
DROP TABLE IF EXISTS `bm_ucenter_app`;
CREATE TABLE `bm_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of bm_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for bm_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `bm_ucenter_member`;
CREATE TABLE `bm_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of bm_ucenter_member
-- ----------------------------
INSERT INTO `bm_ucenter_member` VALUES ('1', 'admin', '7dbd49967a6a6708c21d2861fb37db96', 'test@qq.com', '', '1440409998', '2130706433', '1522933169', '2130706433', '1440409998', '1');
INSERT INTO `bm_ucenter_member` VALUES ('9', 'user', '7c2828af39be359d33bcc4f86ba689ce', 'admin@admin.com', '', '1502769829', '2130706433', '1502769925', '2130706433', '1502769829', '1');
INSERT INTO `bm_ucenter_member` VALUES ('10', 'j', '286b97476e1c89c79658f6b842ace8bb', '2@qq.com', '', '1502770661', '3232235699', '1502770778', '3232235699', '1502770661', '1');
INSERT INTO `bm_ucenter_member` VALUES ('11', 'test1', 'b4b8de4016b7873e8bc368b429f4af44', '22@qq.com', '', '1502770421', '3232235699', '0', '0', '1502770421', '1');

-- ----------------------------
-- Table structure for bm_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `bm_ucenter_setting`;
CREATE TABLE `bm_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of bm_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for bm_url
-- ----------------------------
DROP TABLE IF EXISTS `bm_url`;
CREATE TABLE `bm_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of bm_url
-- ----------------------------

-- ----------------------------
-- Table structure for bm_userdata
-- ----------------------------
DROP TABLE IF EXISTS `bm_userdata`;
CREATE TABLE `bm_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bm_userdata
-- ----------------------------

-- ----------------------------
-- Table structure for bm_webcontent
-- ----------------------------
DROP TABLE IF EXISTS `bm_webcontent`;
CREATE TABLE `bm_webcontent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `webcontent_logo` int(10) unsigned DEFAULT NULL COMMENT '网站logo',
  `webcontent_law` text COMMENT '法律说明(中文)',
  `webcontent_rcode` int(10) unsigned DEFAULT NULL COMMENT '网站二维码',
  `webcontent_tel` varchar(255) DEFAULT NULL COMMENT '电话客服',
  `webcontent_law_en` text COMMENT '法律说明(英文)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_webcontent
-- ----------------------------
INSERT INTO `bm_webcontent` VALUES ('1', '210', '<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;\"><span style=\"vertical-align:baseline;color:#999933;\">您进入本网站及浏览其任何网页，即表示您已经同意遵守下述条款。如不接受下述条款，请立即停止浏览、使用本网站行为，如您继续使用或浏览视为您全部接受下述条款。</span></span><br />\r\n&nbsp;\r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;font-size:12px;\"><span style=\"vertical-align:baseline;color:#999933;\"><strong>&nbsp;<span style=\"vertical-align:baseline;font-size:14px;\">网站内容的版权及使用：</span></strong></span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<hr />\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">1、本网站所有资料包含但不限于以下内容：文本、图形、LOGO、网页设计、软件等的版权归中和农信项目管理有限公司（以下简称“公司”）及/或其授权人所有，受中国及国际版权法的保护。</span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">2、除非另有明确说明，您在使用本网站之内容时，应遵守下列条款：</span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\"><span style=\"vertical-align:baseline;\"><span style=\"vertical-align:baseline;\">＞&nbsp;&nbsp;</span></span>未经书面许可，不得复制、留存、编辑、组合、镜像、转发、出版、演示，或以其他任何形式使用；</span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\"><span style=\"vertical-align:baseline;\"><span style=\"vertical-align:baseline;\">＞&nbsp;&nbsp;</span></span>经许可的使用应载明授权方；</span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\"><span style=\"vertical-align:baseline;\"><span style=\"vertical-align:baseline;\">＞&nbsp;&nbsp;</span></span>任何使用不可对内容有任何修改；</span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\"><span style=\"vertical-align:baseline;\"><span style=\"vertical-align:baseline;\">＞&nbsp;&nbsp;</span></span>任何使用均应遵守中华人民共和国法律；</span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\"><span style=\"vertical-align:baseline;\"><span style=\"vertical-align:baseline;\">＞&nbsp;&nbsp;</span></span>本公司保留随时撤销该授权的权利，无论何种形式的使用，均应于收到公司书面通知当日起立刻停止。</span></span><br />\r\n&nbsp;\r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;\"><span style=\"vertical-align:baseline;color:#999933;\"><strong>&nbsp;标识声明：</strong></span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<hr />\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">1、该网站上使用和显示的所有商标、标志皆属于本公司所有，但注明属于其他方拥有的商标、标志、除外。公司网站所载的任何内容不应被视作未经公司或其他方书面许可，以暗示、不反对或其他形式授予使用前述任何商标、标志的许可或权利。未经事先书面许可，任何人不得以任何方式使用公司名称及公司的标记、标示等。</span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">2、其他任何用来标识本公司和公司其他业务的图形、图片、声音、创意、LOGO和企业名称、英文名称、名称缩写、字号、域名、标识均受相关法律保护，未经本公司或其他相关方的许可，任何人不得擅自使用这些商标、专用名称、标识，更不得以任何曲解或诋毁的形式使用；如擅自使用者，本公司保留追诉权利。</span></span><br />\r\n&nbsp;\r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;\"><span style=\"vertical-align:baseline;color:#999933;\"><strong>&nbsp;链接：</strong></span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<hr />\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">1、本公司网站的运营网址是www.cfpamf.org.cn，对于其他声称公司的网站与公司没有任何关联，公司对其不承担任何法律责任。</span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">2、未经本公司授权，其他商业性网站不得链接本网站，公司对于任何第三方未经授权建立的与本网站链接的网站，本公司均不做任何保证承诺并不承担任何责任。</span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">3、对于您从本公司网站链接到的任何其他网站，本公司均不做任何保证承诺。请务必认知该等网站系独立于本公司之外的，且公司无权干涉该网站之内容。</span></span><br />\r\n&nbsp;\r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;\"><span style=\"vertical-align:baseline;color:#999933;\"><strong>&nbsp;网站上的信息：</strong></span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<hr />\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">1、浏览者可以下载本公司网站上显示的资料，但这些资料只限用于个人学习研究使用，不得用于任何商业用途。</span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">2、本公司网站只提供一般讯息，此处所提供的信息并不构成任何财务建议或其他建议，也不构成任何要约或承诺。</span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">3、除非本公司与其他方另有约定，本公司网站所载的材料和信息，包括但不限于文本、图片、数据、观点、建议、网页或链路，虽然本公司努力在网站上提供准确的材料和信息，但本公司并不保证这些材料和内容的准确、完整、充分和可靠性，并且明确声明不对这些材料和内容的错误或遗漏承担责任，也不对这些材料和内容作出任何明示或默示的、包括但不限于有关所有权担保、没有侵犯第三方权利、质量和没有计算机病毒的保证。</span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">4、本公司对网站的内容拥有解释权，本公司有权随时对网站的内容进行更新或修改。</span></span><br />\r\n&nbsp;\r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;\"><span style=\"vertical-align:baseline;color:#999933;\"><strong>&nbsp;转载声明：</strong></span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<hr />\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">1、本公司网站其他没有主张权利的部分内容由其它组织、机构或个人提供，这些内容的版权属于相应的提供者。</span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">2、本公司网站引用、摘录或转载来自第三方内容仅供访问者交流或参考，文中观点或信息与公司无关。</span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">3、本公司网站摘录或转载这些内容时，均严格按照我国网络著作权相关法律、法规和司法解释确立的原则进行。任何人浏览本公司网站时如发现有关文章存在侵权事宜，请立即通知我们的网络管理员，如果属侵权信息，我们将立即在职责范围内予以清除。</span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">&nbsp;意见及反馈：</span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">任何寄至本公司的意见及反馈，诸如问题、意见、建议以及任何其他的回复都将被视为非机密性文件。本公司对该回复不负任何保密义务，且本公司可自由地使用、复制、散布及公开陈述该意见及反馈。</span></span><br />\r\n&nbsp;\r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;\"><span style=\"vertical-align:baseline;color:#999933;\"><strong>&nbsp;免责：</strong></span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<hr />\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">1、对本公司网站上所有内容及互联网传输，公司不提供任何明示或暗示的担保。</span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">2、公司本网站对用户上载的信息、软件的真实性以及由此引起的任何损失或任何由于使用该内容而引起的损失，包括但不限于直接的，间接的，偶然的、惩罚性的损失，不承担责任。</span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">3、对于因互联网传输故障及其他不可抗力导致的后果，本公司不承担任何责任。</span></span><br />\r\n&nbsp;\r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<span style=\"vertical-align:baseline;\"><span style=\"vertical-align:baseline;color:#999933;\"><strong>&nbsp;适用法律：</strong></span></span> \r\n</div>\r\n<div style=\"margin:0px;padding:0px;border:0px;vertical-align:baseline;color:#7F7F7F;font-family:微软雅黑;font-size:14px;\">\r\n	<hr />\r\n	<span style=\"vertical-align:baseline;color:#333333;\"><span style=\"vertical-align:baseline;font-size:12px;\">本公司网站的运营适用中华人民共和国法律。</span></span> \r\n</div>', '183', '13076800312', 'law');

-- ----------------------------
-- Table structure for bm_worker
-- ----------------------------
DROP TABLE IF EXISTS `bm_worker`;
CREATE TABLE `bm_worker` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `worker_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `worker_img` int(10) unsigned DEFAULT NULL COMMENT '相片',
  `worker_brief` text COMMENT '简介',
  `worker_sort` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `secondary_title` varchar(255) NOT NULL COMMENT '二级标题',
  `woker_record` text NOT NULL COMMENT '二级标题详细内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bm_worker
-- ----------------------------
INSERT INTO `bm_worker` VALUES ('5', 'Mr Lin', '179', 'Mr Lin', '1', '', '');
INSERT INTO `bm_worker` VALUES ('6', 'TSET', '197', '', '1', '', '');
