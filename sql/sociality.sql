# 数据库 
#创建数据库
DROP DATABASE IF EXISTS sociality_db;
CREATE DATABASE sociality_db;

#使用数据库 
use sociality_db;
#创建角色表
CREATE TABLE role_tb(
role_id int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
name varchar(255) COMMENT '角色名',
duty varchar(255) COMMENT '角色职责',
update_date datetime COMMENT '更新时间',
PRIMARY KEY (role_id)
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='角色表';

#创建账户表
CREATE TABLE account_tb(
account_id int(11) NOT NULL AUTO_INCREMENT COMMENT '账户id',
realname varchar(255) COMMENT '姓名',
sid varchar(255) COMMENT '账户',
sex tinyint(4) DEFAULT 0 COMMENT '性别,默认为0未知，为1男性，为2女性',
nation varchar(255) COMMENT '民族',
identity_cards varchar(255) COMMENT '身份证',
phone varchar(255) COMMENT '联系电话',
password varchar(255) COMMENT '密码',
icon varchar(255) COMMENT '头像',
birth_date datetime COMMENT '出生年月日',
create_date datetime COMMENT '创建时间',
login_date datetime COMMENT '登陆时间',
status tinyint DEFAULT 0 COMMENT '状态，默认0离线，1封禁，2异常，3在线',
role_id int(11) COMMENT '角色id外键',
PRIMARY KEY (account_id),
INDEX INDEX_REALNAME (realname) USING BTREE,
INDEX INDEX_ROLEID (role_id) USING BTREE,
INDEX INDEX_STATUS (status) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='账户表';

#创建好友表
CREATE TABLE friend_tb(
friend_id int(11) NOT NULL AUTO_INCREMENT COMMENT '好友id',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
account_id int(11) COMMENT '账户id外键',
friend_account_id int(11) COMMENT '好友id外键',
PRIMARY KEY (friend_id),
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_FRIENDACCOUNTID (friend_account_id) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='好友表';

#创建好友申请表
CREATE TABLE friend_apply_tb(
friend_apply_id int(11) NOT NULL AUTO_INCREMENT COMMENT '好友申请id',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
account_id int(11) COMMENT '申请人id外键',
friend_account_id int(11) COMMENT '被申请人id外键',
status tinyint DEFAULT 0 COMMENT '状态，默认1申请中，2已同意，3已拒绝',
PRIMARY KEY (friend_apply_id),
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_FRIENDACCOUNTID (friend_account_id) USING BTREE,
INDEX INDEX_STATUS (status) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='好友申请表';

#创建朋友圈表
CREATE TABLE circle_tb(
circle_id int(11) NOT NULL AUTO_INCREMENT COMMENT '朋友圈id',
content longtext COMMENT '内容',
praise_points int(11) COMMENT '点赞数',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
account_id int(11) COMMENT '账户id外键',
PRIMARY KEY (circle_id),
INDEX INDEX_ACCOUNTID (account_id) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='朋友圈表';

#创建朋友圈评论表
CREATE TABLE circle_comment_tb(
circle_comment_id int(11) NOT NULL AUTO_INCREMENT COMMENT '朋友圈评论id',
content longtext COMMENT '内容',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
account_id int(11) COMMENT '账户id外键',
PRIMARY KEY (circle_comment_id),
INDEX INDEX_ACCOUNTID (account_id) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='朋友圈评论表';

#创建聊天房表
CREATE TABLE chat_room_tb(
chat_room_id int(11) NOT NULL AUTO_INCREMENT COMMENT '聊天房id',
type tinyint(4) COMMENT '类型，1私聊，2普通房，3语音房，4电影房',
name varchar(255) COMMENT '名称',
url varchar(255) COMMENT '语音或电影url',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
account_id int(11) COMMENT '创建人id外键',
PRIMARY KEY (chat_room_id),
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_TYPE (type) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='聊天房表';

#创建聊天房成员表
CREATE TABLE chat_room_member_tb(
chat_room_member_id int(11) NOT NULL AUTO_INCREMENT COMMENT '聊天房成员id',
type tinyint(4) COMMENT '类型，1私聊，2普通房，3语音房，4电影房',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
chat_room_id int(11) COMMENT '聊天房id外键',
account_id int(11) COMMENT '账户id外键',
PRIMARY KEY (chat_room_member_id),
INDEX INDEX_CHATROOMID (chat_room_id) USING BTREE,
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_TYPE (type) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='聊天房成员表';

#创建聊天房聊天记录表
CREATE TABLE chat_room_record_tb(
chat_room_record_id int(11) NOT NULL AUTO_INCREMENT COMMENT '聊天房聊天记录id',
content longtext COMMENT '内容',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
chat_room_id int(11) COMMENT '聊天房id外键',
from_account_id int(11) COMMENT '发送端账户id外键',
to_account_id int(11) COMMENT '接受端账户id外键',
PRIMARY KEY (chat_room_record_id),
INDEX INDEX_CHATROOMID (chat_room_id) USING BTREE,
INDEX INDEX_FromACCOUNTID (from_account_id) USING BTREE,
INDEX INDEX_TOACCOUNTID (to_account_id) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='聊天房聊天记录表';

#创建公告表
CREATE TABLE notice_tb(
notice_id int(11) NOT NULL AUTO_INCREMENT COMMENT '公告id',
title varchar(255) COMMENT '标题',
content longtext COMMENT '内容',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
PRIMARY KEY (notice_id)
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='公告表';

#设置初始角色
INSERT IGNORE INTO role_tb (role_id,name,duty,update_date)
VALUES (1000,"超级管理员","超级管理员",now());
INSERT IGNORE INTO role_tb (role_id,name,duty,update_date)
VALUES (1001,"用户","用户",now());

#设置初始管理员密码MD5加密123456
INSERT IGNORE INTO account_tb (account_id,realname,sid,phone,password,create_date,login_date,role_id)
VALUES (1000,"超级管理员","1000","1000","11874bb6149dd45428da628c9766b252",now(),now(),1000);