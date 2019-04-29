/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : sociality_db

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2019-04-29 19:37:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account_tb`
-- ----------------------------
DROP TABLE IF EXISTS `account_tb`;
CREATE TABLE `account_tb` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '账户id',
  `realname` varchar(255) DEFAULT NULL COMMENT '姓名',
  `sid` varchar(255) DEFAULT NULL COMMENT '账户',
  `sex` tinyint(4) DEFAULT '0' COMMENT '性别,默认为0未知，为1男性，为2女性',
  `nation` varchar(255) DEFAULT NULL COMMENT '民族',
  `identity_cards` varchar(255) DEFAULT NULL COMMENT '身份证',
  `phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `icon` varchar(255) DEFAULT NULL COMMENT '头像',
  `birth_date` datetime DEFAULT NULL COMMENT '出生年月日',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `login_date` datetime DEFAULT NULL COMMENT '登陆时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态，默认0离线，1封禁，2异常，3在线',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id外键',
  PRIMARY KEY (`account_id`),
  KEY `INDEX_REALNAME` (`realname`) USING BTREE,
  KEY `INDEX_ROLEID` (`role_id`) USING BTREE,
  KEY `INDEX_STATUS` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 COMMENT='账户表';

-- ----------------------------
-- Records of account_tb
-- ----------------------------
INSERT INTO `account_tb` VALUES ('1000', '涅羽', '1000', '1', '', '', '1000', '11874bb6149dd45428da628c9766b252', 'http://localhost:8080/uploaderPath/img/20190418/1555577021logo.png', '2019-04-18 00:00:00', '2019-04-15 15:05:43', '2019-04-15 15:05:43', '0', '1000');
INSERT INTO `account_tb` VALUES ('1001', 'cesds23', '1001', '0', '', '', '', '11874bb6149dd45428da628c9766b252', 'http://localhost:8080/uploaderPath/img/20190428/1556434983yayaogongzhonghao.jpg', null, '2019-04-15 16:13:49', '2019-04-15 16:13:49', '3', '1001');
INSERT INTO `account_tb` VALUES ('1002', 'fdg', '1002', '1', null, null, null, '11874bb6149dd45428da628c9766b252', null, null, '2019-04-15 16:13:57', '2019-04-15 16:13:57', '3', '1001');
INSERT INTO `account_tb` VALUES ('1003', '1111', '1003', '0', '', '', '', '11874bb6149dd45428da628c9766b252', '', null, '2019-04-29 18:39:51', '2019-04-29 18:39:51', '0', '1001');

