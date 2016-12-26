/*
Navicat MySQL Data Transfer

Source Server         : localhost-MariaDB
Source Server Version : 100110
Source Host           : localhost:3306
Source Database       : wemall

Target Server Type    : MYSQL
Target Server Version : 100110
File Encoding         : 65001

Date: 2016-12-26 20:10:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wemall_addon_card_config
-- ----------------------------
DROP TABLE IF EXISTS `wemall_addon_card_config`;
CREATE TABLE `wemall_addon_card_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notify_url` text NOT NULL,
  `about_url` text NOT NULL,
  `address` text NOT NULL,
  `tel` text NOT NULL,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_addon_card_config
-- ----------------------------
INSERT INTO `wemall_addon_card_config` VALUES ('1', '#', '#', '河南郑州', '10086', '', '2015-11-19 16:38:00');

-- ----------------------------
-- Table structure for wemall_admin
-- ----------------------------
DROP TABLE IF EXISTS `wemall_admin`;
CREATE TABLE `wemall_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `phone` text NOT NULL,
  `email` text NOT NULL,
  `token` text,
  `lastip` text,
  `remark` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_admin
-- ----------------------------
INSERT INTO `wemall_admin` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '10086', 'admin@admin.com', '59CKrHehSeP7S907BEaa2yxPIg1Ijs', '', '333', '1', '2016-12-08 10:40:53');

-- ----------------------------
-- Table structure for wemall_ads
-- ----------------------------
DROP TABLE IF EXISTS `wemall_ads`;
CREATE TABLE `wemall_ads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `sub` text NOT NULL,
  `file_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `remark` text,
  `rank` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_ads
-- ----------------------------
INSERT INTO `wemall_ads` VALUES ('1', '1', '', '7', '', '1', '0', '2015-11-06 14:58:06');
INSERT INTO `wemall_ads` VALUES ('2', '2', '', '6', '', '1', '0', '2015-11-06 14:58:20');
INSERT INTO `wemall_ads` VALUES ('3', '3', '', '5', '', '1', '0', '2015-11-06 14:58:30');
INSERT INTO `wemall_ads` VALUES ('4', '4', '', '4', '', '1', '0', '2015-11-06 14:58:41');
INSERT INTO `wemall_ads` VALUES ('5', '5', '', '3', '', '1', '0', '2015-11-06 14:58:50');
INSERT INTO `wemall_ads` VALUES ('6', '广告测试', '2222', '2', '', '1', '222', '2016-01-05 16:14:23');

-- ----------------------------
-- Table structure for wemall_alipay
-- ----------------------------
DROP TABLE IF EXISTS `wemall_alipay`;
CREATE TABLE `wemall_alipay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alipayname` varchar(100) DEFAULT NULL COMMENT '支付宝名称',
  `partner` varchar(100) DEFAULT NULL COMMENT '合作身份者id',
  `key` varchar(100) DEFAULT NULL COMMENT '安全检验码',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_alipay
-- ----------------------------
INSERT INTO `wemall_alipay` VALUES ('1', 'xiujida@163.com', '2088411818635564', 'q97lmadjh6rfmy3y94ngx7rx7iedulne', '2016-01-05 10:15:13');

-- ----------------------------
-- Table structure for wemall_analysis
-- ----------------------------
DROP TABLE IF EXISTS `wemall_analysis`;
CREATE TABLE `wemall_analysis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `trades` float NOT NULL,
  `registers` int(11) NOT NULL,
  `users` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_analysis
-- ----------------------------
INSERT INTO `wemall_analysis` VALUES ('1', '0', '0', '1', '0', '2015-11-16 21:57:10');
INSERT INTO `wemall_analysis` VALUES ('2', '3', '46', '0', '3', '2015-11-18 14:07:19');
INSERT INTO `wemall_analysis` VALUES ('3', '5', '180', '0', '5', '2015-11-19 11:05:35');
INSERT INTO `wemall_analysis` VALUES ('4', '9', '286', '0', '9', '2015-11-20 16:08:57');
INSERT INTO `wemall_analysis` VALUES ('5', '1', '36', '0', '1', '2015-11-23 15:06:03');
INSERT INTO `wemall_analysis` VALUES ('6', '2', '84', '0', '2', '2015-12-23 09:47:38');
INSERT INTO `wemall_analysis` VALUES ('7', '5', '90', '0', '5', '2015-12-24 10:49:23');
INSERT INTO `wemall_analysis` VALUES ('8', '65', '72', '0', '0', '2016-01-06 20:36:40');
INSERT INTO `wemall_analysis` VALUES ('9', '6', '48', '0', '0', '2016-01-07 14:45:39');
INSERT INTO `wemall_analysis` VALUES ('10', '2', '38', '0', '0', '2016-01-09 10:07:45');
INSERT INTO `wemall_analysis` VALUES ('11', '1', '24', '0', '0', '2016-01-18 11:41:34');
INSERT INTO `wemall_analysis` VALUES ('12', '12', '664', '0', '0', '2016-02-17 15:31:43');
INSERT INTO `wemall_analysis` VALUES ('13', '6', '404', '0', '0', '2016-03-10 15:27:57');

-- ----------------------------
-- Table structure for wemall_artical
-- ----------------------------
DROP TABLE IF EXISTS `wemall_artical`;
CREATE TABLE `wemall_artical` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `file_id` int(11) NOT NULL,
  `author` text NOT NULL,
  `sub` text NOT NULL,
  `content` text NOT NULL,
  `remark` text,
  `visiter` int(11) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_artical
-- ----------------------------
INSERT INTO `wemall_artical` VALUES ('1', '文章功能测1', '23', '1', '1', '<p>2222</p>', '1', '9', '2016-12-23 14:19:05');

-- ----------------------------
-- Table structure for wemall_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `wemall_auth_group`;
CREATE TABLE `wemall_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_auth_group
-- ----------------------------
INSERT INTO `wemall_auth_group` VALUES ('1', '超级管理员', '1', '1', '2015-11-06 11:46:17');
INSERT INTO `wemall_auth_group` VALUES ('2', '普通管理员', '1', '58,57,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1', '2016-01-05 11:03:01');

-- ----------------------------
-- Table structure for wemall_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `wemall_auth_group_access`;
CREATE TABLE `wemall_auth_group_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_auth_group_access
-- ----------------------------
INSERT INTO `wemall_auth_group_access` VALUES ('1', '1', '1');
INSERT INTO `wemall_auth_group_access` VALUES ('3', '2', '1');
INSERT INTO `wemall_auth_group_access` VALUES ('5', '4', '2');
INSERT INTO `wemall_auth_group_access` VALUES ('6', '5', '2');
INSERT INTO `wemall_auth_group_access` VALUES ('7', '6', '2');
INSERT INTO `wemall_auth_group_access` VALUES ('8', '7', '1');

-- ----------------------------
-- Table structure for wemall_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `wemall_auth_rule`;
CREATE TABLE `wemall_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_auth_rule
-- ----------------------------
INSERT INTO `wemall_auth_rule` VALUES ('1', 'Admin/Index/index', '系统首页', '1', '1', '', '2015-10-14 05:51:29');
INSERT INTO `wemall_auth_rule` VALUES ('2', 'Admin/Index/userChart', '用户分析', '1', '1', '', '2015-10-18 10:19:06');
INSERT INTO `wemall_auth_rule` VALUES ('3', 'Admin/Config/shopSet', '商城设置', '1', '1', '', '2015-10-14 18:15:02');
INSERT INTO `wemall_auth_rule` VALUES ('4', 'Admin/Config/addressSet', '地址设置', '1', '1', '', '2015-10-14 14:03:58');
INSERT INTO `wemall_auth_rule` VALUES ('5', 'Admin/Config/tplSet', '模板设置', '1', '1', '', '2015-10-14 14:04:24');
INSERT INTO `wemall_auth_rule` VALUES ('6', 'Admin/Config/alipaySet', '支付宝设置', '1', '1', '', '2015-10-14 14:04:46');
INSERT INTO `wemall_auth_rule` VALUES ('7', 'Admin/Config/wxPrintSet', '微信打印机设置', '1', '1', '', '2015-10-14 14:05:04');
INSERT INTO `wemall_auth_rule` VALUES ('8', 'Admin/Config/smsSet', '短信验证设置', '1', '1', '', '2015-10-14 14:05:26');
INSERT INTO `wemall_auth_rule` VALUES ('9', 'Admin/Config/wxTplMsgSet', '微信模板消息设置', '1', '1', '', '2015-10-14 14:05:45');
INSERT INTO `wemall_auth_rule` VALUES ('10', 'Admin/Weixin/wxSet', '微信设置', '1', '1', '', '2015-10-14 14:07:56');
INSERT INTO `wemall_auth_rule` VALUES ('11', 'Admin/Weixin/wxMenuSet', '微信菜单设置', '1', '1', '', '2015-10-14 14:08:13');
INSERT INTO `wemall_auth_rule` VALUES ('12', 'Admin/Weixin/wxReplySet', '自定义回复设置', '1', '1', '', '2015-10-14 14:08:26');
INSERT INTO `wemall_auth_rule` VALUES ('13', 'Admin/Shop/ads', '广告管理', '1', '1', '', '2015-10-14 14:08:44');
INSERT INTO `wemall_auth_rule` VALUES ('14', 'Admin/Shop/menu', '菜单管理', '1', '1', '', '2015-10-14 14:09:00');
INSERT INTO `wemall_auth_rule` VALUES ('15', 'Admin/Shop/product', '商品管理', '1', '1', '', '2015-10-14 14:09:15');
INSERT INTO `wemall_auth_rule` VALUES ('16', 'Admin/Order/order', '订单管理', '1', '1', '', '2015-10-14 14:09:41');
INSERT INTO `wemall_auth_rule` VALUES ('17', 'Admin/Trade/trade', '财务管理', '1', '1', '', '2015-10-14 14:09:59');
INSERT INTO `wemall_auth_rule` VALUES ('18', 'Admin/User/authGroup', '用户组管理', '1', '1', '', '2015-10-14 14:10:16');
INSERT INTO `wemall_auth_rule` VALUES ('19', 'Admin/Addon/addon', '插件管理', '1', '1', '', '2015-10-14 14:11:01');
INSERT INTO `wemall_auth_rule` VALUES ('20', 'Admin/User/authRule', '权限管理', '1', '1', '', '2015-10-14 14:10:16');
INSERT INTO `wemall_auth_rule` VALUES ('21', 'Admin/User/user', '用户管理', '1', '1', '', '2015-10-14 18:18:46');
INSERT INTO `wemall_auth_rule` VALUES ('22', 'Admin/Config/addProvince', '添加省份', '1', '1', '', '2015-10-14 18:19:00');
INSERT INTO `wemall_auth_rule` VALUES ('23', 'Admin/Config/modifyProvince', '修改省份', '1', '1', '', '2015-10-14 14:03:58');
INSERT INTO `wemall_auth_rule` VALUES ('24', 'Admin/Config/delProvince', '删除省份', '1', '1', '', '2015-10-14 14:03:58');
INSERT INTO `wemall_auth_rule` VALUES ('25', 'Admin/Config/addCity', '添加城市', '1', '1', '', '2015-10-14 14:03:58');
INSERT INTO `wemall_auth_rule` VALUES ('26', 'Admin/Config/city', '城市管理', '1', '1', '', '2015-10-14 18:19:56');
INSERT INTO `wemall_auth_rule` VALUES ('27', 'Admin/Config/delCity', '删除城市', '1', '1', '', '2015-10-14 14:03:58');
INSERT INTO `wemall_auth_rule` VALUES ('28', 'Admin/Config/modifyCity', '修改城市', '1', '1', '', '2015-10-14 14:03:58');
INSERT INTO `wemall_auth_rule` VALUES ('29', 'Admin/File/imageUploader', '图片管理', '1', '1', '', '2015-10-14 18:20:12');
INSERT INTO `wemall_auth_rule` VALUES ('30', 'Admin/File/delImage', '删除图片', '1', '1', '', '2015-10-14 18:20:18');
INSERT INTO `wemall_auth_rule` VALUES ('31', 'Admin/File/uploadImage', '上传图片', '1', '1', '', '2015-10-14 18:20:24');
INSERT INTO `wemall_auth_rule` VALUES ('32', 'Admin/Shop/addMenu', '添加菜单', '1', '1', '', '2015-10-14 14:08:44');
INSERT INTO `wemall_auth_rule` VALUES ('33', 'Admin/Shop/modifyMenu', '修改菜单', '1', '1', '', '2015-10-14 14:08:44');
INSERT INTO `wemall_auth_rule` VALUES ('34', 'Admin/Shop/delMenu', '删除菜单', '1', '1', '', '2015-10-14 14:08:44');
INSERT INTO `wemall_auth_rule` VALUES ('35', 'Admin/Shop/addProduct', '添加商品', '1', '1', '', '2015-10-14 14:08:44');
INSERT INTO `wemall_auth_rule` VALUES ('36', 'Admin/Shop/modifyProduct', '修改商品', '1', '1', '', '2015-10-14 14:08:44');
INSERT INTO `wemall_auth_rule` VALUES ('37', 'Admin/Shop/updateProduct', '更新商品', '1', '1', '', '2015-10-18 11:09:21');
INSERT INTO `wemall_auth_rule` VALUES ('38', 'Admin/Shop/delProduct', '删除商品', '1', '1', '', '2015-10-14 18:21:04');
INSERT INTO `wemall_auth_rule` VALUES ('39', 'Admin/Shop/addAds', '添加广告', '1', '1', '', '2015-10-14 18:21:11');
INSERT INTO `wemall_auth_rule` VALUES ('40', 'Admin/Shop/modifyAds', '修改广告', '1', '1', '', '2015-10-14 18:21:17');
INSERT INTO `wemall_auth_rule` VALUES ('41', 'Admin/Shop/delAds', '删除广告', '1', '1', '', '2015-10-14 18:21:23');
INSERT INTO `wemall_auth_rule` VALUES ('42', 'Admin/User/login', '用户登录', '1', '1', '', '2015-10-14 18:21:31');
INSERT INTO `wemall_auth_rule` VALUES ('43', 'Admin/User/logout', '用户注销', '1', '1', '', '2015-10-14 18:21:37');
INSERT INTO `wemall_auth_rule` VALUES ('44', 'Admin/User/delUser', '删除用户', '1', '1', '', '2015-10-14 18:21:43');
INSERT INTO `wemall_auth_rule` VALUES ('45', 'Admin/User/addUser', '添加用户', '1', '1', '', '2015-10-14 18:21:48');
INSERT INTO `wemall_auth_rule` VALUES ('46', 'Admin/User/modifyUser', '修改用户', '1', '1', '', '2015-10-14 18:21:54');
INSERT INTO `wemall_auth_rule` VALUES ('47', 'Admin/User/addAuthGroup', '添加用户组', '1', '1', '', '2015-10-14 18:22:00');
INSERT INTO `wemall_auth_rule` VALUES ('48', 'Admin/User/modifyAuthGroup', '修改用户组', '1', '1', '', '2015-10-14 18:22:09');
INSERT INTO `wemall_auth_rule` VALUES ('49', 'Admin/User/delAuthGroup', '删除用户组', '1', '1', '', '2015-10-14 18:22:14');
INSERT INTO `wemall_auth_rule` VALUES ('50', 'Admin/Base/getNotify', '系统通知', '1', '1', '', '2015-10-18 10:16:38');
INSERT INTO `wemall_auth_rule` VALUES ('51', 'Admin/Addon/addonShop', '插件商店', '1', '1', '', '2015-10-14 14:11:01');
INSERT INTO `wemall_auth_rule` VALUES ('52', 'Admin/Index/orderChart', '订单分析', '1', '1', '', '2015-10-18 10:19:17');
INSERT INTO `wemall_auth_rule` VALUES ('53', 'Admin/Index/productChart', '商品分析', '1', '1', '', '2015-10-18 10:19:35');
INSERT INTO `wemall_auth_rule` VALUES ('54', 'Admin/Shop/comment', '评论管理', '1', '1', '', '2015-10-14 18:21:23');
INSERT INTO `wemall_auth_rule` VALUES ('55', 'Admin/Shop/productSearch', '商品搜索', '1', '1', '', '2015-10-18 10:21:13');
INSERT INTO `wemall_auth_rule` VALUES ('56', 'Admin/Order/search', '订单搜索', '1', '1', '', '2015-10-18 10:24:07');
INSERT INTO `wemall_auth_rule` VALUES ('57', 'Admin/Shop/delComment', '删除评论', '1', '1', '', '2015-10-14 18:21:23');
INSERT INTO `wemall_auth_rule` VALUES ('58', 'Admin/Order/update', '订单操作', '1', '1', '', '2015-10-18 11:00:46');

-- ----------------------------
-- Table structure for wemall_comment
-- ----------------------------
DROP TABLE IF EXISTS `wemall_comment`;
CREATE TABLE `wemall_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_comment
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_config
-- ----------------------------
DROP TABLE IF EXISTS `wemall_config`;
CREATE TABLE `wemall_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `notification` text NOT NULL,
  `reminder` text NOT NULL,
  `tel` text NOT NULL,
  `address` text NOT NULL,
  `freight` float NOT NULL,
  `full` int(11) NOT NULL COMMENT '满',
  `discount` int(11) NOT NULL COMMENT '减',
  `delivery_time` text NOT NULL,
  `theme` text NOT NULL,
  `qrcode` text NOT NULL,
  `oauth` tinyint(1) NOT NULL,
  `oauth_debug` int(1) NOT NULL,
  `balance_payment` tinyint(1) NOT NULL,
  `wechat_payment` tinyint(1) NOT NULL,
  `alipay_payment` tinyint(1) NOT NULL,
  `cool_payment` tinyint(1) NOT NULL,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_config
-- ----------------------------
INSERT INTO `wemall_config` VALUES ('1', 'wemall商城', '欢迎来到wemall商城!', '您的订单我们将在约定的时间送达，谢谢！收货时间在15:30～17:30时间段内，请留意您的手机。', '10086', '河南省郑州市', '2', '20', '2', '10:30-11:30,14:30-15:30,16:00-17:00,15:30-17:30', 'default', 'https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQHD7zoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0lramZuV0xsX2ZhQUljSzJ4V0JtAAIEVpV7VQMEAAAAAA%3D%3D', '1', '1', '1', '1', '1', '1', '', '2016-03-10 14:49:15');

-- ----------------------------
-- Table structure for wemall_contact
-- ----------------------------
DROP TABLE IF EXISTS `wemall_contact`;
CREATE TABLE `wemall_contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone` text NOT NULL,
  `province` text,
  `city` text,
  `district` text,
  `address` text NOT NULL,
  `postcode` text,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_contact
-- ----------------------------
INSERT INTO `wemall_contact` VALUES ('3', '1', '1', '1', '安微省', '合肥市', '1', '1', '1', '1', '2016-03-10 14:49:24');

-- ----------------------------
-- Table structure for wemall_dish
-- ----------------------------
DROP TABLE IF EXISTS `wemall_dish`;
CREATE TABLE `wemall_dish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL COMMENT '关联餐厅ID',
  `name` varchar(255) DEFAULT NULL COMMENT '菜名',
  `price` int(11) DEFAULT NULL,
  `create_t` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='菜品表';

-- ----------------------------
-- Records of wemall_dish
-- ----------------------------
INSERT INTO `wemall_dish` VALUES ('4', '1', '黄焖鸡', '1500', '2016-12-26 18:51:30');
INSERT INTO `wemall_dish` VALUES ('5', '1', '排骨', '1800', '2016-12-26 18:55:34');
INSERT INTO `wemall_dish` VALUES ('6', '1', '西红柿', '200', '2016-12-26 18:55:44');
INSERT INTO `wemall_dish` VALUES ('7', '2', '鸡腿', '500', '2016-12-26 18:56:09');
INSERT INTO `wemall_dish` VALUES ('8', '2', '西兰花', '200', '2016-12-26 18:56:18');
INSERT INTO `wemall_dish` VALUES ('9', '2', '小鸡炖蘑菇', '1500', '2016-12-26 18:56:31');

-- ----------------------------
-- Table structure for wemall_feedback
-- ----------------------------
DROP TABLE IF EXISTS `wemall_feedback`;
CREATE TABLE `wemall_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_file
-- ----------------------------
DROP TABLE IF EXISTS `wemall_file`;
CREATE TABLE `wemall_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `ext` text NOT NULL,
  `type` text NOT NULL,
  `savename` text NOT NULL,
  `savepath` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_file
-- ----------------------------
INSERT INTO `wemall_file` VALUES ('1', '55e6b902cef38.jpg', 'jpg', 'image/jpeg', '56149e72a10c4.jpg', '2015-10-07/', '2015-10-07 12:24:18');
INSERT INTO `wemall_file` VALUES ('2', '5615e26f54d75.jpg', 'jpg', 'image/jpeg', '563c4f4336719.jpg', '2015-11-06/', '2015-11-06 14:57:07');
INSERT INTO `wemall_file` VALUES ('3', '5615ea4fd93f4.jpg', 'jpg', 'image/jpeg', '563c4f433762a.jpg', '2015-11-06/', '2015-11-06 14:57:07');
INSERT INTO `wemall_file` VALUES ('4', '5615eaa90c582.jpg', 'jpg', 'image/jpeg', '563c4f4337c28.jpg', '2015-11-06/', '2015-11-06 14:57:07');
INSERT INTO `wemall_file` VALUES ('5', '5615eaa90d34c.jpg', 'jpg', 'image/jpeg', '563c4f4338996.jpg', '2015-11-06/', '2015-11-06 14:57:07');
INSERT INTO `wemall_file` VALUES ('6', '5615eaa90dfad.jpg', 'jpg', 'image/jpeg', '563c4f4339b2d.jpg', '2015-11-06/', '2015-11-06 14:57:07');
INSERT INTO `wemall_file` VALUES ('7', '5615eaa90e804.jpg', 'jpg', 'image/jpeg', '563c4f433ab12.jpg', '2015-11-06/', '2015-11-06 14:57:07');
INSERT INTO `wemall_file` VALUES ('9', '1-370x370-1420.jpg', 'jpg', 'image/jpeg', '563c52adac85f.jpg', '2015-11-06/', '2015-11-06 15:11:41');
INSERT INTO `wemall_file` VALUES ('10', '1-370x370-5844-4KHF8KDU.jpg', 'jpg', 'image/jpeg', '563c52bb4b7eb.jpg', '2015-11-06/', '2015-11-06 15:11:55');
INSERT INTO `wemall_file` VALUES ('11', '1-370x370-5985-9KPFBWR1.jpg', 'jpg', 'image/jpeg', '563c52bb4bced.jpg', '2015-11-06/', '2015-11-06 15:11:55');
INSERT INTO `wemall_file` VALUES ('12', '1-370x370-6486-BXPDCPCU.jpg', 'jpg', 'image/jpeg', '563c540523c16.jpg', '2015-11-06/', '2015-11-06 15:17:25');
INSERT INTO `wemall_file` VALUES ('13', '1-370x370-5942-KCHKPX9K.jpg', 'jpg', 'image/jpeg', '563c540524b9c.jpg', '2015-11-06/', '2015-11-06 15:17:25');
INSERT INTO `wemall_file` VALUES ('14', '1-370x370-4394-3YU37TSK.jpg', 'jpg', 'image/jpeg', '563c54052539a.jpg', '2015-11-06/', '2015-11-06 15:17:25');
INSERT INTO `wemall_file` VALUES ('15', '1-370x370-3265-PU41F9AB.jpg', 'jpg', 'image/jpeg', '563c540525aca.jpg', '2015-11-06/', '2015-11-06 15:17:25');
INSERT INTO `wemall_file` VALUES ('16', '1-370x370-4854-4TC46UPX.jpg', 'jpg', 'image/jpeg', '563c5405260d0.jpg', '2015-11-06/', '2015-11-06 15:17:25');
INSERT INTO `wemall_file` VALUES ('17', '1-370x370-6423-YSDU6WA6.jpg', 'jpg', 'image/jpeg', '563c540526487.jpg', '2015-11-06/', '2015-11-06 15:17:25');
INSERT INTO `wemall_file` VALUES ('18', '55fa7cf5d3c70.jpg', 'jpg', 'image/jpeg', '563c61f936dbd.jpg', '2015-11-06/', '2015-11-06 16:16:57');
INSERT INTO `wemall_file` VALUES ('19', '55fa79e11089e.png', 'png', 'image/jpeg', '563c61f937aff.png', '2015-11-06/', '2015-11-06 16:16:57');
INSERT INTO `wemall_file` VALUES ('20', '55fa76b46c708.png', 'png', 'image/jpeg', '563c61f938112.png', '2015-11-06/', '2015-11-06 16:16:57');
INSERT INTO `wemall_file` VALUES ('21', '55fa763dbe297.png', 'png', 'image/jpeg', '563c61f9385ba.png', '2015-11-06/', '2015-11-06 16:16:57');
INSERT INTO `wemall_file` VALUES ('22', '55fa76266b041.png', 'png', 'image/jpeg', '563c61f938931.png', '2015-11-06/', '2015-11-06 16:16:57');
INSERT INTO `wemall_file` VALUES ('23', '55fa759ae7a02.png', 'png', 'image/jpeg', '563c61f938cac.png', '2015-11-06/', '2015-11-06 16:16:57');
INSERT INTO `wemall_file` VALUES ('24', '55fa73efc80f0.png', 'png', 'image/jpeg', '563c61f939289.png', '2015-11-06/', '2015-11-06 16:16:57');
INSERT INTO `wemall_file` VALUES ('25', '55fa737d985f2.png', 'png', 'image/jpeg', '563c61f9395ed.png', '2015-11-06/', '2015-11-06 16:16:57');
INSERT INTO `wemall_file` VALUES ('26', '563885a8a6b84.jpg', 'jpg', 'image/jpeg', '563c61f93985d.jpg', '2015-11-06/', '2015-11-06 16:16:57');
INSERT INTO `wemall_file` VALUES ('27', '1417595621584.jpg', 'jpg', 'image/jpeg', '563c68eff3721.jpg', '2015-11-06/', '2015-11-06 16:46:40');
INSERT INTO `wemall_file` VALUES ('28', '1417597271905.jpg', 'jpg', 'image/jpeg', '563c695de2403.jpg', '2015-11-06/', '2015-11-06 16:48:29');
INSERT INTO `wemall_file` VALUES ('29', '1434268044104.jpg', 'jpg', 'image/jpeg', '563c695de2cbe.jpg', '2015-11-06/', '2015-11-06 16:48:29');
INSERT INTO `wemall_file` VALUES ('30', 'mmexport1475198757796.jpeg', 'jpeg', 'image/jpeg', '5848eddba6bcc.jpeg', '2016-12-08/', '2016-12-08 13:21:31');

-- ----------------------------
-- Table structure for wemall_loc_city
-- ----------------------------
DROP TABLE IF EXISTS `wemall_loc_city`;
CREATE TABLE `wemall_loc_city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_loc_city
-- ----------------------------
INSERT INTO `wemall_loc_city` VALUES ('1', '1', '郑州市');
INSERT INTO `wemall_loc_city` VALUES ('2', '1', '洛阳市');
INSERT INTO `wemall_loc_city` VALUES ('3', '2', '海淀区');
INSERT INTO `wemall_loc_city` VALUES ('4', '2', '朝阳区');
INSERT INTO `wemall_loc_city` VALUES ('5', '3', '邯郸市');
INSERT INTO `wemall_loc_city` VALUES ('6', '4', '合肥市');

-- ----------------------------
-- Table structure for wemall_loc_district
-- ----------------------------
DROP TABLE IF EXISTS `wemall_loc_district`;
CREATE TABLE `wemall_loc_district` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `zipcode` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_loc_district
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_loc_province
-- ----------------------------
DROP TABLE IF EXISTS `wemall_loc_province`;
CREATE TABLE `wemall_loc_province` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_loc_province
-- ----------------------------
INSERT INTO `wemall_loc_province` VALUES ('1', '河南省');
INSERT INTO `wemall_loc_province` VALUES ('2', '北京市');
INSERT INTO `wemall_loc_province` VALUES ('3', '河北省');
INSERT INTO `wemall_loc_province` VALUES ('4', '安微省');

-- ----------------------------
-- Table structure for wemall_log
-- ----------------------------
DROP TABLE IF EXISTS `wemall_log`;
CREATE TABLE `wemall_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_log
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_menu
-- ----------------------------
DROP TABLE IF EXISTS `wemall_menu`;
CREATE TABLE `wemall_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `pid` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `remark` text,
  `rank` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_menu
-- ----------------------------
INSERT INTO `wemall_menu` VALUES ('1', '水果', '0', '0', '', '1', '2015-11-18 10:25:27');
INSERT INTO `wemall_menu` VALUES ('2', '生鲜', '0', '0', '', '0', '2015-11-06 16:05:39');
INSERT INTO `wemall_menu` VALUES ('3', '外卖', '0', '0', '', '0', '2015-11-06 16:06:06');
INSERT INTO `wemall_menu` VALUES ('4', '超市', '0', '24', '', '0', '2016-01-05 10:30:11');
INSERT INTO `wemall_menu` VALUES ('5', '社区1', '1', '24', '', '0', '2016-01-05 16:14:31');

-- ----------------------------
-- Table structure for wemall_order
-- ----------------------------
DROP TABLE IF EXISTS `wemall_order`;
CREATE TABLE `wemall_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `orderid` text NOT NULL,
  `totalprice` text NOT NULL,
  `payment` text NOT NULL,
  `pay_status` int(11) NOT NULL,
  `delivery_time` text NOT NULL,
  `freight` float NOT NULL,
  `discount` int(11) NOT NULL,
  `remark` text,
  `status` int(11) NOT NULL COMMENT '0:未处理，1:已发货，-2:退货中，-3:退货完成，-4:申请退货，-1:交易取消，2:交易完成',
  `time` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_order
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_order_contact
-- ----------------------------
DROP TABLE IF EXISTS `wemall_order_contact`;
CREATE TABLE `wemall_order_contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone` text NOT NULL,
  `province` text,
  `city` text,
  `district` text,
  `address` text NOT NULL,
  `postcode` text,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_order_contact
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `wemall_order_detail`;
CREATE TABLE `wemall_order_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `sku_id` text,
  `sku_name` text,
  `num` int(11) NOT NULL,
  `price` text NOT NULL,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_product
-- ----------------------------
DROP TABLE IF EXISTS `wemall_product`;
CREATE TABLE `wemall_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `subname` text,
  `price` text NOT NULL,
  `old_price` float NOT NULL,
  `unit` text,
  `score` float NOT NULL,
  `albums` text NOT NULL,
  `visiter` int(11) NOT NULL,
  `sku` tinyint(1) NOT NULL,
  `file_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `status` int(11) NOT NULL COMMENT '0:售罄，-1:下架，1:出售',
  `label` text COMMENT '标签值',
  `remark` text,
  `rank` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_product
-- ----------------------------
INSERT INTO `wemall_product` VALUES ('1', '1', '橙子', '美味可口', '12', '0', '', '12', '24,29,', '16', '0', '10', '', '1', '热销', '', '0', '2016-01-05 22:35:16');
INSERT INTO `wemall_product` VALUES ('2', '1', '香蕉', null, '12', '0', '', '12', '', '1', '0', '9', '', '1', '', '', '0', '2016-01-05 11:02:23');
INSERT INTO `wemall_product` VALUES ('3', '5', '苹果', '美味', '12', '0', '', '12', '', '13', '0', '11', '', '1', '', '', '0', '2016-01-05 11:02:23');
INSERT INTO `wemall_product` VALUES ('4', '1', '香梨', null, '12', '0', '', '12', '', '0', '0', '17', '', '1', '', '', '0', '2016-01-05 11:02:23');
INSERT INTO `wemall_product` VALUES ('5', '1', '葡萄', null, '12', '0', '', '12', '', '0', '0', '16', '', '1', '', '', '0', '2016-01-05 11:02:23');
INSERT INTO `wemall_product` VALUES ('6', '1', '菠萝', null, '12', '0', '', '12', '', '0', '0', '15', '', '1', '', '', '0', '2016-01-05 11:02:23');
INSERT INTO `wemall_product` VALUES ('7', '1', '火龙果', null, '12', '0', '', '12', '', '2', '0', '14', '', '1', '', '', '0', '2016-01-05 11:02:23');
INSERT INTO `wemall_product` VALUES ('8', '1', '奇异果', null, '12', '0', '', '12', '', '0', '0', '13', '', '1', '', '', '0', '2016-01-05 11:02:23');
INSERT INTO `wemall_product` VALUES ('9', '1', '蓝莓', null, '12', '0', '', '12', '', '1', '0', '12', '', '1', '', '', '0', '2016-01-05 11:02:23');
INSERT INTO `wemall_product` VALUES ('10', '2', '清蒸鲈鱼', null, '12', '0', '', '12', '', '0', '0', '24', '', '1', '', '', '0', '2016-01-05 11:02:23');
INSERT INTO `wemall_product` VALUES ('11', '2', '香辣大闸蟹', null, '12', '0', '', '12', '', '0', '0', '18', '', '1', '', '', '0', '2016-01-05 11:02:23');
INSERT INTO `wemall_product` VALUES ('12', '2', '大米饽饽嫩羊肉', null, '12', '0', '', '12', '', '1', '0', '26', '', '1', '', '', '0', '2016-01-05 11:02:23');
INSERT INTO `wemall_product` VALUES ('13', '2', '蘸汁菠菜', null, '12', '0', '', '12', '', '0', '0', '25', '', '1', '', '', '0', '2016-01-05 11:02:23');
INSERT INTO `wemall_product` VALUES ('14', '2', '手抓羊排', null, '12', '0', '', '12', '', '0', '0', '23', '', '1', '', '', '0', '2016-01-05 11:02:23');
INSERT INTO `wemall_product` VALUES ('15', '5', '美汁活鲍', '', '12', '0', '', '12', '', '0', '0', '22', '', '1', '', '', '0', '2016-01-05 11:02:23');
INSERT INTO `wemall_product` VALUES ('16', '2', '香辣花甲', null, '12', '0', '', '12', '', '0', '0', '20', '', '1', '', '', '0', '2016-01-05 11:02:23');
INSERT INTO `wemall_product` VALUES ('17', '2', '香辣蛏子', null, '12', '0', '', '12', '', '0', '0', '19', '', '1', '', '', '0', '2016-01-05 11:02:23');
INSERT INTO `wemall_product` VALUES ('18', '5', '清蒸黄花鱼', '', '12', '0', '', '12', '', '0', '0', '21', '', '1', '', '', '0', '2016-01-05 11:02:23');
INSERT INTO `wemall_product` VALUES ('19', '5', '红烧排骨', '', '12', '0', '', '12', '', '1', '1', '27', '', '1', null, '', '0', '2016-01-11 18:39:35');
INSERT INTO `wemall_product` VALUES ('21', '4', '肉末茄子', '好吃不贵', '12', '0.2', '千克', '12', '24,18,', '3', '1', '28', '', '1', null, '', '0', '2016-03-10 15:30:14');

-- ----------------------------
-- Table structure for wemall_product_label
-- ----------------------------
DROP TABLE IF EXISTS `wemall_product_label`;
CREATE TABLE `wemall_product_label` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `subname` text,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_product_label
-- ----------------------------
INSERT INTO `wemall_product_label` VALUES ('1', '热销', '热销', '', '2016-01-05 16:48:11');
INSERT INTO `wemall_product_label` VALUES ('2', '推荐', '推荐', '', '2016-01-05 16:55:11');
INSERT INTO `wemall_product_label` VALUES ('3', '特卖', '特卖', '', '2016-01-07 16:00:37');

-- ----------------------------
-- Table structure for wemall_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `wemall_product_sku`;
CREATE TABLE `wemall_product_sku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `path` text,
  `price` float NOT NULL COMMENT '价格',
  `freight` float NOT NULL,
  `store` int(11) NOT NULL COMMENT '库存',
  `sales` int(11) NOT NULL COMMENT '销售量',
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_product_sku
-- ----------------------------
INSERT INTO `wemall_product_sku` VALUES ('21', '21', '北京', null, '22', '3', '0', '7', null, '2016-03-10 15:27:57');
INSERT INTO `wemall_product_sku` VALUES ('22', '21', '上海', null, '44', '4', '0', '8', null, '2016-03-10 15:27:57');

-- ----------------------------
-- Table structure for wemall_shop
-- ----------------------------
DROP TABLE IF EXISTS `wemall_shop`;
CREATE TABLE `wemall_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '餐厅名',
  `create_t` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='餐厅表';

-- ----------------------------
-- Records of wemall_shop
-- ----------------------------
INSERT INTO `wemall_shop` VALUES ('1', 'A号餐厅', '2016-12-23 15:52:33');
INSERT INTO `wemall_shop` VALUES ('2', 'B号餐厅', '2016-12-23 15:53:25');

-- ----------------------------
-- Table structure for wemall_sms
-- ----------------------------
DROP TABLE IF EXISTS `wemall_sms`;
CREATE TABLE `wemall_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` text NOT NULL,
  `pass` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_sms
-- ----------------------------
INSERT INTO `wemall_sms` VALUES ('1', '#', '#', '2016-01-05 10:16:01');

-- ----------------------------
-- Table structure for wemall_trade
-- ----------------------------
DROP TABLE IF EXISTS `wemall_trade`;
CREATE TABLE `wemall_trade` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tradeid` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `money` float NOT NULL,
  `payment` text NOT NULL,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_trade
-- ----------------------------

-- ----------------------------
-- Table structure for wemall_user
-- ----------------------------
DROP TABLE IF EXISTS `wemall_user`;
CREATE TABLE `wemall_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL COMMENT '默认地址',
  `openid` text NOT NULL,
  `nickname` text,
  `username` text NOT NULL,
  `phone` text NOT NULL,
  `password` text NOT NULL,
  `token` text,
  `avater` text NOT NULL,
  `sex` tinyint(4) NOT NULL COMMENT '1:男,2女',
  `city` text NOT NULL,
  `province` text NOT NULL,
  `country` text NOT NULL,
  `language` text NOT NULL,
  `subscribe` tinyint(1) NOT NULL,
  `money` float NOT NULL,
  `score` float NOT NULL,
  `status` int(11) NOT NULL,
  `lastip` text NOT NULL,
  `ctime` text NOT NULL,
  `buy_num` int(11) NOT NULL COMMENT '用户购买量',
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_user
-- ----------------------------
INSERT INTO `wemall_user` VALUES ('1', '3', 'oojFxs4s3PSZVjL-X5UpFPhNfG0c', null, 'wemall', '1', '21232f297a57a5a743894a0e4a801fc3', '2WXwPoVtLgMs7wWE2B0jzUk8aDYrrv', 'http://wx.qlogo.cn/mmopen/KMt8YcxoTr7iaBlsovicVoDriciaLBcQtic7D4IyETkKusiasVicTJq5s2PianSUeg9HuVjGXQQQ9Pz07vyrdE7lMQ1EGw/0', '0', '', '', '', '', '0', '126', '1896', '1', '0.0.0.0', '2015-10-19 12:40:19', '192', '', '2016-03-10 15:27:57');
INSERT INTO `wemall_user` VALUES ('2', '0', '', null, 'zhaokai', '18956036289', '631cba94d961fb7203d012f422611538', null, '', '0', '', '', '', '', '0', '0', '0', '1', '', '', '0', '无', '2016-12-23 15:37:06');

-- ----------------------------
-- Table structure for wemall_user_favorites
-- ----------------------------
DROP TABLE IF EXISTS `wemall_user_favorites`;
CREATE TABLE `wemall_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` text CHARACTER SET latin1 NOT NULL,
  `user_id` int(11) NOT NULL,
  `remark` text CHARACTER SET latin1,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_user_favorites
-- ----------------------------
INSERT INTO `wemall_user_favorites` VALUES ('3', '3', '2', null, '2015-11-19 00:51:26');
INSERT INTO `wemall_user_favorites` VALUES ('4', '3', '2', null, '2015-11-19 00:51:37');
INSERT INTO `wemall_user_favorites` VALUES ('5', '3', '2', null, '2015-11-20 15:37:49');
INSERT INTO `wemall_user_favorites` VALUES ('6', '3', '2', null, '2015-11-20 15:37:52');
INSERT INTO `wemall_user_favorites` VALUES ('7', '3', '2', null, '2015-11-20 15:37:52');
INSERT INTO `wemall_user_favorites` VALUES ('8', '3', '2', null, '2015-11-20 15:37:53');
INSERT INTO `wemall_user_favorites` VALUES ('9', '3', '2', null, '2015-11-20 15:39:03');
INSERT INTO `wemall_user_favorites` VALUES ('10', '3', '2', null, '2015-11-20 15:39:04');
INSERT INTO `wemall_user_favorites` VALUES ('11', '3', '2', null, '2015-11-20 16:07:53');
INSERT INTO `wemall_user_favorites` VALUES ('12', '3', '2', null, '2015-11-20 16:07:56');
INSERT INTO `wemall_user_favorites` VALUES ('13', '3', '2', null, '2015-11-20 16:07:59');
INSERT INTO `wemall_user_favorites` VALUES ('14', '3', '2', null, '2015-11-20 16:08:02');
INSERT INTO `wemall_user_favorites` VALUES ('15', '3', '2', null, '2015-11-20 16:08:23');

-- ----------------------------
-- Table structure for wemall_wx_config
-- ----------------------------
DROP TABLE IF EXISTS `wemall_wx_config`;
CREATE TABLE `wemall_wx_config` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `token` text NOT NULL,
  `appid` text NOT NULL,
  `appsecret` text NOT NULL,
  `encodingaeskey` text NOT NULL,
  `switch` int(11) NOT NULL,
  `mchid` text NOT NULL,
  `key` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_wx_config
-- ----------------------------
INSERT INTO `wemall_wx_config` VALUES ('1', 'wemall', 'wx6d040141df50d9a3', '1f03c9b3f051667efc324927342dc423', 'vkG6JOKy7f2f2nejqJFlOJkjJEK5JJlN5JjjSQ6Q2gM', '1', '1243050102', '0IVTlxNMurPnBga2ulahd7g4m36jirgR', '2016-01-05 10:16:16');

-- ----------------------------
-- Table structure for wemall_wx_menu
-- ----------------------------
DROP TABLE IF EXISTS `wemall_wx_menu`;
CREATE TABLE `wemall_wx_menu` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `type` text,
  `name` text NOT NULL,
  `key` text NOT NULL,
  `url` text NOT NULL,
  `pid` int(5) NOT NULL DEFAULT '0',
  `rank` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_wx_menu
-- ----------------------------
INSERT INTO `wemall_wx_menu` VALUES ('1', 'view', '商业版', '', 'http://1.inuoer.com/wemall/index.php/App/Index/index', '4', '', '0', '', '2016-12-08 11:09:14');
INSERT INTO `wemall_wx_menu` VALUES ('2', 'view', '分销版', '', 'http://1.inuoer.com/wfx/App/Shop/index', '4', '', '0', '', '2016-12-08 11:09:07');
INSERT INTO `wemall_wx_menu` VALUES ('3', 'click', 'QQ客服', 'qqkf', '', '4', '', '0', '2034210985', '2016-12-08 11:08:51');
INSERT INTO `wemall_wx_menu` VALUES ('4', 'click', '专题推荐', 'zhuangtituijian', '', '0', '1', '0', '专题推荐', '2016-12-08 11:07:51');
INSERT INTO `wemall_wx_menu` VALUES ('5', 'click', '餐厅推荐', 'cantingtuijian', '', '0', '2', '0', 'cantingtuijian', '2016-12-08 11:08:21');

-- ----------------------------
-- Table structure for wemall_wx_print
-- ----------------------------
DROP TABLE IF EXISTS `wemall_wx_print`;
CREATE TABLE `wemall_wx_print` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apikey` varchar(100) DEFAULT NULL COMMENT 'apikey',
  `mkey` varchar(100) DEFAULT NULL COMMENT '秘钥',
  `partner` varchar(100) DEFAULT NULL COMMENT '用户id',
  `machine_code` varchar(100) DEFAULT NULL COMMENT '机器码',
  `switch` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_wx_print
-- ----------------------------
INSERT INTO `wemall_wx_print` VALUES ('1', '#', '#', '#', '#', '1', '2016-01-07 14:36:05');

-- ----------------------------
-- Table structure for wemall_wx_reply
-- ----------------------------
DROP TABLE IF EXISTS `wemall_wx_reply`;
CREATE TABLE `wemall_wx_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` text NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `file_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `key` text NOT NULL,
  `remark` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_wx_reply
-- ----------------------------
INSERT INTO `wemall_wx_reply` VALUES ('1', 'text', '恭喜你加入WeMall，欢迎体验WeMall商业版，WeMall分销版和WeMall开源版。WeMall商业版更新，速度提升30%，致力于打造世界上最快，体验最好的微商城。客服QQ：2034210985', '', '23', '', 'subscribe', '', '2016-01-05 10:19:53');
INSERT INTO `wemall_wx_reply` VALUES ('2', 'news', '欢迎来到商业版wemall商城', '欢迎来到商业版wemall商城', '28', 'http://1.inuoer.com/3/App/Index/index', '商城', '', '2016-01-05 10:23:41');

-- ----------------------------
-- Table structure for wemall_wx_tplmsg
-- ----------------------------
DROP TABLE IF EXISTS `wemall_wx_tplmsg`;
CREATE TABLE `wemall_wx_tplmsg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id_short` text NOT NULL,
  `template_id` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wemall_wx_tplmsg
-- ----------------------------
INSERT INTO `wemall_wx_tplmsg` VALUES ('1', 'OPENTM201785396', '2fXIC52dOVv9NXPbpBN7O9C9W5N5qT28G6OuzVilUt4', '2015-11-16 13:30:56');
INSERT INTO `wemall_wx_tplmsg` VALUES ('2', 'OPENTM207791277', 'gdKGxJYc6N-sKc7yvv1Gcf9YOOinCy2WiqPcTs3NfWU', '2016-01-06 20:41:45');
SET FOREIGN_KEY_CHECKS=1;
