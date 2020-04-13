/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : pf_xiangxin_me

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2020-04-13 23:11:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ysk_admin
-- ----------------------------
DROP TABLE IF EXISTS `ysk_admin`;
CREATE TABLE `ysk_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UID',
  `auth_id` int(11) NOT NULL DEFAULT '1' COMMENT '角色ID',
  `nickname` varchar(63) DEFAULT NULL COMMENT '昵称',
  `username` varchar(31) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(63) NOT NULL DEFAULT '' COMMENT '密码',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  `reg_type` varchar(20) DEFAULT NULL COMMENT '注册人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台管理员表格';

-- ----------------------------
-- Records of ysk_admin
-- ----------------------------
INSERT INTO `ysk_admin` VALUES ('1', '1', '超级管理员', 'admin', '8f3bd6b4d00391c9d09cc14e32fee28c', '', '0', '1438651748', '1552141214', '1', '');

-- ----------------------------
-- Table structure for ysk_bankcard
-- ----------------------------
DROP TABLE IF EXISTS `ysk_bankcard`;
CREATE TABLE `ysk_bankcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT 'uid',
  `name` varchar(225) NOT NULL COMMENT '持卡人',
  `bankname` varchar(225) NOT NULL COMMENT '所属银行',
  `banknum` varchar(225) NOT NULL COMMENT '银行卡号',
  `addtime` varchar(225) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='银行卡管理';

-- ----------------------------
-- Records of ysk_bankcard
-- ----------------------------
INSERT INTO `ysk_bankcard` VALUES ('20', '51', '刘勇', '1', '1', '1575967955');
INSERT INTO `ysk_bankcard` VALUES ('19', '50', '谭成山', '兴业银行', '622908376782662819', '1553320346');

-- ----------------------------
-- Table structure for ysk_complaint
-- ----------------------------
DROP TABLE IF EXISTS `ysk_complaint`;
CREATE TABLE `ysk_complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '投诉人id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '投诉内容',
  `imgs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图片路径',
  `status` tinyint(1) DEFAULT '0' COMMENT '0 未查看 1 已查看',
  `create_time` int(10) DEFAULT NULL COMMENT '投诉时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='投诉建议表';

-- ----------------------------
-- Records of ysk_complaint
-- ----------------------------

-- ----------------------------
-- Table structure for ysk_config
-- ----------------------------
DROP TABLE IF EXISTS `ysk_config`;
CREATE TABLE `ysk_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '配置标题',
  `name` varchar(32) DEFAULT NULL COMMENT '配置名称',
  `value` text NOT NULL COMMENT '配置值',
  `group` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `type` varchar(16) NOT NULL DEFAULT '' COMMENT '配置类型',
  `options` varchar(255) NOT NULL DEFAULT '' COMMENT '配置额外值',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统配置表';

-- ----------------------------
-- Records of ysk_config
-- ----------------------------
INSERT INTO `ysk_config` VALUES ('1', '站点开关', 'TOGGLE_WEB_SITE', '1', '3', '0', '0:关闭\r\n1:开启', '商城建设中......', '1378898976', '1406992386', '1', '1');
INSERT INTO `ysk_config` VALUES ('2', '网站标题', 'WEB_SITE_TITLE', '', '1', '0', '', '网站标题前台显示标题', '1378898976', '1379235274', '2', '1');
INSERT INTO `ysk_config` VALUES ('3', '网站LOGO', 'WEB_SITE_LOGO', '', '1', '0', '', '网站LOGO', '1407003397', '1407004692', '3', '1');
INSERT INTO `ysk_config` VALUES ('4', '网站描述', 'WEB_SITE_DESCRIPTION', '', '1', '0', '', '网站搜索引擎描述', '1378898976', '1379235841', '4', '1');
INSERT INTO `ysk_config` VALUES ('5', '网站关键字', 'WEB_SITE_KEYWORD', '', '1', '0', '', '网站搜索引擎关键字', '1378898976', '1381390100', '5', '1');
INSERT INTO `ysk_config` VALUES ('6', '版权信息', 'WEB_SITE_COPYRIGHT', '', '1', '0', '', '设置在网站底部显示的版权信息，如“版权所有 © 2014-2015 科斯克网络科技”', '1406991855', '1406992583', '6', '1');
INSERT INTO `ysk_config` VALUES ('7', '网站备案号', 'WEB_SITE_ICP', '', '1', '0', '', '设置在网站底部显示的备案号，如“苏ICP备1502009号\"', '1378900335', '1415983236', '9', '1');
INSERT INTO `ysk_config` VALUES ('26', '微信二维码', 'WEB_SITE_WX', '', '1', '', '', '', '0', '0', '0', '1');
INSERT INTO `ysk_config` VALUES ('32', '注册开关', 'close_reg', '1', '3', '', '0:关闭1:开启', '关闭注册功能说明', '0', '0', '12', '1');
INSERT INTO `ysk_config` VALUES ('33', '交易开关', 'close_trading', '1', '3', '', '0:关闭1:开启', '交易暂时关闭，16:00后开启', '0', '0', '13', '0');
INSERT INTO `ysk_config` VALUES ('41', '实时价格每分钟增长', 'growem', '', '2', '', '', '', '0', '0', '12', '1');
INSERT INTO `ysk_config` VALUES ('44', '奖励开关', 'regjifen', '0', '1', '0', '', '', '1407003397', '1407004692', '3', '1');

-- ----------------------------
-- Table structure for ysk_ewm
-- ----------------------------
DROP TABLE IF EXISTS `ysk_ewm`;
CREATE TABLE `ysk_ewm` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `ewm_class` int(11) NOT NULL COMMENT '二维码类型',
  `ewm_url` varchar(225) NOT NULL COMMENT '二维码地址',
  `ewm_price` float(10,3) NOT NULL COMMENT '二维码收款金额',
  `ewm_acc` varchar(225) NOT NULL COMMENT '二维码账号',
  `uaccount` varchar(225) NOT NULL COMMENT '用户账号',
  `uname` varchar(225) NOT NULL COMMENT '用户名',
  `addtime` varchar(225) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='二维码管理';

-- ----------------------------
-- Records of ysk_ewm
-- ----------------------------
INSERT INTO `ysk_ewm` VALUES ('76', '1', '1', '1', '/Public/attached/2020/04/12/5e92f95525fd4.jpg', '123.000', '123123', '13111111111', '13111111111', '1586690392');

-- ----------------------------
-- Table structure for ysk_group
-- ----------------------------
DROP TABLE IF EXISTS `ysk_group`;
CREATE TABLE `ysk_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级部门ID',
  `title` varchar(31) NOT NULL DEFAULT '' COMMENT '部门名称',
  `icon` varchar(31) NOT NULL DEFAULT '' COMMENT '图标',
  `menu_auth` text NOT NULL COMMENT '权限列表',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  `auth_id` int(11) DEFAULT NULL,
  `hylb` varchar(10) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门信息表';

-- ----------------------------
-- Records of ysk_group
-- ----------------------------
INSERT INTO `ysk_group` VALUES ('1', '0', '超级管理员', '', '', '1426881003', '1427552428', '0', '1', '1', '0');
INSERT INTO `ysk_group` VALUES ('2', '0', '财务查看', '', '1,7,8,9,3,323', '1498324367', '1571819694', '0', '-1', '2', '5');
INSERT INTO `ysk_group` VALUES ('9', '0', '18559453303', '', '1,7,8,9,348,349,350,351,359,357,352,353,355,360,361,356,3,5,6,327,323', '1585910665', '1585910734', '111', '1', null, '1,2,3,4,5');
INSERT INTO `ysk_group` VALUES ('7', '0', '超级管理', '', '1,3,4,6,327,7,8,9,316,318,322,323', '1526152893', '1528963727', '0', '-1', '0', '');
INSERT INTO `ysk_group` VALUES ('8', '0', '数据管理', '', '1,3,4,327,7,8,10,11,315,324,325,334,329,328', '1527085184', '1527140823', '0', '-1', '0', '0');
INSERT INTO `ysk_group` VALUES ('10', '0', '18559453301', '', '1,7,8,9,348,349,350,351,359,357,352,353,355,360,361,356,3,5,6,327,323', '1586150474', '1586150474', '255', '1', null, '1,2,3,4,5');

-- ----------------------------
-- Table structure for ysk_menu
-- ----------------------------
DROP TABLE IF EXISTS `ysk_menu`;
CREATE TABLE `ysk_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `pid` int(11) NOT NULL COMMENT '父级id',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '爷爷ID、',
  `col` varchar(30) NOT NULL COMMENT '控制器',
  `act` varchar(30) NOT NULL COMMENT '方法',
  `patch` varchar(50) DEFAULT NULL COMMENT '全路径',
  `level` int(11) NOT NULL COMMENT '级别',
  `icon` varchar(50) DEFAULT NULL,
  `sort` char(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=364 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_menu
-- ----------------------------
INSERT INTO `ysk_menu` VALUES ('327', '数据库管理', '3', '1', 'Database', 'index', '', '2', 'fa fa-lock', '14', '1');
INSERT INTO `ysk_menu` VALUES ('323', '系统公告', '3', '1', 'News', 'index', '', '2', 'fa-twitter-square', '51', '1');
INSERT INTO `ysk_menu` VALUES ('356', '支付成功订单', '352', '1', 'Roborder', 'ordersucc', '', '2', 'fa-calendar-check-o', '49', '1');
INSERT INTO `ysk_menu` VALUES ('355', '匹配成功支付中', '352', '1', 'Roborder', 'robsucc', '', '2', 'fa-calendar-plus-o', '40', '1');
INSERT INTO `ysk_menu` VALUES ('354', '抢单分配列表', '352', '1', 'Roborder', 'userrob', '', '2', 'fa-child', '39', '-1');
INSERT INTO `ysk_menu` VALUES ('1', '系统', '0', '0', '', '', '', '0', 'fa-cog', '0', '1');
INSERT INTO `ysk_menu` VALUES ('9', '推荐结构', '7', '1', 'Tree', 'index', '', '2', 'fa-th-large', '22', '1');
INSERT INTO `ysk_menu` VALUES ('8', '会员列表', '7', '1', 'User', 'index', '', '2', 'fa-user', '21', '1');
INSERT INTO `ysk_menu` VALUES ('7', '会员管理', '1', '1', '', '', '', '1', 'fa-folder-open-o', '1', '1');
INSERT INTO `ysk_menu` VALUES ('5', '角色管理', '3', '1', 'Group', 'index', '', '2', 'fa-sitemap', '12', '1');
INSERT INTO `ysk_menu` VALUES ('3', '统用功能', '1', '1', '', '', '', '1', 'fa-folder-open-o', '3', '1');
INSERT INTO `ysk_menu` VALUES ('6', '管理员管理', '3', '1', 'Manage', 'index', '', '2', 'fa fa-cog', '13', '1');
INSERT INTO `ysk_menu` VALUES ('352', '抢单管理', '1', '1', '', '', '', '1', 'fa-globe', '2', '1');
INSERT INTO `ysk_menu` VALUES ('353', '全部订单列表', '352', '1', 'Roborder', 'index', '', '2', 'fa-calendar', '38', '1');
INSERT INTO `ysk_menu` VALUES ('357', '游戏参数设置', '7', '1', 'Roborder', 'asystem', '', '2', 'fa-binoculars', '44', '1');
INSERT INTO `ysk_menu` VALUES ('351', '银行卡管理', '7', '1', 'User', 'bankcard', '', '2', 'fa-credit-card', '37', '1');
INSERT INTO `ysk_menu` VALUES ('350', '二维码管理', '7', '1', 'User', 'ewm', '', '2', 'fa-qrcode', '36', '1');
INSERT INTO `ysk_menu` VALUES ('349', '提现管理', '7', '1', 'User', 'withdraw', '', '2', 'fa-cube', '35', '1');
INSERT INTO `ysk_menu` VALUES ('348', '充值管理', '7', '1', 'User', 'recharge', '', '2', 'fa-cubes', '34', '1');
INSERT INTO `ysk_menu` VALUES ('358', '收款二维码管理', '3', '1', 'Roborder', 'skewm', '', '2', 'fa-twitter-square', '42', '0');
INSERT INTO `ysk_menu` VALUES ('359', '资金流水', '7', '1', 'User', 'bill', '', '2', 'fa-building-o', '43', '1');
INSERT INTO `ysk_menu` VALUES ('360', '未支付等待审查', '352', '1', 'Roborder', 'orderhasfali', '', '2', 'fa-calendar-o', '41', '1');
INSERT INTO `ysk_menu` VALUES ('361', '未支付订单', '352', '1', 'Roborder', 'orderfali', '', '2', 'fa-calendar-times-o', '42', '1');
INSERT INTO `ysk_menu` VALUES ('362', '商品管理', '1', '1', ' ', ' ', null, '1', 'fa-th-large', '45', '1');
INSERT INTO `ysk_menu` VALUES ('363', '商品列表', '362', '1', 'User', 'shop', null, '2', 'fa-qrcode', '46', '1');

-- ----------------------------
-- Table structure for ysk_news
-- ----------------------------
DROP TABLE IF EXISTS `ysk_news`;
CREATE TABLE `ysk_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标题',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '文章图片',
  `sort` smallint(6) NOT NULL DEFAULT '0',
  `desc` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_out` tinyint(4) NOT NULL DEFAULT '0',
  `content` text NOT NULL COMMENT '内容',
  `from` varchar(255) NOT NULL DEFAULT '' COMMENT '文章来源',
  `visit` smallint(6) NOT NULL DEFAULT '0',
  `lang` tinyint(4) NOT NULL DEFAULT '0',
  `tuijian` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统公告';

-- ----------------------------
-- Records of ysk_news
-- ----------------------------

-- ----------------------------
-- Table structure for ysk_notice
-- ----------------------------
DROP TABLE IF EXISTS `ysk_notice`;
CREATE TABLE `ysk_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_tittle` varchar(80) NOT NULL COMMENT '公告标题',
  `notice_content` varchar(600) NOT NULL COMMENT '公告详情',
  `notice_addtime` varchar(20) NOT NULL COMMENT '公告添加时间',
  `notice_read` text NOT NULL COMMENT '看过公告会员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_notice
-- ----------------------------

-- ----------------------------
-- Table structure for ysk_orderconfig
-- ----------------------------
DROP TABLE IF EXISTS `ysk_orderconfig`;
CREATE TABLE `ysk_orderconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paypipeiouttime` int(11) NOT NULL DEFAULT '0' COMMENT '支付匹配超时时间/s',
  `payonlineouttime` int(11) NOT NULL DEFAULT '0' COMMENT '支付在线超时时间/s',
  `payouttime` int(11) NOT NULL DEFAULT '0' COMMENT '支付超时时间/s',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ysk_orderconfig
-- ----------------------------
INSERT INTO `ysk_orderconfig` VALUES ('1', '16', '6', '300');

-- ----------------------------
-- Table structure for ysk_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `ysk_qrcode`;
CREATE TABLE `ysk_qrcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `uname` varchar(225) NOT NULL COMMENT '会员名称',
  `code_class` int(2) NOT NULL COMMENT '二维码类型1支付宝2微信3银行卡',
  `code_url` varchar(225) NOT NULL COMMENT '二维码图片地址',
  `uaccount` varchar(225) NOT NULL COMMENT '会员账号',
  `code_acc` varchar(225) NOT NULL COMMENT '二维码账号，如支付宝账号',
  `addtime` varchar(225) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='二维码管理';

