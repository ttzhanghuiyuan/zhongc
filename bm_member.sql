/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : zhongc

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-04-07 00:16:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bm_member
-- ----------------------------
DROP TABLE IF EXISTS `bm_member`;
CREATE TABLE `bm_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL COMMENT '生日',
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
