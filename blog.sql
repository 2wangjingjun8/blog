/*
Navicat MySQL Data Transfer

Source Server         : bendi
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-11-25 20:51:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_adminmenu
-- ----------------------------
DROP TABLE IF EXISTS `blog_adminmenu`;
CREATE TABLE `blog_adminmenu` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `namestr` varchar(20) DEFAULT NULL,
  `fun` varchar(20) DEFAULT NULL,
  `act` varchar(20) DEFAULT NULL,
  `isshow` tinyint(1) unsigned DEFAULT '0',
  `sort` tinyint(3) unsigned DEFAULT '99',
  `pid` int(10) unsigned NOT NULL DEFAULT '1',
  `level` tinyint(3) unsigned DEFAULT '3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_adminmenu
-- ----------------------------
INSERT INTO `blog_adminmenu` VALUES ('2', '学无止境', 'knowledge', '', '1', '4', '0', '1');
INSERT INTO `blog_adminmenu` VALUES ('3', '个人日记', 'diary', '', '1', '3', '0', '1');
INSERT INTO `blog_adminmenu` VALUES ('4', '相册展示', 'pics', '', '1', '7', '0', '1');
INSERT INTO `blog_adminmenu` VALUES ('5', '博主信息', 'user', 'update&id=1', '1', '2', '0', '1');
INSERT INTO `blog_adminmenu` VALUES ('6', '留言反馈', 'msg', '', '1', '9', '0', '1');
INSERT INTO `blog_adminmenu` VALUES ('7', '友情链接', 'friendlink', null, '1', '8', '0', '1');
INSERT INTO `blog_adminmenu` VALUES ('11', '文章列表', 'knowledge', 'index', '1', '99', '2', '2');
INSERT INTO `blog_adminmenu` VALUES ('12', '文章添加', 'knowledge', 'add', '1', '99', '2', '2');
INSERT INTO `blog_adminmenu` VALUES ('13', '文章编辑', 'knowledge', 'update', '0', '99', '2', '3');
INSERT INTO `blog_adminmenu` VALUES ('14', '文章删除', 'knowledge', 'del', '0', '99', '2', '3');
INSERT INTO `blog_adminmenu` VALUES ('15', '日记列表', 'diary', 'index', '1', '99', '3', '2');
INSERT INTO `blog_adminmenu` VALUES ('16', '日记添加', 'diary', 'add', '1', '99', '3', '2');
INSERT INTO `blog_adminmenu` VALUES ('17', '日记编辑', 'diary', 'update', '0', '99', '3', '3');
INSERT INTO `blog_adminmenu` VALUES ('18', '日记删除', 'diary', 'del', '0', '99', '3', '3');
INSERT INTO `blog_adminmenu` VALUES ('19', '图片列表', 'pics', 'index', '1', '99', '4', '2');
INSERT INTO `blog_adminmenu` VALUES ('20', '图片添加', 'pics', 'add', '1', '99', '4', '2');
INSERT INTO `blog_adminmenu` VALUES ('21', '图片编辑', 'pics', 'update', '0', '99', '4', '3');
INSERT INTO `blog_adminmenu` VALUES ('22', '图片删除', 'pics', 'del', '0', '99', '4', '3');
INSERT INTO `blog_adminmenu` VALUES ('23', '信息列表', 'user', 'index', '1', '99', '5', '2');
INSERT INTO `blog_adminmenu` VALUES ('25', '信息编辑', 'user', 'update', '0', '99', '5', '3');
INSERT INTO `blog_adminmenu` VALUES ('26', '信息删除', 'user', 'del', '0', '99', '5', '3');
INSERT INTO `blog_adminmenu` VALUES ('27', '留言列表', 'msg', 'index', '1', '99', '6', '2');
INSERT INTO `blog_adminmenu` VALUES ('29', '留言查看回复', 'msg', 'update', '0', '99', '6', '3');
INSERT INTO `blog_adminmenu` VALUES ('30', '留言删除', 'msg', 'del', '0', '99', '6', '3');
INSERT INTO `blog_adminmenu` VALUES ('31', '碎言碎语列表', 'words', 'index', '1', '99', '35', '2');
INSERT INTO `blog_adminmenu` VALUES ('32', '碎言碎语添加', 'words', 'add', '1', '99', '35', '2');
INSERT INTO `blog_adminmenu` VALUES ('33', '碎言碎语编辑', 'words', 'update', '0', '99', '35', '3');
INSERT INTO `blog_adminmenu` VALUES ('34', '碎言碎语删除', 'words', 'del', '0', '99', '35', '3');
INSERT INTO `blog_adminmenu` VALUES ('35', '碎言碎语', 'words', '', '1', '6', '0', '1');
INSERT INTO `blog_adminmenu` VALUES ('36', '友情链接列表', 'friendlink', 'index', '1', '99', '7', '2');
INSERT INTO `blog_adminmenu` VALUES ('37', '友情链接添加', 'friendlink', 'add', '1', '99', '7', '2');
INSERT INTO `blog_adminmenu` VALUES ('38', '友情链接编辑', 'friendlink', 'update', '0', '99', '7', '3');
INSERT INTO `blog_adminmenu` VALUES ('39', '友情链接删除', 'friendlink', 'del', '0', '99', '7', '3');
INSERT INTO `blog_adminmenu` VALUES ('40', '评论列表', 'comment', 'index', '1', '99', '2', '2');
INSERT INTO `blog_adminmenu` VALUES ('41', '视频管理', 'video', null, '1', '7', '0', '1');
INSERT INTO `blog_adminmenu` VALUES ('42', '视频添加', 'video', 'add', '1', '99', '41', '2');
INSERT INTO `blog_adminmenu` VALUES ('43', '视频列表', 'video', 'index', '1', '99', '41', '2');
INSERT INTO `blog_adminmenu` VALUES ('44', '视频编辑', 'video', 'update', '0', '99', '41', '3');
INSERT INTO `blog_adminmenu` VALUES ('45', '视频删除', 'video', 'del', '0', '99', '41', '3');

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL COMMENT '评论内容',
  `reply_content` varchar(255) NOT NULL COMMENT '回复评论',
  `create_time` int(10) unsigned NOT NULL COMMENT '评论时间',
  `article_id` int(10) unsigned NOT NULL COMMENT '文章id',
  `comment_person` varchar(60) NOT NULL COMMENT '评论人',
  `reply_time` int(10) unsigned NOT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------
INSERT INTO `blog_comment` VALUES ('1', '很好，写的不错！', 'dasd', '1542813001', '20', '王静俊', '0');
INSERT INTO `blog_comment` VALUES ('2', 'liushuaishauishuozaiqi', '好的', '1542813031', '20', '王静俊', '2018');
INSERT INTO `blog_comment` VALUES ('3', '你好，我也坐坐沙发', '', '1542813051', '20', '王静俊', '0');
INSERT INTO `blog_comment` VALUES ('4', '太差劲了', '', '1542813718', '20', '王静俊', '0');
INSERT INTO `blog_comment` VALUES ('5', '哈哈，我来过', '', '1542813774', '20', '王静俊', '0');
INSERT INTO `blog_comment` VALUES ('6', 'haha', '', '1542813835', '20', '王静俊', '0');
INSERT INTO `blog_comment` VALUES ('7', 'dasa', '', '1542813865', '20', '王静俊', '0');
INSERT INTO `blog_comment` VALUES ('8', '丢失', '', '1542816194', '15', '王静俊', '0');
INSERT INTO `blog_comment` VALUES ('9', '1111', '自己评论，自己回复', '1542872886', '16', '刘毛毛', '2018');
INSERT INTO `blog_comment` VALUES ('10', '', '', '1542886414', '18', '刘毛毛', '0');
INSERT INTO `blog_comment` VALUES ('11', '撒大声地', '', '1542886595', '18', '刘毛毛', '0');
INSERT INTO `blog_comment` VALUES ('12', '对方水电费', '', '1542886605', '18', '刘毛毛', '0');

-- ----------------------------
-- Table structure for blog_diary
-- ----------------------------
DROP TABLE IF EXISTS `blog_diary`;
CREATE TABLE `blog_diary` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `portrait` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '日记头像',
  `content` text CHARACTER SET utf8 NOT NULL COMMENT '日记内容',
  `ctime` int(10) unsigned NOT NULL COMMENT '发表日记时间',
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of blog_diary
-- ----------------------------
INSERT INTO `blog_diary` VALUES ('1', '11', 'static/home/images/my_1.jpg', '1时间好像一把尺子，它能衡量奋斗者前进的进程。时间如同一架天平，它能称量奋斗者成果的重量；时间就像一把皮鞭，它能鞭策我们追赶人生的目标。时间犹如一面战鼓，它能激励我们加快前进的脚步。', '1104967295', '1');
INSERT INTO `blog_diary` VALUES ('2', '22', 'static/home/images/my_1.jpg', '2时间好像一把尺子，它能衡量奋斗者前进的进程。时间如同一架天平，它能称量奋斗者成果的重量；时间就像一把皮鞭，它能鞭策我们追赶人生的目标。时间犹如一面战鼓，它能激励我们加快前进的脚步1。', '1194967295', '2');
INSERT INTO `blog_diary` VALUES ('3', '33', 'static/home/images/my_1.jpg', '3时间好像一把尺子，它能衡量奋斗者前进的进程。时间如同一架天平，它能称量奋斗者成果的重量；时间就像一把皮鞭，它能鞭策我们追赶人生的目标。时间犹如一面战鼓，它能激励我们加快前进的脚步。', '1104967295', '1');
INSERT INTO `blog_diary` VALUES ('4', '44dfsvsd', 'static/home/images/my_1.jpg', '4时间好像一把尺子，它能衡量奋斗者前进的进程。时间如同一架天平，它能称量奋斗者成果的重量；时间就像一把皮鞭，它能鞭策我们追赶人生的目标。时间犹如一面战鼓，它能激励我们加快前进的脚步1。', '1542721231', '2');
INSERT INTO `blog_diary` VALUES ('5', '55', 'static/home/images/my_1.jpg', '5时间好像一把尺子，它能衡量奋斗者前进的进程。时间如同一架天平，它能称量奋斗者成果的重量；时间就像一把皮鞭，它能鞭策我们追赶人生的目标。时间犹如一面战鼓，它能激励我们加快前进的脚步。', '1104967295', '2');
INSERT INTO `blog_diary` VALUES ('6', '66', 'static/home/images/my_1.jpg', '6时间好像一把尺子，它能衡量奋斗者前进的进程。时间如同一架天平，它能称量奋斗者成果的重量；时间就像一把皮鞭，它能鞭策我们追赶人生的目标。时间犹如一面战鼓，它能激励我们加快前进的脚步1。', '1194967295', '1');
INSERT INTO `blog_diary` VALUES ('7', '77', 'static/home/images/my_1.jpg', '7时间好像一把尺子，它能衡量奋斗者前进的进程。时间如同一架天平，它能称量奋斗者成果的重量；时间就像一把皮鞭，它能鞭策我们追赶人生的目标。时间犹如一面战鼓，它能激励我们加快前进的脚步。', '1104967295', '2');
INSERT INTO `blog_diary` VALUES ('8', '88', 'static/home/images/my_1.jpg', '8时间好像一把尺子，它能衡量奋斗者前进的进程。时间如同一架天平，它能称量奋斗者成果的重量；时间就像一把皮鞭，它能鞭策我们追赶人生的目标。时间犹如一面战鼓，它能激励我们加快前进的脚步1。', '1194967295', '1');
INSERT INTO `blog_diary` VALUES ('9', '99', 'static/home/images/my_1.jpg', '9时间好像一把尺子，它能衡量奋斗者前进的进程。时间如同一架天平，它能称量奋斗者成果的重量；时间就像一把皮鞭，它能鞭策我们追赶人生的目标。时间犹如一面战鼓，它能激励我们加快前进的脚步。', '1104967295', '2');
INSERT INTO `blog_diary` VALUES ('10', '10', 'static/home/images/my_1.jpg', '10时间好像一把尺子，它能衡量奋斗者前进的进程。时间如同一架天平，它能称量奋斗者成果的重量；时间就像一把皮鞭，它能鞭策我们追赶人生的目标。时间犹如一面战鼓，它能激励我们加快前进的脚步1。', '1194967295', '2');
INSERT INTO `blog_diary` VALUES ('11', '111', 'static/home/images/my_1.jpg', '11时间好像一把尺子，它能衡量奋斗者前进的进程。时间如同一架天平，它能称量奋斗者成果的重量；时间就像一把皮鞭，它能鞭策我们追赶人生的目标。时间犹如一面战鼓，它能激励我们加快前进的脚步。', '1104967295', '1');
INSERT INTO `blog_diary` VALUES ('12', '12', 'static/home/images/my_1.jpg', '12时间好像一把尺子，它能衡量奋斗者前进的进程。时间如同一架天平，它能称量奋斗者成果的重量；时间就像一把皮鞭，它能鞭策我们追赶人生的目标。时间犹如一面战鼓，它能激励我们加快前进的脚步1。', '1194967295', '1');
INSERT INTO `blog_diary` VALUES ('13', '13', 'static/home/images/my_1.jpg', '13时1间好像一把尺子，它能衡量奋斗者前进的进程。时间如同一架天平，它能称量奋斗者成果的重量；时间就像一把皮鞭，它能鞭策我们追赶人生的目标。时间犹如一面战鼓，它能激励我们加快前进的脚步1。', '1194967295', '2');
INSERT INTO `blog_diary` VALUES ('14', '14', 'static/home/images/my_1.jpg', '14时间好像一把尺子，它能衡量奋斗者前进的进程。时间如同一架天平，它能称量奋斗者成果的重量；时间就像一把皮鞭，它能鞭策我们追赶人生的目标。时间犹如一面战鼓，它能激励我们加快前进的脚步。', '1104967295', '1');
INSERT INTO `blog_diary` VALUES ('15', 'dada', 'static/home/images/my_1.jpg', '15时间好像一把尺子，它能衡量奋斗者前进的进程。时间如同一架天平，它能称量奋斗者成果的重量；时间就像一把皮鞭，它能鞭策我们追赶人生的目标。时间犹如一面战鼓，它能激励我们加快前进的脚步1。', '1194967295', '2');
INSERT INTO `blog_diary` VALUES ('16', 'xiaoxiao', 'static/home/images/my_1.jpg', '16时间好像一把尺子，它能衡量奋斗者前进的进程。时间如同一架天平，它能称量奋斗者成果的重量；时间就像一把皮鞭，它能鞭策我们追赶人生的目标。时间犹如一面战鼓，它能激励我们加快前进的脚步。', '1104967295', '1');
INSERT INTO `blog_diary` VALUES ('17', '1222', 'uploads/20180708\\a2c5ee4911dac242619ff8dd221819c3.png', '<span style=\\\"color:#1D1A1A;font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;\\\">随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\\\\\\\\\\\\\\\"XP系统\\\\\\\\\\\\\\\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....</span>', '1531065326', '1');
INSERT INTO `blog_diary` VALUES ('19', '刘帅帅', 'uploads/20181117\\43c3ebd8e1d31d40a3a6a5a7e4dc07cd.jpg', '帅帅来也', '1542467441', '2');

-- ----------------------------
-- Table structure for blog_friendlink
-- ----------------------------
DROP TABLE IF EXISTS `blog_friendlink`;
CREATE TABLE `blog_friendlink` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '友情链接标题',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '链接地址',
  `ctime` int(10) unsigned NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of blog_friendlink
-- ----------------------------
INSERT INTO `blog_friendlink` VALUES ('1', '惠省乐购优惠券大全', 'http://www.ice20.top', '1725256325', '1');
INSERT INTO `blog_friendlink` VALUES ('2', '百度', 'http://www.baidu.com', '1531105462', '1');

-- ----------------------------
-- Table structure for blog_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `blog_knowledge`;
CREATE TABLE `blog_knowledge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '标题',
  `portrait` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '图片',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '简介',
  `content` text CHARACTER SET utf8 NOT NULL COMMENT '内容',
  `ctime` int(10) unsigned NOT NULL,
  `is_recommend` tinyint(1) unsigned NOT NULL COMMENT '是否精选',
  `is_new` tinyint(1) unsigned NOT NULL COMMENT '是否最新',
  `hits` int(10) unsigned NOT NULL COMMENT '阅读次数',
  `author` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '作者',
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of blog_knowledge
-- ----------------------------
INSERT INTO `blog_knowledge` VALUES ('1', '浅谈：html5和html的区别1', 'static/home/images/s.jpg', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '1800002222', '0', '0', '0', 'wang jing jun', '2');
INSERT INTO `blog_knowledge` VALUES ('2', '浅谈：html5和html的区别2', 'static/home/images/s.jpg', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '1800002222', '1', '0', '1', 'wang jing jun', '1');
INSERT INTO `blog_knowledge` VALUES ('3', '浅谈：html5和html的区别3', 'static/home/images/s.jpg', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '1800002222', '0', '0', '1', 'wang jing jun', '2');
INSERT INTO `blog_knowledge` VALUES ('4', '浅谈：html5和html的区别4', 'static/home/images/s.jpg', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '1800002222', '0', '0', '3', 'wang jing jun', '1');
INSERT INTO `blog_knowledge` VALUES ('5', '浅谈：html5和html的区别5', 'static/home/images/s.jpg', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '1800002222', '1', '0', '2', 'wang jing jun', '1');
INSERT INTO `blog_knowledge` VALUES ('6', '浅谈：html5和html的区别6', 'static/home/images/s.jpg', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '1800002222', '0', '0', '0', 'wang jing jun', '2');
INSERT INTO `blog_knowledge` VALUES ('7', '浅谈：html5和html的区别7', 'static/home/images/s.jpg', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '1800002222', '1', '0', '2', 'wang jing jun', '1');
INSERT INTO `blog_knowledge` VALUES ('8', '浅谈：html5和html的区别8', 'static/home/images/s.jpg', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '1800002222', '0', '0', '0', 'wang jing jun', '2');
INSERT INTO `blog_knowledge` VALUES ('9', '浅谈：html5和html的区别9', 'static/home/images/s.jpg', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '1800002222', '1', '0', '1', 'wang jing jun', '1');
INSERT INTO `blog_knowledge` VALUES ('10', '浅谈：html5和html的区别10', 'static/home/images/s.jpg', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '1800002222', '0', '0', '3', 'wang jing jun', '1');
INSERT INTO `blog_knowledge` VALUES ('11', '浅谈：html5和html的区别11', 'static/home/images/s.jpg', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '1800002222', '1', '0', '7', 'wang jing jun', '1');
INSERT INTO `blog_knowledge` VALUES ('12', '浅谈：html5和html的区别12', 'static/home/images/s.jpg', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '1800002222', '0', '1', '0', 'wang jing jun', '2');
INSERT INTO `blog_knowledge` VALUES ('13', '浅谈：html5和html的区别13', 'static/home/images/s.jpg', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '1800002222', '0', '1', '0', 'wang jing jun', '2');
INSERT INTO `blog_knowledge` VALUES ('14', '浅谈：html5和html的区别14', 'static/home/images/s.jpg', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '1800002222', '1', '1', '12', 'wang jing jun', '2');
INSERT INTO `blog_knowledge` VALUES ('15', 'php分页查询', 'static/home/images/s.jpg', '* 分页查询的原理', '<span style=\\\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\\\">* 分页查询的原理</span>\r\n<p style=\\\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:&quot;\\\">\r\n	* 分析分页的原理:\r\n</p>\r\n<p style=\\\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:&quot;\\\">\r\n	* 1. LIMIT 参数的作用: 偏移量与显示数量\r\n</p>\r\n<p style=\\\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:&quot;\\\">\r\n	* 2. 如果控制每页显示的数量\r\n</p>\r\n<p style=\\\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:&quot;\\\">\r\n	* 3. 接收GET参数,用p表示当前页数,每页显示3条\r\n</p>\r\n<p style=\\\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:&quot;\\\">\r\n	* 4. 需要的参数:\r\n</p>\r\n<p style=\\\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:&quot;\\\">\r\n	* (1).totalPage 总页数\r\n</p>\r\n<p style=\\\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:&quot;\\\">\r\n	* (2).totalNumber 一共有多少条数据\r\n</p>\r\n<p style=\\\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:&quot;\\\">\r\n	* (3).pageSize 每页显示多少条数据\r\n</p>\r\n<p style=\\\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:&quot;\\\">\r\n	* (4)currentPage 当前第几页\r\n</p>\r\n<p style=\\\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:&quot;\\\">\r\n	* (5)*.rangeStart 起始页\r\n</p>\r\n<p style=\\\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:&quot;\\\">\r\n	* (6)*.rangeEnd 末页\r\n</p>\r\n<p style=\\\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:&quot;\\\">\r\n	* 5. 当前偏移量的计算公式: (页数-1)*每页显示的数量\r\n</p>\r\n<p style=\\\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:&quot;\\\">\r\n	* offset = (page-1)*num\r\n</p>\r\n<table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" class=\\\"syntaxhighlighter  php ke-zeroborder\\\" style=\\\"font-family:Monaco, Menlo, Consolas, &quot;width:758px;color:#000000;margin:0.3em 0px !important;padding:0px !important;border-collapse:separate !important;background:none #1B2426 !important;border:1px solid #CCCCCC !important;font-size:13px !important;\\\">\r\n	<tbody>\r\n		<tr>\r\n			<td class=\\\"gutter\\\" style=\\\"font-family:Monaco, Menlo, Consolas, &quot;background:none !important;vertical-align:baseline !important;font-size:13px !important;color:#AFAFAF !important;\\\">\r\n				<div class=\\\"line number1 index0 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					1\r\n				</div>\r\n				<div class=\\\"line number2 index1 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					2\r\n				</div>\r\n				<div class=\\\"line number3 index2 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					3\r\n				</div>\r\n				<div class=\\\"line number4 index3 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					4\r\n				</div>\r\n				<div class=\\\"line number5 index4 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					5\r\n				</div>\r\n				<div class=\\\"line number6 index5 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					6\r\n				</div>\r\n				<div class=\\\"line number7 index6 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					7\r\n				</div>\r\n				<div class=\\\"line number8 index7 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					8\r\n				</div>\r\n				<div class=\\\"line number9 index8 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					9\r\n				</div>\r\n				<div class=\\\"line number10 index9 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					10\r\n				</div>\r\n				<div class=\\\"line number11 index10 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					11\r\n				</div>\r\n				<div class=\\\"line number12 index11 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					12\r\n				</div>\r\n				<div class=\\\"line number13 index12 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					13\r\n				</div>\r\n				<div class=\\\"line number14 index13 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					14\r\n				</div>\r\n				<div class=\\\"line number15 index14 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					15\r\n				</div>\r\n				<div class=\\\"line number16 index15 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					16\r\n				</div>\r\n				<div class=\\\"line number17 index16 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					17\r\n				</div>\r\n				<div class=\\\"line number18 index17 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					18\r\n				</div>\r\n				<div class=\\\"line number19 index18 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					19\r\n				</div>\r\n				<div class=\\\"line number20 index19 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					20\r\n				</div>\r\n				<div class=\\\"line number21 index20 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					21\r\n				</div>\r\n				<div class=\\\"line number22 index21 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					22\r\n				</div>\r\n				<div class=\\\"line number23 index22 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					23\r\n				</div>\r\n				<div class=\\\"line number24 index23 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					24\r\n				</div>\r\n				<div class=\\\"line number25 index24 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					25\r\n				</div>\r\n				<div class=\\\"line number26 index25 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					26\r\n				</div>\r\n				<div class=\\\"line number27 index26 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					27\r\n				</div>\r\n				<div class=\\\"line number28 index27 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					28\r\n				</div>\r\n				<div class=\\\"line number29 index28 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					29\r\n				</div>\r\n				<div class=\\\"line number30 index29 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					30\r\n				</div>\r\n				<div class=\\\"line number31 index30 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					31\r\n				</div>\r\n				<div class=\\\"line number32 index31 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					32\r\n				</div>\r\n				<div class=\\\"line number33 index32 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					33\r\n				</div>\r\n				<div class=\\\"line number34 index33 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					34\r\n				</div>\r\n				<div class=\\\"line number35 index34 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					35\r\n				</div>\r\n				<div class=\\\"line number36 index35 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					36\r\n				</div>\r\n				<div class=\\\"line number37 index36 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					37\r\n				</div>\r\n				<div class=\\\"line number38 index37 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					38\r\n				</div>\r\n				<div class=\\\"line number39 index38 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					39\r\n				</div>\r\n				<div class=\\\"line number40 index39 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					40\r\n				</div>\r\n				<div class=\\\"line number41 index40 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					41\r\n				</div>\r\n				<div class=\\\"line number42 index41 alt1\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					42\r\n				</div>\r\n				<div class=\\\"line number43 index42 alt2\\\" style=\\\"margin:0px !important;padding:0px 0.5em 0px 1em !important;text-align:right !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n					43\r\n				</div>\r\n			</td>\r\n			<td class=\\\"code\\\" style=\\\"font-family:Monaco, Menlo, Consolas, &quot;background:none !important;border:0px !important;vertical-align:baseline !important;font-size:13px !important;\\\">\r\n				<div class=\\\"container\\\" style=\\\"margin:0px !important;padding:0px !important;background:none !important;border:0px !important;vertical-align:baseline !important;\\\">\r\n					<div class=\\\"line number1 index0 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						$page= isset($_GET[\\\'p\\\'])?$_GET[\\\'p\\\']:1;\r\n					</div>\r\n					<div class=\\\"line number2 index1 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						$page= ($page== 0 ) ? 1 :$page;\r\n					</div>\r\n					<div class=\\\"line number3 index2 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						$num= 5;\r\n					</div>\r\n					<div class=\\\"line number4 index3 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						$offset= ($page-1)*$num;\r\n					</div>\r\n					<div class=\\\"line number5 index4 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						//1.获取到所有数据,用表格显示出来\r\n					</div>\r\n					<div class=\\\"line number6 index5 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						$pdo=newPDO(\\\'mysql:host=localhost;dbname=php\\\',\\\'root\\\',\\\'root\\\');\r\n					</div>\r\n					<div class=\\\"line number7 index6 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						//$sql = \\\"SELECT id,name,email FROM user1 LIMIT 0,3\\\";\r\n					</div>\r\n					<div class=\\\"line number8 index7 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						$sql=\\\"SELECT `staff_id`,`name`,`sex`,`age`,`salary` FROM `staff` LIMIT :offset, :num\\\";\r\n					</div>\r\n					<div class=\\\"line number9 index8 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						$stmt=$pdo-&gt;prepare($sql);\r\n					</div>\r\n					<div class=\\\"line number10 index9 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						$stmt-&gt;bindParam(\\\':offset\\\',$offset, PDO::PARAM_INT);\r\n					</div>\r\n					<div class=\\\"line number11 index10 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						$stmt-&gt;bindParam(\\\':num\\\',$num, PDO::PARAM_INT);\r\n					</div>\r\n					<div class=\\\"line number12 index11 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						$stmt-&gt;execute();\r\n					</div>\r\n					<div class=\\\"line number13 index12 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						$stmt-&gt;setFetchMode(PDO::FETCH_ASSOC);\r\n					</div>\r\n					<div class=\\\"line number14 index13 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						$res=$stmt-&gt;fetchAll();\r\n					</div>\r\n					<div class=\\\"line number15 index14 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						echo\\\'&lt;h2 align=\\\"center\\\"&gt;员工信息表&lt;/h2&gt;\\\';\r\n					</div>\r\n					<div class=\\\"line number16 index15 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						echo\\\'&lt;table border=\\\"1\\\" cellspacing=\\\"0\\\" cellpadding=\\\"5\\\" width=\\\"70%\\\" align=\\\"center\\\"&gt;\\\';\r\n					</div>\r\n					<div class=\\\"line number17 index16 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						echo\\\'&lt;tr bgcolor=\\\"lightgreen\\\"&gt;&lt;th&gt;ID&lt;/th&gt;&lt;th&gt;用户名&lt;/th&gt;&lt;th&gt;性别&lt;/th&gt;&lt;th&gt;年龄&lt;/th&gt;&lt;th&gt;工资&lt;/th&gt;&lt;/tr&gt;\\\';\r\n					</div>\r\n					<div class=\\\"line number18 index17 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						foreach($resas$row) {\r\n					</div>\r\n					<div class=\\\"line number19 index18 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						&nbsp;&nbsp;&nbsp;&nbsp;echo\\\'&lt;tr align=\\\"center\\\"&gt;\\\';\r\n					</div>\r\n					<div class=\\\"line number20 index19 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						&nbsp;&nbsp;&nbsp;&nbsp;echo\\\'&lt;td&gt;\\\'.$row[\\\'staff_id\\\'].\\\'&lt;/td&gt;&lt;td&gt;\\\'.$row[\\\'name\\\'].\\\'&lt;/td&gt;\\\';\r\n					</div>\r\n					<div class=\\\"line number21 index20 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						&nbsp;&nbsp;&nbsp;&nbsp;$row[\\\'sex\\\'] =$row[\\\'sex\\\']==0 ?\\\'男\\\':\\\'&lt;span style=\\\"color:red\\\"&gt;女&lt;/span&gt;\\\';\r\n					</div>\r\n					<div class=\\\"line number22 index21 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						&nbsp;&nbsp;&nbsp;&nbsp;echo\\\'&lt;td&gt;\\\'.$row[\\\'sex\\\'].\\\'&lt;/td&gt;\\\';\r\n					</div>\r\n					<div class=\\\"line number23 index22 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						&nbsp;&nbsp;&nbsp;&nbsp;echo\\\'&lt;td&gt;\\\'.$row[\\\'age\\\'].\\\'&lt;/td&gt;&lt;td&gt;\\\'.$row[\\\'salary\\\'].\\\'&lt;/td&gt;\\\';\r\n					</div>\r\n					<div class=\\\"line number24 index23 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						&nbsp;&nbsp;&nbsp;&nbsp;echo\\\'&lt;/tr&gt;\\\';\r\n					</div>\r\n					<div class=\\\"line number25 index24 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						}\r\n					</div>\r\n					<div class=\\\"line number26 index25 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						echo\\\'&lt;/table&gt;\\\';\r\n					</div>\r\n					<div class=\\\"line number27 index26 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						//计算共计多少页?\r\n					</div>\r\n					<div class=\\\"line number28 index27 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						$stmt2=$pdo-&gt;prepare(\\\"SELECT * FROM staff\\\");\r\n					</div>\r\n					<div class=\\\"line number29 index28 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						$stmt2-&gt;execute();\r\n					</div>\r\n					<div class=\\\"line number30 index29 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						$totalPage=ceil($stmt2-&gt;rowCount() /$num);\r\n					</div>\r\n					<div class=\\\"line number31 index30 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						$page= ($page==$totalPage) ? ($totalPage-1) :$page;\r\n					</div>\r\n					<div class=\\\"line number32 index31 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						echo\\\'&lt;style&gt;a {margin-left: 10px;text-decoration: none}a:hover{color:red}&lt;/style&gt;\\\';\r\n					</div>\r\n					<div class=\\\"line number33 index32 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						echo\\\'&lt;h3 align=\\\"center\\\"&gt;\\\';\r\n					</div>\r\n					<div class=\\\"line number34 index33 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						echo\\\'&lt;a href=\\\"http://php.io/0427/page.php?p=1\\\"&gt;首页&lt;/a&gt;\\\';\r\n					</div>\r\n					<div class=\\\"line number35 index34 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						echo\\\'&lt;a href=\\\"http://php.io/0427/page.php?p=\\\';\r\n					</div>\r\n					<div class=\\\"line number36 index35 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						echo(($page-1)==0)?1:($page-1);\r\n					</div>\r\n					<div class=\\\"line number37 index36 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						echo\\\'\\\"&gt;上一页&lt;/a&gt;\\\';\r\n					</div>\r\n					<div class=\\\"line number38 index37 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						for($i=1;$i&lt;=$totalPage;$i++) {\r\n					</div>\r\n					<div class=\\\"line number39 index38 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						&nbsp;&nbsp;&nbsp;&nbsp;echo\\\'&lt;a href=\\\"http://php.io/0427/page.php?p=\\\'.$i.\\\'\\\"&gt;\\\'.$i.\\\'&lt;/a&gt;\\\';\r\n					</div>\r\n					<div class=\\\"line number40 index39 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						}\r\n					</div>\r\n					<div class=\\\"line number41 index40 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						echo\\\'&lt;a href=\\\"http://php.io/0427/page.php?p=\\\'.($page+1).\\\'\\\"&gt;下一页&lt;/a&gt;\\\';\r\n					</div>\r\n					<div class=\\\"line number42 index41 alt1\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						echo\\\'&lt;a href=\\\"http://php.io/0427/page.php?p=\\\'.$totalPage.\\\'\\\"&gt;尾页&lt;/a&gt;\\\';\r\n					</div>\r\n					<div class=\\\"line number43 index42 alt2\\\" style=\\\"margin:0px !important;padding:0px 1em !important;vertical-align:baseline !important;color:#B9BDB6 !important;\\\">\r\n						echo\\\'&lt;/h3&gt;\\\';\r\n					</div>\r\n				</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '1531116824', '1', '1', '13', 'wang jing jun', '1');
INSERT INTO `blog_knowledge` VALUES ('16', '浅谈：html5和html的区别16', 'static/home/images/s.jpg', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....最近看群里聊天聊得最火热的莫过于手机网站和html5这两个词。可能有人会问，这两者有什么关系呢？随着这移动互联 网快速发展的时代，尤其是4G时代已经来临的时刻，加上微软对\"XP系统\"不提供更新补丁、维护的情况下。 html5+css3也逐渐的成为新一代web前端技术.....', '1800002222', '0', '1', '6', 'wang jing jun', '2');
INSERT INTO `blog_knowledge` VALUES ('20', 'php类魔术方法', 'uploads/20180722\\05a9881420bd11e482d202a662bb3f87.jpg', ' 通过一个案例， 来看看在Android 中该如何实现滑动效果。 定义一个View， 并置于一个LinearLayout 中， 实现一个简单布局， 代码如下：* 1.类魔术方法:__get(),__set()实现属性查询器和设置器', '通过一个案例， 来看看在Android 中该如何实现滑动效果。 定义一个View， 并置于一个LinearLayout 中， 实现一个简单布局， 代码如下：* 1.类魔术方法:__get(),__set()实现属性查询器和设置器', '1532264227', '1', '1', '53', '毛毛', '1');
INSERT INTO `blog_knowledge` VALUES ('18', '带你玩转PHP命名空间', 'uploads/20181118\\2ce44b380cefd20c8e7b490f1cf86368.jpg', '* 命名空间', '<span style=\"font-family:\" font-size:14px;background-color:#ffffff;\"=\"\">* 命名空间</span> \r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 先理解一个重要概念:代码复用\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 我们学习面向对象编程的终极目标是什么? \\\\\\\\\\\\\\\"代码复用\\\\\\\\\\\\\\\"\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 一、彻底理解代码复用机制?\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* **到目前为止,我们已经学到的代码复用的实现手段\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 1. 函数: 代码复用最简单的方式;\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 2. 类与对象:将函数与它可能用到的数据封装到一起;\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 3. trait与接口:一种特殊的类,本质是仍是函数与数据的封装;\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 4. 常量:因为常量具有一旦定义不可修改性,可以做到一次声明,随处调用,而值不会发生变化\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 二、彻底理解什么是全局?\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 1.全局其它就是指当前脚本,是不能跨脚本的,更不是指整个项目\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 2.全局与局部是一对双胞胎兄弟,他们有一个共同的亲爹:作用域,都由它管着\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 三、彻底理解php脚本中有哪些成员?\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 1.变量:包括系统预置变量与用户自定义变量;\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 2.常量:包括系统预置常量,用户自定义常量;\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 3.函数:包括匿名函数/函数表达式/自执行函数;\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 4.类与对象:包括抽象类,接口,trait;\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 三、彻底理解什么是作用域?\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	******作用域主要是针对变量\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	*****PHP中的变量有三种作用域: 函数作用域,全局作用域,超全局作用哉;\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 1. 全局作用域: 在函数外部声明,在函数内部不能直接使用\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 注: 函数中使用全局变量必须用global声明,或者使用超全局数组:$GLOBALS\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 2. 函数作用域:也就是局部作用域,包括函数的参数以及函数内声明的变量,离开函数则自动清除;\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 3. 超全局作用域: 除了在全局有效外,在函数内也可以不用声明直接使用\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 四、为什么要使用命名空间?\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 1.类,函数,常量都是全局有效,包括在函数中也可以直接使用.\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 2.因此,在全局中不允许有重名的类,函数和常量。\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 3.如果想从外部导入一个函数库或类库,他们的函数名,类名极有可能与当前脚本冲突\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 4.所以,必须要有一套对于工作在全局范围内的脚本成员,进行标识符命名冲突处理的机制。\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 5.命名空间就是这样一套解决方案,他不仅可以让用户为全局成员起一个较短的名称,又解决了\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 第三方资源的引入带来的重名问题。\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 6.在没有使用任何命名空间的情部下,所有类,常量,函数全部声明在全局空间,用\\\\\\\\\\\\\\\\表,现在我们在\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 他们之前加上反斜线\\\\\\\\\\\\\\\\之外,你会发现,执行结果也是正确的.\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 声明类,常量,函数的时候,前面不需要添加\\\\\\\\\\\\\\\\,调用的时候才需要添加\\\\\\\\\\\\\\\\\r\n</p>\r\n<p style=\"color:#3D464D;font-size:16px;background:#EEEEEE;font-family:;\">\r\n	* 命名空间非常重要,如果不能彻底掌握,将会成为你以后学习的最大障碍!!!\r\n</p>', '1542548638', '1', '0', '32', 'jj', '2');
INSERT INTO `blog_knowledge` VALUES ('22', 'ThinkPHP 图片上传 改路径上传', 'uploads/20180722\\e7e9b213b566f87fee61305fa505fe78.jpg', 'ThinkPHP 图片上传 改路径上传', '<article>\r\n		<div id=\\\"article_content\\\" class=\\\"article_content clearfix csdn-tracking-statistics\\\" data-pid=\\\"blog\\\" data-mod=\\\"popu_307\\\" data-dsm=\\\"post\\\">\r\n                    <link rel=\\\"stylesheet\\\" href=\\\"https://csdnimg.cn/release/phoenix/template/css/ck_htmledit_views-e2445db1a8.css\\\">\r\n						<div class=\\\"htmledit_views\\\">\r\n                \r\n<p><strong>此为ajax异步上传</strong></p>\r\n<p><strong>首先是form表单里的代码</strong></p>\r\n<p></p>\r\n<pre onclick=\\\"hljs.copyCode(event)\\\"><code class=\\\"language-html hljs xml\\\"><ol class=\\\"hljs-ln\\\" style=\\\"width:1047px\\\"><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"1\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">Photo:<span class=\\\"hljs-tag\\\">&lt;<span class=\\\"hljs-name\\\">input</span> <span class=\\\"hljs-attr\\\">type</span>=<span class=\\\"hljs-string\\\">\\\"file\\\"</span> <span class=\\\"hljs-attr\\\">name</span>=<span class=\\\"hljs-string\\\">\\\"photo\\\"</span> <span class=\\\"hljs-attr\\\">id</span>=<span class=\\\"hljs-string\\\">\\\"up_photo\\\"</span>&gt;</span><span class=\\\"hljs-tag\\\">&lt;<span class=\\\"hljs-name\\\">br</span>&gt;</span></div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"2\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">      <span class=\\\"hljs-tag\\\">&lt;<span class=\\\"hljs-name\\\">input</span> <span class=\\\"hljs-attr\\\">type</span>=<span class=\\\"hljs-string\\\">\\\"hidden\\\"</span> <span class=\\\"hljs-attr\\\">name</span>=<span class=\\\"hljs-string\\\">\\\"thumb\\\"</span> <span class=\\\"hljs-attr\\\">value</span>=<span class=\\\"hljs-string\\\">\\\"\\\"</span> <span class=\\\"hljs-attr\\\">id</span>=<span class=\\\"hljs-string\\\">\\\"thumb\\\"</span>&gt;</span><span class=\\\"hljs-tag\\\">&lt;<span class=\\\"hljs-name\\\">br</span>&gt;</span>  //这里是为了获取图片的名称</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"3\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">      <span class=\\\"hljs-tag\\\">&lt;<span class=\\\"hljs-name\\\">img</span> <span class=\\\"hljs-attr\\\">src</span>=<span class=\\\"hljs-string\\\">\\\"\\\"</span> <span class=\\\"hljs-attr\\\">style</span>=<span class=\\\"hljs-string\\\">\\\"display:none\\\"</span> <span class=\\\"hljs-attr\\\">id</span>=<span class=\\\"hljs-string\\\">\\\"img_thumb\\\"</span> <span class=\\\"hljs-attr\\\">width</span>=<span class=\\\"hljs-string\\\">\\\"150\\\"</span> <span class=\\\"hljs-attr\\\">height</span>=<span class=\\\"hljs-string\\\">\\\"180\\\"</span>&gt;</span><span class=\\\"hljs-tag\\\">&lt;<span class=\\\"hljs-name\\\">br</span>&gt;</span>  //先隐藏，然后点击上传后会显示一张预览图，后有详细解释</div></div></li></ol></code><div class=\\\"hljs-button\\\" data-title=\\\"复制\\\"></div></pre><br><strong>ajax代码</strong>\r\n<p></p>\r\n<p></p>\r\n<pre onclick=\\\"hljs.copyCode(event)\\\"><code class=\\\"language-html hljs xml\\\"><ol class=\\\"hljs-ln\\\"><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"1\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">$(\\\"#up_photo\\\").on(\\\"change\\\",function(){</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"2\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                    //用html方式上传</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"3\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                    var cont=new FormData($(\\\"#frmlogin\\\")[0]); //转换成DOM方法</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"4\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                    $.ajax({</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"5\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                      url:\\\"{:U(\\\'Index/ajax_upload\\\')}\\\",       //跳转至控制器</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"6\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                      type:\\\"POST\\\",</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"7\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                      data:cont,</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"8\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                      dataType:\\\"JSON\\\",</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"9\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                      cache:false,</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"10\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                      processData:false,</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"11\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                      contentType:false,</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"12\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                      success:function(data){</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"13\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                          if (data.status) {</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"14\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                              $(\\\"#img_thumb\\\").attr(\\\'src\\\',\\\"./upload/\\\" +data.msg);</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"15\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                              $(\\\"#img_thumb\\\").show();      //显示预览图</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"16\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                              $(\\\"#img_thumb\\\").val(\\\"./upload\\\" +data.msg);</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"17\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                          }else{</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"18\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                              dialog.error(data.msg);</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"19\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                          }</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"20\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                      },</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"21\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">                    });</div></div></li></ol></code><div class=\\\"hljs-button\\\" data-title=\\\"复制\\\"></div></pre><strong>控制器代码</strong>\r\n<p></p>\r\n<p></p>\r\n<pre onclick=\\\"hljs.copyCode(event)\\\"><code class=\\\"language-php hljs\\\"><ol class=\\\"hljs-ln\\\"><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"1\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\"> <span class=\\\"hljs-keyword\\\">public</span> <span class=\\\"hljs-function\\\"><span class=\\\"hljs-keyword\\\">function</span> <span class=\\\"hljs-title\\\">ajax_upload</span><span class=\\\"hljs-params\\\">()</span></span>{</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"2\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">          $upload=<span class=\\\"hljs-keyword\\\">new</span> \\\\Think\\\\Upload();</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"3\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">          $upload-&gt;maxSize=<span class=\\\"hljs-number\\\">3145728</span>;</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"4\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">          $upload-&gt;exts=<span class=\\\"hljs-keyword\\\">array</span>(<span class=\\\"hljs-string\\\">\\\'jpg\\\'</span>,<span class=\\\"hljs-string\\\">\\\'gif\\\'</span>,<span class=\\\"hljs-string\\\">\\\'png\\\'</span>,<span class=\\\"hljs-string\\\">\\\'jpeg\\\'</span>);</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"5\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">          $upload-&gt;rootPath=<span class=\\\"hljs-string\\\">\\\"./upload/\\\"</span>;</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"6\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">          $upload-&gt;savePath=<span class=\\\"hljs-string\\\">\\\'images/\\\'</span>;</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"7\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">          $upload-&gt;autoSub=<span class=\\\"hljs-keyword\\\">false</span>;</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"8\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">          </div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"9\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">          $info=$upload-&gt;upload();</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"10\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\"> </div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"11\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">          <span class=\\\"hljs-keyword\\\">if</span>($info){</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"12\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">            $file=$info[<span class=\\\"hljs-string\\\">\\\'photo\\\'</span>][<span class=\\\"hljs-string\\\">\\\'savepath\\\'</span>].$info[<span class=\\\"hljs-string\\\">\\\'photo\\\'</span>][<span class=\\\"hljs-string\\\">\\\'savename\\\'</span>];</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"13\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">            <span class=\\\"hljs-keyword\\\">return</span> show_ajax(<span class=\\\"hljs-number\\\">1</span>,$file);</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"14\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">          }<span class=\\\"hljs-keyword\\\">else</span>{</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"15\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">            <span class=\\\"hljs-keyword\\\">return</span> show_ajax(<span class=\\\"hljs-number\\\">0</span>,$upload-&gt;getError());</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"16\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">          }</div></div></li><li><div class=\\\"hljs-ln-numbers\\\"><div class=\\\"hljs-ln-line hljs-ln-n\\\" data-line-number=\\\"17\\\"></div></div><div class=\\\"hljs-ln-code\\\"><div class=\\\"hljs-ln-line\\\">    }</div></div></li></ol></code><div class=\\\"hljs-button\\\" data-title=\\\"复制\\\"></div></pre><strong>效果图</strong><br><img src=\\\"https://img-blog.csdn.net/20170923120541935?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvR19vX25fZw==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast\\\" alt=\\\"\\\"><br><br><p></p>\r\n            </div>\r\n                </div>\r\n				\r\n        	</article>', '1532266900', '0', '0', '22', 'mm', '1');
INSERT INTO `blog_knowledge` VALUES ('24', '刘帅帅', 'uploads/20181117\\31776b00495d7aac7be996dd2bc0ad5b.jpg', 'adasdaasdad', 'scdfszfghfghfghjgk', '1542467924', '0', '0', '89', 'add多多', '2');

-- ----------------------------
-- Table structure for blog_log
-- ----------------------------
DROP TABLE IF EXISTS `blog_log`;
CREATE TABLE `blog_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL,
  `login_time` int(10) unsigned NOT NULL,
  `logout_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_log
-- ----------------------------
INSERT INTO `blog_log` VALUES ('1', 'wangjingjun', '0', '1531107800');
INSERT INTO `blog_log` VALUES ('2', 'wangjingjun', '1531107824', '0');
INSERT INTO `blog_log` VALUES ('3', 'wangjingjun', '1531112667', '0');
INSERT INTO `blog_log` VALUES ('4', 'wangjingjun', '1531135005', '0');
INSERT INTO `blog_log` VALUES ('5', 'wangjingjun', '1532264199', '0');
INSERT INTO `blog_log` VALUES ('6', 'wangjingjun', '1542440267', '0');
INSERT INTO `blog_log` VALUES ('7', 'wangjingjun', '0', '1542441232');
INSERT INTO `blog_log` VALUES ('8', 'wangjingjun', '1542441323', '0');
INSERT INTO `blog_log` VALUES ('9', 'wangjingjun', '0', '1542444867');
INSERT INTO `blog_log` VALUES ('10', 'lss', '1542444912', '0');
INSERT INTO `blog_log` VALUES ('11', 'lss', '0', '1542445164');
INSERT INTO `blog_log` VALUES ('12', 'lss', '1542445872', '0');
INSERT INTO `blog_log` VALUES ('13', 'lss', '0', '1542446342');
INSERT INTO `blog_log` VALUES ('14', 'lss', '1542446358', '0');
INSERT INTO `blog_log` VALUES ('15', 'lss', '0', '1542464412');
INSERT INTO `blog_log` VALUES ('16', 'lss', '1542464430', '0');
INSERT INTO `blog_log` VALUES ('17', 'lss', '0', '1542465191');
INSERT INTO `blog_log` VALUES ('18', 'lss', '1542465273', '0');
INSERT INTO `blog_log` VALUES ('19', 'lss', '0', '1542465845');
INSERT INTO `blog_log` VALUES ('20', 'lss', '1542465862', '0');
INSERT INTO `blog_log` VALUES ('21', 'lss', '1542543330', '0');
INSERT INTO `blog_log` VALUES ('22', 'lss', '1542641731', '0');
INSERT INTO `blog_log` VALUES ('23', 'wjj', '1542644456', '0');
INSERT INTO `blog_log` VALUES ('24', 'lss', '1542675007', '0');
INSERT INTO `blog_log` VALUES ('25', 'lss', '1542716613', '0');
INSERT INTO `blog_log` VALUES ('26', 'lss', '0', '1542720712');
INSERT INTO `blog_log` VALUES ('27', 'lss', '1542721159', '0');
INSERT INTO `blog_log` VALUES ('28', 'lss', '0', '1542722794');
INSERT INTO `blog_log` VALUES ('29', 'lss', '1542722841', '0');
INSERT INTO `blog_log` VALUES ('30', 'lss', '0', '1542722850');
INSERT INTO `blog_log` VALUES ('31', 'lss', '1542724702', '0');
INSERT INTO `blog_log` VALUES ('32', 'lss', '1542787693', '0');
INSERT INTO `blog_log` VALUES ('33', 'lss', '1542811211', '0');
INSERT INTO `blog_log` VALUES ('34', 'lss', '1542872275', '0');
INSERT INTO `blog_log` VALUES ('35', 'lss', '0', '1542875502');
INSERT INTO `blog_log` VALUES ('36', 'lss', '1542875538', '0');
INSERT INTO `blog_log` VALUES ('37', 'lss', '0', '1542886585');
INSERT INTO `blog_log` VALUES ('38', 'lss', '1542886843', '0');
INSERT INTO `blog_log` VALUES ('39', 'lss', '1542893791', '0');
INSERT INTO `blog_log` VALUES ('40', 'lss', '1542960382', '0');
INSERT INTO `blog_log` VALUES ('41', 'wangjingjun', '1542970547', '0');
INSERT INTO `blog_log` VALUES ('42', 'wangjingjun', '0', '1542972767');
INSERT INTO `blog_log` VALUES ('43', 'lss', '1542972896', '0');
INSERT INTO `blog_log` VALUES ('44', 'lss', '0', '1542972954');
INSERT INTO `blog_log` VALUES ('45', 'wangjingjun', '1542972969', '0');
INSERT INTO `blog_log` VALUES ('46', 'wangjingjun', '0', '1542972974');
INSERT INTO `blog_log` VALUES ('47', 'lss', '1542972993', '0');
INSERT INTO `blog_log` VALUES ('48', 'lss', '0', '1542973404');
INSERT INTO `blog_log` VALUES ('49', 'lss', '1542980873', '0');
INSERT INTO `blog_log` VALUES ('50', 'lss', '0', '1542982974');
INSERT INTO `blog_log` VALUES ('51', '123456', '1542983383', '0');
INSERT INTO `blog_log` VALUES ('52', '123456', '1542983563', '0');
INSERT INTO `blog_log` VALUES ('53', '123456', '1542983897', '0');
INSERT INTO `blog_log` VALUES ('54', 'lss', '1542984024', '0');
INSERT INTO `blog_log` VALUES ('55', 'lss', '0', '1542984138');
INSERT INTO `blog_log` VALUES ('56', '123456', '1542984152', '0');
INSERT INTO `blog_log` VALUES ('57', '123456', '0', '1542984552');
INSERT INTO `blog_log` VALUES ('58', '123456', '1542984568', '0');
INSERT INTO `blog_log` VALUES ('59', '123456', '0', '1542984861');
INSERT INTO `blog_log` VALUES ('60', '11111', '1542984927', '0');
INSERT INTO `blog_log` VALUES ('61', '11111', '0', '1542985173');
INSERT INTO `blog_log` VALUES ('62', '11111', '1542985186', '0');
INSERT INTO `blog_log` VALUES ('63', '11111', '0', '1542986119');
INSERT INTO `blog_log` VALUES ('64', '22222', '1542986141', '0');
INSERT INTO `blog_log` VALUES ('65', '22222', '0', '1542987236');
INSERT INTO `blog_log` VALUES ('66', '22222', '1542987267', '0');
INSERT INTO `blog_log` VALUES ('67', '22222', '1543028795', '0');
INSERT INTO `blog_log` VALUES ('68', '22222', '0', '1543070308');
INSERT INTO `blog_log` VALUES ('69', 'wangjingjun', '1543070321', '0');
INSERT INTO `blog_log` VALUES ('70', 'wangjingjun', '0', '1543070791');
INSERT INTO `blog_log` VALUES ('71', 'wangjingjun', '1543070805', '0');
INSERT INTO `blog_log` VALUES ('72', 'wangjingjun', '0', '1543072546');
INSERT INTO `blog_log` VALUES ('73', 'lss', '1543072558', '0');
INSERT INTO `blog_log` VALUES ('74', 'lss', '0', '1543072762');
INSERT INTO `blog_log` VALUES ('75', 'wangjingjun', '1543072772', '0');
INSERT INTO `blog_log` VALUES ('76', 'wangjingjun', '0', '1543072801');
INSERT INTO `blog_log` VALUES ('77', 'lss', '1543072820', '0');
INSERT INTO `blog_log` VALUES ('78', 'lss', '0', '1543072907');
INSERT INTO `blog_log` VALUES ('79', 'wangjingjun', '1543072932', '0');
INSERT INTO `blog_log` VALUES ('80', 'wangjingjun', '0', '1543072966');
INSERT INTO `blog_log` VALUES ('81', 'lss', '1543072997', '0');

-- ----------------------------
-- Table structure for blog_msg
-- ----------------------------
DROP TABLE IF EXISTS `blog_msg`;
CREATE TABLE `blog_msg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_user` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '留言用户',
  `email` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '留言邮箱',
  `content` text CHARACTER SET utf8 NOT NULL COMMENT '留言内容',
  `is_reply` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否回复留言',
  `ctime` int(10) unsigned NOT NULL COMMENT '留言时间',
  `user_id` int(10) NOT NULL,
  `reply_content` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of blog_msg
-- ----------------------------
INSERT INTO `blog_msg` VALUES ('1', 'admin', '18813967628@163.com', '我我我我我我我', '0', '1200222202', '2', '');
INSERT INTO `blog_msg` VALUES ('2', 'tomshu', '1748616485@qq.com', '你好，我是小小，很高兴认识你', '0', '1200222202', '2', '');
INSERT INTO `blog_msg` VALUES ('3', 'qsssss', '18813967628@163.com', '你好jjhb', '0', '1200222202', '1', '');
INSERT INTO `blog_msg` VALUES ('4', 'qsssss', '18813967628@163.com', '你好jjhb', '0', '1200222202', '1', '');
INSERT INTO `blog_msg` VALUES ('5', 'admin', '18813967628@163.com', '你好，补鞥', '1', '1200222202', '1', '');
INSERT INTO `blog_msg` VALUES ('6', 'admin123', '18813967628@163.com', '你好jjhb', '1', '1200222202', '2', '');
INSERT INTO `blog_msg` VALUES ('7', 'wangjingjun', '18813967628@163.com', 'nihao,wosss', '0', '1200222202', '2', '');
INSERT INTO `blog_msg` VALUES ('8', 'wangxx', '18813967628@163.com', '我给你留言了', '1', '1200222202', '1', '');
INSERT INTO `blog_msg` VALUES ('9', 'admin', '18813967628@163.com', 'ddddd', '0', '0', '2', '');
INSERT INTO `blog_msg` VALUES ('10', 'admin123', '1748616485@qq.com', '你好啊，小鸡鸡', '0', '0', '1', '');
INSERT INTO `blog_msg` VALUES ('11', 'tomshu', '18813967628@163.com', 'nihao,xiaoxiao', '0', '1531066872', '2', '');
INSERT INTO `blog_msg` VALUES ('12', 'zjq43', '1083988776@qq.com', '你好，我叫刘帅帅', '1', '1542423583', '2', '刘大山');
INSERT INTO `blog_msg` VALUES ('13', '刘帅帅给自己留言', '1748616485@qq.com', '我来留言了', '1', '1542717928', '2', '年后');

-- ----------------------------
-- Table structure for blog_nav
-- ----------------------------
DROP TABLE IF EXISTS `blog_nav`;
CREATE TABLE `blog_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nav_name` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT '导航名',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL,
  `c` varchar(60) CHARACTER SET utf8 NOT NULL,
  `a` varchar(60) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of blog_nav
-- ----------------------------
INSERT INTO `blog_nav` VALUES ('1', '首页', 'home/index/index', 'index', 'index');
INSERT INTO `blog_nav` VALUES ('2', '关于我', 'home/index/about', 'index', 'about');
INSERT INTO `blog_nav` VALUES ('3', '视频收藏', 'home/index/shuo', 'index', 'shuo');
INSERT INTO `blog_nav` VALUES ('4', '个人日记', 'home/index/riji', 'index', 'riji');
INSERT INTO `blog_nav` VALUES ('5', '相册展示', 'home/index/xc', 'index', 'xc');
INSERT INTO `blog_nav` VALUES ('6', '学无止境', 'home/index/learn', 'index', 'learn');
INSERT INTO `blog_nav` VALUES ('7', '留言板', 'home/index/guestbook', 'index', 'guestbook');

-- ----------------------------
-- Table structure for blog_pics
-- ----------------------------
DROP TABLE IF EXISTS `blog_pics`;
CREATE TABLE `blog_pics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pic_name` varchar(255) NOT NULL COMMENT '图片名称',
  `description` varchar(255) NOT NULL COMMENT '相片描述',
  `pic_url` text NOT NULL COMMENT '相册图片路径',
  `ctime` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_pics
-- ----------------------------
INSERT INTO `blog_pics` VALUES ('1', '毕业啦', '毕业啦毕业啦毕业啦毕业啦', 'static/home/images/photo/1.jpg', '1400000000', '1');
INSERT INTO `blog_pics` VALUES ('2', '可爱的我们', '可爱的我们可爱的我们可爱的我们可爱的我们可爱的我们可爱的我们可爱的我们可爱的我们可爱的我们可爱的我们可爱的我们可爱的我们可爱的我们可爱的我们可爱的我们可爱的我们可爱的我们可爱的我们可爱的我们', 'static/home/images/photo/2.jpg', '1400000000', '2');
INSERT INTO `blog_pics` VALUES ('3', '我们毕业了', '这是照片描述', 'static/home/images/photo/3.jpg', '1400000000', '1');
INSERT INTO `blog_pics` VALUES ('4', '学霸的世界你不懂', '123456', 'static/home/images/photo/4.jpg', '1400000000', '1');
INSERT INTO `blog_pics` VALUES ('5', '广智和我', '123456', 'static/home/images/photo/7.jpg', '1400000000', '2');
INSERT INTO `blog_pics` VALUES ('6', '逗比的我', '123456', 'static/home/images/photo/8.jpg', '1400000000', '1');
INSERT INTO `blog_pics` VALUES ('7', '最佳舍友', '123456', 'static/home/images/photo/5.jpg', '1400000000', '2');
INSERT INTO `blog_pics` VALUES ('8', '最佳拍档', '123456', 'static/home/images/photo/6.jpg', '1400000000', '1');
INSERT INTO `blog_pics` VALUES ('9', '宋老师好开心啊', '123456', 'static/home/images/photo/9.jpg', '1400000000', '2');
INSERT INTO `blog_pics` VALUES ('10', '我们在聚餐', '123456', 'static/home/images/photo/10.jpg', '1400000000', '1');
INSERT INTO `blog_pics` VALUES ('11', '彪哥毕业了', '123456', 'static/home/images/photo/11.jpg', '1400000000', '1');
INSERT INTO `blog_pics` VALUES ('12', '我也会游泳', '123456', 'static/home/images/photo/14.jpg', '1400000000', '2');
INSERT INTO `blog_pics` VALUES ('13', '装着已经毕业的样子', '123456', 'static/home/images/photo/15.jpg', '1400000000', '2');
INSERT INTO `blog_pics` VALUES ('14', '青蛙要上岸了', '123456', 'static/home/images/photo/13.jpg', '1400000000', '2');
INSERT INTO `blog_pics` VALUES ('15', '三人行', '123456', 'static/home/images/photo/12.jpg', '1400000000', '2');
INSERT INTO `blog_pics` VALUES ('16', '自拍自恋', '123456', 'static/home/images/photo/18.jpg', '1400000000', '1');
INSERT INTO `blog_pics` VALUES ('17', '我的奖状呢？', '123456', 'static/home/images/photo/19.jpg', '1400000000', '2');
INSERT INTO `blog_pics` VALUES ('18', '这是干嘛的？', '123456', 'static/home/images/photo/17.jpg', '1400000000', '1');
INSERT INTO `blog_pics` VALUES ('19', '我还在装毕业', '123456', 'static/home/images/photo/16.jpg', '1400000000', '1');
INSERT INTO `blog_pics` VALUES ('20', '臭表妹有了男朋友就没有我了', '123456', 'static/home/images/photo/22.jpg', '1400000000', '2');
INSERT INTO `blog_pics` VALUES ('21', '这是从哪里来的额', '123456', 'static/home/images/photo/21.jpg', '1400000000', '2');
INSERT INTO `blog_pics` VALUES ('22', '创业之星有我们', '123456', 'static/home/images/photo/20.jpg', '1400000000', '2');
INSERT INTO `blog_pics` VALUES ('23', '笨雅琪好漂亮的', '123456', 'static/home/images/photo/23.jpg', '1400000000', '1');
INSERT INTO `blog_pics` VALUES ('24', '哇哇哇……', '123456', 'static/home/images/photo/24.jpg', '1400000000', '1');
INSERT INTO `blog_pics` VALUES ('25', 'xxxxxxxxxxxxx1', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'uploads/20180708\\aa6c692e74979e5ea1af6fafedf64bd5.png', '1531065250', '1');
INSERT INTO `blog_pics` VALUES ('26', 'aaa飒飒', 'aaaaa', 'uploads/20181122\\eccb972a182bfdbd0b5cd79f71861a8f.png', '1542893890', '2');
INSERT INTO `blog_pics` VALUES ('29', '我在测试', '123456789 啊啊是否对去阿达的 收到1 啊', 'uploads/20181123\\7397dbdfcfde4f46c3d8c90da7f85c35.png', '1542987210', '5');
INSERT INTO `blog_pics` VALUES ('28', '111', '本人刘帅帅', 'uploads/20181118\\e5455005579d57f8b676af2f8cfb81d4.jpg', '1542471841', '2');

-- ----------------------------
-- Table structure for blog_set
-- ----------------------------
DROP TABLE IF EXISTS `blog_set`;
CREATE TABLE `blog_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '名称',
  `value` varchar(255) NOT NULL COMMENT '值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_set
-- ----------------------------
INSERT INTO `blog_set` VALUES ('1', 'wangxiaoxiao', 'jj');
INSERT INTO `blog_set` VALUES ('2', '', '');
INSERT INTO `blog_set` VALUES ('3', '', '');
INSERT INTO `blog_set` VALUES ('4', '', '');
INSERT INTO `blog_set` VALUES ('5', '', '');
INSERT INTO `blog_set` VALUES ('6', '', '');
INSERT INTO `blog_set` VALUES ('7', 'v001', 'v002');
INSERT INTO `blog_set` VALUES ('8', '', '');
INSERT INTO `blog_set` VALUES ('9', 'wxx', 'ddd');

-- ----------------------------
-- Table structure for blog_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '我的用户id',
  `real_name` varchar(60) CHARACTER SET utf8 NOT NULL,
  `name` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '博主姓名',
  `password` varchar(32) CHARACTER SET utf8 NOT NULL,
  `position` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '职位',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '博主简介',
  `content` text CHARACTER SET utf8 NOT NULL COMMENT '关于博主内容描述',
  `qq` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT 'qq',
  `portrait` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '博主头像',
  `saying` varchar(100) CHARACTER SET utf8 NOT NULL,
  `last_login` int(10) unsigned NOT NULL COMMENT '上一次登录时间',
  `wechat` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '个人微信',
  `phone` char(11) CHARACTER SET utf8 NOT NULL COMMENT '电话号码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of blog_user
-- ----------------------------
INSERT INTO `blog_user` VALUES ('1', '刘瞎子', 'wangjingjun', 'e10adc3949ba59abbe56e057f20f883e', 'web后端、视觉设计', '博主很懒，暂时没有简介', '<span>1、前端技术HTML、DIV+CSS、并且具备bootstrap制作经验</span><br />\r\n<span>2、对页面交互效果JavaScript、jQuery、Ajax、Json有手动编写能力；</span><br />\r\n<span>3、擅长PHP+MySQL+APCACHE项目开发；</span><br />\r\n<span>4、熟练THINKPHP框架快速开发网站项目，了解其他流行框架，SMARTY</span><br />\r\n<span>5、具备对大数据处理优化能力，包括数据库的索引，事务处理</span><br />\r\n<span>6、熟悉ECSHOP整站开发，并能二次开发；</span><br />\r\n<span>7、具备编写接口能力与对第三方接口开发和对接能力</span><br />\r\n<span>8、具有微信公众号客户端项目开发经验</span><br />', '1748616485', 'uploads/20181117\\e6dc940af2a6b1a464d751f00cd26a47.png', '人生并不像火车要通过每个站似的经过每一个生活阶段。人生总是直向前行走，从不留下什么', '1543072966', 'abc1748616485', '110');
INSERT INTO `blog_user` VALUES ('2', '刘毛毛', 'lss', 'e10adc3949ba59abbe56e057f20f883e', 'web前端、视觉设计', '刘帅帅很懒，你知道吗？', '<ol class=\\\"\\\\&quot;custom_cn\\\" para-list=\\\"\\\" list-paddingleft-1\\\\\\\"=\\\"\\\" style=\\\"\\\\&quot;color:#333333;font-family:arial,\\\" 宋体,=\\\"\\\" sans-serif;background-color:#ffffff;\\\\\\\"=\\\"\\\">\r\n	<li class=\\\"\\\\&quot;list-cn-1-1\\\" list-cn-paddingleft-1\\\\\\\"=\\\"\\\">\r\n<div class=\\\"\\\\&quot;para\\\\&quot;\\\" style=\\\"font-size:14px;margin-left:30px;\\\">\r\n	掌握各种修图软件，如PS\\\\\\\\Fireworks\\\\\\\\AI，不要求专业设计师水平，但要会用会改，今天是一专多能的时代，光会编程讨不好饭碗的；\r\n</div>\r\n	</li>\r\n<li class=\\\"\\\\&quot;list-cn-1-2\\\" list-cn-paddingleft-1\\\\\\\"=\\\"\\\">\r\n	<div class=\\\"\\\\&quot;para\\\\&quot;\\\" style=\\\"font-size:14px;margin-left:30px;\\\">\r\n		精通JavaScript、jQuery、vue、 react、angular等页面效果框架，这是前端工程师的最核心技能，是专做页面效果的技术。其实精通了JavaScript，后端编程语言，如.NET、PHP、Ruby都很容易掌握，因为其原理是一样的；\r\n	</div>\r\n</li>\r\n<li class=\\\"\\\\&quot;list-cn-1-3\\\" list-cn-paddingleft-1\\\\\\\"=\\\"\\\">\r\n<div class=\\\"\\\\&quot;para\\\\&quot;\\\" style=\\\"font-size:14px;margin-left:30px;\\\">\r\n	精通一二种模板语言，并能修改，如织梦或wordpress的模板；\r\n</div>\r\n	</li>\r\n<li class=\\\"\\\\&quot;list-cn-1-4\\\" list-cn-paddingleft-1\\\\\\\"=\\\"\\\">\r\n	<div class=\\\"\\\\&quot;para\\\\&quot;\\\" style=\\\"font-size:14px;margin-left:30px;\\\">\r\n		掌握thinkphp与zend框架，能修改此类开源源码；\r\n	</div>\r\n</li>\r\n<li class=\\\"\\\\&quot;list-cn-1-5\\\" list-cn-paddingleft-1\\\\\\\"=\\\"\\\">\r\n<div class=\\\"\\\\&quot;para\\\\&quot;\\\" style=\\\"font-size:14px;margin-left:30px;\\\">\r\n	掌握html5与sencha，这是做手机等移动设备的页面前端技术；\r\n</div>\r\n	</li>\r\n<li class=\\\"\\\\&quot;list-cn-1-6\\\" list-cn-paddingleft-1\\\\\\\"=\\\"\\\">\r\n	<div class=\\\"\\\\&quot;para\\\\&quot;\\\" style=\\\"font-size:14px;margin-left:30px;\\\">\r\n		掌握一二种后端编程语言，如PHP、.NET、JAVA，能读懂后端源码，实际上其原理跟JS差不多；\r\n	</div>\r\n</li>\r\n<li class=\\\"\\\\&quot;list-cn-1-7\\\" list-cn-paddingleft-1\\\\\\\"=\\\"\\\">\r\n<div class=\\\"\\\\&quot;para\\\\&quot;\\\" style=\\\"font-size:14px;margin-left:30px;\\\">\r\n	掌握node.js，熟悉各种自动化部署工具；\r\n</div>\r\n	</li>\r\n<li class=\\\"\\\\&quot;list-cn-1-8\\\" list-cn-paddingleft-1\\\\\\\"=\\\"\\\">\r\n	<div class=\\\"\\\\&quot;para\\\\&quot;\\\" style=\\\"font-size:14px;margin-left:30px;\\\">\r\n		前端是重视用户体验的，不是靠美工给的页面 做出来就行了，那样不是一个合格的前端。\r\n	</div>\r\n</li>\r\n	</ol>\r\n<br />', '1381381384', 'uploads/20181117\\e6dc940af2a6b1a464d751f00cd26a47.png', '我是刘帅帅，你了解我了吗？以下是我的博客介绍！', '1543072907', 'abc138138138', '18813967255');
INSERT INTO `blog_user` VALUES ('4', '', 'wjj', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', '', '', '', '0', null, '');
INSERT INTO `blog_user` VALUES ('5', '奔跑的小海哥', '22222', 'e10adc3949ba59abbe56e057f20f883e', '12345678955555', '我就不介绍我自己了 111', '一个来自远方的狼', '1083988776', 'uploads/20181123\\0f748766f55faaaef55ebe329f5fc46c.png', '这个真的可以 666', '1543070308', '1083988776', '1083988776');

-- ----------------------------
-- Table structure for blog_video
-- ----------------------------
DROP TABLE IF EXISTS `blog_video`;
CREATE TABLE `blog_video` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL COMMENT '视频名称',
  `url` varchar(255) NOT NULL COMMENT '视频链接',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传视频时间',
  `user_id` int(10) unsigned NOT NULL COMMENT '视频上传者',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_video
-- ----------------------------
INSERT INTO `blog_video` VALUES ('7', 'dcasc', 'uploads/20181123\\bfc312ecdca049c4dff8ff2038091936.mp4', '1542971860', '1', 'scsc');
INSERT INTO `blog_video` VALUES ('2', '熊熊123', 'uploads/20181122\\bf000457f7c8ed46cc619964fd14283d.ogg', '1542897004', '2', '我是熊熊我是熊熊123我是我是熊熊123我是我是熊熊123我是123');
INSERT INTO `blog_video` VALUES ('10', 'scdc', 'uploads/20181123\\306e831c3f61c8918018ef229946f03c.mp4', '1542972346', '1', 'scsc');

-- ----------------------------
-- Table structure for blog_words
-- ----------------------------
DROP TABLE IF EXISTS `blog_words`;
CREATE TABLE `blog_words` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `content` text CHARACTER SET utf8 NOT NULL COMMENT '碎言碎语',
  `ctime` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_index` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of blog_words
-- ----------------------------
INSERT INTO `blog_words` VALUES ('1', '那个可以', '那个可以任意挥霍的年纪，人们叫它\'青春\'。', '1525061007', '1');
INSERT INTO `blog_words` VALUES ('3', '时间好象一把尺子', '时间好象一把尺子，它能衡量奋斗者前进的进程。 时间如同一架天平，它能称量奋斗者成果的重量； 时间就像一把皮鞭，它能鞭策我们追赶人生的目标。时间犹如一面战鼓，它能激励我们加快前进的脚步。', '1530001007', '1');
INSERT INTO `blog_words` VALUES ('4', '青春，一半明媚', '青春，一半明媚，一半忧伤。 它是一本惊天地泣鬼神的着作，而我们却读的太匆忙。 于不经意间，青春的书籍悄然合上，以至于我们要重新研读它时， 却发现青春的字迹早已落满尘埃，模糊不清。', '1531011007', '1');
INSERT INTO `blog_words` VALUES ('5', '技术改变命运', '技术改变命运，学习改变梦想', '1531063166', '2');
INSERT INTO `blog_words` VALUES ('7', '编程之乐', '哪怕前路崎岖，也要勇敢前行！', '1531121007', '1');
INSERT INTO `blog_words` VALUES ('8', '我们相信我们自己', '我们坚信前进的动力是踏实勤奋', '1531121312', '2');
INSERT INTO `blog_words` VALUES ('9', '你好', '永远都不会明白那天你为什么要这样对我？', '1531136996', '1');
INSERT INTO `blog_words` VALUES ('10', '刘帅帅', '真是刘帅帅', '1542468803', '2');
INSERT INTO `blog_words` VALUES ('11', '村上春树', '真是牛逼、、nbnb', '1542468919', '2');