-- ----------------------------
-- Records of ysk_qrcode
-- ----------------------------

-- ----------------------------
-- Table structure for ysk_recharge
-- ----------------------------
DROP TABLE IF EXISTS `ysk_recharge`;
CREATE TABLE `ysk_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `account` varchar(225) NOT NULL COMMENT '会员账号',
  `name` varchar(225) NOT NULL COMMENT '姓名',
  `price` float(10,3) NOT NULL COMMENT '充值金额',
  `way` int(11) NOT NULL COMMENT '充值方式：1支付宝2微信3银行卡',
  `addtime` varchar(225) NOT NULL COMMENT '充值日期',
  `status` int(11) NOT NULL COMMENT '充值状态1提交，2退回，3成功',
  `marker` varchar(225) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='会员充值表';

-- ----------------------------
-- Records of ysk_recharge
-- ----------------------------
INSERT INTO `ysk_recharge` VALUES ('31', '50', '13969901196', '张东健', '10000.000', '3', '1585747831', '1', '哇哈哈');
INSERT INTO `ysk_recharge` VALUES ('30', '50', '13969901196', '王大可1', '100.000', '3', '1576148093', '1', '');
INSERT INTO `ysk_recharge` VALUES ('29', '50', '13969901196', '还回家', '2000.000', '3', '1576133315', '2', '还回家');
INSERT INTO `ysk_recharge` VALUES ('23', '50', '13969901196', '王大可1', '10000.000', '3', '1572882761', '3', '额度');
INSERT INTO `ysk_recharge` VALUES ('24', '51', '13165124666', '刘勇', '1000.000', '3', '1575842851', '3', '');
INSERT INTO `ysk_recharge` VALUES ('25', '51', '13165124666', '刘勇', '20000.000', '3', '1575873838', '3', '');
INSERT INTO `ysk_recharge` VALUES ('26', '51', '13165124666', '刘勇', '1000.000', '3', '1575968937', '3', '');
INSERT INTO `ysk_recharge` VALUES ('27', '52', '15064030366', '沐阳', '10000.000', '3', '1576065315', '3', '');
INSERT INTO `ysk_recharge` VALUES ('28', '50', '13969901196', '对对对', '1000.000', '3', '1576115843', '3', '在宿舍');

-- ----------------------------
-- Table structure for ysk_roborder
-- ----------------------------
DROP TABLE IF EXISTS `ysk_roborder`;
CREATE TABLE `ysk_roborder` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `class` int(2) NOT NULL COMMENT '收款类型',
  `price` float(10,3) NOT NULL COMMENT '收款金额',
  `addtime` varchar(225) NOT NULL COMMENT '添加时间',
  `uponlinetime` varchar(255) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL COMMENT '订单状态',
  `uid` int(11) NOT NULL COMMENT '匹配用户ID',
  `uname` varchar(225) NOT NULL COMMENT '匹配用户名称',
  `umoney` float(10,3) NOT NULL COMMENT '匹配用户余额',
  `pipeitime` varchar(225) NOT NULL COMMENT '匹配时间',
  `finishtime` varchar(225) NOT NULL COMMENT '完成时间',
  `ordernum` varchar(225) NOT NULL COMMENT '订单号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COMMENT='抢单表';

-- ----------------------------
-- Records of ysk_roborder
-- ----------------------------
INSERT INTO `ysk_roborder` VALUES ('1', '1', '100.000', '1572919646', '1572919663', '5', '0', '', '0.000', '', '1572919821', '1027171572919646486516');
INSERT INTO `ysk_roborder` VALUES ('2', '1', '100.000', '1572919668', '1572919821', '5', '0', '', '0.000', '', '1572919821', '1027111572919668103298');
INSERT INTO `ysk_roborder` VALUES ('3', '1', '100.000', '1572919832', '1572919839', '5', '0', '', '0.000', '', '1572919847', '1027191572919832405559');
INSERT INTO `ysk_roborder` VALUES ('4', '1', '1000.000', '1572919852', '1572919860', '3', '50', '谭成山', '4065.000', '1572919861', '1572919880', '1027161572919852988418');
INSERT INTO `ysk_roborder` VALUES ('5', '1', '1000.000', '1572920335', '1572920350', '5', '0', '', '0.000', '', '1572920351', '1027131572920335965971');
INSERT INTO `ysk_roborder` VALUES ('6', '1', '1000.000', '1572920382', '1572920382', '3', '50', '谭成山', '3078.000', '1572920383', '1572920492', '1027121572920382436292');
INSERT INTO `ysk_roborder` VALUES ('7', '1', '100.000', '1572921055', '1572921012', '5', '0', '', '0.000', '', '1572921020', '1027121572921055852721');
INSERT INTO `ysk_roborder` VALUES ('8', '1', '100.000', '1572921484', '1572921498', '5', '0', '', '0.000', '', '1572921500', '1027161572921484389762');
INSERT INTO `ysk_roborder` VALUES ('9', '1', '100.000', '1572921832', '1572921832', '5', '0', '', '0.000', '', '1572921838', '1027111572921832644959');
INSERT INTO `ysk_roborder` VALUES ('10', '1', '1000.000', '1572921898', '1572921898', '5', '0', '', '0.000', '', '1572921904', '1027181572921898968312');
INSERT INTO `ysk_roborder` VALUES ('11', '1', '1000.000', '1572921901', '1572921901', '3', '50', '谭成山', '2091.000', '1572921903', '1572921954', '1027161572921901358428');
INSERT INTO `ysk_roborder` VALUES ('12', '1', '100.000', '1572922701', '1572922701', '3', '50', '谭成山', '1104.000', '1572922702', '1572922826', '1027131572922701316727');
INSERT INTO `ysk_roborder` VALUES ('13', '1', '100.000', '1572957515', '1572959543', '5', '0', '', '0.000', '', '1575806376', '1027121572957515213498');
INSERT INTO `ysk_roborder` VALUES ('14', '2', '100.000', '1575811234', '1575811250', '5', '0', '', '0.000', '', '1575811251', '1027141575811234650318');
INSERT INTO `ysk_roborder` VALUES ('15', '2', '100.000', '1575811257', '1575811273', '5', '0', '', '0.000', '', '1575811274', '1027171575811257434583');
INSERT INTO `ysk_roborder` VALUES ('16', '2', '100.000', '1575811370', '1575811386', '5', '0', '', '0.000', '', '1575811387', '1027141575811370317672');
INSERT INTO `ysk_roborder` VALUES ('17', '1', '100.000', '1575811439', '1575811439', '3', '50', '谭成山', '1005.300', '1575811440', '1575811473', '1027111575811439871423');
INSERT INTO `ysk_roborder` VALUES ('18', '1', '100.000', '1575811517', '1575811517', '3', '50', '谭成山', '906.600', '1575811518', '1575811561', '1027191575811517459119');
INSERT INTO `ysk_roborder` VALUES ('19', '1', '100.000', '1575811992', '1575811992', '3', '50', '谭成山', '807.900', '1575811992', '1575812032', '1027151575811992296454');
INSERT INTO `ysk_roborder` VALUES ('20', '1', '100.000', '1575816591', '1575816591', '4', '50', '谭成山', '709.200', '1575816591', '1575817079', '1027131575816591794617');
INSERT INTO `ysk_roborder` VALUES ('21', '1', '100.000', '1575817570', '1575817570', '3', '50', '谭成山', '609.200', '1575817570', '1575817862', '1027151575817570127747');
INSERT INTO `ysk_roborder` VALUES ('22', '1', '100.000', '1575820186', '1575820202', '5', '0', '', '0.000', '', '1575820202', '1027161575820186113899');
INSERT INTO `ysk_roborder` VALUES ('23', '1', '100.000', '1575822697', '1575822712', '5', '0', '', '0.000', '', '1575822714', '1027161575822697650913');
INSERT INTO `ysk_roborder` VALUES ('24', '1', '100.000', '1575822737', '1575822737', '3', '50', '谭成山', '510.200', '1575822738', '1575822767', '1027161575822737399273');
INSERT INTO `ysk_roborder` VALUES ('25', '1', '100.000', '1575860875', '1575860875', '4', '50', '谭成山', '411.200', '1575860876', '1575861176', '1027141575860875248544');
INSERT INTO `ysk_roborder` VALUES ('26', '1', '100.000', '1575863178', '1575863178', '4', '50', '谭成山', '311.200', '1575863178', '1575863478', '1027121575863178262938');
INSERT INTO `ysk_roborder` VALUES ('27', '1', '300.000', '1575872581', '1575872596', '5', '0', '', '0.000', '', '1575872598', '1031151575872581143179');
INSERT INTO `ysk_roborder` VALUES ('28', '1', '300.000', '1575872615', '1575872623', '5', '0', '', '0.000', '', '1575872630', '1031161575872615195668');
INSERT INTO `ysk_roborder` VALUES ('29', '1', '1000.000', '1575872755', '1575872764', '4', '51', '刘勇', '1000.000', '1575872764', '1575873064', '1031181575872755252132');
INSERT INTO `ysk_roborder` VALUES ('30', '1', '500.000', '1575875216', '1575875216', '3', '51', '刘勇', '20000.000', '1575875216', '1575875427', '1031161575875216727283');
INSERT INTO `ysk_roborder` VALUES ('31', '2', '500.000', '1575875307', '1575875323', '5', '0', '', '0.000', '', '1575875324', '1031151575875307555778');
INSERT INTO `ysk_roborder` VALUES ('32', '1', '1000.000', '1575876413', '1575876422', '3', '51', '刘勇', '19507.500', '1575876423', '1575876436', '1031041575876413701453');
INSERT INTO `ysk_roborder` VALUES ('33', '1', '100.000', '1575893829', '1575893829', '4', '50', '谭成山', '213.450', '1575893831', '1575894132', '1027141575893829776398');
INSERT INTO `ysk_roborder` VALUES ('34', '1', '100.000', '1575894576', '1575894576', '3', '50', '谭成山', '100000.000', '1575894576', '1575894772', '1027121575894576161755');
INSERT INTO `ysk_roborder` VALUES ('35', '1', '100.000', '1575894671', '1575894686', '5', '0', '', '0.000', '', '1575894687', '1027191575894671171744');
INSERT INTO `ysk_roborder` VALUES ('36', '1', '100.000', '1575894792', '1575894792', '4', '50', '谭成山', '99901.500', '1575894793', '1575895094', '1027161575894792650195');
INSERT INTO `ysk_roborder` VALUES ('37', '1', '100.000', '1575895141', '1575895141', '4', '50', '谭成山', '99801.500', '1575895142', '1575895442', '1027191575895141140074');
INSERT INTO `ysk_roborder` VALUES ('38', '1', '100.000', '1575895370', '1575895385', '5', '0', '', '0.000', '', '1575895386', '1027171575895370218735');
INSERT INTO `ysk_roborder` VALUES ('39', '1', '100.000', '1575895724', '1575895725', '4', '50', '谭成山', '99701.500', '1575895726', '1575896026', '1027131575895724636945');
INSERT INTO `ysk_roborder` VALUES ('40', '1', '100.000', '1575896047', '1575896048', '4', '50', '谭成山', '99601.500', '1575896049', '1575896349', '1027171575896047253462');
INSERT INTO `ysk_roborder` VALUES ('41', '1', '100.000', '1575896362', '1575896363', '4', '50', '谭成山', '99501.500', '1575896364', '1575896664', '1027121575896362306227');
INSERT INTO `ysk_roborder` VALUES ('42', '1', '100.000', '1575896697', '1575896697', '4', '50', '谭成山', '99401.500', '1575896698', '1575896998', '1027181575896697710131');
INSERT INTO `ysk_roborder` VALUES ('43', '1', '100.000', '1575897069', '1575897069', '4', '50', '谭成山', '99301.500', '1575897070', '1575897370', '1027111575897069322095');
INSERT INTO `ysk_roborder` VALUES ('44', '1', '100.000', '1575898284', '1575898284', '4', '50', '谭成山', '99201.500', '1575898285', '1575898586', '1027181575898284863943');
INSERT INTO `ysk_roborder` VALUES ('45', '1', '100.000', '1575898599', '1575898599', '4', '50', '谭成山', '99101.500', '1575898600', '1575898901', '1027131575898599244363');
INSERT INTO `ysk_roborder` VALUES ('46', '1', '100.000', '1575898914', '1575898916', '4', '50', '谭成山', '99001.500', '1575898917', '1575899218', '1027111575898914169851');
INSERT INTO `ysk_roborder` VALUES ('47', '1', '100.000', '1575899239', '1575899239', '4', '50', '谭成山', '98901.500', '1575899240', '1575899540', '1027131575899239285745');
INSERT INTO `ysk_roborder` VALUES ('48', '1', '100.000', '1575899487', '1575899499', '5', '0', '', '0.000', '', '1575899504', '1027171575899487137362');
INSERT INTO `ysk_roborder` VALUES ('49', '1', '100.000', '1575899551', '1575899552', '4', '50', '谭成山', '98801.500', '1575899553', '1575899854', '1027181575899551992541');
INSERT INTO `ysk_roborder` VALUES ('50', '1', '100.000', '1575899712', '1575899727', '5', '0', '', '0.000', '', '1575899728', '1027151575899712916292');
INSERT INTO `ysk_roborder` VALUES ('51', '1', '100.000', '1575899914', '1575899914', '4', '50', '谭成山', '98701.500', '1575899915', '1575900216', '1027131575899914336643');
INSERT INTO `ysk_roborder` VALUES ('52', '1', '100.000', '1575901255', '1575901271', '5', '0', '', '0.000', '', '1575901272', '1027161575901255695584');
INSERT INTO `ysk_roborder` VALUES ('53', '1', '100.000', '1575901317', '1575901333', '5', '0', '', '0.000', '', '1575901334', '1027191575901317820822');
INSERT INTO `ysk_roborder` VALUES ('54', '1', '100.000', '1575901439', '1575901439', '5', '0', '', '0.000', '', '1575901446', '1027171575901439614867');
INSERT INTO `ysk_roborder` VALUES ('55', '2', '100.000', '1575901477', '1575901492', '5', '0', '', '0.000', '', '1575901494', '1027111575901477496364');
INSERT INTO `ysk_roborder` VALUES ('56', '1', '100.000', '1575901549', '1575901549', '3', '50', '谭成山', '98601.500', '1575901550', '1575901566', '1027131575901549788431');
INSERT INTO `ysk_roborder` VALUES ('57', '2', '100.000', '1575901699', '1575901716', '5', '0', '', '0.000', '', '1575901716', '1027111575901699292818');
INSERT INTO `ysk_roborder` VALUES ('58', '2', '100.000', '1575901726', '1575901741', '5', '0', '', '0.000', '', '1575901742', '1027111575901726940938');
INSERT INTO `ysk_roborder` VALUES ('59', '3', '100.000', '1575901765', '1575901780', '5', '0', '', '0.000', '', '1575901782', '1027141575901765661355');
INSERT INTO `ysk_roborder` VALUES ('60', '1', '100.000', '1575901973', '1575901988', '5', '0', '', '0.000', '', '1575901990', '1027141575901973256813');
INSERT INTO `ysk_roborder` VALUES ('61', '1', '100.000', '1575902163', '1575902163', '4', '50', '谭成山', '98503.000', '1575902163', '1575902464', '1027121575902163128868');
INSERT INTO `ysk_roborder` VALUES ('62', '1', '100.000', '1575902606', '1575902621', '5', '0', '', '0.000', '', '1575902622', '1027161575902606941578');
INSERT INTO `ysk_roborder` VALUES ('63', '1', '100.000', '1575902869', '1575902869', '3', '50', '谭成山', '98403.000', '1575902871', '1575903159', '1027191575902869266176');
INSERT INTO `ysk_roborder` VALUES ('64', '1', '100.000', '1575903173', '1575903173', '3', '50', '谭成山', '98304.500', '1575903174', '1575903183', '1027131575903173195074');
INSERT INTO `ysk_roborder` VALUES ('65', '1', '100.000', '1575903580', '1575903582', '3', '50', '谭成山', '98206.000', '1575903583', '1575903657', '1027111575903580867872');
INSERT INTO `ysk_roborder` VALUES ('66', '1', '100.000', '1575903649', '1575903652', '5', '0', '', '0.000', '', '1575903659', '1027161575903649298538');
INSERT INTO `ysk_roborder` VALUES ('67', '1', '100.000', '1575903708', '1575903708', '3', '50', '谭成山', '98107.500', '1575903709', '1575903747', '1027191575903708645185');
INSERT INTO `ysk_roborder` VALUES ('68', '1', '100.000', '1575904623', '1575904623', '5', '0', '', '0.000', '', '1575904630', '1027151575904623812912');
INSERT INTO `ysk_roborder` VALUES ('69', '1', '100.000', '1575904716', '1575904716', '3', '50', '谭成山', '98009.000', '1575904717', '1575904850', '1027171575904716730546');
INSERT INTO `ysk_roborder` VALUES ('70', '1', '100.000', '1575904974', '1575904974', '3', '50', '谭成山', '97910.500', '1575904976', '1575905069', '1027171575904974790653');
INSERT INTO `ysk_roborder` VALUES ('71', '1', '100.000', '1575905140', '1575905140', '3', '50', '谭成山', '97812.000', '1575905142', '1575905385', '1027131575905140195696');
INSERT INTO `ysk_roborder` VALUES ('72', '1', '100.000', '1575905401', '1575905401', '3', '50', '谭成山', '97713.500', '1575905402', '1575905615', '1027141575905401198899');
INSERT INTO `ysk_roborder` VALUES ('73', '1', '100.000', '1575905640', '1575905640', '3', '50', '谭成山', '97615.000', '1575905640', '1575905652', '1027141575905640681344');
INSERT INTO `ysk_roborder` VALUES ('74', '1', '100.000', '1575905673', '1575905674', '3', '50', '谭成山', '97516.500', '1575905675', '1575905690', '1027171575905673556283');
INSERT INTO `ysk_roborder` VALUES ('75', '1', '100.000', '1575905829', '1575905830', '3', '50', '谭成山', '97418.000', '1575905831', '1575905842', '1027161575905829340049');
INSERT INTO `ysk_roborder` VALUES ('76', '1', '100.000', '1575905907', '1575905907', '3', '50', '谭成山', '97319.500', '1575905909', '1575905913', '1027111575905907281727');
INSERT INTO `ysk_roborder` VALUES ('77', '1', '100.000', '1575905972', '1575905976', '3', '50', '谭成山', '97221.000', '1575905976', '1575905983', '1027111575905972491226');
INSERT INTO `ysk_roborder` VALUES ('78', '1', '100.000', '1575906267', '1575906267', '3', '50', '谭成山', '97122.500', '1575906268', '1575906448', '1027181575906267955847');
INSERT INTO `ysk_roborder` VALUES ('79', '1', '100.000', '1575906519', '1575906519', '3', '50', '谭成山', '97024.000', '1575906519', '1575906552', '1027121575906519688521');
INSERT INTO `ysk_roborder` VALUES ('80', '1', '100.000', '1575907027', '1575907043', '5', '0', '', '0.000', '', '1575907044', '1027141575907027194323');
INSERT INTO `ysk_roborder` VALUES ('81', '1', '100.000', '1575908043', '1575908043', '5', '0', '', '0.000', '', '1575908049', '1027171575908043200174');
INSERT INTO `ysk_roborder` VALUES ('82', '1', '100.000', '1575908064', '1575908079', '5', '0', '', '0.000', '', '1575908080', '1027141575908064834627');
INSERT INTO `ysk_roborder` VALUES ('83', '1', '100.000', '1575908175', '1575908175', '3', '50', '谭成山', '96925.500', '1575908175', '1575908252', '1027151575908175501382');
INSERT INTO `ysk_roborder` VALUES ('84', '1', '500.000', '1575965740', '1575965899', '5', '0', '', '0.000', '', '1575965899', '1031011575965740434662');
INSERT INTO `ysk_roborder` VALUES ('85', '1', '500.000', '1575965948', '1575965948', '4', '51', '刘勇', '18522.500', '1575965949', '1575966249', '1031061575965948679481');
INSERT INTO `ysk_roborder` VALUES ('86', '1', '1000.000', '1575966420', '1575966438', '5', '0', '', '0.000', '', '1575966438', '1031061575966420684428');
INSERT INTO `ysk_roborder` VALUES ('87', '1', '1000.000', '1575966457', '1575966469', '5', '0', '', '0.000', '', '1575966474', '1031081575966457151494');
INSERT INTO `ysk_roborder` VALUES ('88', '2', '1000.000', '1575966487', '1575966487', '3', '51', '刘勇', '18022.500', '1575966488', '1575966499', '1031061575966487729492');
INSERT INTO `ysk_roborder` VALUES ('89', '2', '1000.000', '1575966961', '1575966961', '3', '51', '刘勇', '17034.500', '1575966961', '1575966969', '1031161575966961594396');
INSERT INTO `ysk_roborder` VALUES ('90', '1', '800.000', '1575967470', '1575967484', '5', '0', '', '0.000', '', '1575967486', '1031121575967470507066');
INSERT INTO `ysk_roborder` VALUES ('91', '1', '800.000', '1575967518', '1575967523', '3', '51', '刘勇', '16046.500', '1575967524', '1575967624', '1031111575967518787261');
INSERT INTO `ysk_roborder` VALUES ('92', '1', '500.000', '1575967582', '1575967597', '5', '0', '', '0.000', '', '1575967599', '1031171575967582595813');
INSERT INTO `ysk_roborder` VALUES ('93', '1', '500.000', '1575967663', '1575967679', '5', '0', '', '0.000', '', '1575967680', '1031141575967663566719');
INSERT INTO `ysk_roborder` VALUES ('94', '1', '500.000', '1575967691', '1575967699', '3', '51', '刘勇', '15258.500', '1575967699', '1575967723', '1031161575967691376384');
INSERT INTO `ysk_roborder` VALUES ('95', '1', '500.000', '1575969346', '1575969347', '3', '51', '刘勇', '15766.000', '1575969347', '1575969355', '1031111575969346394453');
INSERT INTO `ysk_roborder` VALUES ('96', '1', '500.000', '1575969459', '1575969461', '3', '51', '刘勇', '15373.500', '1575969462', '1575969469', '1031161575969459804974');
INSERT INTO `ysk_roborder` VALUES ('97', '1', '100.000', '1576133701', '1576133701', '3', '50', '谭成山', '97842.852', '1576133703', '1576133714', '1027111576133701549633');
INSERT INTO `ysk_roborder` VALUES ('98', '1', '1000.000', '1576134475', '1576134485', '5', '0', '', '0.000', '', '1576134491', '1031071576134475426226');
INSERT INTO `ysk_roborder` VALUES ('99', '2', '1000.000', '1576134502', '1576134502', '3', '51', '刘勇', '14881.000', '1576134503', '1576134518', '1031061576134502164315');
INSERT INTO `ysk_roborder` VALUES ('100', '2', '1000.000', '1576134691', '1576134691', '3', '51', '刘勇', '13913.000', '1576134692', '1576134706', '1031081576134691191252');
INSERT INTO `ysk_roborder` VALUES ('101', '1', '100.000', '1576135099', '1576135099', '3', '50', '谭成山', '97750.750', '1576135100', '1576135104', '1027171576135099198056');
INSERT INTO `ysk_roborder` VALUES ('102', '1', '800.000', '1576178390', '1576178392', '3', '51', '刘勇', '12925.000', '1576178392', '1576178399', '1031011576178390844946');
INSERT INTO `ysk_roborder` VALUES ('103', '2', '1000.000', '1576178728', '1576178728', '3', '51', '刘勇', '12138.600', '1576178728', '1576178738', '1031061576178728959774');
INSERT INTO `ysk_roborder` VALUES ('104', '2', '500.000', '1576178953', '1576178989', '5', '0', '', '0.000', '', '1576322778', '1031021576178953609971');
INSERT INTO `ysk_roborder` VALUES ('105', '2', '500.000', '1576179006', '1576179019', '5', '0', '', '0.000', '', '1576322778', '1031071576179006175312');
INSERT INTO `ysk_roborder` VALUES ('106', '1', '500.000', '1576179030', '1576179031', '3', '51', '刘勇', '11152.600', '1576179031', '1576179091', '1031021576179030400399');
INSERT INTO `ysk_roborder` VALUES ('107', '2', '1000.000', '1576180175', '1576180186', '5', '0', '', '0.000', '', '1576322778', '1031041576180175752994');
INSERT INTO `ysk_roborder` VALUES ('108', '2', '1000.000', '1576180206', '1576180206', '3', '51', '刘勇', '10661.100', '1576180207', '1576180215', '1031051576180206169221');
INSERT INTO `ysk_roborder` VALUES ('109', '1', '500.000', '1576236036', '1576236591', '5', '0', '', '0.000', '', '1576322778', '1031181576236036375771');
INSERT INTO `ysk_roborder` VALUES ('110', '1', '100.000', '1576322783', '1576322783', '3', '50', '谭成山', '97657.258', '1576322784', '1576322861', '1027121576322783760277');
INSERT INTO `ysk_roborder` VALUES ('111', '1', '100.000', '1576323137', '1576323137', '4', '50', '谭成山', '97558.961', '1576323137', '1576323437', '1027151576323137971957');
INSERT INTO `ysk_roborder` VALUES ('112', '1', '500.000', '1576384846', '1576384846', '3', '51', '刘勇', '9175.100', '1576384847', '1576384864', '1031081576384846567243');
INSERT INTO `ysk_roborder` VALUES ('113', '1', '500.000', '1576548295', '1576548295', '3', '51', '刘勇', '8683.600', '1576548296', '1576548313', '1031021576548295799572');
INSERT INTO `ysk_roborder` VALUES ('114', '1', '500.000', '1576555226', '1576555229', '4', '51', '刘勇', '8192.100', '1576555231', '1576557720', '1031031576555226125346');
INSERT INTO `ysk_roborder` VALUES ('115', '1', '100.000', '1576560901', '1576560901', '3', '50', '谭成山', '96260.664', '1576560902', '1576560920', '1027141576560901525425');
INSERT INTO `ysk_roborder` VALUES ('116', '1', '100.000', '1576560949', '1576560950', '3', '50', '谭成山', '96162.367', '1576560951', '1576560957', '1027151576560949708318');
INSERT INTO `ysk_roborder` VALUES ('117', '1', '100.000', '1576560951', '1576560966', '5', '0', '', '0.000', '', '1576560967', '1027111576560951410585');
INSERT INTO `ysk_roborder` VALUES ('118', '1', '100.000', '1576560974', '1576560975', '3', '50', '谭成山', '96064.070', '1576560975', '1576560982', '1027121576560974858788');
INSERT INTO `ysk_roborder` VALUES ('119', '1', '100.000', '1576561817', '1576561817', '3', '50', '谭成山', '95965.773', '1576561817', '1576561865', '1027181576561817411836');
INSERT INTO `ysk_roborder` VALUES ('120', '1', '100.000', '1576561897', '1576561897', '3', '50', '谭成山', '95867.477', '1576561897', '1576561905', '1027151576561897145599');
INSERT INTO `ysk_roborder` VALUES ('121', '1', '100.000', '1576561952', '1576561953', '3', '50', '谭成山', '95769.180', '1576561953', '1576561961', '1027161576561952396992');
INSERT INTO `ysk_roborder` VALUES ('122', '1', '100.000', '1576561984', '1576561985', '3', '50', '谭成山', '95670.883', '1576561985', '1576562019', '1027171576561984335031');
INSERT INTO `ysk_roborder` VALUES ('123', '1', '100.000', '1576562028', '1576562028', '3', '50', '谭成山', '95572.586', '1576562030', '1576562039', '1027191576562028470615');
INSERT INTO `ysk_roborder` VALUES ('124', '1', '100.000', '1576562049', '1576562049', '3', '50', '谭成山', '95474.289', '1576562049', '1576562066', '1027151576562049374227');
INSERT INTO `ysk_roborder` VALUES ('125', '1', '100.000', '1576562108', '1576562108', '3', '50', '谭成山', '95375.992', '1576562109', '1576562240', '1027121576562108514746');
INSERT INTO `ysk_roborder` VALUES ('126', '1', '100.000', '1576562267', '1576562267', '3', '50', '谭成山', '95277.695', '1576562268', '1576562276', '1027131576562267486527');
INSERT INTO `ysk_roborder` VALUES ('127', '1', '100.000', '1576562274', '1576562280', '3', '50', '谭成山', '95179.398', '1576562280', '1576562295', '1027191576562274739716');
INSERT INTO `ysk_roborder` VALUES ('128', '1', '100.000', '1576562286', '1576562301', '5', '0', '', '0.000', '', '1576562303', '1027111576562286979539');
INSERT INTO `ysk_roborder` VALUES ('129', '1', '100.000', '1576562331', '1576562331', '3', '50', '谭成山', '95081.102', '1576562331', '1576562340', '1027151576562331549568');
INSERT INTO `ysk_roborder` VALUES ('130', '1', '100.000', '1576562332', '1576562348', '5', '0', '', '0.000', '', '1576562348', '1027171576562332266134');
INSERT INTO `ysk_roborder` VALUES ('131', '1', '100.000', '1576562335', '1576562350', '5', '0', '', '0.000', '', '1576562353', '1027151576562335218138');
INSERT INTO `ysk_roborder` VALUES ('132', '1', '100.000', '1576562345', '1576562345', '3', '50', '谭成山', '94982.805', '1576562346', '1576562354', '1027191576562345197831');
INSERT INTO `ysk_roborder` VALUES ('133', '1', '100.000', '1576562362', '1576562363', '3', '50', '谭成山', '94884.508', '1576562363', '1576562370', '1027161576562362879317');
INSERT INTO `ysk_roborder` VALUES ('134', '1', '100.000', '1576562376', '1576562377', '3', '50', '谭成山', '94786.211', '1576562377', '1576562401', '1027151576562376709826');
INSERT INTO `ysk_roborder` VALUES ('135', '1', '100.000', '1576562384', '1576562399', '5', '0', '', '0.000', '', '1576562400', '1027161576562384128526');
INSERT INTO `ysk_roborder` VALUES ('136', '1', '100.000', '1576562405', '1576562422', '5', '0', '', '0.000', '', '1576562423', '1027131576562405880086');
INSERT INTO `ysk_roborder` VALUES ('137', '1', '100.000', '1576562431', '1576562438', '5', '0', '', '0.000', '', '1576562445', '1027131576562431337216');
INSERT INTO `ysk_roborder` VALUES ('138', '1', '100.000', '1576562476', '1576562478', '3', '50', '谭成山', '94687.914', '1576562478', '1576562490', '1027141576562476999112');
INSERT INTO `ysk_roborder` VALUES ('139', '1', '100.000', '1576562485', '1576562497', '3', '50', '谭成山', '94589.617', '1576562498', '1576562535', '1027121576562485879832');
INSERT INTO `ysk_roborder` VALUES ('140', '1', '100.000', '1576562561', '1576562561', '3', '50', '谭成山', '94491.320', '1576562561', '1576562824', '1027131576562561253941');
INSERT INTO `ysk_roborder` VALUES ('141', '1', '500.000', '1576562714', '1576562714', '3', '51', '刘勇', '7692.100', '1576562715', '1576562732', '1031071576562714373472');
INSERT INTO `ysk_roborder` VALUES ('142', '1', '100.000', '1576562842', '1576562842', '3', '50', '谭成山', '94393.875', '1576562843', '1576562856', '1027151576562842823379');
INSERT INTO `ysk_roborder` VALUES ('143', '1', '500.000', '1576562867', '1576562867', '4', '51', '刘勇', '7200.600', '1576562868', '1576563169', '1031071576562867829459');
INSERT INTO `ysk_roborder` VALUES ('144', '1', '100.000', '1576562870', '1576562870', '3', '50', '谭成山', '94295.578', '1576562871', '1576562877', '1027121576562870386221');
INSERT INTO `ysk_roborder` VALUES ('145', '1', '100.000', '1576562884', '1576562884', '3', '50', '谭成山', '94197.281', '1576562885', '1576562893', '1027141576562884218216');
INSERT INTO `ysk_roborder` VALUES ('146', '1', '100.000', '1576562899', '1576562899', '3', '50', '谭成山', '94098.984', '1576562904', '1576562911', '1027181576562899942427');
INSERT INTO `ysk_roborder` VALUES ('147', '1', '100.000', '1576562918', '1576562920', '3', '50', '谭成山', '94000.688', '1576562920', '1576562930', '1027161576562918445918');
INSERT INTO `ysk_roborder` VALUES ('148', '1', '100.000', '1576562937', '1576562937', '3', '50', '谭成山', '93902.391', '1576562938', '1576562960', '1027151576562937645644');
INSERT INTO `ysk_roborder` VALUES ('149', '1', '100.000', '1576563006', '1576563006', '3', '50', '谭成山', '93804.094', '1576563008', '1576563026', '1027131576563006144197');
INSERT INTO `ysk_roborder` VALUES ('150', '1', '100.000', '1576563057', '1576563057', '3', '50', '谭成山', '93705.797', '1576563058', '1576563065', '1027171576563057149434');
INSERT INTO `ysk_roborder` VALUES ('151', '1', '100.000', '1576563131', '1576563131', '3', '50', '谭成山', '93607.500', '1576563132', '1576563140', '1027141576563131171613');
INSERT INTO `ysk_roborder` VALUES ('152', '1', '100.000', '1576563216', '1576563216', '3', '50', '谭成山', '93509.203', '1576563217', '1576563228', '1027171576563216965054');
INSERT INTO `ysk_roborder` VALUES ('153', '1', '100.000', '1576563235', '1576563235', '3', '50', '谭成山', '93410.906', '1576563236', '1576563243', '1027171576563235228765');
INSERT INTO `ysk_roborder` VALUES ('154', '1', '100.000', '1576563250', '1576563250', '3', '50', '谭成山', '93312.609', '1576563250', '1576563257', '1027171576563250332719');
INSERT INTO `ysk_roborder` VALUES ('155', '1', '100.000', '1576563284', '1576563284', '3', '50', '谭成山', '93214.312', '1576563285', '1576563293', '1027151576563284984891');
INSERT INTO `ysk_roborder` VALUES ('156', '1', '500.000', '1576563375', '1576563375', '4', '51', '刘勇', '6700.600', '1576563376', '1576563677', '1031031576563375604118');
INSERT INTO `ysk_roborder` VALUES ('157', '1', '100.000', '1576563381', '1576563382', '3', '50', '谭成山', '93116.016', '1576563382', '1576563390', '1027111576563381916944');
INSERT INTO `ysk_roborder` VALUES ('158', '1', '100.000', '1576563396', '1576563397', '3', '50', '谭成山', '93017.719', '1576563397', '1576563583', '1027111576563396738829');
INSERT INTO `ysk_roborder` VALUES ('159', '1', '100.000', '1576564584', '1576564586', '3', '50', '谭成山', '92919.422', '1576564586', '1576564614', '1027181576564584462441');
INSERT INTO `ysk_roborder` VALUES ('160', '1', '100.000', '1576564625', '1576564626', '3', '50', '谭成山', '92821.125', '1576564626', '1576564836', '1027141576564625511821');
INSERT INTO `ysk_roborder` VALUES ('161', '1', '100.000', '1576564920', '1576564920', '3', '50', '谭成山', '92722.828', '1576564921', '1576564934', '1027111576564920883242');
INSERT INTO `ysk_roborder` VALUES ('162', '1', '100.000', '1576564950', '1576564950', '3', '50', '谭成山', '92624.531', '1576564951', '1576565027', '1027131576564950334822');
INSERT INTO `ysk_roborder` VALUES ('163', '1', '100.000', '1576565039', '1576565039', '3', '50', '谭成山', '92526.234', '1576565040', '1576565056', '1027151576565039542778');
INSERT INTO `ysk_roborder` VALUES ('164', '1', '500.000', '1576565218', '1576565218', '3', '51', '刘勇', '6200.600', '1576565219', '1576565273', '1031091576565218288823');
INSERT INTO `ysk_roborder` VALUES ('165', '1', '500.000', '1576565281', '1576565286', '4', '51', '刘勇', '5709.100', '1576565288', '1576565589', '1031091576565281295055');
INSERT INTO `ysk_roborder` VALUES ('166', '1', '500.000', '1576565607', '1576565608', '4', '51', '刘勇', '5209.100', '1576565608', '1576565908', '1031021576565607170571');
INSERT INTO `ysk_roborder` VALUES ('167', '1', '100.000', '1576565782', '1576565782', '4', '50', '谭成山', '92428.789', '1576565782', '1576566083', '1027141576565782887358');
INSERT INTO `ysk_roborder` VALUES ('168', '1', '100.000', '1576567839', '1576567839', '3', '50', '谭成山', '92328.789', '1576567839', '1576567847', '1027151576567839549948');
INSERT INTO `ysk_roborder` VALUES ('169', '1', '100.000', '1576567888', '1576567888', '3', '50', '谭成山', '92230.492', '1576567889', '1576567896', '1027161576567888474128');
INSERT INTO `ysk_roborder` VALUES ('170', '1', '100.000', '1576568020', '1576568020', '3', '50', '谭成山', '92132.195', '1576568021', '1576568064', '1027171576568020341567');
INSERT INTO `ysk_roborder` VALUES ('171', '1', '100.000', '1576568219', '1576568219', '3', '50', '谭成山', '92033.898', '1576568219', '1576568232', '1027171576568219344258');
INSERT INTO `ysk_roborder` VALUES ('172', '1', '100.000', '1576568247', '1576568247', '3', '50', '谭成山', '91935.602', '1576568248', '1576568271', '1027161576568247786944');
INSERT INTO `ysk_roborder` VALUES ('173', '1', '100.000', '1576568283', '1576568283', '3', '50', '谭成山', '91837.305', '1576568284', '1576568337', '1027131576568283860184');
INSERT INTO `ysk_roborder` VALUES ('174', '1', '100.000', '1576568346', '1576568348', '3', '50', '谭成山', '91739.008', '1576568348', '1576568361', '1027141576568346551322');
INSERT INTO `ysk_roborder` VALUES ('175', '1', '100.000', '1576569808', '1576569808', '3', '50', '谭成山', '91640.711', '1576569809', '1576569987', '1027161576569808209987');
INSERT INTO `ysk_roborder` VALUES ('176', '1', '100.000', '1576569996', '1576569996', '3', '50', '谭成山', '91542.414', '1576569997', '1576570045', '1027181576569996830816');
INSERT INTO `ysk_roborder` VALUES ('177', '1', '100.000', '1576570067', '1576570068', '3', '50', '谭成山', '91444.117', '1576570069', '1576570080', '1027141576570067472147');
INSERT INTO `ysk_roborder` VALUES ('178', '1', '100.000', '1576570091', '1576570091', '3', '50', '谭成山', '91345.820', '1576570092', '1576570108', '1027141576570091673882');
INSERT INTO `ysk_roborder` VALUES ('179', '1', '500.000', '1576570333', '1576570333', '3', '51', '刘勇', '4709.100', '1576570335', '1576570442', '1031021576570333292096');
INSERT INTO `ysk_roborder` VALUES ('180', '1', '500.000', '1576570455', '1576570456', '4', '51', '刘勇', '4217.600', '1576570456', '1576570759', '1031081576570455514226');
INSERT INTO `ysk_roborder` VALUES ('181', '1', '100.000', '1576571121', '1576571121', '3', '50', '谭成山', '91248.375', '1576571122', '1576571147', '1027121576571121271843');
INSERT INTO `ysk_roborder` VALUES ('182', '1', '100.000', '1576571222', '1576571237', '5', '0', '', '0.000', '', '1576571238', '1027161576571222416371');
INSERT INTO `ysk_roborder` VALUES ('183', '1', '100.000', '1576571247', '1576571247', '3', '50', '谭成山', '91150.078', '1576571249', '1576571458', '1027131576571247371915');
INSERT INTO `ysk_roborder` VALUES ('184', '1', '100.000', '1576571472', '1576571472', '3', '50', '谭成山', '91051.781', '1576571473', '1576571514', '1027181576571472234057');
INSERT INTO `ysk_roborder` VALUES ('185', '1', '100.000', '1576571551', '1576571551', '3', '50', '谭成山', '90953.484', '1576571552', '1576571564', '1027181576571551125989');
INSERT INTO `ysk_roborder` VALUES ('186', '1', '100.000', '1576571697', '1576571697', '3', '50', '谭成山', '90855.188', '1576571698', '1576571708', '1027171576571697781167');
INSERT INTO `ysk_roborder` VALUES ('187', '1', '100.000', '1576571833', '1576571833', '3', '50', '谭成山', '90756.891', '1576571833', '1576571841', '1027111576571833767095');
INSERT INTO `ysk_roborder` VALUES ('188', '1', '100.000', '1576571881', '1576571881', '3', '50', '谭成山', '90658.594', '1576571882', '1576571916', '1027111576571881614191');
INSERT INTO `ysk_roborder` VALUES ('189', '1', '100.000', '1576572230', '1576572230', '3', '50', '谭成山', '90560.297', '1576572230', '1576572237', '1027111576572230268179');
INSERT INTO `ysk_roborder` VALUES ('190', '1', '100.000', '1576572258', '1576572258', '3', '50', '谭成山', '90462.000', '1576572259', '1576572266', '1027151576572258128839');
INSERT INTO `ysk_roborder` VALUES ('191', '1', '100.000', '1576572275', '1576572275', '4', '50', '谭成山', '90363.703', '1576572277', '1576572577', '1027111576572275193359');
INSERT INTO `ysk_roborder` VALUES ('192', '1', '100.000', '1576573503', '1576573503', '3', '50', '谭成山', '90263.703', '1576573504', '1576573511', '1027161576573503367438');
INSERT INTO `ysk_roborder` VALUES ('193', '1', '100.000', '1576575886', '1576575886', '3', '50', '谭成山', '90165.406', '1576575887', '1576575894', '1027151576575886962372');

-- ----------------------------
-- Table structure for ysk_shop
-- ----------------------------
DROP TABLE IF EXISTS `ysk_shop`;
CREATE TABLE `ysk_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `name` text NOT NULL COMMENT '商品名称',
  `price` float(10,3) NOT NULL COMMENT '商品价格',
  `img` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `addtime` varchar(225) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='二维码管理';