-- ----------------------------
-- Table structure for `chat_room_member_tb`
-- ----------------------------
DROP TABLE IF EXISTS `chat_room_member_tb`;
CREATE TABLE `chat_room_member_tb` (
  `chat_room_member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '聊天房成员id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `chat_room_id` int(11) DEFAULT NULL COMMENT '聊天房id外键',
  `account_id` int(11) DEFAULT NULL COMMENT '账户id外键',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型，1私聊，2普通房，3语音房，4电影房',
  PRIMARY KEY (`chat_room_member_id`),
  KEY `INDEX_CHATROOMID` (`chat_room_id`) USING BTREE,
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_TYPE` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1024 DEFAULT CHARSET=utf8 COMMENT='聊天房成员表';

-- ----------------------------
-- Records of chat_room_member_tb
-- ----------------------------
INSERT INTO `chat_room_member_tb` VALUES ('1000', '2019-04-25 10:34:26', '2019-04-25 10:34:26', '3', '1000', '1');
INSERT INTO `chat_room_member_tb` VALUES ('1001', '2019-04-25 10:34:26', '2019-04-25 10:34:26', '3', '1001', '1');
INSERT INTO `chat_room_member_tb` VALUES ('1002', '2019-04-25 11:53:19', '2019-04-25 11:53:19', '4', '1000', '1');
INSERT INTO `chat_room_member_tb` VALUES ('1003', '2019-04-25 11:53:19', '2019-04-25 11:53:19', '4', '1002', '1');
INSERT INTO `chat_room_member_tb` VALUES ('1005', '2019-04-28 11:14:02', '2019-04-28 11:14:02', '6', '1000', '3');
INSERT INTO `chat_room_member_tb` VALUES ('1012', '2019-04-28 16:09:24', '2019-04-28 16:09:24', '13', '1000', '4');
INSERT INTO `chat_room_member_tb` VALUES ('1013', '2019-04-28 16:13:57', '2019-04-28 16:13:57', '14', '1001', '4');
INSERT INTO `chat_room_member_tb` VALUES ('1017', '2019-04-28 17:56:12', '2019-04-28 17:56:12', '14', '1000', '4');
INSERT INTO `chat_room_member_tb` VALUES ('1018', '2019-04-28 18:15:19', '2019-04-28 18:15:19', '14', '1002', '4');
INSERT INTO `chat_room_member_tb` VALUES ('1019', '2019-04-29 18:01:28', '2019-04-29 18:01:28', '13', '1002', '4');
INSERT INTO `chat_room_member_tb` VALUES ('1020', '2019-04-29 18:42:37', '2019-04-29 18:42:37', '6', '1003', '3');
INSERT INTO `chat_room_member_tb` VALUES ('1021', '2019-04-29 18:42:47', '2019-04-29 18:42:47', '14', '1003', '4');
INSERT INTO `chat_room_member_tb` VALUES ('1022', '2019-04-29 18:44:11', '2019-04-29 18:44:11', '13', '1003', '4');
INSERT INTO `chat_room_member_tb` VALUES ('1023', '2019-04-29 18:45:05', '2019-04-29 18:45:05', '13', '1001', '4');

-- ----------------------------
-- Table structure for `chat_room_record_tb`
-- ----------------------------
DROP TABLE IF EXISTS `chat_room_record_tb`;
CREATE TABLE `chat_room_record_tb` (
  `chat_room_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '聊天房聊天记录id',
  `content` longtext COMMENT '内容',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `chat_room_id` int(11) DEFAULT NULL COMMENT '聊天房id外键',
  `from_account_id` int(11) DEFAULT NULL COMMENT '发送端账户id外键',
  `to_account_id` int(11) DEFAULT NULL COMMENT '接受端账户id外键',
  PRIMARY KEY (`chat_room_record_id`),
  KEY `INDEX_CHATROOMID` (`chat_room_id`) USING BTREE,
  KEY `INDEX_FromACCOUNTID` (`from_account_id`) USING BTREE,
  KEY `INDEX_TOACCOUNTID` (`to_account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1145 DEFAULT CHARSET=utf8 COMMENT='聊天房聊天记录表';

-- ----------------------------
-- Records of chat_room_record_tb
-- ----------------------------
INSERT INTO `chat_room_record_tb` VALUES ('1043', 'fghfgh', '2019-04-29 17:42:51', '2019-04-29 17:42:51', '3', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1044', 'fghfgh', '2019-04-29 17:42:51', '2019-04-29 17:42:51', '3', '1000', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1045', 'jhgj', '2019-04-29 17:44:36', '2019-04-29 17:44:36', '3', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1046', 'jhgj', '2019-04-29 17:44:36', '2019-04-29 17:44:36', '3', '1000', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1047', 'yuy', '2019-04-29 17:44:40', '2019-04-29 17:44:40', '3', '1001', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1048', 'yuy', '2019-04-29 17:44:41', '2019-04-29 17:44:41', '3', '1001', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1049', 'er', '2019-04-29 17:46:48', '2019-04-29 17:46:48', '3', '1001', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1050', 'er', '2019-04-29 17:46:48', '2019-04-29 17:46:48', '3', '1001', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1051', 'rtr', '2019-04-29 17:46:53', '2019-04-29 17:46:53', '3', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1052', 'rtr', '2019-04-29 17:46:53', '2019-04-29 17:46:53', '3', '1000', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1053', 'rt', '2019-04-29 17:46:56', '2019-04-29 17:46:56', '3', '1001', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1054', 'rt', '2019-04-29 17:46:56', '2019-04-29 17:46:56', '3', '1001', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1055', 'rt', '2019-04-29 17:47:00', '2019-04-29 17:47:00', '3', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1056', 'rt', '2019-04-29 17:47:00', '2019-04-29 17:47:00', '3', '1000', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1057', '123456', '2019-04-29 17:47:04', '2019-04-29 17:47:04', '3', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1058', '123456', '2019-04-29 17:47:04', '2019-04-29 17:47:04', '3', '1000', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1059', '333', '2019-04-29 17:47:15', '2019-04-29 17:47:15', '3', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1060', '333', '2019-04-29 17:47:15', '2019-04-29 17:47:15', '3', '1000', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1061', '111', '2019-04-29 17:47:19', '2019-04-29 17:47:19', '3', '1001', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1062', '111', '2019-04-29 17:47:19', '2019-04-29 17:47:19', '3', '1001', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1063', 'rtht', '2019-04-29 17:48:28', '2019-04-29 17:48:28', '3', '1001', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1064', 'rtht', '2019-04-29 17:48:28', '2019-04-29 17:48:28', '3', '1001', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1065', 'er', '2019-04-29 17:48:31', '2019-04-29 17:48:31', '3', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1066', 'er', '2019-04-29 17:48:31', '2019-04-29 17:48:31', '3', '1000', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1067', '45', '2019-04-29 17:48:37', '2019-04-29 17:48:37', '3', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1068', '45', '2019-04-29 17:48:37', '2019-04-29 17:48:37', '3', '1000', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1069', '45', '2019-04-29 17:48:43', '2019-04-29 17:48:43', '3', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1070', '45', '2019-04-29 17:48:43', '2019-04-29 17:48:43', '3', '1000', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1071', 'rt', '2019-04-29 17:49:15', '2019-04-29 17:49:15', '3', '1001', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1072', 'rt', '2019-04-29 17:49:15', '2019-04-29 17:49:15', '3', '1001', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1073', 'er', '2019-04-29 17:51:25', '2019-04-29 17:51:25', '3', '1001', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1074', 'er', '2019-04-29 17:51:25', '2019-04-29 17:51:25', '3', '1001', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1075', '34', '2019-04-29 17:51:29', '2019-04-29 17:51:29', '3', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1076', '34', '2019-04-29 17:51:29', '2019-04-29 17:51:29', '3', '1000', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1077', 'dsfsd', '2019-04-29 17:52:30', '2019-04-29 17:52:30', '6', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1078', 'sdf', '2019-04-29 17:52:40', '2019-04-29 17:52:40', '14', '1000', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1079', 'sdf', '2019-04-29 17:52:40', '2019-04-29 17:52:40', '14', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1080', 'sdf', '2019-04-29 17:52:40', '2019-04-29 17:52:40', '14', '1000', '1002');
INSERT INTO `chat_room_record_tb` VALUES ('1081', 'dfg', '2019-04-29 17:52:49', '2019-04-29 17:52:49', '14', '1001', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1082', 'dfg', '2019-04-29 17:52:49', '2019-04-29 17:52:49', '14', '1001', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1083', 'dfg', '2019-04-29 17:52:49', '2019-04-29 17:52:49', '14', '1001', '1002');
INSERT INTO `chat_room_record_tb` VALUES ('1084', 'dfg', '2019-04-29 17:52:51', '2019-04-29 17:52:51', '14', '1001', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1085', 'dfg', '2019-04-29 17:52:51', '2019-04-29 17:52:51', '14', '1001', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1086', 'dfg', '2019-04-29 17:52:51', '2019-04-29 17:52:51', '14', '1001', '1002');
INSERT INTO `chat_room_record_tb` VALUES ('1087', '333', '2019-04-29 17:53:23', '2019-04-29 17:53:23', '14', '1002', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1088', '333', '2019-04-29 17:53:23', '2019-04-29 17:53:23', '14', '1002', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1089', '333', '2019-04-29 17:53:23', '2019-04-29 17:53:23', '14', '1002', '1002');
INSERT INTO `chat_room_record_tb` VALUES ('1090', '22', '2019-04-29 17:53:32', '2019-04-29 17:53:32', '14', '1001', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1091', '22', '2019-04-29 17:53:32', '2019-04-29 17:53:32', '14', '1001', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1092', '22', '2019-04-29 17:53:32', '2019-04-29 17:53:32', '14', '1001', '1002');
INSERT INTO `chat_room_record_tb` VALUES ('1093', '11', '2019-04-29 17:53:35', '2019-04-29 17:53:35', '14', '1000', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1094', '11', '2019-04-29 17:53:35', '2019-04-29 17:53:35', '14', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1095', '11', '2019-04-29 17:53:35', '2019-04-29 17:53:35', '14', '1000', '1002');
INSERT INTO `chat_room_record_tb` VALUES ('1096', '33', '2019-04-29 17:53:43', '2019-04-29 17:53:43', '14', '1002', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1097', '33', '2019-04-29 17:53:43', '2019-04-29 17:53:43', '14', '1002', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1098', '33', '2019-04-29 17:53:43', '2019-04-29 17:53:43', '14', '1002', '1002');
INSERT INTO `chat_room_record_tb` VALUES ('1099', '11', '2019-04-29 17:53:47', '2019-04-29 17:53:47', '14', '1000', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1100', '11', '2019-04-29 17:53:47', '2019-04-29 17:53:47', '14', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1101', '11', '2019-04-29 17:53:47', '2019-04-29 17:53:47', '14', '1000', '1002');
INSERT INTO `chat_room_record_tb` VALUES ('1102', '22', '2019-04-29 17:53:50', '2019-04-29 17:53:50', '14', '1001', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1103', '22', '2019-04-29 17:53:50', '2019-04-29 17:53:50', '14', '1001', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1104', '22', '2019-04-29 17:53:50', '2019-04-29 17:53:50', '14', '1001', '1002');
INSERT INTO `chat_room_record_tb` VALUES ('1105', 'rt', '2019-04-29 17:56:12', '2019-04-29 17:56:12', '14', '1000', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1106', 'rt', '2019-04-29 17:56:12', '2019-04-29 17:56:12', '14', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1107', 'rt', '2019-04-29 17:56:12', '2019-04-29 17:56:12', '14', '1000', '1002');
INSERT INTO `chat_room_record_tb` VALUES ('1108', 'e', '2019-04-29 17:56:42', '2019-04-29 17:56:42', '14', '1000', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1109', 'e', '2019-04-29 17:56:42', '2019-04-29 17:56:42', '14', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1110', 'e', '2019-04-29 17:56:42', '2019-04-29 17:56:42', '14', '1000', '1002');
INSERT INTO `chat_room_record_tb` VALUES ('1111', '33', '2019-04-29 17:56:45', '2019-04-29 17:56:45', '14', '1001', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1112', '33', '2019-04-29 17:56:45', '2019-04-29 17:56:45', '14', '1001', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1113', '33', '2019-04-29 17:56:45', '2019-04-29 17:56:45', '14', '1001', '1002');
INSERT INTO `chat_room_record_tb` VALUES ('1114', '2', '2019-04-29 17:56:50', '2019-04-29 17:56:50', '14', '1002', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1115', '2', '2019-04-29 17:56:50', '2019-04-29 17:56:50', '14', '1002', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1116', '2', '2019-04-29 17:56:50', '2019-04-29 17:56:50', '14', '1002', '1002');
INSERT INTO `chat_room_record_tb` VALUES ('1117', 'w', '2019-04-29 18:01:39', '2019-04-29 18:01:39', '13', '1002', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1118', 'w', '2019-04-29 18:01:39', '2019-04-29 18:01:39', '13', '1002', '1002');
INSERT INTO `chat_room_record_tb` VALUES ('1119', 'rter', '2019-04-29 18:31:51', '2019-04-29 18:31:51', '6', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1120', 'rtrt', '2019-04-29 18:31:52', '2019-04-29 18:31:52', '6', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1121', 'rtr', '2019-04-29 18:31:53', '2019-04-29 18:31:53', '6', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1122', 'rtr', '2019-04-29 18:31:54', '2019-04-29 18:31:54', '6', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1123', 'rtr', '2019-04-29 18:31:55', '2019-04-29 18:31:55', '6', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1124', 'rtr', '2019-04-29 18:31:56', '2019-04-29 18:31:56', '6', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1125', 'rtr', '2019-04-29 18:31:57', '2019-04-29 18:31:57', '6', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1126', '343', '2019-04-29 18:31:58', '2019-04-29 18:31:58', '6', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1127', '546', '2019-04-29 18:31:59', '2019-04-29 18:31:59', '6', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1128', 'fgh4', '2019-04-29 18:32:01', '2019-04-29 18:32:01', '6', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1129', '45g', '2019-04-29 18:32:02', '2019-04-29 18:32:02', '6', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1130', 'h4', '2019-04-29 18:32:04', '2019-04-29 18:32:04', '6', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1131', '34', '2019-04-29 18:34:00', '2019-04-29 18:34:00', '3', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1132', '34', '2019-04-29 18:34:00', '2019-04-29 18:34:00', '3', '1000', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1133', '34', '2019-04-29 18:34:02', '2019-04-29 18:34:02', '3', '1000', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1134', '34', '2019-04-29 18:34:02', '2019-04-29 18:34:02', '3', '1000', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1135', 'sdf', '2019-04-29 18:42:41', '2019-04-29 18:42:41', '6', '1003', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1136', 'sdf', '2019-04-29 18:42:41', '2019-04-29 18:42:41', '6', '1003', '1003');
INSERT INTO `chat_room_record_tb` VALUES ('1137', '56', '2019-04-29 18:44:07', '2019-04-29 18:44:07', '14', '1003', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1138', '56', '2019-04-29 18:44:07', '2019-04-29 18:44:07', '14', '1003', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1139', '56', '2019-04-29 18:44:07', '2019-04-29 18:44:07', '14', '1003', '1002');
INSERT INTO `chat_room_record_tb` VALUES ('1140', '56', '2019-04-29 18:44:07', '2019-04-29 18:44:07', '14', '1003', '1003');
INSERT INTO `chat_room_record_tb` VALUES ('1141', 'sdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffsd', '2019-04-29 18:56:45', '2019-04-29 18:56:45', '14', '1001', '1001');
INSERT INTO `chat_room_record_tb` VALUES ('1142', 'sdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffsd', '2019-04-29 18:56:45', '2019-04-29 18:56:45', '14', '1001', '1000');
INSERT INTO `chat_room_record_tb` VALUES ('1143', 'sdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffsd', '2019-04-29 18:56:45', '2019-04-29 18:56:45', '14', '1001', '1002');
INSERT INTO `chat_room_record_tb` VALUES ('1144', 'sdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffsd', '2019-04-29 18:56:45', '2019-04-29 18:56:45', '14', '1001', '1003');

-- ----------------------------
-- Table structure for `chat_room_tb`
-- ----------------------------
DROP TABLE IF EXISTS `chat_room_tb`;
CREATE TABLE `chat_room_tb` (
  `chat_room_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '聊天房id',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型，1私聊，2普通房，3语音房，4电影房',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `url` varchar(255) DEFAULT NULL COMMENT '语音或电影url',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` int(11) DEFAULT NULL COMMENT '创建人id外键',
  PRIMARY KEY (`chat_room_id`),
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_TYPE` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='聊天房表';

-- ----------------------------
-- Records of chat_room_tb
-- ----------------------------
INSERT INTO `chat_room_tb` VALUES ('3', '1', null, null, '2019-04-25 10:34:26', '2019-04-25 10:34:26', '1000');
INSERT INTO `chat_room_tb` VALUES ('4', '1', null, null, '2019-04-25 11:53:19', '2019-04-25 11:53:19', '1000');
INSERT INTO `chat_room_tb` VALUES ('6', '3', '发个', 'http://localhost:8080/uploaderPath/img/20190428/1556421240a.mp4', '2019-04-28 11:14:02', '2019-04-28 11:14:02', '1000');
INSERT INTO `chat_room_tb` VALUES ('13', '4', '的法规', 'http://localhost:8080/uploaderPath/img/20190428/155643896303000A01005A635D2B277349C9D3F829339D00-2BF4-1D61-D0BE-75C701002705.mp4', '2019-04-28 16:09:24', '2019-04-28 16:09:24', '1000');
INSERT INTO `chat_room_tb` VALUES ('14', '4', 'sd', 'http://localhost:8080/uploaderPath/img/20190428/1556439235a.mp4', '2019-04-28 16:13:57', '2019-04-28 16:13:57', '1001');

-- ----------------------------
-- Table structure for `circle_comment_tb`
-- ----------------------------
DROP TABLE IF EXISTS `circle_comment_tb`;
CREATE TABLE `circle_comment_tb` (
  `circle_comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '朋友圈评论id',
  `content` longtext COMMENT '内容',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` int(11) DEFAULT NULL COMMENT '账户id外键',
  PRIMARY KEY (`circle_comment_id`),
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='朋友圈评论表';

-- ----------------------------
-- Records of circle_comment_tb
-- ----------------------------

-- ----------------------------
-- Table structure for `circle_tb`
-- ----------------------------
DROP TABLE IF EXISTS `circle_tb`;
CREATE TABLE `circle_tb` (
  `circle_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '朋友圈id',
  `content` longtext COMMENT '内容',
  `praise_points` int(11) DEFAULT NULL COMMENT '点赞数',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` int(11) DEFAULT NULL COMMENT '账户id外键',
  PRIMARY KEY (`circle_id`),
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8 COMMENT='朋友圈表';

-- ----------------------------
-- Records of circle_tb
-- ----------------------------
INSERT INTO `circle_tb` VALUES ('1000', '测试二套房2', '242', '2019-04-15 16:32:05', '2019-04-29 18:42:14', '1002');
INSERT INTO `circle_tb` VALUES ('1001', 'dfsgsfdg', '2', '2019-04-23 16:25:17', '2019-04-29 18:42:13', '1000');
INSERT INTO `circle_tb` VALUES ('1002', 'sdf', '2', '2019-04-23 16:28:38', '2019-04-23 17:41:41', '1000');
INSERT INTO `circle_tb` VALUES ('1003', 'sdfsd', '1', '2019-04-23 16:33:31', '2019-04-23 17:41:39', '1000');
INSERT INTO `circle_tb` VALUES ('1004', 'd23323', '1', '2019-04-23 16:34:04', '2019-04-23 17:41:40', '1002');
INSERT INTO `circle_tb` VALUES ('1005', 'gf6', '1', '2019-04-24 14:01:17', '2019-04-29 18:42:17', '1001');

-- ----------------------------
-- Table structure for `friend_apply_tb`
-- ----------------------------
DROP TABLE IF EXISTS `friend_apply_tb`;
CREATE TABLE `friend_apply_tb` (
  `friend_apply_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '好友申请id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` int(11) DEFAULT NULL COMMENT '申请人id外键',
  `friend_account_id` int(11) DEFAULT NULL COMMENT '被申请人id外键',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态，默认1申请中，2已同意，3已拒绝',
  PRIMARY KEY (`friend_apply_id`),
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_FRIENDACCOUNTID` (`friend_account_id`) USING BTREE,
  KEY `INDEX_STATUS` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='好友申请表';

-- ----------------------------
-- Records of friend_apply_tb
-- ----------------------------
INSERT INTO `friend_apply_tb` VALUES ('1', '2019-04-23 09:39:16', '2019-04-24 11:16:35', '1000', '1002', '2');
INSERT INTO `friend_apply_tb` VALUES ('5', '2019-04-24 11:28:01', '2019-04-24 13:41:01', '1001', '1000', '3');
INSERT INTO `friend_apply_tb` VALUES ('6', '2019-04-24 14:01:30', '2019-04-24 14:01:48', '1000', '1001', '2');
INSERT INTO `friend_apply_tb` VALUES ('7', '2019-04-24 18:56:16', '2019-04-25 09:35:19', '1000', '1002', '2');
INSERT INTO `friend_apply_tb` VALUES ('8', '2019-04-29 18:42:30', '2019-04-29 19:01:01', '1003', '1001', '2');
INSERT INTO `friend_apply_tb` VALUES ('9', '2019-04-29 18:42:32', '2019-04-29 18:42:32', '1003', '1002', '1');
INSERT INTO `friend_apply_tb` VALUES ('10', '2019-04-29 18:42:33', '2019-04-29 18:42:33', '1003', '1000', '1');

-- ----------------------------
-- Table structure for `friend_tb`
-- ----------------------------
DROP TABLE IF EXISTS `friend_tb`;
CREATE TABLE `friend_tb` (
  `friend_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '好友id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` int(11) DEFAULT NULL COMMENT '账户id外键',
  `friend_account_id` int(11) DEFAULT NULL COMMENT '好友id外键',
  PRIMARY KEY (`friend_id`),
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_FRIENDACCOUNTID` (`friend_account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='好友表';

-- ----------------------------
-- Records of friend_tb
-- ----------------------------
INSERT INTO `friend_tb` VALUES ('7', '2019-04-24 14:01:48', '2019-04-24 14:01:48', '1000', '1001');
INSERT INTO `friend_tb` VALUES ('8', '2019-04-24 14:01:48', '2019-04-24 14:01:48', '1001', '1000');
INSERT INTO `friend_tb` VALUES ('9', '2019-04-25 09:35:19', '2019-04-25 09:35:19', '1000', '1002');
INSERT INTO `friend_tb` VALUES ('10', '2019-04-25 09:35:19', '2019-04-25 09:35:19', '1002', '1000');
INSERT INTO `friend_tb` VALUES ('11', '2019-04-29 19:01:01', '2019-04-29 19:01:01', '1003', '1001');
INSERT INTO `friend_tb` VALUES ('12', '2019-04-29 19:01:01', '2019-04-29 19:01:01', '1001', '1003');

-- ----------------------------
-- Table structure for `notice_tb`
-- ----------------------------
DROP TABLE IF EXISTS `notice_tb`;
CREATE TABLE `notice_tb` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` longtext COMMENT '内容',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8 COMMENT='公告表';

-- ----------------------------
-- Records of notice_tb
-- ----------------------------
INSERT INTO `notice_tb` VALUES ('1000', '测试公告', 'd', '2019-04-15 16:42:41', '2019-04-15 16:42:41');
INSERT INTO `notice_tb` VALUES ('1001', '有点意思啊', '你想说什么就说什么不行', '2019-04-18 09:23:58', '2019-04-18 09:23:58');

-- ----------------------------
-- Table structure for `role_tb`
-- ----------------------------
DROP TABLE IF EXISTS `role_tb`;
CREATE TABLE `role_tb` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `duty` varchar(255) DEFAULT NULL COMMENT '角色职责',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role_tb
-- ----------------------------
INSERT INTO `role_tb` VALUES ('1000', '超级管理员', '超级管理员', '2019-04-15 15:05:43');
INSERT INTO `role_tb` VALUES ('1001', '用户', '用户', '2019-04-15 15:05:43');
