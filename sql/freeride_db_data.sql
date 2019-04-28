/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : freeride_db

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2018-12-26 19:04:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account_tb`
-- ----------------------------
DROP TABLE IF EXISTS `account_tb`;
CREATE TABLE `account_tb` (
  `account_id` bigint(20) NOT NULL COMMENT '账户id',
  `phone` varchar(255) DEFAULT NULL COMMENT '注册手机号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `icon` varchar(255) DEFAULT NULL COMMENT '图像',
  `sex` tinyint(4) DEFAULT '0' COMMENT '性别,默认为0未知，为1男性，为2女性',
  `country` varchar(255) DEFAULT NULL COMMENT '国家,默认中国',
  `realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(255) DEFAULT NULL COMMENT 'email',
  `invite_code` varchar(255) DEFAULT NULL COMMENT '邀请码',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `auth` tinyint(4) DEFAULT NULL COMMENT '认证，0没认证，1审核中，2已认证',
  `identity_cards_front_img` varchar(255) DEFAULT NULL COMMENT '身份证正面',
  `identity_cards_back_img` varchar(255) DEFAULT NULL COMMENT '身份证反面',
  `driving_license_front_img` varchar(255) DEFAULT NULL COMMENT '驾照正面',
  `driving_license_back_img` varchar(255) DEFAULT NULL COMMENT '驾照反面',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `login_date` datetime DEFAULT NULL COMMENT '登陆时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态，默认0正常，1封禁，2异常',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色id外键',
  `master_id` bigint(20) DEFAULT NULL COMMENT '上级id',
  PRIMARY KEY (`account_id`),
  KEY `INDEX_AUTH` (`auth`) USING BTREE,
  KEY `INDEX_PHONE` (`phone`) USING BTREE,
  KEY `INDEX_REALNAME` (`realname`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_LOGINDATE` (`login_date`) USING BTREE,
  KEY `INDEX_ROLEID` (`role_id`) USING BTREE,
  KEY `INDEX_STATUS` (`status`) USING BTREE,
  KEY `INDEX_MASTERID` (`master_id`) USING BTREE,
  KEY `INDEX_INVITECODE` (`invite_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户表';

-- ----------------------------
-- Records of account_tb
-- ----------------------------
INSERT INTO `account_tb` VALUES ('1000', '1000', '11874bb6149dd45428da628c9766b252', '聂跃', null, '0', null, '聂跃', '1000@qq.com', 'mc8N3itZ', null, '0', null, null, null, null, '2018-12-15 18:38:52', '2018-12-21 08:57:21', '0', '1000', null);
INSERT INTO `account_tb` VALUES ('1074188987531218945', '1001', '11874bb6149dd45428da628c9766b252', null, null, '0', null, 'nsidf', null, null, null, '0', null, null, null, null, '2018-12-16 14:26:27', '2018-12-19 14:48:30', '0', '1001', null);
INSERT INTO `account_tb` VALUES ('1074189088903352322', '15111336586', '11874bb6149dd45428da628c9766b252', null, null, '0', null, 'sdf', null, 'moI1c2LC', null, '0', null, null, null, null, '2018-12-16 14:26:51', '2018-12-16 14:26:51', '0', '1002', null);
INSERT INTO `account_tb` VALUES ('1074190170920538113', '15111336585', '11874bb6149dd45428da628c9766b252', null, null, '0', null, 'dsf', null, 'x9fb5q2t', null, '0', null, null, null, null, '2018-12-16 14:31:09', '2018-12-16 14:31:09', '0', '1003', null);
INSERT INTO `account_tb` VALUES ('1074619818151714817', '15111336587', '2f1bfc22ff4d2647a11c9ba17ff1b00c', null, null, '0', null, 'sdf', null, '88888888', 'sdgfsdga过段时间', '2', 'http://localhost:8080/uploaderPath/img/20181218/1545123174596.png', 'http://localhost:8080/uploaderPath/img/20181218/1545123176320.png', 'http://localhost:8080/uploaderPath/img/20181218/1545123180246.png', 'http://localhost:8080/uploaderPath/img/20181218/1545123183758.png', '2018-12-17 18:58:25', '2018-12-26 13:41:23', '0', '1002', '1000');

-- ----------------------------
-- Table structure for `activation_code_tb`
-- ----------------------------
DROP TABLE IF EXISTS `activation_code_tb`;
CREATE TABLE `activation_code_tb` (
  `activation_code_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '激活码id',
  `code` varchar(255) DEFAULT NULL COMMENT '激活码',
  `is_usered` tinyint(4) DEFAULT NULL COMMENT '是否使用，1未使用，2已使用',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` bigint(20) DEFAULT NULL COMMENT '账户id外键',
  PRIMARY KEY (`activation_code_id`),
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_ISUSERED` (`is_usered`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1075289600203096067 DEFAULT CHARSET=utf8 COMMENT='激活码表';

-- ----------------------------
-- Records of activation_code_tb
-- ----------------------------
INSERT INTO `activation_code_tb` VALUES ('1074206182638309377', '61X1BQRs', '2', '2018-12-16 15:34:46', '2018-12-18 16:51:54', '1074619818151714817');
INSERT INTO `activation_code_tb` VALUES ('1074207085801984002', 'GXd7YoOg', '1', '2018-12-16 15:38:22', '2018-12-16 15:38:22', null);
INSERT INTO `activation_code_tb` VALUES ('1074209116885315585', 'bYX3dWt4', '1', '2018-12-16 15:46:26', '2018-12-16 15:46:26', null);
INSERT INTO `activation_code_tb` VALUES ('1074209805032218626', 'cFXyYV1X', '1', '2018-12-16 15:49:10', '2018-12-16 15:49:10', null);
INSERT INTO `activation_code_tb` VALUES ('1074209805317431298', 'DOuU5i0w', '1', '2018-12-16 15:49:10', '2018-12-16 15:49:10', null);
INSERT INTO `activation_code_tb` VALUES ('1074209805371957250', 'JcsKBK6r', '1', '2018-12-16 15:49:10', '2018-12-16 15:49:10', null);
INSERT INTO `activation_code_tb` VALUES ('1074209845935071233', 'wU54XPHX', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846010568705', '64L29eFY', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846052511746', 'wmg4zspv', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846086066177', 'a7x8Zpba', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846148980738', 'zgPbRcBK', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846195118081', 'y7RrNcSa', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846228672514', 'h8Ye6Wl5', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846270615554', 'PtCW8VaK', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846320947202', '52eyIUCg', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846346113025', 'lZTbdVT7', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846392250369', 'LKnrojBE', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846417416193', 'PJmz3IXT', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846467747841', '8sfUGQVB', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846518079489', 'INVmfmxc', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846555828226', '6dO1VgPS', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846601965569', '6hA4OUWu', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846656491521', 'AR1GddkS', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846681657345', 'YzFBXR8a', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846727794690', '91kMB1gA', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846757154817', 'cZI5cUef', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846778126337', 'ISZMC9vP', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846832652289', 'LQn4hWV3', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846857818114', 'QYr3EU3r', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846878789634', 'o20thxV8', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846929121282', 'bUNeDzZY', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209846954287106', '03fq9iL2', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847008813057', 'ARwUZvzV', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847054950401', 'C6A07aDc', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847075921922', 'yQhv5TTB', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847126253570', '4ZSrgfod', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847147225089', 'gzumtz0p', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847168196609', 'PN72xVH0', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847218528257', 'BedxTPnF', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847268859906', '9RkOFUn0', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847289831425', '5g1k9RaC', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847340163073', 'CUy9ftQU', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847390494721', 'N1ge1GY6', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847432437762', 'mPWX8ycP', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847474380802', '0WHTO6Za', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847499546625', '5QC5awL2', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847541489665', 'kdh2c0Zw', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847562461186', 'b1exTdfZ', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847591821314', 'KdEzEu7i', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847637958657', 'UxFUB6aw', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847658930177', '9YcAmrnH', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847684096001', 'UfYOcgVU', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847730233346', 'SBX0bs8T', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847767982081', 'UeB9an91', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847801536514', 'kCnQDtH1', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847851868161', 'ye0Q84sw', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847868645378', 'B99ukmc7', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847893811202', 'hxvuECnh', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847944142849', 'j0sCFU8G', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847973502977', 'I51Vlx9w', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209847994474498', 'CwK0W68S', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848044806145', 'hK4UiXZq', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848065777665', 'kdYKbxhO', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848111915009', 'PyE2Nl0Z', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848141275137', '0aeJedGc', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848166440962', 'IV5t2Iv0', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848208384001', 'ZGzSPY2m', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848237744130', '4V13yuRb', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848258715649', '3GHRikQe', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848309047298', 'z97Sw5vw', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848355184642', '27XmMcu1', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848405516290', 's8RdhIPA', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848451653634', 'LqddzVDY', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848476819457', 'YqTnKHT6', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848497790978', 'ojaLOghE', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848543928321', 'z4EIXGdK', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848590065665', 'YSO9FC1C', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848632008706', 'T0laB27F', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848682340354', '6v45aLfk', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848728477697', 'rl4Wb9oE', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848757837825', 'Kh06cO45', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848783003649', 'EwSdUyOC', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848829140993', 'eCx4IHei', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848854306817', 'YPCfaAj9', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848875278337', 'eIH0aPnN', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848925609985', 'cSX66d2c', '1', '2018-12-16 15:49:20', '2018-12-16 15:49:20', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848959164417', 'eKAGQAFY', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209848980135938', 'GUHZgvSk', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209849034661889', 'O85p9CWX', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209849064022018', 'umAzVB9K', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209849080799233', 'cS6goFRA', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209849135325185', 'b6DK3EyL', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209849160491010', 'zh2E7Eah', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209849194045442', 'fRUzWmzz', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209849261154306', '7DfXyLN0', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209849307291650', 'BDEtBfe7', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209849324068866', 'wMb5b81j', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209849378594818', 'VGOh7EJT', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209849428926465', 'tJdaym5g', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209849449897985', '3bl0f4fV', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209849496035329', 'vcY2fIiH', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209849542172674', 'n8zUZuB5', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209849563144193', 'SHLV3Z3d', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209849613475842', 'hVc4WTgO', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209849659613185', 'aiq4aF81', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209849688973314', 'l8vEB2xh', '1', '2018-12-16 15:49:21', '2018-12-16 15:49:21', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890004623362', '55Nkf7WO', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890046566402', '1guEtsgY', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890101092353', 'zGvlVRyN', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890130452481', 'LgLqhde4', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890180784130', 'MQ8XfkVY', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890239504385', '3TQyMw0c', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890268864513', 'Jxf1LLwB', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890302418946', 'dZjZKjM4', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890348556289', 'Xbfc5ay2', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890373722113', 'NWfcSR2R', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890419859458', 'extf41X9', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890465996802', 'd9tzxSrA', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890495356929', '5Y9o3OYw', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890520522754', 'O22fu2bW', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890566660097', '793ypSOM', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890587631618', 'RXVVKjMA', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890633768962', '6iSTgeow', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890696683522', 'FRA32OYW', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890721849345', '10d5yVoU', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890767986689', 'v4Jiepw9', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890818318338', 'xqibMYEF', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890843484161', 'YrA9dm5D', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890893815809', 's7Nrhttb', '1', '2018-12-16 15:49:30', '2018-12-16 15:49:30', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890948341761', '6AT3Ckdg', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209890973507586', 'UrJjXN0r', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891032227841', 'J6cclWlS', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891078365185', 'AwkvB3vj', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891099336706', '8Qv7Y76y', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891145474049', '1awfZtAf', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891195805697', 'gMQDFlBO', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891241943042', 'WcP0SZma', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891288080386', 'M7z20lC7', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891313246210', 'f6FegDc7', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891355189250', 'UwKzua2B', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891401326594', '542W9oFf', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891426492417', '1tu9Tzom', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891468435457', 'cVAv7egY', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891514572801', 'CFE1SWGo', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891560710146', 'bIJ4R8Df', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891585875969', 'DLRRcOQo', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891627819010', 'X7r4Indr', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891678150657', 'ym8xBNfI', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891694927873', 'FGXEGxi4', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891745259522', '5V8z3n1T', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891795591170', 'KZ0CK4Ha', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891816562690', 'e8U2zrUb', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891862700033', 'CS3hgXph', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891913031681', 'W1dKd3BR', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891938197506', '1IpVMlyz', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209891988529154', '19f8byjU', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892034666498', 'EGbQhU1Z', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892059832321', 'hhzoPOQw', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892105969665', 'jYjnvCdG', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892156301314', 'L6cb9BZz', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892202438657', 'qzCHfOxv', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892248576001', 'cvMUx3ul', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892269547521', 'Jja9lR62', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892311490561', 'N9fxdAcL', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892340850690', '1Mves1tX', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892403765250', 'Lr1qYa9f', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892449902594', 'RGb14fAQ', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892496039938', 'GZ39gcUU', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892542177281', 'bySTgHAV', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892588314626', 'TRV1zZbu', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892605091841', 'lOLPOclG', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892651229185', 'K8ioBEVt', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892705755138', '4mnX5lUh', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892730920961', 'R440VVeS', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892772864001', '1U5XzGMs', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892798029826', 'dGwouh4T', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892844167170', 'qAfxl7Fy', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892865138690', '40ghuBg7', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892911276033', 'sQAcaX8u', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892936441857', 'm6LwfJ62', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209892957413377', 'y30NkvxZ', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893007745026', 'a9PN0ywu', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893028716546', '71Uf0dVg', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893049688065', 'SOlV1wPm', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893100019714', 'OuGgCevc', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893120991234', 'LB5w7P1E', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893146157057', 'orvrHCjm', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893192294402', '4A46ZyOJ', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893217460225', 'ZhgdI6Vb', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893263597569', 'VRfTa3xL', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893305540609', 'u8wXvLQw', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893334900738', 'DteTsQUs', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893381038081', '74XXuxAY', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893406203905', 'mKrciOh4', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893431369730', '6081Ikdc', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893477507074', 'fdAg417b', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893519450114', 'xgEmK070', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893557198849', '8CLlXVLl', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893607530498', '3Yg1XiO4', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893708193793', 'embXa4Iv', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893733359618', 'AS1dzQFH', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893817245698', 'jQUWEW40', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893834022913', 'V2Y97SHm', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893947269121', 'Me9IaxQ4', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209893972434945', 'UJhRGvqE', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894010183682', 'CcWjktxx', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894056321025', 'ILw5jDva', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894102458369', '8Dl78ZjU', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894156984322', '4GvyTyGa', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894182150146', 'xjUqjAYd', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894224093186', '4ZYXNwGM', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894249259009', 'wQ1Natc0', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894266036225', 'mRZ5xo5G', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894320562177', '2ChZAiYZ', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894362505218', '27InSu5F', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894387671041', 'GCHc1JOt', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894433808386', 'Ky6ovJf2', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894458974209', 'subucXUc', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894500917250', 'C2szI26c', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894542860289', '04FUcNu6', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894568026113', 'JGub0ARb', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894593191937', 'QZB5q7PK', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894635134978', 'me41ZzkR', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894689660930', 'HYYVh6Gr', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894710632450', 'Whf2dZpF', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894760964097', 'dXFefhBT', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894786129922', '8CDsyct9', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894807101441', '3R30ONVD', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894857433089', 'ze2kay10', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894899376130', 'EOfI8ke6', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894924541953', 'GQeZ7RKj', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894970679297', 'XA4H4uff', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209894995845122', '4l4YafRd', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895033593858', '9dS2jgSi', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895079731202', 'jQPfzlXf', '1', '2018-12-16 15:49:31', '2018-12-16 15:49:31', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895104897026', 'XKCR6hSj', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895151034370', 'MzEdbd5C', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895192977410', 'WVQ4WXge', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895218143233', 'HAMBCrbE', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895260086274', 'bmsHLb1C', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895314612225', 'ZduOdVg7', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895335583745', 'Mx6XAWnu', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895377526785', '8J3tupPp', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895402692609', 'jV8AG2uP', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895440441345', 'bs53i7hc', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895486578690', '9NSAaHhS', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895515938818', 'gw4Xbwi5', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895562076162', 'dZL9bj7i', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895608213505', 'AfXp8Sgu', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895650156546', '27X8tBZ2', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895696293890', 'tROO0xRt', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895750819841', '8bf7BJye', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895792762882', 'FABb6vwR', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895843094530', '9U2LbDn2', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895910203393', 'nzRWL111', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209895981506561', '2RZO4Uwi', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896006672386', 'CxKZEGoh', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896044421122', 'tuh9XNK2', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896090558466', 'cc4Rib2q', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896140890113', 'cGFWeLeX', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896182833153', 'vdL44pv9', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896212193282', '8grXDH9m', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896249942018', 'W1CkUeKU', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896317050882', 'zz0qOx5v', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896375771138', '9ACgS2z7', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896434491394', 'ZSKcbNQ1', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896501600257', 'yzxxO0zK', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896539348993', '0TLu7gZ5', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896598069250', 'UdzLVLov', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896665178114', '4M65uFCN', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896723898370', 'oeac0aII', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896778424322', 'ZgGjr15x', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896828755970', 'ugm6Cftm', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896874893314', '95XEmSY6', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896895864833', 'Wr259QLP', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896942002178', 'rGb8hxz6', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209896988139521', 'j2m89LUi', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897004916738', '9cXE7DKg', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897055248386', 'pJX98kc0', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897097191426', 'Jyt4DUZm', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897122357250', 'tZJx0I9Y', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897164300290', 'Pop6WFXN', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897206243329', 'NBAxHhE0', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897231409153', 'nDz0PbWc', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897273352193', '99hHHHLa', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897319489537', 'cgQGD37D', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897348849666', 'SZN32ZbO', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897428541441', 'J4O1Oy7c', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897483067393', 'UypPXkhr', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897508233217', '9y7QVZyV', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897558564865', 'nS875eM4', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897575342082', 'gpYY16yr', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897600507906', '665eedHM', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897680199681', '13o7gQQg', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897701171201', 'WbNc3xQg', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897751502850', 'VSXVa7el', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897776668674', 'OCx5TsRG', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897822806018', 'BZ2bGBoi', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897868943361', 'K77dgSho', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897889914882', 'eYIu576D', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897931857922', 'kfZmZU8b', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209897973800961', 'ggHrXaBt', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898007355393', 'Ny1yIbwQ', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898049298433', 'kRbbU7hP', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898091241473', '4eYsDNFR', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898120601601', 'imaVnZUe', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898162544641', '2G0wDA5d', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898204487681', '1ps8zRop', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898229653505', 'ZWzyRvc6', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898275790850', 'swLKE7mC', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898317733889', '71CZdtNd', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898359676930', '79vcy5Sh', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898389037057', 'muLPFrXP', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898435174401', 'oJNuyC85', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898493894658', 'y8Zw7uXy', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898514866177', 'bWU5DT9V', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898569392130', '6miba9e2', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898611335169', 'ppXCYqum', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898644889602', 'zsJyxL56', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898691026945', 'ns2Eo1i9', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898716192770', 'uXgTvaYA', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898745552897', 'NVSn1beP', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898791690241', 'knSOWSjs', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898812661762', 'QEu6kjLs', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898829438978', 'v6Mqwq0k', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898875576322', 'dltfP2oP', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209898955268097', 'J3VizXcw', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899001405442', 'tEGT6w7b', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899022376962', 'rY4z7bv6', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899039154178', 'OgV4Og99', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899089485825', '9uczy31I', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899135623170', 'c8rNWL33', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899156594689', 'MqqcIGQj', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899202732034', 'Z5hpqY2Q', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899232092161', 'dA7ngzAK', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899261452289', 'si3dGvac', '1', '2018-12-16 15:49:32', '2018-12-16 15:49:32', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899311783937', 'S5oMBhlb', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899362115586', 'hGZ49AIs', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899378892802', 'pYOJhLGI', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899425030145', 'ZtkXAtUC', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899466973185', 'dp22j1hJ', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899496333314', 'Rzzv2UUU', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899513110529', 'vb0dzkZC', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899563442178', 'e1u19X5j', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899643133953', 'fKT5z3yP', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899685076993', 'lRYO5q6u', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899722825729', 'kY0ar00T', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899768963074', 'uvS8bAvn', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899789934593', 'iKyYb1bd', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899857043457', '6KSn8sC4', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899924152322', 'P29aohxO', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209899974483969', 'JBIjXFhd', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900024815618', 'k2UB53u5', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900070952962', 'dXbR9Awm', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900096118785', 'yCvuLOHV', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900146450434', '87Hm4fch', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900167421953', 'O5WNVjJ4', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900209364993', '3i63Ajhd', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900259696642', 'zhV0BYCl', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900305833985', 'Ir7Wf3j5', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900322611201', 'ynmHU87q', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900372942849', 'jZ3TUJxc', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900389720065', 'A9bZ1g5s', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900414885890', 'QB34DUFT', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900461023233', 'pEsdXHZE', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900481994754', '8YC1Vk55', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900498771969', 'y58Ci2y4', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900544909313', 'uFTdgyYY', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900570075138', 'bKNYA6ic', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900591046658', 'XB1F3SPA', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900628795394', 'Oemay9Ue', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900683321346', '8UFsCIU6', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900729458690', 'XTgXCQnV', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900771401729', '8ZDye9C6', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900821733378', 'dxWTx51E', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900842704898', 'rK9mHCVR', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900859482114', '5zZJuJvv', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900939173890', 'cAN6YY4R', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900972728321', 'atLBhISb', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209900989505537', 'Ap3WXyTN', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901035642882', 'V95r69SD', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901060808706', 'ahYoFehm', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901098557442', 'jbxndhd8', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901148889089', 'jlIyZQ7d', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901169860609', '1R0XfLXI', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901211803650', '94iYuxnt', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901262135297', 'Ru9SDW6d', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901287301121', 'R3e9W0oe', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901325049857', 'Rd2EnW2v', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901371187201', 'RG5HWSCJ', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901421518849', 'uk7wxAio', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901497016322', 'h1rirh7c', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901522182146', '4FucnvYY', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901564125186', 'c098SAsR', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901614456833', 'xGf4upU5', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901660594177', 'ZsBTb0w5', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901702537217', 'iMEO4yd6', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901752868866', 'FZeNo1jv', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901769646081', 'vz7xiGva', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901819977729', 'b7OVihB0', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901882892289', 'gPVvZrCv', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901903863810', 'AxtXwfEK', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901954195458', 'LZ0iYd0i', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209901991944193', 'HbUYH5K7', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902042275842', '0YYQNExt', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902088413186', '5e9UJhxj', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902134550529', 'H2dI4QOg', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902155522050', 'bDWuySD7', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902197465090', 'Asv3z4zb', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902222630913', 'WKmEFgBo', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902264573953', '7fG0l2Gr', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902314905602', 'TyVylsb5', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902335877122', '4X9zrxBH', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902356848641', '1zxWZ10t', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902402985986', 'I334vQPh', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902436540418', 'g9zT5NQA', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902457511937', 'WjrdBJ9R', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902507843586', 'vuSPsjg0', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902545592321', 'bDaAZd6d', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902600118273', 'TFWB0B7L', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902646255618', '2Z6T7IXs', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902696587265', '5fYQLUYc', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902725947394', 'tYvH6R66', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902746918914', 'hJQORFtM', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902788861954', 'SygtW0dU', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902834999298', '75I9wXZd', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902851776513', '2wJnkCb7', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902902108161', 'L7U6rnZ4', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902960828418', 'ByMYChyd', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209902981799937', 'B4STXsIO', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903027937281', 'aHRWlTTV', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903074074626', 'cXUR45Rz', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903116017665', 'guXsWKYK', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903162155010', 'ubZATaU7', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903178932226', 'CvanxNdD', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903225069570', 'STvdTw4Q', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903271206913', 'VXYaYhyU', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903296372737', 'NycNyzMO', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903355092993', '5dZ4uszC', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903376064514', '2WGWEeKk', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903401230337', 'DAEoQTKL', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903476727809', 'zbqyUwjQ', '1', '2018-12-16 15:49:33', '2018-12-16 15:49:33', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903497699330', 'laA6WV8c', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903543836673', 'QDOQxGrg', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903589974018', 'sVE8ZGdy', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903610945537', 'z7LOJiiU', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903631917057', '8ROOpbnt', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903673860097', 'agiO7cT5', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903728386050', 'k9q1bTJC', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903749357570', 'b4Rb0htZ', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903799689218', 'rjnNE2a8', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903837437953', 'cxN1aXaT', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903858409473', 'BjHEWUqx', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903904546817', '2F7h9OB8', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903946489858', 'ehx9uuY0', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209903975849986', 'DndHouFz', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904013598722', 'RGfXgfeM', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904059736065', 'NRKX0YLK', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904084901890', 'qiO309Yq', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904122650625', 'tUK4DZpy', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904172982274', 'TWAz32az', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904193953793', '4aSZDtQ5', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904235896833', '6BRRl8rS', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904282034177', 'Pg4Xmw2G', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904298811393', 'iLHW0CwI', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904323977217', 'ft7Z5egm', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904370114562', 'S56PDPtB', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904391086081', '2v5uV54d', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904407863297', 'WjaX9e5O', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904454000642', 'SSV7Ws3i', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904500137985', 'L73NwB1h', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904542081025', '4IFR2nZc', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904584024066', 'szuma6dY', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904655327233', 'jA1WNEdi', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904701464577', '0bFRa0zM', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904722436098', 'B0YOEjB2', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904768573441', 'zghSYbKA', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904810516481', 'XtWo3o7R', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904860848130', '67ICfHy5', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904902791170', 'jOcphSXk', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209904923762690', 'enZnBvDB', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905011843073', 'WCa24ktv', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905032814593', 'wSgkeJEk', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905053786113', 'zPgnKeIc', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905125089282', '4X13GRBa', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905171226625', 'IgZ10IaO', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905188003841', 'WElka0Er', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905234141186', 'B70liNm1', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905271889922', '2Tp70l0I', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905318027265', '5QBm9NG7', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905338998785', 'MpVTPNlV', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905410301954', 'QXEXoacK', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905456439298', 'UhPZCfd1', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905481605122', 'aRds0aUI', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905506770946', 'MXBWqwU2', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905548713985', 'uAkN1Sai', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905573879810', 'yb0TV0Nj', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905607434241', 'haBFBeTW', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905645182978', '2qacfHBB', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905666154498', 'at1WnWE7', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905708097538', 'h2RY33ew', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905783595010', 'rdIWy4v6', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905825538049', 'Fphvs30X', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905854898178', 'WZ7uVe5e', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905901035521', 'WQIaWTrP', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905947172866', 'HjBzM9m9', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209905963950081', '7ayx2R8J', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906010087426', 'K1xIKrSN', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906060419074', 'gmsY05x6', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906077196289', 'iUne9adI', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906119139329', 'g69ueY5B', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906165276674', 'GZ2Pc0n2', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906182053889', 'y84tlW5T', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906228191234', 'aPAoYCX9', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906282717186', 'jxn5ABzY', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906320465921', 'aNYw6mTZ', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906383380481', '61f1dCbF', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906433712129', 'CyY7Dhjc', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906479849473', 'F8e00qc6', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906538569730', '3QBc0sOJ', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906584707074', '2IVaMLLu', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906643427329', 'CudotUyA', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906689564674', 'iSYK6Z65', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906735702017', 'OTC7VAr8', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906777645057', 'x9NV4pRC', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906798616577', 'aYUHDhVv', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906848948225', 'VvgGczzq', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906899279874', 'OKVaX0DD', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906937028610', 'TDt000k0', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209906987360257', 'Ag64eJGb', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907012526081', 'ZpDy9MBU', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907050274817', 'Yjv17Sgp', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907121577985', '5O9z34u5', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907146743810', 'UpYvbaMf', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907163521026', 'uDvWs4KM', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907213852673', 'Xd6RdRO3', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907234824193', 'pXG2aAe8', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907272572930', 'W3CWnFQM', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907318710274', 'hXjwgv7c', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907373236225', 'jQ9VQtPn', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907394207746', 'ShKVxXQj', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907440345089', 'iBAQqTux', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907482288129', 'dSZ1w4ZT', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907507453953', 'mbmiR1j2', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907553591298', 'UDWf5W4W', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907574562818', '24nxNvmQ', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907591340033', '9JPuHpsz', '1', '2018-12-16 15:49:34', '2018-12-16 15:49:34', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907675226114', 'cyLLAYcv', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907696197634', 'bgzTqBnt', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907738140673', '29q1nAZP', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907851386882', 'YtwLfvx5', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907901718530', 'h30bq8Lo', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907947855873', 'B0D0gUBI', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209907964633090', 'Q49SrWDZ', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908027547649', 'h8d76R9q', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908086267905', 'tw3RIHuv', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908107239426', 'rqG1Zv7K', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908153376769', 'rHWWVpiu', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908241457154', 'WXGXCg4Z', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908279205890', 'zdqC4Bzq', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908329537538', 'aETu5i47', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908371480578', 'Ukkl6egG', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908405035009', 'BoF6P97z', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908451172354', 'ImUffbWf', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908501504002', 'vc5YAqcd', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908564418561', 'eqqgyasS', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908614750210', 'IhNuSeiK', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908635721730', 'LWHpaJwq', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908686053377', 'AZ0IRDux', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908732190721', 'reSdcXlD', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908748967937', 'D0bOr8Hh', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908795105282', '8FfpQLdw', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908816076802', '0FSFEX1Y', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908862214145', 'D1iern1T', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209908954488834', 'eJzaTHRh', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909000626177', '7OJODL1f', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909025792001', '4IQXPFYQ', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909084512257', '68LL8bkj', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909139038210', 'oss2fMwj', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909147426817', 'Vuc1QN11', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909197758465', '4h3aFVbw', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909248090114', 'l2ORlrce', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909269061634', '6h0CS8hn', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909327781890', 'Pz2TxsGY', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909344559106', 'P7Zfz4cO', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909369724930', 'VAG5pPvg', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909461999617', 'BA1bjoST', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909478776833', '5eJV1Klb', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909529108481', 'KBguUUzM', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909566857218', 'gSc7Qc4X', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909642354690', 'UmDu5x2Z', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909684297729', 'rRs3fA2V', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909709463553', 'XcrPUzz9', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909730435074', 'Vt5Q4ZQa', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909772378114', 'jYT2dWaA', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909784961025', '6VnWdPGv', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909835292673', 'SSz4eL9k', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909860458497', 'Pq45acAs', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909902401537', 'XV7KaXTs', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909944344577', 'MK2gcd5D', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209909990481921', 'lIDOGgVT', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910011453441', 'DJ22XgnR', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910045007874', 'g8mKnu8v', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910095339521', '7O6YAeCp', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910120505345', 'RChb05Am', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910133088257', 'wTDXfnnE', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910179225601', 'PX581WAA', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910204391425', 'jNzcHxXG', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910225362945', 'QazvWhAY', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910271500289', 'gplmecTW', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910296666114', 'TQfT0KwS', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910326026241', '8NAsdrVS', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910372163586', 'RxOTVR7N', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910422495233', 'AUZ2dZ5m', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910460243969', 'EPmLD9z6', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910510575618', 'vdC6t0iZ', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910531547138', 'F6dADVQm', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910573490178', 'TB4y7E4U', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910644793345', '19kdZaeZ', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910661570562', 'd2dH4EZ8', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910707707905', 'f1gu56vN', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910787399681', 'yBs21JBd', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910833537025', 'v6v60pN4', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910879674369', '4HS2e313', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910896451585', 'bbgQrYqv', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209910967754753', 'BzRXU6bi', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911018086402', 'AyQXgfmg', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911034863618', 'Vpq1t9mC', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911081000961', 'oQk40KwY', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911131332610', '7PcZAdE3', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911177469954', '9oa33Mnq', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911194247169', '1BVes8Ya', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911244578817', 'xbuAqR7z', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911265550337', 'zCLrSFiH', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911307493377', '1g2MhJzO', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911353630721', 'BTNvNXDP', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911378796545', 'N3qwrLPw', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911424933889', 'YpMbC7FP', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911466876930', 'S1tWuDll', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911542374401', 'grgsbBa6', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911609483265', 'VbPVSby6', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911693369346', 'PdIDEtTz', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911731118082', '1Xez5IME', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911777255425', 'PH9Q94NK', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911827587073', 'wLHGAnRw', '1', '2018-12-16 15:49:35', '2018-12-16 15:49:35', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911873724417', 'gzMSglwt', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911919861762', '8iFbE7jz', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209911940833282', 'q50It1Pi', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912020525057', 'xORh3U5k', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912075051010', 's1GOyWA7', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912096022529', '38Kdgu3x', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912137965569', 'ZvaXUMwy', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912205074434', 'sAK7ja4i', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912230240257', 'ldE0ytBA', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912255406082', '34kKCEzF', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912305737729', 'bvS3QZWM', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912326709250', '75ObiyU0', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912347680770', 'jE10ChMl', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912385429506', '7KydgCYh', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912410595330', 'WTWky51N', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912452538370', 'hge9AAsG', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912528035841', '37RTz8sA', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912582561793', 'elGygt91', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912624504833', 'yd6ufuEL', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912641282050', '5jw5GgTd', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912687419394', 'zw4eT1h6', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912737751041', 'TC4qaaQM', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912779694081', '7eN5sYA3', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912821637122', 'bhEwGa1d', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912850997250', 'E6x2Skcz', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912888745985', 'ajNpSV6h', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912939077633', 'bc41ba3D', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209912985214977', 'wwBrYShm', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913027158018', '5m4udNXS', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913069101058', 'V4czfYVB', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913115238402', '44mTHkcI', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913140404225', 'YniaB3Vc', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913186541569', '3UvedJyn', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913207513090', 'OUcgEssR', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913249456130', 'TewCNtMS', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913291399170', 'dPYBbsdV', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913312370689', 'Na60S01o', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913345925122', '9dlozIIV', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913387868161', 'XMIQRFuX', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913404645378', '2f9OhNZi', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913467559937', 'teeQcB4d', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913505308673', '42b2a8Oe', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913526280194', 'V4MOwDzO', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913547251713', '4ybyNyaj', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913593389057', '6hB3L277', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913631137794', 'k1fLA8cw', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913652109313', 'FYRH0xPs', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913702440962', '0H5p2Ak2', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913719218177', 'rr8xPSj5', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913744384001', 'G75pX0xI', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913819881473', 'fuiIj947', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913866018818', 'GdcXeeXA', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913895378946', '5kcjxpy3', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913941516290', 'I6TS4isd', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209913983459329', 'k0AtSIqW', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914033790977', 'P29NSNwG', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914079928322', 'LPrSV3fp', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914126065665', 'duMf8Fhl', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914163814401', '7imE52BD', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914214146049', 'zfbX2qRp', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914264477698', 'ESg5E3Dq', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914281254914', 'LCQObZce', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914327392257', 'zZ3yaocI', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914377723906', 'Os3ZYU4U', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914419666945', '8EzBL5rb', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914469998593', '6YPweLRt', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914516135938', 'Cpa0jtYx', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914528718850', 'kpLj0vT6', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914579050497', 'oUU59EM7', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914625187841', '2gUq5eG0', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914662936578', 'BCyzZatx', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914688102402', 'mQMTtkZf', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914734239745', 'DP59BC0t', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914755211266', 'Tcj8mmz3', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914776182785', '4ZduWY7G', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914826514434', '7j2CaAu4', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914876846082', 'WZH7vb0o', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914897817602', '6Yl2Ddia', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914943954945', '3f3b8aM3', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209914969120770', 'R5ap6FTD', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915015258114', 'Z0AWZor7', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915053006849', 'M1QQKkd5', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915082366977', 'RhO2AXxA', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915120115714', 'Oa7V5San', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915141087233', 'D4rdUq3l', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915162058754', 'WciWIXNV', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915204001794', '8RqBqb6Z', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915224973314', '4rO0sct5', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915250139137', 'TTxd3UYb', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915304665090', 'eqLYIBuD', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915350802433', 'CD5KfI5l', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915367579650', 'mvKHs6xj', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915413716994', 'doCXZwde', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915476631553', 'sydeLT2B', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915497603074', 'zYY88Y0g', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915543740417', 'F3GZ5a8L', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915585683457', 'OUW1p7J2', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915644403713', 'iBdzaYxt', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915656986626', 'eKWxKtIa', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915703123969', 'pvZRjw7y', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915749261313', 'FofKMqin', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915791204354', '7KYK7HF4', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915841536001', 'ySbbf96W', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915883479042', 'ArYaY4M1', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915929616385', 'ZGk20DLf', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209915996725249', 'USRuZVPb', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916013502466', 'EgOwamXj', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916034473985', 'DeU0453R', '1', '2018-12-16 15:49:36', '2018-12-16 15:49:36', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916080611330', 'mWtLzreV', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916130942977', 'A21Aer50', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916172886017', 'Qd2Ahfgh', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916214829057', 'MUEwVAWY', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916239994881', 'T4Aozwkd', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916290326529', '6UbiNcs7', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916374212609', 'KNy5AUNT', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916395184130', 'chfZxiUa', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916437127170', 'd6RLNzMw', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916487458818', 'cdqui5va', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916529401857', 'nGSbkv8b', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916579733506', 'Ar1OeIzT', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916625870850', 'g41oXeEo', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916672008194', '9MmU7c0u', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916713951234', '9wC59hTo', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916764282882', 'YDYuytj4', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916802031618', 'eNGOqadP', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916848168962', 'Qv5yAW1F', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916869140481', 'MdC676MA', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916911083521', 'b06t97eD', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209916999163906', 'yAuYSV3J', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917041106946', 'jYAzd757', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917112410113', 'TXNacZpy', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917133381634', 'aXXq93wL', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917179518978', '5IIVSqPV', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917221462018', 'vD80W9B8', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917238239234', 'SDDoa9dY', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917284376577', 'ICnyfBOH', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917334708226', '0GGTCz09', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917385039874', '4AqWb9Nh', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917401817090', 'ubx1jkPI', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917443760129', 'MBWS43hm', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917489897474', 'QO4WTYO8', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917515063298', 'Y69s1f8L', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917552812034', 'ZJX27oHB', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917598949377', '2WQU3LWF', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917615726594', 'TTdxx4Kc', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917666058242', 'bQNKVTUM', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917708001281', 'GZg6FQbt', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917724778497', 'Vij8DX9b', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917770915841', 'Qs4w8ZWe', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917817053186', 'StRXeB3H', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917863190529', '6ZVE9Enu', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917900939266', '3k5NALfX', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209917951270914', 'o4xW2XMq', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918001602562', 'Ha5OXDfA', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918077100034', 'zN5dffvY', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918127431682', '94gcGa7c', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918181957633', 'VJDZdq4I', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918232289281', 'bVeyyAWb', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918299398145', 'WGsCl2nq', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918383284225', 'ylvTaZux', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918404255746', 'AZqZ5urj', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918446198786', 'RsdOSb73', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918492336129', 'xVV1GMku', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918530084866', 'ecw25duF', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918555250690', 'aOIX6dxR', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918597193730', 'RfbCiiSu', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918622359554', 'c1tTNqP0', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918651719681', 'Tciwm6We', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918697857025', 'Wksu0rNn', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918714634242', 'A5jFv4ON', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918764965890', 'X5gvHOWT', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918823686145', 'EUdVV1be', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918857240577', 'u9QwlC0A', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918924349441', 'ZuoLsYhK', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209918999846913', 'PI5PazCg', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919037595649', 'l3K199n6', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919066955778', 'qir3VZ2l', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919108898818', 'L25o9CYa', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919150841857', 'KBX0RhTW', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919176007681', 'dOlXZ5f4', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919217950722', 'LZYxIz3h', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919268282369', 'VcPZAV3H', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919310225410', '0j4c8k0h', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919360557057', 'AzF0E2qY', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919402500098', '2OH0PAis', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919444443138', 'Ua0M91Vm', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919490580481', 'PRaceyD3', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919540912130', 'EOaa9X2X', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919557689346', 'p23cGP31', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919691907073', 'CafUerQO', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919746433026', 'JsnN3enn', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919784181762', 'ju5P43oD', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919834513409', 'U93fBwmn', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919884845057', 'kz9zR72c', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919918399489', 'QiVDekPR', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209919968731138', '119zLXAq', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920027451393', 'f2a5E95N', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920044228609', 'hfUY8jh5', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920077783042', 'dbY1i49h', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920144891905', '591s8sWK', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920186834945', 'sqJy75BY', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920220389378', 'qd1T6fht', '1', '2018-12-16 15:49:37', '2018-12-16 15:49:37', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920274915329', '9GnXBd2C', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920316858369', 'UDjZ5Sd8', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920358801410', '593rS0FK', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920379772930', 'oIbdfyu1', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920396550146', 'Q2cSaEkh', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920442687489', 'ihdVA78P', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920476241921', 'vy32fbd2', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920493019137', 'ZbaUJ7sL', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920543350785', 'v5dw2aUv', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920585293825', 'k4K07wl3', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920639819777', 'byTyH3U3', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920681762817', 'g9FW7K6Y', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920740483073', 'gciZY7fc', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920765648898', 'p5yM8box', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920811786242', 'hjdJ7OyP', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920866312193', 'NgSXXuYZ', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920912449538', 'a3zRD5w1', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209920979558402', 'Iz3u5302', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921025695745', 'xaPj9tjM', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921038278657', 'BRicSHfQ', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921084416001', 'h7R9CVxK', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921134747649', 'KEzgZiAL', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921155719170', 'GgRuI0IP', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921201856513', '7zA309iB', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921239605249', 'br3CNya4', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921289936897', 'lfKUCjTl', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921331879937', '8gewNbSB', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921357045761', 'kh5R4GYb', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921398988802', 'IxT8VMb3', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921424154625', 'XrCfw1op', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921491263489', 'e9hwa9CL', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921533206529', 'HDBtGZhj', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921583538177', 'YXqg6NVX', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921625481217', 'BZLMTeU6', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921654841345', 'gO6Z3cWE', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921692590082', 'vrZWNWPn', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921713561601', '42Cp9ohY', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921772281858', '4W7PzAFQ', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921793253377', 'uzX4WMOk', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921839390721', 'wdIDlF8S', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921881333762', '6YqW17PV', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921931665409', '2pSXmGbU', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209921969414146', '9mjM5OoV', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922019745794', 'rVhxelX5', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922032328706', 'cg62dhyk', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922082660354', 'pAOWuv92', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922120409090', 'Z5Rs8bjC', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922170740737', 'z5fwXzqX', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922237849602', 'yXWWsX8J', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922288181249', 'HQ6Sgb60', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922330124290', 'k77DyfOM', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922351095810', '9oMcScQF', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922397233153', 'TTyv6RZi', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922468536322', 'g9ZK6hPK', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922485313538', 'cV9cCX16', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922506285058', 'Wc4yk0ej', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922548228097', 'Ru9Khx3V', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922606948353', 'h3khpw87', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922623725569', 'f7tMTgzY', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922669862914', 'zH00Cmya', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922686640129', 'iuDyb416', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922732777473', 'hiBf7U5r', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922778914817', 'j8cpaKf0', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922799886337', 'GYB3UUna', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922825052161', 'HU6XAx1K', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922871189505', 'bCCH7poC', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922913132545', 'Wh7ZbOYv', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922925715457', 's9W94cWo', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209922976047106', 'FChvRe25', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923030573058', 'wdGzjwQW', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923068321793', 'BPbod9fZ', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923114459138', '9XgS9fxL', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923160596481', 'tdX54tpA', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923177373697', 'xJfQbHsD', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923198345217', 'eb4j8CXg', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923252871170', 'cKvXYLz5', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923307397121', 'JvzzjgNx', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923332562945', 'FTRjd9Eg', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923378700289', 'MBUu6eLf', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923399671810', 'KB94SdoM', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923424837633', 'UZifcyMs', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923466780674', 'wYt16az7', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923479363586', 'uDuxSTiL', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923529695233', 'dxq2HhdY', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923571638274', 'Y28RzP89', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923605192706', '7xyhZQEc', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923647135745', 'TONsQUZW', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923689078785', 'WVbsuUtz', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923705856002', 'J0gYWm98', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923756187650', 'UEWQz0tY', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923802324993', 'tf9F9PYJ', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923823296514', 'WW85qATm', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923865239554', 'Rqsb2JI2', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923890405378', 'U1ayh7WV', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923911376898', 'j3XdCTdm', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923953319937', '7M1sB1yl', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209923970097153', 'd9CT1Ao9', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924020428802', 'ERlWXX50', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924041400322', 'ma8YXEl3', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924079149057', 'OPsWtEeP', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924146257921', 'V45v8zxU', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924192395266', 'UH81cvXf', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924213366786', 'kYuBeXd8', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924251115521', 'ZU3f6g4e', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924276281346', 'bI9TqbdT', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924318224385', 'ffT1ziuh', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924368556034', 'NEF0yBuW', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924389527553', 'xvPTVveX', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924406304769', 'PH8FQcOL', '1', '2018-12-16 15:49:38', '2018-12-16 15:49:38', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924452442114', '0NTZBY6b', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924473413633', 'TsYWGMIP', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924490190850', 'XSAy5sxV', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924536328193', 'NklQVSaz', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924590854145', 'JwN7Ym82', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924645380097', 'p8T2FSQG', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924699906050', 'HnVzH4hQ', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924750237698', 'b0YGaSVZ', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924775403521', 'a572pfXK', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924821540865', 'H4eu1QLO', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924871872513', 'ySU1DWpW', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924913815553', 'st7ncvis', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209924976730113', 'tjKaBgYx', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925014478849', 'scBy7TtC', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925052227585', '54X9kk1S', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925123530754', 'ciaaPU47', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925165473794', 'PXV9uezH', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925215805442', 'BwNTPkQ2', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925261942785', 'A5Sc4UQQ', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925333245954', 'tSE188xC', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925375188994', 'cOcWjm8J', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925438103554', 'wYhRzxv5', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925450686465', 'HZ3z77Hs', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925501018113', 'MbwtmZWF', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925538766849', 'NTbvDA03', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925559738369', '3cd2GnSK', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925605875713', 'Fp0Z0VYW', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925652013057', 'pcwt3Cj3', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925677178881', 'LB836SOI', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925727510529', 'aUHJE24H', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925769453570', '6DX6xjZb', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925798813697', 'urGp6HAz', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925865922562', '32JW1CAC', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925907865601', 'iZe4UsZo', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925924642817', 'fKZO5n89', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209925970780162', 'zwYSmWvU', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926021111809', 'i64Sjh02', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926042083329', 'oOwHzZWy', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926058860545', 'xZwZ36XM', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926146940930', '8WdDRUfA', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926193078274', '10vKNRcq', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926218244098', 'AmZRWw3X', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926255992834', 'RXY9ZtD1', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926281158657', 'PBPUVrIJ', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926352461826', 'iOu3wvVB', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926419570689', 'v90Dndtd', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926436347906', 'STvoGZp1', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926461513729', 'ehu9pciV', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926520233985', 'o3CxhOxK', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926566371330', 'LHzy3FSh', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926612508674', '6EKa64Zn', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926650257409', '8DAVPYxc', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926675423234', 'XAUigP2f', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926692200449', 'PZw1duc9', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926742532097', 'FazzsZuZ', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926755115010', '1nuTiRV8', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926776086529', 'NV0ynj2k', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926818029570', 'CzvXWhqU', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926839001090', 'R0TSpX54', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926864166913', '4BWmeyY8', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926901915649', 'i4N22T8T', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926927081473', '0U3O9a5f', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209926969024513', 'bcRKbVv2', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927006773250', '9mf7G3gB', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927027744769', '7Lds9qe2', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927078076417', 'hJO1sH2e', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927115825154', 'agcPH1AU', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927145185281', '35Q9D03J', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927191322626', 'vl1xjV10', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927203905537', '81429j3A', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927254237185', 'UXYiVrJt', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927275208706', 'PpbEc1VG', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927317151746', 'SaHj3f6x', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927367483393', 'fFNF7Jxz', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927384260609', 'a4d3ebVX', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927401037825', 'zNMxhu6a', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927455563778', '0ZuiQc0n', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927497506818', '39Pzho02', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927514284033', '5MGlHo6S', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927556227073', 'Ucw2AmEW', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927602364418', 'XjO2Pa26', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927619141633', 'P9weBp7a', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927665278977', 'udh7Wywv', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927707222018', '5h53KUqW', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927749165058', '1ZtVlUAK', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927765942273', 'qxTT0X0y', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927791108098', 'RuFBzPzB', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927833051137', '2gL4At55', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927854022657', 'Qk626bXw', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927870799873', 'gnfA4PJS', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927921131521', 'jUAbxUj2', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927942103041', 'nh03Zzk5', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209927954685954', '2e8zViZX', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928055349249', 'AW33s9mb', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928076320770', 'giZSDmQI', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928135041026', 'uV8t8zwh', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928156012545', 'Xb3vwQEb', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928206344194', 'Ozk9fhC5', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928248287234', 'qc8X056m', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928298618881', 'PXN6eb4B', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928319590402', 'USza8l4g', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928353144833', '9V3bZbi9', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928399282178', 'tZD9rZ0W', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928474779649', 'D6tUPI4k', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928529305601', 'b60MHGyP', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928554471426', 'FC6Rn2AY', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928600608769', 'JpGohYJn', '1', '2018-12-16 15:49:39', '2018-12-16 15:49:39', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928642551809', 'QY4wVVyP', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928701272066', 'l6XmHOz5', '1', '2018-12-16 15:49:40', '2018-12-18 14:43:28', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928722243585', 'vg6jyCmi', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928772575233', 'bzaUYEBC', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928810323969', 'TVw2n2O9', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928831295489', 'Xi0Nxiwf', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928910987265', 'G2Y8xpZA', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928957124609', 'TSjR59ah', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209928978096129', '3D7uc3c3', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929015844866', 'tgU1mp0Z', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929066176513', '5M5rKtn4', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929078759426', 'bveO5Ec1', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929129091073', 'zgEjzf90', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929166839809', 'QWFRSNV9', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929196199938', 'ahuGFf9G', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929246531586', 'fBX5YPZR', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929296863234', 'ObL88K1P', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929309446146', 'eWZSwXKo', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929351389185', 'ElNVnzk8', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929376555010', '3ySIpeH1', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929422692354', 'GfZsxqix', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929468829697', 'rOkoUOqg', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929485606913', 'Tjgi2Yx7', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929506578433', 'zbe01P7V', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929552715778', 'OsahlkVM', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929594658818', '4JYVcgIJ', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929615630337', 'SbYAq3ed', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929632407554', 'OxAbms7o', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929703710722', 'd6N7TcpA', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929749848066', 'pjfrUu5Q', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929762430978', '4fXyK73X', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929812762626', 'URAoDG43', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929842122754', 'j7I6lxHe', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929896648706', 'D77nIymA', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209929976340481', 'VV7v13fD', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209930001506306', '97MxevWi', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209930018283522', '8SS23Fbw', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209930064420865', 'sW1CoyeP', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209930148306945', 'YxERhcw4', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209930194444290', 'FFVz2Uel', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209930240581634', 'C5PUDotn', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209930278330370', 'ykUSevx4', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1074209930324467713', 'WBei6q61', '1', '2018-12-16 15:49:40', '2018-12-16 15:49:40', null);
INSERT INTO `activation_code_tb` VALUES ('1075289600089849858', 'mxXa91V7', '1', '2018-12-19 15:19:53', '2018-12-19 15:19:53', null);
INSERT INTO `activation_code_tb` VALUES ('1075289600156958722', 'eyb8l2je', '1', '2018-12-19 15:19:53', '2018-12-19 15:19:53', null);
INSERT INTO `activation_code_tb` VALUES ('1075289600161153026', 'acg5fctg', '1', '2018-12-19 15:19:53', '2018-12-19 15:19:53', null);
INSERT INTO `activation_code_tb` VALUES ('1075289600169541633', 's2nqbvWk', '1', '2018-12-19 15:19:53', '2018-12-19 15:19:53', null);
INSERT INTO `activation_code_tb` VALUES ('1075289600177930241', 'ud06X28c', '1', '2018-12-19 15:19:53', '2018-12-19 15:19:53', null);
INSERT INTO `activation_code_tb` VALUES ('1075289600186318849', '5752RP4D', '1', '2018-12-19 15:19:53', '2018-12-19 15:19:53', null);
INSERT INTO `activation_code_tb` VALUES ('1075289600190513154', 'wBbvqy7N', '1', '2018-12-19 15:19:53', '2018-12-19 15:19:53', null);
INSERT INTO `activation_code_tb` VALUES ('1075289600194707458', 'BhtNlJ0b', '1', '2018-12-19 15:19:53', '2018-12-19 15:19:53', null);
INSERT INTO `activation_code_tb` VALUES ('1075289600198901762', '1MZuBwT3', '1', '2018-12-19 15:19:53', '2018-12-19 15:19:53', null);
INSERT INTO `activation_code_tb` VALUES ('1075289600203096066', 'poQxYm1P', '1', '2018-12-19 15:19:53', '2018-12-19 15:19:53', null);

-- ----------------------------
-- Table structure for `config_tb`
-- ----------------------------
DROP TABLE IF EXISTS `config_tb`;
CREATE TABLE `config_tb` (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `platform_name` varchar(255) DEFAULT NULL COMMENT '平台名称',
  `service_phone` varchar(255) DEFAULT NULL COMMENT '平台联系电话',
  `service_qq` varchar(255) DEFAULT NULL COMMENT '平台联系qq',
  `free_number` tinyint(4) DEFAULT NULL COMMENT '免费发布次数',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
-- Records of config_tb
-- ----------------------------
INSERT INTO `config_tb` VALUES ('1000', '赤兔顺风车', '15111336587', '1499438073', '3', '2018-12-15 18:38:52', '2018-12-16 12:42:55');

-- ----------------------------
-- Table structure for `integral_tb`
-- ----------------------------
DROP TABLE IF EXISTS `integral_tb`;
CREATE TABLE `integral_tb` (
  `integral_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '积分id',
  `integral` decimal(11,2) DEFAULT '0.00' COMMENT '剩余积分',
  `recharge` decimal(11,2) DEFAULT '0.00' COMMENT '充值积分',
  `consume` decimal(11,2) DEFAULT '0.00' COMMENT '消费积分',
  `base_profit` decimal(11,2) DEFAULT '0.00' COMMENT '赠送积分',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` bigint(20) DEFAULT NULL COMMENT '账户id外键',
  PRIMARY KEY (`integral_id`),
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1074619818223017986 DEFAULT CHARSET=utf8 COMMENT='积分表';

-- ----------------------------
-- Records of integral_tb
-- ----------------------------
INSERT INTO `integral_tb` VALUES ('1000', '0.00', '0.00', '0.00', '0.00', '2018-12-16 14:19:51', '2018-12-16 14:19:51', '1000');
INSERT INTO `integral_tb` VALUES ('1074188987568967681', '0.00', '0.00', '0.00', '0.00', '2018-12-16 14:26:27', '2018-12-16 14:26:27', '1074188987531218945');
INSERT INTO `integral_tb` VALUES ('1074189088911740930', '0.00', '0.00', '0.00', '0.00', '2018-12-16 14:26:51', '2018-12-16 14:26:51', '1074189088903352322');
INSERT INTO `integral_tb` VALUES ('1074190170928926721', '0.00', '0.00', '0.00', '0.00', '2018-12-16 14:31:09', '2018-12-16 14:31:09', '1074190170920538113');
INSERT INTO `integral_tb` VALUES ('1074619818223017985', '3.00', '0.00', '0.00', '0.00', '2018-12-17 18:58:25', '2018-12-17 18:58:25', '1074619818151714817');

-- ----------------------------
-- Table structure for `permission_tb`
-- ----------------------------
DROP TABLE IF EXISTS `permission_tb`;
CREATE TABLE `permission_tb` (
  `permission_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `type` tinyint(4) DEFAULT NULL COMMENT '权限类型，默认0开放，1鉴权',
  `manager_name` varchar(255) DEFAULT NULL COMMENT '权限管理名',
  `name` varchar(255) DEFAULT NULL COMMENT '权限名',
  `route` varchar(255) DEFAULT NULL COMMENT '权限路由',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `route` (`route`) USING BTREE,
  KEY `INDEX_TYPE` (`type`) USING BTREE,
  KEY `INDEX_MANAGERNAME` (`manager_name`) USING BTREE,
  KEY `INDEX_NAME` (`name`) USING BTREE,
  KEY `INDEX_ROUTE` (`route`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1077799381543346179 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of permission_tb
-- ----------------------------
INSERT INTO `permission_tb` VALUES ('1074121711272505346', '1', '账户管理', '账户增加', '/account/add', '2018-12-16 09:59:06');
INSERT INTO `permission_tb` VALUES ('1074121711461249025', '1', '账户管理', '账户实名认证', '/account/auth', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121711545135106', '0', '账户管理', '账户数量', '/account/count', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121711620632577', '1', '账户管理', '账户删除', '/account/delete', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121711712907266', '0', '账户管理', '是否登录', '/account/islogin', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121711784210434', '0', '账户管理', '账户列表', '/account/list', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121711872290818', '0', '账户管理', '账户单个加载', '/account/load', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121711935205377', '0', '账户管理', '管理员登录', '/account/login', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121711981342722', '0', '账户管理', '登出', '/account/loginout', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121712073617410', '1', '账户管理', '手机号账户是否存在', '/account/phoneIsExist', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121712119754754', '1', '账户管理', '账户修改', '/account/update', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121712203640833', '1', '账户管理', '账户修改用户信息', '/account/updateInfo', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121712274944001', '1', '账户管理', '账户修改密码', '/account/updatePassword', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121712358830081', '0', '账户管理', '手机验证码发送/邮箱验证链接', '/account/validCode', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121712430133249', '0', '账户管理', 'web用户登录', '/account/weblogin', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121712505630721', '0', '账户管理', 'web用户注册', '/account/webregister', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121712606294018', '1', '激活码管理', '激活码增加', '/activationCode/add', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121712656625666', '0', '激活码管理', '激活码数量', '/activationCode/count', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121712706957313', '1', '激活码管理', '激活码删除', '/activationCode/delete', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121712786649089', '0', '激活码管理', '激活码列表', '/activationCode/list', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121712824397825', '0', '激活码管理', '激活码单个加载', '/activationCode/load', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121712862146561', '1', '激活码管理', '激活码修改', '/activationCode/update', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121712946032642', '1', '配置管理', '配置增加', '/config/add', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121713008947202', '0', '配置管理', '配置数量', '/config/count', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121713097027586', '1', '配置管理', '配置删除', '/config/delete', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121713164136450', '0', '配置管理', '配置列表', '/config/list', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121713231245314', '0', '配置管理', '配置单个加载', '/config/load', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121713306742786', '1', '配置管理', '配置修改', '/config/update', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121713382240257', '1', '积分管理', '积分增加', '/integral/add', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121713428377602', '0', '积分管理', '积分数量', '/integral/count', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121713508069378', '1', '积分管理', '积分删除', '/integral/delete', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121713587761154', '0', '积分管理', '积分列表', '/integral/list', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121713684230145', '0', '积分管理', '积分单个加载', '/integral/load', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121713751339010', '1', '积分管理', '积分修改', '/integral/update', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121713801670658', '1', '权限管理', '权限增加', '/permission/add', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121713872973826', '0', '权限管理', '权限数量', '/permission/count', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121713919111170', '1', '权限管理', '权限删除', '/permission/delete', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121713969442817', '1', '权限管理', '初始化权限', '/permission/init', '2018-12-16 09:59:07');
INSERT INTO `permission_tb` VALUES ('1074121714044940289', '0', '权限管理', '权限列表', '/permission/list', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121714091077633', '0', '权限管理', '权限单个加载', '/permission/load', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121714141409281', '1', '权限管理', '权限修改', '/permission/update', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121714208518146', '1', '角色管理', '角色增加', '/role/add', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121714288209921', '0', '角色管理', '角色数量', '/role/count', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121714359513089', '1', '角色管理', '角色删除', '/role/delete', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121714439204866', '0', '角色管理', '角色列表', '/role/list', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121714531479554', '0', '角色管理', '角色单个加载', '/role/load', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121714586005506', '1', '角色管理', '角色修改', '/role/update', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121714657308674', '1', '角色权限管理', '角色权限增加', '/rolePermission/add', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121714724417537', '0', '角色权限管理', '角色权限数量', '/rolePermission/count', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121714757971970', '1', '角色权限管理', '角色权限删除', '/rolePermission/delete', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121714825080834', '0', '角色权限管理', '角色权限列表', '/rolePermission/list', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121714904772609', '0', '角色权限管理', '角色权限单个加载', '/rolePermission/load', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121714946715649', '1', '角色权限管理', '角色权限修改', '/rolePermission/update', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121715001241602', '0', '工具接口管理', '根据url获取内容', '/tool/contentByUrl', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121715072544770', '0', '工具接口管理', '上传文件', '/tool/file/add', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121715114487809', '0', '工具接口管理', '获取sessionId', '/tool/getSession', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121715185790978', '0', '工具接口管理', '验证码', '/tool/getVerificationCode', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121715257094146', '0', '工具接口管理', '上传图片', '/tool/img/add', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121715299037185', '0', '工具接口管理', 'test', '/tool/test', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121715370340353', '1', '行程管理', '行程增加', '/trip/add', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121715420672002', '0', '行程管理', '行程数量', '/trip/count', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121715454226434', '1', '行程管理', '行程删除', '/trip/delete', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121715521335298', '0', '行程管理', '行程列表', '/trip/list', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121715596832769', '0', '行程管理', '行程单个加载', '/trip/load', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074121715651358721', '1', '行程管理', '行程修改', '/trip/update', '2018-12-16 09:59:08');
INSERT INTO `permission_tb` VALUES ('1074152062833348610', '0', '账户管理', '忘记密码', '/account/forgetPassword', '2018-12-21 08:59:04');
INSERT INTO `permission_tb` VALUES ('1074201062710136834', '1', '激活码管理', '激活码批量增加', '/activationCode/addBatch', '2018-12-16 15:14:26');
INSERT INTO `permission_tb` VALUES ('1074853772947533826', '1', '账户管理', '认证审核', '/account/authExamine', '2018-12-18 10:28:04');
INSERT INTO `permission_tb` VALUES ('1074912182615322626', '1', '激活码管理', '激活码提交', '/activationCode/submit', '2018-12-18 14:20:10');
INSERT INTO `permission_tb` VALUES ('1074973997432995841', '1', '账户管理', '更新邀请码', '/account/updateInviteCode', '2018-12-18 18:25:48');
INSERT INTO `permission_tb` VALUES ('1074988824339578882', '0', '行程管理', '顺风车查询', '/trip/search', '2018-12-18 19:30:22');
INSERT INTO `permission_tb` VALUES ('1077799381245550593', '1', '联系管理', '联系增加', '/contact/add', '2018-12-26 13:32:51');
INSERT INTO `permission_tb` VALUES ('1077799381392351234', '0', '联系管理', '联系数量', '/contact/count', '2018-12-26 13:32:52');
INSERT INTO `permission_tb` VALUES ('1077799381413322753', '1', '联系管理', '联系删除', '/contact/delete', '2018-12-26 13:32:52');
INSERT INTO `permission_tb` VALUES ('1077799381476237313', '0', '联系管理', '联系列表', '/contact/list', '2018-12-26 13:32:52');
INSERT INTO `permission_tb` VALUES ('1077799381505597442', '0', '联系管理', '联系单个加载', '/contact/load', '2018-12-26 13:32:52');
INSERT INTO `permission_tb` VALUES ('1077799381543346178', '1', '联系管理', '联系修改', '/contact/update', '2018-12-26 13:32:52');

-- ----------------------------
-- Table structure for `role_permission_tb`
-- ----------------------------
DROP TABLE IF EXISTS `role_permission_tb`;
CREATE TABLE `role_permission_tb` (
  `role_permission_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色权限id',
  `region` tinyint(4) DEFAULT NULL COMMENT '范围，1公共，2自身',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id,外键',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `permission_id` bigint(20) DEFAULT NULL COMMENT '权限id,外键',
  PRIMARY KEY (`role_permission_id`),
  UNIQUE KEY `UNIQUE_ROLEID_PERMISSIONID` (`role_id`,`permission_id`) USING BTREE,
  KEY `INDEX_REGION` (`region`) USING BTREE,
  KEY `INDEX_ROLEID` (`role_id`) USING BTREE,
  KEY `INDEX_PERMISSIONID` (`permission_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1074975798358081538 DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Records of role_permission_tb
-- ----------------------------
INSERT INTO `role_permission_tb` VALUES ('1074134951150964738', '1', '1001', '2018-12-16 10:51:43', '1074121715651358721');
INSERT INTO `role_permission_tb` VALUES ('1074134951150964739', '1', '1001', '2018-12-16 10:51:43', '1074121714946715649');
INSERT INTO `role_permission_tb` VALUES ('1074134951150964740', '1', '1001', '2018-12-16 10:51:43', '1074121714757971970');
INSERT INTO `role_permission_tb` VALUES ('1074134951150964741', '1', '1001', '2018-12-16 10:51:43', '1074121715454226434');
INSERT INTO `role_permission_tb` VALUES ('1074134951150964742', '1', '1001', '2018-12-16 10:51:43', '1074121715370340353');
INSERT INTO `role_permission_tb` VALUES ('1074134951150964743', '1', '1001', '2018-12-16 10:51:43', '1074121714657308674');
INSERT INTO `role_permission_tb` VALUES ('1074134951503286274', '1', '1001', '2018-12-16 10:51:44', '1074121714586005506');
INSERT INTO `role_permission_tb` VALUES ('1074134951817859074', '1', '1001', '2018-12-16 10:51:44', '1074121714359513089');
INSERT INTO `role_permission_tb` VALUES ('1074134952220512257', '1', '1001', '2018-12-16 10:51:44', '1074121714208518146');
INSERT INTO `role_permission_tb` VALUES ('1074134952635748354', '1', '1001', '2018-12-16 10:51:44', '1074121714141409281');
INSERT INTO `role_permission_tb` VALUES ('1074134953109704705', '1', '1001', '2018-12-16 10:51:44', '1074121713969442817');
INSERT INTO `role_permission_tb` VALUES ('1074134953474609154', '1', '1001', '2018-12-16 10:51:44', '1074121713919111170');
INSERT INTO `role_permission_tb` VALUES ('1074134953894039554', '1', '1001', '2018-12-16 10:51:44', '1074121713801670658');
INSERT INTO `role_permission_tb` VALUES ('1074134954309275649', '1', '1001', '2018-12-16 10:51:44', '1074121713751339010');
INSERT INTO `role_permission_tb` VALUES ('1074134954766454785', '1', '1001', '2018-12-16 10:51:44', '1074121713508069378');
INSERT INTO `role_permission_tb` VALUES ('1074134955169107969', '1', '1001', '2018-12-16 10:51:44', '1074121713382240257');
INSERT INTO `role_permission_tb` VALUES ('1074134955584344066', '1', '1001', '2018-12-16 10:51:45', '1074121713306742786');
INSERT INTO `role_permission_tb` VALUES ('1074134955986997249', '1', '1001', '2018-12-16 10:51:45', '1074121713097027586');
INSERT INTO `role_permission_tb` VALUES ('1074134956414816258', '1', '1001', '2018-12-16 10:51:45', '1074121712946032642');
INSERT INTO `role_permission_tb` VALUES ('1074134956842635265', '1', '1001', '2018-12-16 10:51:45', '1074121712862146561');
INSERT INTO `role_permission_tb` VALUES ('1074134957249482754', '1', '1001', '2018-12-16 10:51:45', '1074121712706957313');
INSERT INTO `role_permission_tb` VALUES ('1074134957668913153', '1', '1001', '2018-12-16 10:51:45', '1074121712606294018');
INSERT INTO `role_permission_tb` VALUES ('1074134958092537857', '1', '1001', '2018-12-16 10:51:45', '1074121712274944001');
INSERT INTO `role_permission_tb` VALUES ('1074134958520356865', '1', '1001', '2018-12-16 10:51:45', '1074121712203640833');
INSERT INTO `role_permission_tb` VALUES ('1074134958931398658', '1', '1001', '2018-12-16 10:51:45', '1074121712119754754');
INSERT INTO `role_permission_tb` VALUES ('1074134959409549314', '1', '1001', '2018-12-16 10:51:45', '1074121712073617410');
INSERT INTO `role_permission_tb` VALUES ('1074134959778648065', '1', '1001', '2018-12-16 10:51:46', '1074121711620632577');
INSERT INTO `role_permission_tb` VALUES ('1074134960198078465', '1', '1001', '2018-12-16 10:51:46', '1074121711461249025');
INSERT INTO `role_permission_tb` VALUES ('1074134960609120257', '1', '1001', '2018-12-16 10:51:46', '1074121711272505346');
INSERT INTO `role_permission_tb` VALUES ('1074135246488686594', '2', '1002', '2018-12-16 10:52:54', '1074121715370340353');
INSERT INTO `role_permission_tb` VALUES ('1074135312460894210', '2', '1002', '2018-12-16 10:53:10', '1074121712203640833');
INSERT INTO `role_permission_tb` VALUES ('1074135356052295681', '2', '1002', '2018-12-16 10:53:20', '1074121712073617410');
INSERT INTO `role_permission_tb` VALUES ('1074135375115407362', '2', '1002', '2018-12-16 10:53:25', '1074121712274944001');
INSERT INTO `role_permission_tb` VALUES ('1074139152065187841', '2', '1003', '2018-12-16 11:08:25', '1074121712203640833');
INSERT INTO `role_permission_tb` VALUES ('1074139167969988610', '2', '1003', '2018-12-16 11:08:29', '1074121712073617410');
INSERT INTO `role_permission_tb` VALUES ('1074139188283002881', '2', '1003', '2018-12-16 11:08:34', '1074121712274944001');
INSERT INTO `role_permission_tb` VALUES ('1074139221581582338', '2', '1003', '2018-12-16 11:08:42', '1074121711461249025');
INSERT INTO `role_permission_tb` VALUES ('1074139275478388738', '2', '1002', '2018-12-16 11:08:54', '1074121711461249025');
INSERT INTO `role_permission_tb` VALUES ('1074152241682665473', '1', '1001', '2018-12-16 12:00:26', '1074152062833348610');
INSERT INTO `role_permission_tb` VALUES ('1074202757318004738', '1', '1001', '2018-12-16 15:21:10', '1074201062710136834');
INSERT INTO `role_permission_tb` VALUES ('1074853905533677570', '1', '1001', '2018-12-18 10:28:36', '1074853772947533826');
INSERT INTO `role_permission_tb` VALUES ('1074912312189956097', '1', '1001', '2018-12-18 14:20:41', '1074912182615322626');
INSERT INTO `role_permission_tb` VALUES ('1074912344284770305', '2', '1002', '2018-12-18 14:20:48', '1074912182615322626');
INSERT INTO `role_permission_tb` VALUES ('1074912372130754561', '2', '1003', '2018-12-18 14:20:55', '1074912182615322626');
INSERT INTO `role_permission_tb` VALUES ('1074975798358081537', '1', '1001', '2018-12-18 18:32:57', '1074973997432995841');

-- ----------------------------
-- Table structure for `role_tb`
-- ----------------------------
DROP TABLE IF EXISTS `role_tb`;
CREATE TABLE `role_tb` (
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `duty` varchar(255) DEFAULT NULL COMMENT '角色职责',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role_tb
-- ----------------------------
INSERT INTO `role_tb` VALUES ('1000', '超级管理员', '超级管理员', '2018-12-15 16:45:51');
INSERT INTO `role_tb` VALUES ('1001', '普通管理员', '普通管理员', '2018-12-15 16:45:51');
INSERT INTO `role_tb` VALUES ('1002', '车主', '车主', '2018-12-15 16:45:51');
INSERT INTO `role_tb` VALUES ('1003', '用户', '用户', '2018-12-16 10:56:01');

-- ----------------------------
-- Table structure for `trip_tb`
-- ----------------------------
DROP TABLE IF EXISTS `trip_tb`;
CREATE TABLE `trip_tb` (
  `trip_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '行程id',
  `start_address` varchar(255) DEFAULT NULL COMMENT '出发地',
  `middle_address` varchar(255) DEFAULT NULL COMMENT '途径地',
  `end_address` varchar(255) DEFAULT NULL COMMENT '目的地',
  `start_date` datetime DEFAULT NULL COMMENT '出发时间',
  `is_door` tinyint(4) DEFAULT NULL COMMENT '是否上门接送，1是，2否',
  `person_number` tinyint(4) DEFAULT NULL COMMENT '可带人数',
  `unit_price` decimal(11,2) DEFAULT NULL COMMENT '金额/人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` bigint(20) DEFAULT NULL COMMENT '账户id,外键',
  PRIMARY KEY (`trip_id`),
  KEY `INDEX_ISDOOR` (`is_door`) USING BTREE,
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1074979462216843267 DEFAULT CHARSET=utf8 COMMENT='行程表';

-- ----------------------------
-- Records of trip_tb
-- ----------------------------
INSERT INTO `trip_tb` VALUES ('1074977843785924610', '江苏省徐州市云龙区', 'sdfds', '天津市天津市河东区', '2018-12-18 01:01:01', '2', '1', '344.00', '2018-12-18 18:41:46', '2018-12-18 18:41:05', '1074619818151714817');
INSERT INTO `trip_tb` VALUES ('1074978909831200770', '福建省泉州市洛江区', 'sdf', '山西省晋城市阳城县', '2018-12-19 01:01:01', '1', '1', '435.00', '2018-12-18 18:45:19', '2018-12-18 18:45:19', '1074619818151714817');
INSERT INTO `trip_tb` VALUES ('1074979462216843266', '湖南省长沙市岳麓区', 'fgd', '湖南省常德市鼎城区', '2018-12-20 01:01:01', '2', '1', '12.00', '2018-12-18 18:47:31', '2018-12-18 18:47:31', '1074619818151714817');