-- ----------------------------
-- Records of ysk_shop
-- ----------------------------
INSERT INTO `ysk_shop` VALUES ('76', '安娜家anna 邂逅浪漫田园！v领法式长裙子 复古碎花连衣裙女春秋', '123.000', '/Public/attached/2020/04/12/5e92f95525fd4.jpg', '1586690392');
INSERT INTO `ysk_shop` VALUES ('77', '格子衬衫女春秋2020新款宽松方领复古薄款休闲长袖中长款chic衬衣', '156.000', 'logo.gif', '1586690639');

-- ----------------------------
-- Table structure for ysk_skm
-- ----------------------------
DROP TABLE IF EXISTS `ysk_skm`;
CREATE TABLE `ysk_skm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wxewm` varchar(225) NOT NULL,
  `zfbewm` varchar(225) NOT NULL,
  `bankewm` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='收款码';

-- ----------------------------
-- Records of ysk_skm
-- ----------------------------
INSERT INTO `ysk_skm` VALUES ('1', '2019pay/2019-03-20/5c911c22156dc.png', '2019pay/2019-03-20/5c911c22188b8.png', '2019pay/2019-03-20/5c911c221b2c7.png');

-- ----------------------------
-- Table structure for ysk_somebill
-- ----------------------------
DROP TABLE IF EXISTS `ysk_somebill`;
CREATE TABLE `ysk_somebill` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `jl_class` int(11) NOT NULL COMMENT '流水类别：1佣金2团队奖励3充值4提现5订单匹配',
  `info` varchar(225) NOT NULL COMMENT '说明',
  `addtime` varchar(225) NOT NULL COMMENT '事件时间',
  `jc_class` varchar(225) NOT NULL COMMENT '分+ 或-',
  `num` float(10,3) NOT NULL COMMENT '币量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=utf8 COMMENT='会员流水账单';

