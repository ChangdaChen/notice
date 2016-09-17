/*
Navicat MySQL Data Transfer

Source Server         : database
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : talk

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2016-06-26 23:23:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_message`
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `createTime` time NOT NULL,
  `contents` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`userName`),
  KEY `id` (`id`),
  KEY `userName` (`userName`),
  CONSTRAINT `userName` FOREIGN KEY (`userName`) REFERENCES `t_user` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('8', '哈伦裤', '～～零度', '20:48:08', '哈哈哈哈爱吃啊');
INSERT INTO `t_message` VALUES ('18', '1', '111题目', '10:53:07', '11111');
INSERT INTO `t_message` VALUES ('19', '1', '1111111', '11:15:04', '1111111111111');
INSERT INTO `t_message` VALUES ('20', '1', '11111111', '11:15:10', '11111111111111111111');

-- ----------------------------
-- Table structure for `t_reply`
-- ----------------------------
DROP TABLE IF EXISTS `t_reply`;
CREATE TABLE `t_reply` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `messageId` int(10) NOT NULL,
  `userId` int(10) NOT NULL,
  `createTime` time NOT NULL,
  `contents` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`messageId`,`userId`),
  KEY `userId` (`userId`),
  KEY `messageId` (`messageId`),
  CONSTRAINT `messageId` FOREIGN KEY (`messageId`) REFERENCES `t_message` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_reply
-- ----------------------------
INSERT INTO `t_reply` VALUES ('15', '8', '7', '22:49:20', '我也爱！！！');
INSERT INTO `t_reply` VALUES ('17', '8', '11', '14:03:04', '2222');
INSERT INTO `t_reply` VALUES ('33', '18', '11', '10:53:33', '111111111');
INSERT INTO `t_reply` VALUES ('34', '18', '1', '12:12:29', '1111111111111111111212');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(10) NOT NULL COMMENT '姓名',
  `loginName` varchar(10) NOT NULL COMMENT '账号',
  `loginPwd` varchar(10) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`,`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '管理员', 'admin', 'admin');
INSERT INTO `t_user` VALUES ('7', '陈昌达', '140210219', '140210219');
INSERT INTO `t_user` VALUES ('8', 'You丶霸霸', '1139995138', 'xiaoyou521');
INSERT INTO `t_user` VALUES ('9', '哈伦裤', '921463372', '7452174521');
INSERT INTO `t_user` VALUES ('11', '1', '1', '1');
INSERT INTO `t_user` VALUES ('12', 'FF', 'FF', 'FF');
INSERT INTO `t_user` VALUES ('14', 'tao', 'tao', '123');
INSERT INTO `t_user` VALUES ('15', '444', '444', '444');
INSERT INTO `t_user` VALUES ('16', '333', '333', '333');
INSERT INTO `t_user` VALUES ('17', '112', '12', '12');