-- ----------------------------
-- Records of ysk_somebill
-- ----------------------------
INSERT INTO `ysk_somebill` VALUES ('1', '50', '5', '微信抢单本金', '1572919880', '-', '1000.000');
INSERT INTO `ysk_somebill` VALUES ('2', '50', '1', '微信抢单佣金', '1572919880', '+', '13.000');
INSERT INTO `ysk_somebill` VALUES ('3', '50', '5', '微信抢单本金', '1572920492', '-', '1000.000');
INSERT INTO `ysk_somebill` VALUES ('4', '50', '1', '微信抢单佣金', '1572920492', '+', '13.000');
INSERT INTO `ysk_somebill` VALUES ('5', '50', '5', '微信抢单本金', '1572921954', '-', '1000.000');
INSERT INTO `ysk_somebill` VALUES ('6', '50', '1', '微信抢单佣金', '1572921954', '+', '13.000');
INSERT INTO `ysk_somebill` VALUES ('7', '50', '5', '微信抢单本金', '1572922826', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('8', '50', '1', '微信抢单佣金', '1572922826', '+', '1.300');
INSERT INTO `ysk_somebill` VALUES ('9', '50', '5', '微信抢单本金', '1575811473', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('10', '50', '1', '微信抢单佣金', '1575811473', '+', '1.300');
INSERT INTO `ysk_somebill` VALUES ('11', '50', '5', '微信抢单本金', '1575811561', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('12', '50', '1', '微信抢单佣金', '1575811561', '+', '1.300');
INSERT INTO `ysk_somebill` VALUES ('13', '50', '5', '微信抢单本金', '1575812032', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('14', '50', '1', '微信抢单佣金', '1575812032', '+', '1.300');
INSERT INTO `ysk_somebill` VALUES ('15', '50', '5', '微信抢单本金', '1575817862', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('16', '50', '1', '微信抢单佣金', '1575817862', '+', '1.000');
INSERT INTO `ysk_somebill` VALUES ('17', '50', '5', '微信抢单本金', '1575822767', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('18', '50', '1', '微信抢单佣金', '1575822767', '+', '1.000');
INSERT INTO `ysk_somebill` VALUES ('19', '51', '5', '微信抢单本金', '1575875427', '-', '500.000');
INSERT INTO `ysk_somebill` VALUES ('20', '51', '1', '微信抢单佣金', '1575875427', '+', '7.500');
INSERT INTO `ysk_somebill` VALUES ('21', '50', '1', '直推抢单成功佣金', '1575875427', '+', '0.750');
INSERT INTO `ysk_somebill` VALUES ('22', '51', '5', '微信抢单本金', '1575876436', '-', '1000.000');
INSERT INTO `ysk_somebill` VALUES ('23', '51', '1', '微信抢单佣金', '1575876436', '+', '15.000');
INSERT INTO `ysk_somebill` VALUES ('24', '50', '1', '直推抢单成功佣金', '1575876436', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('25', '50', '5', '微信抢单本金', '1575894772', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('26', '50', '1', '微信抢单佣金', '1575894772', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('27', '50', '5', '微信抢单本金', '1575901566', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('28', '50', '1', '微信抢单佣金', '1575901566', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('29', '50', '5', '微信抢单本金', '1575903159', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('30', '50', '1', '微信抢单佣金', '1575903159', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('31', '50', '5', '微信抢单本金', '1575903183', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('32', '50', '1', '微信抢单佣金', '1575903183', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('33', '50', '5', '微信抢单本金', '1575903657', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('34', '50', '1', '微信抢单佣金', '1575903657', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('35', '50', '5', '微信抢单本金', '1575903747', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('36', '50', '1', '微信抢单佣金', '1575903747', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('37', '50', '5', '微信抢单本金', '1575904850', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('38', '50', '1', '微信抢单佣金', '1575904850', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('39', '50', '5', '微信抢单本金', '1575905069', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('40', '50', '1', '微信抢单佣金', '1575905069', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('41', '50', '5', '微信抢单本金', '1575905385', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('42', '50', '1', '微信抢单佣金', '1575905385', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('43', '50', '5', '微信抢单本金', '1575905615', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('44', '50', '1', '微信抢单佣金', '1575905615', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('45', '50', '5', '微信抢单本金', '1575905652', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('46', '50', '1', '微信抢单佣金', '1575905652', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('47', '50', '5', '微信抢单本金', '1575905690', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('48', '50', '1', '微信抢单佣金', '1575905690', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('49', '50', '5', '微信抢单本金', '1575905842', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('50', '50', '1', '微信抢单佣金', '1575905842', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('51', '50', '5', '微信抢单本金', '1575905913', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('52', '50', '1', '微信抢单佣金', '1575905913', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('53', '50', '5', '微信抢单本金', '1575905983', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('54', '50', '1', '微信抢单佣金', '1575905983', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('55', '50', '5', '微信抢单本金', '1575906448', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('56', '50', '1', '微信抢单佣金', '1575906448', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('57', '50', '5', '微信抢单本金', '1575906552', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('58', '50', '1', '微信抢单佣金', '1575906552', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('59', '50', '5', '微信抢单本金', '1575908252', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('60', '50', '1', '微信抢单佣金', '1575908252', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('61', '51', '5', '支付宝抢单本金', '1575966499', '-', '1000.000');
INSERT INTO `ysk_somebill` VALUES ('62', '51', '1', '支付宝抢单佣金', '1575966499', '+', '12.000');
INSERT INTO `ysk_somebill` VALUES ('63', '50', '1', '直推抢单成功佣金', '1575966499', '+', '1.200');
INSERT INTO `ysk_somebill` VALUES ('64', '51', '5', '支付宝抢单本金', '1575966969', '-', '1000.000');
INSERT INTO `ysk_somebill` VALUES ('65', '51', '1', '支付宝抢单佣金', '1575966969', '+', '12.000');
INSERT INTO `ysk_somebill` VALUES ('66', '50', '1', '直推抢单成功佣金', '1575966969', '+', '1.200');
INSERT INTO `ysk_somebill` VALUES ('67', '51', '5', '微信抢单本金', '1575967624', '-', '800.000');
INSERT INTO `ysk_somebill` VALUES ('68', '51', '1', '微信抢单佣金', '1575967624', '+', '12.000');
INSERT INTO `ysk_somebill` VALUES ('69', '50', '1', '直推抢单成功佣金', '1575967624', '+', '1.200');
INSERT INTO `ysk_somebill` VALUES ('70', '51', '5', '微信抢单本金', '1575967723', '-', '500.000');
INSERT INTO `ysk_somebill` VALUES ('71', '51', '1', '微信抢单佣金', '1575967723', '+', '7.500');
INSERT INTO `ysk_somebill` VALUES ('72', '50', '1', '直推抢单成功佣金', '1575967723', '+', '0.750');
INSERT INTO `ysk_somebill` VALUES ('73', '51', '5', '微信抢单本金', '1575969355', '-', '500.000');
INSERT INTO `ysk_somebill` VALUES ('74', '51', '1', '微信抢单佣金', '1575969355', '+', '107.500');
INSERT INTO `ysk_somebill` VALUES ('75', '50', '1', '直推抢单成功佣金', '1575969355', '+', '10.750');
INSERT INTO `ysk_somebill` VALUES ('76', '51', '5', '微信抢单本金', '1575969469', '-', '500.000');
INSERT INTO `ysk_somebill` VALUES ('77', '51', '1', '微信抢单佣金', '1575969469', '+', '7.500');
INSERT INTO `ysk_somebill` VALUES ('78', '50', '1', '直推抢单成功佣金', '1575969469', '+', '0.750');
INSERT INTO `ysk_somebill` VALUES ('79', '50', '5', '微信抢单本金', '1576133714', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('80', '50', '1', '微信抢单佣金', '1576133714', '+', '3.500');
INSERT INTO `ysk_somebill` VALUES ('81', '51', '5', '支付宝抢单本金', '1576134518', '-', '1000.000');
INSERT INTO `ysk_somebill` VALUES ('82', '51', '1', '支付宝抢单佣金', '1576134518', '+', '32.000');
INSERT INTO `ysk_somebill` VALUES ('83', '50', '1', '直推抢单成功佣金', '1576134518', '+', '3.200');
INSERT INTO `ysk_somebill` VALUES ('84', '51', '5', '支付宝抢单本金', '1576134706', '-', '1000.000');
INSERT INTO `ysk_somebill` VALUES ('85', '51', '1', '支付宝抢单佣金', '1576134706', '+', '12.000');
INSERT INTO `ysk_somebill` VALUES ('86', '50', '1', '直推抢单成功佣金', '1576134706', '+', '1.200');
INSERT INTO `ysk_somebill` VALUES ('87', '50', '5', '微信抢单本金', '1576135104', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('88', '50', '1', '微信抢单佣金', '1576135104', '+', '1.500');
INSERT INTO `ysk_somebill` VALUES ('89', '51', '5', '微信抢单本金', '1576178399', '-', '800.000');
INSERT INTO `ysk_somebill` VALUES ('90', '51', '1', '微信抢单佣金', '1576178399', '+', '13.600');
INSERT INTO `ysk_somebill` VALUES ('91', '50', '1', '直推抢单成功佣金', '1576178399', '+', '1.360');
INSERT INTO `ysk_somebill` VALUES ('92', '51', '5', '支付宝抢单本金', '1576178738', '-', '1000.000');
INSERT INTO `ysk_somebill` VALUES ('93', '51', '1', '支付宝抢单佣金', '1576178738', '+', '14.000');
INSERT INTO `ysk_somebill` VALUES ('94', '50', '1', '直推抢单成功佣金', '1576178738', '+', '1.400');
INSERT INTO `ysk_somebill` VALUES ('95', '51', '5', '微信抢单本金', '1576179091', '-', '500.000');
INSERT INTO `ysk_somebill` VALUES ('96', '51', '1', '微信抢单佣金', '1576179091', '+', '8.500');
INSERT INTO `ysk_somebill` VALUES ('97', '50', '1', '直推抢单成功佣金', '1576179091', '+', '0.850');
INSERT INTO `ysk_somebill` VALUES ('98', '51', '5', '支付宝抢单本金', '1576180215', '-', '1000.000');
INSERT INTO `ysk_somebill` VALUES ('99', '51', '1', '支付宝抢单佣金', '1576180215', '+', '14.000');
INSERT INTO `ysk_somebill` VALUES ('100', '50', '1', '直推抢单成功佣金', '1576180215', '+', '1.400');
INSERT INTO `ysk_somebill` VALUES ('101', '50', '5', '微信抢单本金', '1576322861', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('102', '50', '1', '微信抢单佣金', '1576322861', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('103', '51', '5', '微信抢单本金', '1576384864', '-', '500.000');
INSERT INTO `ysk_somebill` VALUES ('104', '51', '1', '微信抢单佣金', '1576384864', '+', '8.500');
INSERT INTO `ysk_somebill` VALUES ('105', '50', '1', '直推抢单成功佣金', '1576384864', '+', '0.850');
INSERT INTO `ysk_somebill` VALUES ('106', '51', '5', '微信抢单本金', '1576548313', '-', '500.000');
INSERT INTO `ysk_somebill` VALUES ('107', '51', '1', '微信抢单佣金', '1576548313', '+', '8.500');
INSERT INTO `ysk_somebill` VALUES ('108', '50', '1', '直推抢单成功佣金', '1576548313', '+', '0.850');
INSERT INTO `ysk_somebill` VALUES ('109', '50', '5', '微信抢单本金', '1576560920', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('110', '50', '1', '微信抢单佣金', '1576560920', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('111', '50', '5', '微信抢单本金', '1576560957', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('112', '50', '1', '微信抢单佣金', '1576560957', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('113', '50', '5', '微信抢单本金', '1576560982', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('114', '50', '1', '微信抢单佣金', '1576560982', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('115', '50', '5', '微信抢单本金', '1576561865', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('116', '50', '1', '微信抢单佣金', '1576561865', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('117', '50', '5', '微信抢单本金', '1576561905', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('118', '50', '1', '微信抢单佣金', '1576561905', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('119', '50', '5', '微信抢单本金', '1576561961', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('120', '50', '1', '微信抢单佣金', '1576561961', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('121', '50', '5', '微信抢单本金', '1576562019', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('122', '50', '1', '微信抢单佣金', '1576562019', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('123', '50', '5', '微信抢单本金', '1576562039', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('124', '50', '1', '微信抢单佣金', '1576562039', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('125', '50', '5', '微信抢单本金', '1576562066', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('126', '50', '1', '微信抢单佣金', '1576562066', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('127', '50', '5', '微信抢单本金', '1576562240', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('128', '50', '1', '微信抢单佣金', '1576562240', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('129', '50', '5', '微信抢单本金', '1576562276', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('130', '50', '1', '微信抢单佣金', '1576562276', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('131', '50', '5', '微信抢单本金', '1576562295', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('132', '50', '1', '微信抢单佣金', '1576562295', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('133', '50', '5', '微信抢单本金', '1576562340', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('134', '50', '1', '微信抢单佣金', '1576562340', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('135', '50', '5', '微信抢单本金', '1576562354', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('136', '50', '1', '微信抢单佣金', '1576562354', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('137', '50', '5', '微信抢单本金', '1576562370', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('138', '50', '1', '微信抢单佣金', '1576562370', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('139', '50', '5', '微信抢单本金', '1576562401', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('140', '50', '1', '微信抢单佣金', '1576562401', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('141', '50', '5', '微信抢单本金', '1576562490', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('142', '50', '1', '微信抢单佣金', '1576562490', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('143', '50', '5', '微信抢单本金', '1576562535', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('144', '50', '1', '微信抢单佣金', '1576562535', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('145', '51', '5', '微信抢单本金', '1576562732', '-', '500.000');
INSERT INTO `ysk_somebill` VALUES ('146', '51', '1', '微信抢单佣金', '1576562732', '+', '8.500');
INSERT INTO `ysk_somebill` VALUES ('147', '50', '1', '直推抢单成功佣金', '1576562732', '+', '0.850');
INSERT INTO `ysk_somebill` VALUES ('148', '50', '5', '微信抢单本金', '1576562824', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('149', '50', '1', '微信抢单佣金', '1576562824', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('150', '50', '5', '微信抢单本金', '1576562856', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('151', '50', '1', '微信抢单佣金', '1576562856', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('152', '50', '5', '微信抢单本金', '1576562877', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('153', '50', '1', '微信抢单佣金', '1576562877', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('154', '50', '5', '微信抢单本金', '1576562893', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('155', '50', '1', '微信抢单佣金', '1576562893', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('156', '50', '5', '微信抢单本金', '1576562911', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('157', '50', '1', '微信抢单佣金', '1576562911', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('158', '50', '5', '微信抢单本金', '1576562930', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('159', '50', '1', '微信抢单佣金', '1576562930', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('160', '50', '5', '微信抢单本金', '1576562960', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('161', '50', '1', '微信抢单佣金', '1576562960', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('162', '50', '5', '微信抢单本金', '1576563026', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('163', '50', '1', '微信抢单佣金', '1576563026', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('164', '50', '5', '微信抢单本金', '1576563065', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('165', '50', '1', '微信抢单佣金', '1576563065', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('166', '50', '5', '微信抢单本金', '1576563140', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('167', '50', '1', '微信抢单佣金', '1576563140', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('168', '50', '5', '微信抢单本金', '1576563228', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('169', '50', '1', '微信抢单佣金', '1576563228', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('170', '50', '5', '微信抢单本金', '1576563243', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('171', '50', '1', '微信抢单佣金', '1576563243', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('172', '50', '5', '微信抢单本金', '1576563257', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('173', '50', '1', '微信抢单佣金', '1576563257', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('174', '50', '5', '微信抢单本金', '1576563293', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('175', '50', '1', '微信抢单佣金', '1576563293', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('176', '50', '5', '微信抢单本金', '1576563390', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('177', '50', '1', '微信抢单佣金', '1576563390', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('178', '50', '5', '微信抢单本金', '1576563583', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('179', '50', '1', '微信抢单佣金', '1576563583', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('180', '50', '5', '微信抢单本金', '1576564614', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('181', '50', '1', '微信抢单佣金', '1576564614', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('182', '50', '5', '微信抢单本金', '1576564836', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('183', '50', '1', '微信抢单佣金', '1576564836', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('184', '50', '5', '微信抢单本金', '1576564934', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('185', '50', '1', '微信抢单佣金', '1576564934', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('186', '50', '5', '微信抢单本金', '1576565027', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('187', '50', '1', '微信抢单佣金', '1576565027', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('188', '50', '5', '微信抢单本金', '1576565056', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('189', '50', '1', '微信抢单佣金', '1576565056', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('190', '51', '5', '微信抢单本金', '1576565273', '-', '500.000');
INSERT INTO `ysk_somebill` VALUES ('191', '51', '1', '微信抢单佣金', '1576565273', '+', '8.500');
INSERT INTO `ysk_somebill` VALUES ('192', '50', '1', '直推抢单成功佣金', '1576565273', '+', '0.850');
INSERT INTO `ysk_somebill` VALUES ('193', '50', '5', '微信抢单本金', '1576567847', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('194', '50', '1', '微信抢单佣金', '1576567847', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('195', '50', '5', '微信抢单本金', '1576567896', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('196', '50', '1', '微信抢单佣金', '1576567896', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('197', '50', '5', '微信抢单本金', '1576568064', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('198', '50', '1', '微信抢单佣金', '1576568064', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('199', '50', '5', '微信抢单本金', '1576568232', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('200', '50', '1', '微信抢单佣金', '1576568232', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('201', '50', '5', '微信抢单本金', '1576568271', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('202', '50', '1', '微信抢单佣金', '1576568271', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('203', '50', '5', '微信抢单本金', '1576568337', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('204', '50', '1', '微信抢单佣金', '1576568337', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('205', '50', '5', '微信抢单本金', '1576568361', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('206', '50', '1', '微信抢单佣金', '1576568361', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('207', '50', '5', '微信抢单本金', '1576569987', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('208', '50', '1', '微信抢单佣金', '1576569987', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('209', '50', '5', '微信抢单本金', '1576570045', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('210', '50', '1', '微信抢单佣金', '1576570045', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('211', '50', '5', '微信抢单本金', '1576570080', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('212', '50', '1', '微信抢单佣金', '1576570080', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('213', '50', '5', '微信抢单本金', '1576570108', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('214', '50', '1', '微信抢单佣金', '1576570108', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('215', '51', '5', '微信抢单本金', '1576570442', '-', '500.000');
INSERT INTO `ysk_somebill` VALUES ('216', '51', '1', '微信抢单佣金', '1576570442', '+', '8.500');
INSERT INTO `ysk_somebill` VALUES ('217', '50', '1', '直推抢单成功佣金', '1576570442', '+', '0.850');
INSERT INTO `ysk_somebill` VALUES ('218', '50', '5', '微信抢单本金', '1576571147', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('219', '50', '1', '微信抢单佣金', '1576571147', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('220', '50', '5', '微信抢单本金', '1576571458', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('221', '50', '1', '微信抢单佣金', '1576571458', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('222', '50', '5', '微信抢单本金', '1576571514', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('223', '50', '1', '微信抢单佣金', '1576571514', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('224', '50', '5', '微信抢单本金', '1576571564', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('225', '50', '1', '微信抢单佣金', '1576571564', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('226', '50', '5', '微信抢单本金', '1576571708', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('227', '50', '1', '微信抢单佣金', '1576571708', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('228', '50', '5', '微信抢单本金', '1576571841', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('229', '50', '1', '微信抢单佣金', '1576571841', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('230', '50', '5', '微信抢单本金', '1576571916', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('231', '50', '1', '微信抢单佣金', '1576571916', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('232', '50', '5', '微信抢单本金', '1576572237', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('233', '50', '1', '微信抢单佣金', '1576572237', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('234', '50', '5', '微信抢单本金', '1576572266', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('235', '50', '1', '微信抢单佣金', '1576572266', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('236', '50', '5', '微信抢单本金', '1576573511', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('237', '50', '1', '微信抢单佣金', '1576573511', '+', '1.700');
INSERT INTO `ysk_somebill` VALUES ('238', '50', '5', '微信抢单本金', '1576575894', '-', '100.000');
INSERT INTO `ysk_somebill` VALUES ('239', '50', '1', '微信抢单佣金', '1576575894', '+', '1.700');

-- ----------------------------
-- Table structure for ysk_store
-- ----------------------------
DROP TABLE IF EXISTS `ysk_store`;
CREATE TABLE `ysk_store` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `cangku_num` decimal(13,5) NOT NULL DEFAULT '0.00000' COMMENT '钱包余额',
  `fengmi_num` decimal(13,5) NOT NULL DEFAULT '0.00000' COMMENT '积分',
  `plant_num` decimal(13,4) NOT NULL DEFAULT '0.0000' COMMENT '播种总数',
  `huafei_total` decimal(13,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '施肥累计',
  `vip_grade` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of ysk_store
-- ----------------------------

-- ----------------------------
-- Table structure for ysk_system
-- ----------------------------
DROP TABLE IF EXISTS `ysk_system`;
CREATE TABLE `ysk_system` (
  `id` int(2) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `qd_cf` int(11) NOT NULL COMMENT '抢单余额比列',
  `qd_nd` varchar(225) NOT NULL COMMENT '抢单难度，数组(0.1,0.2,0.3)',
  `qd_wxyj` float(10,3) NOT NULL COMMENT '微信抢单佣金30%填0.3',
  `qd_zfbyj` float(10,3) NOT NULL COMMENT '支付宝抢单佣金30%填0.3',
  `qd_bkyj` float(10,3) NOT NULL COMMENT '银行卡抢单佣金30%填0.3',
  `qd_ndtime` varchar(225) NOT NULL COMMENT '增加难度时间点',
  `qd_yjjc` varchar(12) NOT NULL COMMENT '佣金加成',
  `qd_minmoney` float NOT NULL COMMENT '抢单最低额度',
  `min_recharge` float(10,3) NOT NULL COMMENT '最低充值额度',
  `mix_withdraw` float(10,3) NOT NULL COMMENT '最小提现额度',
  `max_withdraw` float(10,3) NOT NULL COMMENT '最大提现额度',
  `tx_yeb` float NOT NULL COMMENT '提现要求：收款与余额比例 ',
  `team_oneyj` float(10,3) NOT NULL COMMENT '1代佣金比例30%写0.3',
  `team_twoyj` float(10,3) NOT NULL COMMENT '2代佣金比例30%写0.3',
  `team_threeyj` float(10,3) NOT NULL COMMENT '3代佣金比例30%写0.3',
  `cz_yh` varchar(255) NOT NULL,
  `cz_xm` varchar(255) NOT NULL,
  `cz_kh` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='游戏参数设置表';

-- ----------------------------
-- Records of ysk_system
-- ----------------------------
INSERT INTO `ysk_system` VALUES ('1', '70', '0.2', '0.015', '0.012', '0.010', '1，12', '0.002', '100', '500.000', '500.000', '10000.000', '50', '0.100', '0.050', '0.030', '农业银行', '朱德义', '6228481198233289579');

-- ----------------------------
-- Table structure for ysk_upload
-- ----------------------------
DROP TABLE IF EXISTS `ysk_upload`;
CREATE TABLE `ysk_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'UID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `url` varchar(255) DEFAULT NULL COMMENT '文件链接',
  `ext` char(4) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) DEFAULT NULL COMMENT '文件md5',
  `sha1` char(40) DEFAULT NULL COMMENT '文件sha1编码',
  `location` varchar(15) NOT NULL DEFAULT '' COMMENT '文件存储位置',
  `download` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传表';

-- ----------------------------
-- Records of ysk_upload
-- ----------------------------

-- ----------------------------
-- Table structure for ysk_user
-- ----------------------------
DROP TABLE IF EXISTS `ysk_user`;
CREATE TABLE `ysk_user` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL COMMENT '上级ID',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '上上级ID',
  `ggid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上上上级ID',
  `account` char(20) NOT NULL DEFAULT '0' COMMENT '用户账号',
  `mobile` char(20) NOT NULL COMMENT '用户手机号',
  `u_yqm` varchar(225) NOT NULL COMMENT '邀请码',
  `username` varchar(255) NOT NULL DEFAULT '',
  `login_pwd` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `login_salt` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `money` float(10,3) NOT NULL DEFAULT '0.000' COMMENT '用户余额',
  `reg_date` int(11) NOT NULL COMMENT '注册时间',
  `reg_ip` varchar(20) NOT NULL COMMENT '注册IP',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户锁定  1 不锁  0拉黑  -1 删除',
  `activate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否激活 1-已激活 0-未激活',
  `session_id` varchar(225) DEFAULT NULL,
  `wx_no` varchar(225) DEFAULT NULL COMMENT '微信账号',
  `alipay` varchar(225) DEFAULT NULL COMMENT '支付宝',
  `truename` varchar(225) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(225) NOT NULL COMMENT '电子邮件',
  `userqq` varchar(32) NOT NULL COMMENT 'QQ',
  `usercard` varchar(32) NOT NULL COMMENT '身份证号码',
  `path` text,
  `use_grade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户等级',
  `u_ztnum` int(11) NOT NULL COMMENT '直推人数',
  `rz_st` int(1) NOT NULL COMMENT '资料完善状态，1OK2no',
  `tx_status` int(11) NOT NULL COMMENT '提现状态',
  `zsy` float(10,3) NOT NULL COMMENT '总收益',
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  UNIQUE KEY `account` (`account`) USING BTREE,
  KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ysk_user
-- ----------------------------
INSERT INTO `ysk_user` VALUES ('1', '0', '0', '0', '13111111111', '13111111111', 'mYZVaoFYZwb4', '13111111111', '1ea9bb4c15e153968b495debcac1b5a1', 'nJfl', '1000.000', '1553320281', '60.217.21.254', '1', '0', 'r803ahrmln6urrgc9isev58k4g', null, null, null, '421692188@qq.com', '123', '123', null, '0', '16', '1', '1', '1.000');

-- ----------------------------
-- Table structure for ysk_userrob
-- ----------------------------
DROP TABLE IF EXISTS `ysk_userrob`;
CREATE TABLE `ysk_userrob` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `class` int(2) NOT NULL COMMENT '支付类别',
  `price` float(10,3) NOT NULL COMMENT '金额',
  `yjjc` float(10,3) NOT NULL COMMENT '佣金加成',
  `umoney` float(10,3) NOT NULL COMMENT '会员余额',
  `uaccount` varchar(225) NOT NULL COMMENT '会员账号',
  `uname` varchar(225) NOT NULL COMMENT '会员姓名',
  `ppid` int(11) NOT NULL COMMENT '匹配的ID号',
  `hasfalistate` tinyint(4) NOT NULL DEFAULT '0' COMMENT '未支付审查：1已审查；-1未审查',
  `hasfailres` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1返还；-1未返还',
  `status` int(2) NOT NULL COMMENT '状态1等2匹配中3成功',
  `addtime` varchar(225) NOT NULL COMMENT '添加时间',
  `pipeitime` varchar(225) NOT NULL COMMENT '匹配成功时间',
  `finishtime` varchar(225) NOT NULL COMMENT '交易完成时间',
  `ordernum` varchar(225) NOT NULL COMMENT '订单号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COMMENT='会员抢单表前台发起的';

-- ----------------------------
-- Records of ysk_userrob
-- ----------------------------
INSERT INTO `ysk_userrob` VALUES ('1', '50', '1', '1000.000', '0.000', '4065.000', '13969901196', '谭成山', '4', '-1', '0', '3', '1572919861', '1572919861', '1572919880', '1027161572919852988418');
INSERT INTO `ysk_userrob` VALUES ('2', '50', '1', '1000.000', '0.000', '3078.000', '13969901196', '谭成山', '6', '-1', '0', '3', '1572920383', '1572920383', '1572920492', '1027121572920382436292');
INSERT INTO `ysk_userrob` VALUES ('3', '50', '1', '1000.000', '0.000', '2091.000', '13969901196', '谭成山', '11', '-1', '0', '3', '1572921903', '1572921903', '1572921954', '1027161572921901358428');
INSERT INTO `ysk_userrob` VALUES ('4', '50', '1', '100.000', '0.000', '1104.000', '13969901196', '谭成山', '12', '-1', '0', '3', '1572922702', '1572922702', '1572922826', '1027131572922701316727');
INSERT INTO `ysk_userrob` VALUES ('5', '50', '1', '100.000', '0.000', '1005.300', '13969901196', '谭成山', '17', '-1', '0', '3', '1575811440', '1575811440', '1575811473', '1027111575811439871423');
INSERT INTO `ysk_userrob` VALUES ('6', '50', '1', '100.000', '0.000', '906.600', '13969901196', '谭成山', '18', '-1', '0', '3', '1575811518', '1575811518', '1575811561', '1027191575811517459119');
INSERT INTO `ysk_userrob` VALUES ('7', '50', '1', '100.000', '0.000', '807.900', '13969901196', '谭成山', '19', '-1', '0', '3', '1575811992', '1575811992', '1575812032', '1027151575811992296454');
INSERT INTO `ysk_userrob` VALUES ('8', '50', '1', '100.000', '0.000', '709.200', '13969901196', '谭成山', '20', '-1', '0', '4', '1575816591', '1575816591', '1575817079', '1027131575816591794617');
INSERT INTO `ysk_userrob` VALUES ('9', '50', '1', '100.000', '0.000', '609.200', '13969901196', '谭成山', '21', '-1', '0', '3', '1575817570', '1575817570', '1575817862', '1027151575817570127747');
INSERT INTO `ysk_userrob` VALUES ('10', '50', '1', '100.000', '0.000', '510.200', '13969901196', '谭成山', '24', '-1', '0', '3', '1575822738', '1575822738', '1575822767', '1027161575822737399273');
INSERT INTO `ysk_userrob` VALUES ('11', '50', '1', '100.000', '0.000', '411.200', '13969901196', '谭成山', '25', '-1', '0', '4', '1575860876', '1575860876', '1575861176', '1027141575860875248544');
INSERT INTO `ysk_userrob` VALUES ('12', '50', '1', '100.000', '0.000', '311.200', '13969901196', '谭成山', '26', '-1', '0', '4', '1575863178', '1575863178', '1575863478', '1027121575863178262938');
INSERT INTO `ysk_userrob` VALUES ('13', '51', '1', '1000.000', '0.000', '1000.000', '13165124666', '刘勇', '29', '-1', '0', '4', '1575872764', '1575872764', '1575873064', '1031181575872755252132');
INSERT INTO `ysk_userrob` VALUES ('14', '51', '1', '500.000', '0.000', '20000.000', '13165124666', '刘勇', '30', '-1', '0', '3', '1575875216', '1575875216', '1575875427', '1031161575875216727283');
INSERT INTO `ysk_userrob` VALUES ('15', '51', '1', '1000.000', '0.000', '19507.500', '13165124666', '刘勇', '32', '-1', '0', '3', '1575876423', '1575876423', '1575876436', '1031041575876413701453');
INSERT INTO `ysk_userrob` VALUES ('16', '50', '1', '100.000', '0.000', '213.450', '13969901196', '谭成山', '33', '-1', '0', '4', '1575893831', '1575893831', '1575894132', '1027141575893829776398');
INSERT INTO `ysk_userrob` VALUES ('17', '50', '1', '100.000', '0.000', '100000.000', '13969901196', '谭成山', '34', '-1', '0', '3', '1575894576', '1575894576', '1575894772', '1027121575894576161755');
INSERT INTO `ysk_userrob` VALUES ('18', '50', '1', '100.000', '0.000', '99901.500', '13969901196', '谭成山', '36', '-1', '0', '4', '1575894793', '1575894793', '1575895094', '1027161575894792650195');
INSERT INTO `ysk_userrob` VALUES ('19', '50', '1', '100.000', '0.000', '99801.500', '13969901196', '谭成山', '37', '-1', '0', '4', '1575895142', '1575895142', '1575895442', '1027191575895141140074');
INSERT INTO `ysk_userrob` VALUES ('20', '50', '1', '100.000', '0.000', '99701.500', '13969901196', '谭成山', '39', '-1', '0', '4', '1575895726', '1575895726', '1575896026', '1027131575895724636945');
INSERT INTO `ysk_userrob` VALUES ('21', '50', '1', '100.000', '0.000', '99601.500', '13969901196', '谭成山', '40', '-1', '0', '4', '1575896049', '1575896049', '1575896349', '1027171575896047253462');
INSERT INTO `ysk_userrob` VALUES ('22', '50', '1', '100.000', '0.000', '99501.500', '13969901196', '谭成山', '41', '-1', '0', '4', '1575896364', '1575896364', '1575896664', '1027121575896362306227');
INSERT INTO `ysk_userrob` VALUES ('23', '50', '1', '100.000', '0.000', '99401.500', '13969901196', '谭成山', '42', '-1', '0', '4', '1575896698', '1575896698', '1575896998', '1027181575896697710131');
INSERT INTO `ysk_userrob` VALUES ('24', '50', '1', '100.000', '0.000', '99301.500', '13969901196', '谭成山', '43', '-1', '0', '4', '1575897070', '1575897070', '1575897370', '1027111575897069322095');
INSERT INTO `ysk_userrob` VALUES ('25', '50', '1', '100.000', '0.000', '99201.500', '13969901196', '谭成山', '44', '-1', '0', '4', '1575898285', '1575898285', '1575898586', '1027181575898284863943');
INSERT INTO `ysk_userrob` VALUES ('26', '50', '1', '100.000', '0.000', '99101.500', '13969901196', '谭成山', '45', '-1', '0', '4', '1575898600', '1575898600', '1575898901', '1027131575898599244363');
INSERT INTO `ysk_userrob` VALUES ('27', '50', '1', '100.000', '0.000', '99001.500', '13969901196', '谭成山', '46', '-1', '0', '4', '1575898917', '1575898917', '1575899218', '1027111575898914169851');
INSERT INTO `ysk_userrob` VALUES ('28', '50', '1', '100.000', '0.000', '98901.500', '13969901196', '谭成山', '47', '-1', '0', '4', '1575899240', '1575899240', '1575899540', '1027131575899239285745');
INSERT INTO `ysk_userrob` VALUES ('29', '50', '1', '100.000', '0.000', '98801.500', '13969901196', '谭成山', '49', '-1', '0', '4', '1575899553', '1575899553', '1575899854', '1027181575899551992541');
INSERT INTO `ysk_userrob` VALUES ('30', '50', '1', '100.000', '0.000', '98701.500', '13969901196', '谭成山', '51', '-1', '0', '4', '1575899915', '1575899915', '1575900216', '1027131575899914336643');
INSERT INTO `ysk_userrob` VALUES ('31', '50', '1', '100.000', '0.000', '98601.500', '13969901196', '谭成山', '56', '-1', '0', '3', '1575901550', '1575901550', '1575901566', '1027131575901549788431');
INSERT INTO `ysk_userrob` VALUES ('32', '50', '1', '100.000', '0.000', '98503.000', '13969901196', '谭成山', '61', '-1', '0', '4', '1575902163', '1575902163', '1575902464', '1027121575902163128868');
INSERT INTO `ysk_userrob` VALUES ('33', '50', '1', '100.000', '0.000', '98403.000', '13969901196', '谭成山', '63', '-1', '0', '3', '1575902871', '1575902871', '1575903159', '1027191575902869266176');
INSERT INTO `ysk_userrob` VALUES ('34', '50', '1', '100.000', '0.000', '98304.500', '13969901196', '谭成山', '64', '-1', '0', '3', '1575903174', '1575903174', '1575903183', '1027131575903173195074');
INSERT INTO `ysk_userrob` VALUES ('35', '50', '1', '100.000', '0.000', '98206.000', '13969901196', '谭成山', '65', '-1', '0', '3', '1575903583', '1575903583', '1575903657', '1027111575903580867872');
INSERT INTO `ysk_userrob` VALUES ('36', '50', '1', '100.000', '0.000', '98107.500', '13969901196', '谭成山', '67', '-1', '0', '3', '1575903709', '1575903709', '1575903747', '1027191575903708645185');
INSERT INTO `ysk_userrob` VALUES ('37', '50', '1', '100.000', '0.000', '98009.000', '13969901196', '谭成山', '69', '-1', '0', '3', '1575904717', '1575904717', '1575904850', '1027171575904716730546');
INSERT INTO `ysk_userrob` VALUES ('38', '50', '1', '100.000', '0.000', '97910.500', '13969901196', '谭成山', '70', '-1', '0', '3', '1575904976', '1575904976', '1575905069', '1027171575904974790653');
INSERT INTO `ysk_userrob` VALUES ('39', '50', '1', '100.000', '0.000', '97812.000', '13969901196', '谭成山', '71', '-1', '0', '3', '1575905142', '1575905142', '1575905385', '1027131575905140195696');
INSERT INTO `ysk_userrob` VALUES ('40', '50', '1', '100.000', '0.000', '97713.500', '13969901196', '谭成山', '72', '-1', '0', '3', '1575905402', '1575905402', '1575905615', '1027141575905401198899');
INSERT INTO `ysk_userrob` VALUES ('41', '50', '1', '100.000', '0.000', '97615.000', '13969901196', '谭成山', '73', '-1', '0', '3', '1575905640', '1575905640', '1575905652', '1027141575905640681344');
INSERT INTO `ysk_userrob` VALUES ('42', '50', '1', '100.000', '0.000', '97516.500', '13969901196', '谭成山', '74', '-1', '0', '3', '1575905675', '1575905675', '1575905690', '1027171575905673556283');
INSERT INTO `ysk_userrob` VALUES ('43', '50', '1', '100.000', '0.000', '97418.000', '13969901196', '谭成山', '75', '-1', '0', '3', '1575905831', '1575905831', '1575905842', '1027161575905829340049');
INSERT INTO `ysk_userrob` VALUES ('44', '50', '1', '100.000', '0.000', '97319.500', '13969901196', '谭成山', '76', '-1', '0', '3', '1575905909', '1575905909', '1575905913', '1027111575905907281727');
INSERT INTO `ysk_userrob` VALUES ('45', '50', '1', '100.000', '0.000', '97221.000', '13969901196', '谭成山', '77', '-1', '0', '3', '1575905976', '1575905976', '1575905983', '1027111575905972491226');
INSERT INTO `ysk_userrob` VALUES ('46', '50', '1', '100.000', '0.000', '97122.500', '13969901196', '谭成山', '78', '-1', '0', '3', '1575906268', '1575906268', '1575906448', '1027181575906267955847');
INSERT INTO `ysk_userrob` VALUES ('47', '50', '1', '100.000', '0.000', '97024.000', '13969901196', '谭成山', '79', '-1', '0', '3', '1575906519', '1575906519', '1575906552', '1027121575906519688521');
INSERT INTO `ysk_userrob` VALUES ('48', '50', '1', '100.000', '0.000', '96925.500', '13969901196', '谭成山', '83', '-1', '0', '3', '1575908175', '1575908175', '1575908252', '1027151575908175501382');
INSERT INTO `ysk_userrob` VALUES ('49', '51', '1', '500.000', '0.000', '18522.500', '13165124666', '刘勇', '85', '-1', '0', '4', '1575965949', '1575965949', '1575966249', '1031061575965948679481');
INSERT INTO `ysk_userrob` VALUES ('50', '51', '2', '1000.000', '0.000', '18022.500', '13165124666', '刘勇', '88', '-1', '0', '3', '1575966488', '1575966488', '1575966499', '1031061575966487729492');
INSERT INTO `ysk_userrob` VALUES ('51', '51', '2', '1000.000', '0.000', '17034.500', '13165124666', '刘勇', '89', '-1', '0', '3', '1575966961', '1575966961', '1575966969', '1031161575966961594396');
INSERT INTO `ysk_userrob` VALUES ('52', '51', '1', '800.000', '0.000', '16046.500', '13165124666', '刘勇', '91', '-1', '0', '3', '1575967524', '1575967524', '1575967624', '1031111575967518787261');
INSERT INTO `ysk_userrob` VALUES ('53', '51', '1', '500.000', '0.000', '15258.500', '13165124666', '刘勇', '94', '-1', '0', '3', '1575967699', '1575967699', '1575967723', '1031161575967691376384');
INSERT INTO `ysk_userrob` VALUES ('54', '51', '1', '500.000', '0.200', '15766.000', '13165124666', '刘勇', '95', '-1', '0', '3', '1575969347', '1575969347', '1575969355', '1031111575969346394453');
INSERT INTO `ysk_userrob` VALUES ('55', '51', '1', '500.000', '0.000', '15373.500', '13165124666', '刘勇', '96', '-1', '0', '3', '1575969462', '1575969462', '1575969469', '1031161575969459804974');
INSERT INTO `ysk_userrob` VALUES ('56', '50', '1', '100.000', '0.020', '97842.852', '13969901196', '谭成山', '97', '-1', '0', '3', '1576133703', '1576133703', '1576133714', '1027111576133701549633');
INSERT INTO `ysk_userrob` VALUES ('57', '51', '2', '1000.000', '0.020', '14881.000', '13165124666', '刘勇', '99', '-1', '0', '3', '1576134503', '1576134503', '1576134518', '1031061576134502164315');
INSERT INTO `ysk_userrob` VALUES ('58', '51', '2', '1000.000', '0.000', '13913.000', '13165124666', '刘勇', '100', '-1', '0', '3', '1576134692', '1576134692', '1576134706', '1031081576134691191252');
INSERT INTO `ysk_userrob` VALUES ('59', '50', '1', '100.000', '0.000', '97750.750', '13969901196', '谭成山', '101', '-1', '0', '3', '1576135100', '1576135100', '1576135104', '1027171576135099198056');
INSERT INTO `ysk_userrob` VALUES ('60', '51', '1', '800.000', '0.002', '12925.000', '13165124666', '刘勇', '102', '-1', '0', '3', '1576178392', '1576178392', '1576178399', '1031011576178390844946');
INSERT INTO `ysk_userrob` VALUES ('61', '51', '2', '1000.000', '0.002', '12138.600', '13165124666', '刘勇', '103', '-1', '0', '3', '1576178728', '1576178728', '1576178738', '1031061576178728959774');
INSERT INTO `ysk_userrob` VALUES ('62', '51', '1', '500.000', '0.002', '11152.600', '13165124666', '刘勇', '106', '-1', '0', '3', '1576179031', '1576179031', '1576179091', '1031021576179030400399');
INSERT INTO `ysk_userrob` VALUES ('63', '51', '2', '1000.000', '0.002', '10661.100', '13165124666', '刘勇', '108', '-1', '0', '3', '1576180207', '1576180207', '1576180215', '1031051576180206169221');
INSERT INTO `ysk_userrob` VALUES ('64', '50', '1', '100.000', '0.002', '97657.258', '13969901196', '谭成山', '110', '-1', '0', '3', '1576322784', '1576322784', '1576510341', '1027121576322783760277');
INSERT INTO `ysk_userrob` VALUES ('65', '50', '1', '100.000', '0.002', '97558.961', '13969901196', '谭成山', '111', '1', '0', '3', '1576323137', '1576510341', '1576510341', '1027151576323137971957');
INSERT INTO `ysk_userrob` VALUES ('66', '51', '1', '500.000', '0.002', '9175.100', '13165124666', '刘勇', '112', '-1', '0', '3', '1576384847', '1576384847', '1576384864', '1031081576384846567243');
INSERT INTO `ysk_userrob` VALUES ('67', '51', '1', '500.000', '0.002', '8683.600', '13165124666', '刘勇', '113', '-1', '0', '3', '1576548296', '1576548296', '1576548313', '1031021576548295799572');
INSERT INTO `ysk_userrob` VALUES ('68', '51', '1', '500.000', '0.002', '8192.100', '13165124666', '刘勇', '114', '-1', '0', '4', '1576555231', '1576555231', '1576557720', '1031031576555226125346');
INSERT INTO `ysk_userrob` VALUES ('69', '50', '1', '100.000', '0.002', '96260.664', '13969901196', '谭成山', '115', '-1', '0', '3', '1576560902', '1576560902', '1576560920', '1027141576560901525425');
INSERT INTO `ysk_userrob` VALUES ('70', '50', '1', '100.000', '0.002', '96162.367', '13969901196', '谭成山', '116', '-1', '0', '3', '1576560951', '1576560951', '1576560957', '1027151576560949708318');
INSERT INTO `ysk_userrob` VALUES ('71', '50', '1', '100.000', '0.002', '96064.070', '13969901196', '谭成山', '118', '-1', '0', '3', '1576560975', '1576560975', '1576560982', '1027121576560974858788');
INSERT INTO `ysk_userrob` VALUES ('72', '50', '1', '100.000', '0.002', '95965.773', '13969901196', '谭成山', '119', '-1', '0', '3', '1576561817', '1576561817', '1576561865', '1027181576561817411836');
INSERT INTO `ysk_userrob` VALUES ('73', '50', '1', '100.000', '0.002', '95867.477', '13969901196', '谭成山', '120', '-1', '0', '3', '1576561897', '1576561897', '1576561905', '1027151576561897145599');
INSERT INTO `ysk_userrob` VALUES ('74', '50', '1', '100.000', '0.002', '95769.180', '13969901196', '谭成山', '121', '-1', '0', '3', '1576561953', '1576561953', '1576561961', '1027161576561952396992');
INSERT INTO `ysk_userrob` VALUES ('75', '50', '1', '100.000', '0.002', '95670.883', '13969901196', '谭成山', '122', '-1', '0', '3', '1576561985', '1576561985', '1576562019', '1027171576561984335031');
INSERT INTO `ysk_userrob` VALUES ('76', '50', '1', '100.000', '0.002', '95572.586', '13969901196', '谭成山', '123', '-1', '0', '3', '1576562030', '1576562030', '1576562039', '1027191576562028470615');
INSERT INTO `ysk_userrob` VALUES ('77', '50', '1', '100.000', '0.002', '95474.289', '13969901196', '谭成山', '124', '-1', '0', '3', '1576562049', '1576562049', '1576562066', '1027151576562049374227');
INSERT INTO `ysk_userrob` VALUES ('78', '50', '1', '100.000', '0.002', '95375.992', '13969901196', '谭成山', '125', '-1', '0', '3', '1576562109', '1576562109', '1576562240', '1027121576562108514746');
INSERT INTO `ysk_userrob` VALUES ('79', '50', '1', '100.000', '0.002', '95277.695', '13969901196', '谭成山', '126', '-1', '0', '3', '1576562268', '1576562268', '1576562276', '1027131576562267486527');
INSERT INTO `ysk_userrob` VALUES ('80', '50', '1', '100.000', '0.002', '95179.398', '13969901196', '谭成山', '127', '-1', '0', '3', '1576562280', '1576562280', '1576562295', '1027191576562274739716');
INSERT INTO `ysk_userrob` VALUES ('81', '50', '1', '100.000', '0.002', '95081.102', '13969901196', '谭成山', '129', '-1', '0', '3', '1576562331', '1576562331', '1576562340', '1027151576562331549568');
INSERT INTO `ysk_userrob` VALUES ('82', '50', '1', '100.000', '0.002', '94982.805', '13969901196', '谭成山', '132', '-1', '0', '3', '1576562346', '1576562346', '1576562354', '1027191576562345197831');
INSERT INTO `ysk_userrob` VALUES ('83', '50', '1', '100.000', '0.002', '94884.508', '13969901196', '谭成山', '133', '-1', '0', '3', '1576562363', '1576562363', '1576562370', '1027161576562362879317');
INSERT INTO `ysk_userrob` VALUES ('84', '50', '1', '100.000', '0.002', '94786.211', '13969901196', '谭成山', '134', '-1', '0', '3', '1576562377', '1576562377', '1576562401', '1027151576562376709826');
INSERT INTO `ysk_userrob` VALUES ('85', '50', '1', '100.000', '0.002', '94687.914', '13969901196', '谭成山', '138', '-1', '0', '3', '1576562478', '1576562478', '1576562490', '1027141576562476999112');
INSERT INTO `ysk_userrob` VALUES ('86', '50', '1', '100.000', '0.002', '94589.617', '13969901196', '谭成山', '139', '-1', '0', '3', '1576562498', '1576562498', '1576562535', '1027121576562485879832');
INSERT INTO `ysk_userrob` VALUES ('87', '50', '1', '100.000', '0.002', '94491.320', '13969901196', '谭成山', '140', '-1', '0', '3', '1576562561', '1576562561', '1576562824', '1027131576562561253941');
INSERT INTO `ysk_userrob` VALUES ('88', '51', '1', '500.000', '0.002', '7692.100', '13165124666', '刘勇', '141', '-1', '0', '3', '1576562715', '1576562715', '1576562732', '1031071576562714373472');
INSERT INTO `ysk_userrob` VALUES ('89', '50', '1', '100.000', '0.002', '94393.875', '13969901196', '谭成山', '142', '-1', '0', '3', '1576562843', '1576562843', '1576562856', '1027151576562842823379');
INSERT INTO `ysk_userrob` VALUES ('90', '51', '1', '500.000', '0.002', '7200.600', '13165124666', '刘勇', '143', '-1', '0', '4', '1576562868', '1576562868', '1576563169', '1031071576562867829459');
INSERT INTO `ysk_userrob` VALUES ('91', '50', '1', '100.000', '0.002', '94295.578', '13969901196', '谭成山', '144', '-1', '0', '3', '1576562871', '1576562871', '1576562877', '1027121576562870386221');
INSERT INTO `ysk_userrob` VALUES ('92', '50', '1', '100.000', '0.002', '94197.281', '13969901196', '谭成山', '145', '-1', '0', '3', '1576562885', '1576562885', '1576562893', '1027141576562884218216');
INSERT INTO `ysk_userrob` VALUES ('93', '50', '1', '100.000', '0.002', '94098.984', '13969901196', '谭成山', '146', '-1', '0', '3', '1576562904', '1576562904', '1576562911', '1027181576562899942427');
INSERT INTO `ysk_userrob` VALUES ('94', '50', '1', '100.000', '0.002', '94000.688', '13969901196', '谭成山', '147', '-1', '0', '3', '1576562920', '1576562920', '1576562930', '1027161576562918445918');
INSERT INTO `ysk_userrob` VALUES ('95', '50', '1', '100.000', '0.002', '93902.391', '13969901196', '谭成山', '148', '-1', '0', '3', '1576562938', '1576562938', '1576562960', '1027151576562937645644');
INSERT INTO `ysk_userrob` VALUES ('96', '50', '1', '100.000', '0.002', '93804.094', '13969901196', '谭成山', '149', '-1', '0', '3', '1576563008', '1576563008', '1576563026', '1027131576563006144197');
INSERT INTO `ysk_userrob` VALUES ('97', '50', '1', '100.000', '0.002', '93705.797', '13969901196', '谭成山', '150', '-1', '0', '3', '1576563058', '1576563058', '1576563065', '1027171576563057149434');
INSERT INTO `ysk_userrob` VALUES ('98', '50', '1', '100.000', '0.002', '93607.500', '13969901196', '谭成山', '151', '-1', '0', '3', '1576563132', '1576563132', '1576563140', '1027141576563131171613');
INSERT INTO `ysk_userrob` VALUES ('99', '50', '1', '100.000', '0.002', '93509.203', '13969901196', '谭成山', '152', '-1', '0', '3', '1576563217', '1576563217', '1576563228', '1027171576563216965054');
INSERT INTO `ysk_userrob` VALUES ('100', '50', '1', '100.000', '0.002', '93410.906', '13969901196', '谭成山', '153', '-1', '0', '3', '1576563236', '1576563236', '1576563243', '1027171576563235228765');
INSERT INTO `ysk_userrob` VALUES ('101', '50', '1', '100.000', '0.002', '93312.609', '13969901196', '谭成山', '154', '-1', '0', '3', '1576563250', '1576563250', '1576563257', '1027171576563250332719');
INSERT INTO `ysk_userrob` VALUES ('102', '50', '1', '100.000', '0.002', '93214.312', '13969901196', '谭成山', '155', '-1', '0', '3', '1576563285', '1576563285', '1576563293', '1027151576563284984891');
INSERT INTO `ysk_userrob` VALUES ('103', '51', '1', '500.000', '0.002', '6700.600', '13165124666', '刘勇', '156', '-1', '0', '4', '1576563376', '1576563376', '1576563677', '1031031576563375604118');
INSERT INTO `ysk_userrob` VALUES ('104', '50', '1', '100.000', '0.002', '93116.016', '13969901196', '谭成山', '157', '-1', '0', '3', '1576563382', '1576563382', '1576563390', '1027111576563381916944');
INSERT INTO `ysk_userrob` VALUES ('105', '50', '1', '100.000', '0.002', '93017.719', '13969901196', '谭成山', '158', '-1', '0', '3', '1576563397', '1576563397', '1576563583', '1027111576563396738829');
INSERT INTO `ysk_userrob` VALUES ('106', '50', '1', '100.000', '0.002', '92919.422', '13969901196', '谭成山', '159', '-1', '0', '3', '1576564586', '1576564586', '1576564614', '1027181576564584462441');
INSERT INTO `ysk_userrob` VALUES ('107', '50', '1', '100.000', '0.002', '92821.125', '13969901196', '谭成山', '160', '-1', '0', '3', '1576564626', '1576564626', '1576564836', '1027141576564625511821');
INSERT INTO `ysk_userrob` VALUES ('108', '50', '1', '100.000', '0.002', '92722.828', '13969901196', '谭成山', '161', '-1', '0', '3', '1576564921', '1576564921', '1576564934', '1027111576564920883242');
INSERT INTO `ysk_userrob` VALUES ('109', '50', '1', '100.000', '0.002', '92624.531', '13969901196', '谭成山', '162', '-1', '0', '3', '1576564951', '1576564951', '1576565027', '1027131576564950334822');
INSERT INTO `ysk_userrob` VALUES ('110', '50', '1', '100.000', '0.002', '92526.234', '13969901196', '谭成山', '163', '-1', '0', '3', '1576565040', '1576565040', '1576565056', '1027151576565039542778');
INSERT INTO `ysk_userrob` VALUES ('111', '51', '1', '500.000', '0.002', '6200.600', '13165124666', '刘勇', '164', '-1', '0', '3', '1576565219', '1576565219', '1576565273', '1031091576565218288823');
INSERT INTO `ysk_userrob` VALUES ('112', '51', '1', '500.000', '0.002', '5709.100', '13165124666', '刘勇', '165', '-1', '0', '4', '1576565288', '1576565288', '1576565589', '1031091576565281295055');
INSERT INTO `ysk_userrob` VALUES ('113', '51', '1', '500.000', '0.002', '5209.100', '13165124666', '刘勇', '166', '-1', '0', '4', '1576565608', '1576565608', '1576565908', '1031021576565607170571');
INSERT INTO `ysk_userrob` VALUES ('114', '50', '1', '100.000', '0.002', '92428.789', '13969901196', '谭成山', '167', '-1', '0', '4', '1576565782', '1576565782', '1576566083', '1027141576565782887358');
INSERT INTO `ysk_userrob` VALUES ('115', '50', '1', '100.000', '0.002', '92328.789', '13969901196', '谭成山', '168', '-1', '0', '3', '1576567839', '1576567839', '1576567847', '1027151576567839549948');
INSERT INTO `ysk_userrob` VALUES ('116', '50', '1', '100.000', '0.002', '92230.492', '13969901196', '谭成山', '169', '-1', '0', '3', '1576567889', '1576567889', '1576567896', '1027161576567888474128');
INSERT INTO `ysk_userrob` VALUES ('117', '50', '1', '100.000', '0.002', '92132.195', '13969901196', '谭成山', '170', '-1', '0', '3', '1576568021', '1576568021', '1576568064', '1027171576568020341567');
INSERT INTO `ysk_userrob` VALUES ('118', '50', '1', '100.000', '0.002', '92033.898', '13969901196', '谭成山', '171', '-1', '0', '3', '1576568219', '1576568219', '1576568232', '1027171576568219344258');
INSERT INTO `ysk_userrob` VALUES ('119', '50', '1', '100.000', '0.002', '91935.602', '13969901196', '谭成山', '172', '-1', '0', '3', '1576568248', '1576568248', '1576568271', '1027161576568247786944');
INSERT INTO `ysk_userrob` VALUES ('120', '50', '1', '100.000', '0.002', '91837.305', '13969901196', '谭成山', '173', '-1', '0', '3', '1576568284', '1576568284', '1576568337', '1027131576568283860184');
INSERT INTO `ysk_userrob` VALUES ('121', '50', '1', '100.000', '0.002', '91739.008', '13969901196', '谭成山', '174', '-1', '0', '3', '1576568348', '1576568348', '1576568361', '1027141576568346551322');
INSERT INTO `ysk_userrob` VALUES ('122', '50', '1', '100.000', '0.002', '91640.711', '13969901196', '谭成山', '175', '-1', '0', '3', '1576569809', '1576569809', '1576569987', '1027161576569808209987');
INSERT INTO `ysk_userrob` VALUES ('123', '50', '1', '100.000', '0.002', '91542.414', '13969901196', '谭成山', '176', '-1', '0', '3', '1576569997', '1576569997', '1576570045', '1027181576569996830816');
INSERT INTO `ysk_userrob` VALUES ('124', '50', '1', '100.000', '0.002', '91444.117', '13969901196', '谭成山', '177', '-1', '0', '3', '1576570069', '1576570069', '1576570080', '1027141576570067472147');
INSERT INTO `ysk_userrob` VALUES ('125', '50', '1', '100.000', '0.002', '91345.820', '13969901196', '谭成山', '178', '-1', '0', '3', '1576570092', '1576570092', '1576570108', '1027141576570091673882');
INSERT INTO `ysk_userrob` VALUES ('126', '51', '1', '500.000', '0.002', '4709.100', '13165124666', '刘勇', '179', '-1', '0', '3', '1576570335', '1576570335', '1576570442', '1031021576570333292096');
INSERT INTO `ysk_userrob` VALUES ('127', '51', '1', '500.000', '0.002', '4217.600', '13165124666', '刘勇', '180', '-1', '0', '4', '1576570456', '1576570456', '1576570759', '1031081576570455514226');
INSERT INTO `ysk_userrob` VALUES ('128', '50', '1', '100.000', '0.002', '91248.375', '13969901196', '谭成山', '181', '-1', '0', '3', '1576571122', '1576571122', '1576571147', '1027121576571121271843');
INSERT INTO `ysk_userrob` VALUES ('129', '50', '1', '100.000', '0.002', '91150.078', '13969901196', '谭成山', '183', '-1', '0', '3', '1576571249', '1576571249', '1576571458', '1027131576571247371915');
INSERT INTO `ysk_userrob` VALUES ('130', '50', '1', '100.000', '0.002', '91051.781', '13969901196', '谭成山', '184', '-1', '0', '3', '1576571473', '1576571473', '1576571514', '1027181576571472234057');
INSERT INTO `ysk_userrob` VALUES ('131', '50', '1', '100.000', '0.002', '90953.484', '13969901196', '谭成山', '185', '-1', '0', '3', '1576571552', '1576571552', '1576571564', '1027181576571551125989');
INSERT INTO `ysk_userrob` VALUES ('132', '50', '1', '100.000', '0.002', '90855.188', '13969901196', '谭成山', '186', '-1', '0', '3', '1576571698', '1576571698', '1576571708', '1027171576571697781167');
INSERT INTO `ysk_userrob` VALUES ('133', '50', '1', '100.000', '0.002', '90756.891', '13969901196', '谭成山', '187', '-1', '0', '3', '1576571833', '1576571833', '1576571841', '1027111576571833767095');
INSERT INTO `ysk_userrob` VALUES ('134', '50', '1', '100.000', '0.002', '90658.594', '13969901196', '谭成山', '188', '-1', '0', '3', '1576571882', '1576571882', '1576571916', '1027111576571881614191');
INSERT INTO `ysk_userrob` VALUES ('135', '50', '1', '100.000', '0.002', '90560.297', '13969901196', '谭成山', '189', '-1', '0', '3', '1576572230', '1576572230', '1576572237', '1027111576572230268179');
INSERT INTO `ysk_userrob` VALUES ('136', '50', '1', '100.000', '0.002', '90462.000', '13969901196', '谭成山', '190', '-1', '0', '3', '1576572259', '1576572259', '1576572266', '1027151576572258128839');
INSERT INTO `ysk_userrob` VALUES ('137', '50', '1', '100.000', '0.002', '90363.703', '13969901196', '谭成山', '191', '-1', '0', '4', '1576572277', '1576572277', '1576572577', '1027111576572275193359');
INSERT INTO `ysk_userrob` VALUES ('138', '50', '1', '100.000', '0.002', '90263.703', '13969901196', '谭成山', '192', '-1', '0', '3', '1576573504', '1576573504', '1576573511', '1027161576573503367438');
INSERT INTO `ysk_userrob` VALUES ('139', '50', '1', '100.000', '0.002', '90165.406', '13969901196', '谭成山', '193', '-1', '0', '3', '1576575887', '1576575887', '1576575894', '1027151576575886962372');

-- ----------------------------
-- Table structure for ysk_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `ysk_withdraw`;
CREATE TABLE `ysk_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `account` varchar(225) NOT NULL COMMENT '提现账号',
  `name` varchar(225) NOT NULL COMMENT '提现人姓名',
  `way` varchar(225) NOT NULL COMMENT '提现方式',
  `price` float(10,3) NOT NULL COMMENT '提现金额',
  `addtime` varchar(225) NOT NULL COMMENT '提现时间',
  `endtime` varchar(225) NOT NULL COMMENT '完成时间',
  `status` int(11) NOT NULL COMMENT '状态1提交，2退回3成功',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='提现申请表';

-- ----------------------------
-- Records of ysk_withdraw
-- ----------------------------
INSERT INTO `ysk_withdraw` VALUES ('7', '50', '123123', '123123', '123123123', '600.000', '1576510454', '', '3');
INSERT INTO `ysk_withdraw` VALUES ('6', '50', '123123', '123123', '123123123', '600.000', '1576510378', '', '3');
INSERT INTO `ysk_withdraw` VALUES ('5', '51', 'd', '刘勇', '支付宝', '500.000', '1576180253', '', '3');
