/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : jsppzl5k

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-11-06 13:11:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `config`
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', 'picture1', null);
INSERT INTO `config` VALUES ('2', 'picture2', null);
INSERT INTO `config` VALUES ('3', 'picture3', null);
INSERT INTO `config` VALUES ('4', 'picture4', null);
INSERT INTO `config` VALUES ('5', 'picture5', null);
INSERT INTO `config` VALUES ('6', 'homepage', null);

-- ----------------------------
-- Table structure for `gongyingshang`
-- ----------------------------
DROP TABLE IF EXISTS `gongyingshang`;
CREATE TABLE `gongyingshang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `zhanghao` varchar(200) NOT NULL COMMENT '账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `gongsimingcheng` varchar(200) NOT NULL COMMENT '公司名称',
  `fuzeren` varchar(200) DEFAULT NULL COMMENT '负责人',
  `dianhua` varchar(200) DEFAULT NULL COMMENT '电话',
  `dizhi` varchar(200) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhanghao` (`zhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1604586887637 DEFAULT CHARSET=utf8 COMMENT='供应商';

-- ----------------------------
-- Records of gongyingshang
-- ----------------------------
INSERT INTO `gongyingshang` VALUES ('1', '2020-11-05 22:10:40', '供应商1', '123456', '公司名称1', '负责人1', '020-89819991', '地址1');
INSERT INTO `gongyingshang` VALUES ('2', '2020-11-05 22:10:40', '供应商2', '123456', '公司名称2', '负责人2', '020-89819992', '地址2');
INSERT INTO `gongyingshang` VALUES ('3', '2020-11-05 22:10:40', '供应商3', '123456', '公司名称3', '负责人3', '020-89819993', '地址3');
INSERT INTO `gongyingshang` VALUES ('1604585739812', '2020-11-05 22:15:39', '001', '001', '上海杂货有限公司', '', '', '');
INSERT INTO `gongyingshang` VALUES ('1604586887636', '2020-11-05 22:34:47', '1', '1', '上海杂货有限公司', '肖总', '15214758521', '上海市人民路2号');

-- ----------------------------
-- Table structure for `gongyingshangshangpin`
-- ----------------------------
DROP TABLE IF EXISTS `gongyingshangshangpin`;
CREATE TABLE `gongyingshangshangpin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shangpinbianhao` varchar(200) NOT NULL COMMENT '商品编号',
  `shangpinmingcheng` varchar(200) NOT NULL COMMENT '商品名称',
  `shangpinleixing` varchar(200) NOT NULL COMMENT '商品类型',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  `jianshu` longtext COMMENT '简述',
  `jiage` int(11) DEFAULT NULL COMMENT '价格',
  `shuliang` int(11) DEFAULT NULL COMMENT '数量',
  `yuexiaoliang` int(11) DEFAULT NULL COMMENT '月销量',
  `shangjiariqi` date DEFAULT NULL COMMENT '上架日期',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `gongsimingcheng` varchar(200) DEFAULT NULL COMMENT '公司名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1604587368017 DEFAULT CHARSET=utf8 COMMENT='供应商商品';

-- ----------------------------
-- Records of gongyingshangshangpin
-- ----------------------------
INSERT INTO `gongyingshangshangpin` VALUES ('1', '2020-11-05 22:10:40', '商品编号1', '商品名称1', '商品类型1', 'gongyingshangshangpin_tupian1', '简述1', '1', '1', '1', '2020-11-05', '账号1', '公司名称1');
INSERT INTO `gongyingshangshangpin` VALUES ('2', '2020-11-05 22:10:40', '商品编号2', '商品名称2', '商品类型2', 'gongyingshangshangpin_tupian2', '简述2', '2', '2', '2', '2020-11-05', '账号2', '公司名称2');
INSERT INTO `gongyingshangshangpin` VALUES ('3', '2020-11-05 22:10:40', '商品编号3', '商品名称3', '商品类型3', 'gongyingshangshangpin_tupian3', '简述3', '3', '3', '3', '2020-11-05', '账号3', '公司名称3');
INSERT INTO `gongyingshangshangpin` VALUES ('1604587368016', '2020-11-05 22:42:47', '1589203150', '七喜饮料', '饮料', 'http://localhost:8080/jsppzl5K/upload/1604587327871.jpg', '进货便宜，月销量破万，有需要的可以合作\r\n', '3', '900', '10000', '2020-10-26', '1', '上海杂货有限公司');

-- ----------------------------
-- Table structure for `jinhuoxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `jinhuoxinxi`;
CREATE TABLE `jinhuoxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dingdanbianhao` varchar(200) DEFAULT NULL COMMENT '订单编号',
  `shangpinmingcheng` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `shangpinleixing` varchar(200) DEFAULT NULL COMMENT '商品类型',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `jiage` varchar(200) DEFAULT NULL COMMENT '价格',
  `shuliang` int(11) DEFAULT NULL COMMENT '数量',
  `zongjiage` int(11) DEFAULT NULL COMMENT '总价格',
  `jinhuoriqi` date DEFAULT NULL COMMENT '进货日期',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  `ispay` varchar(200) DEFAULT '未支付' COMMENT '是否支付',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dingdanbianhao` (`dingdanbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=1604587966717 DEFAULT CHARSET=utf8 COMMENT='进货信息';

-- ----------------------------
-- Records of jinhuoxinxi
-- ----------------------------
INSERT INTO `jinhuoxinxi` VALUES ('1', '2020-11-05 22:10:40', '订单编号1', '商品名称1', '商品类型1', null, '价格1', '1', '1', '2020-11-05', '工号1', '未支付');
INSERT INTO `jinhuoxinxi` VALUES ('2', '2020-11-05 22:10:40', '订单编号2', '商品名称2', '商品类型2', null, '价格2', '2', '2', '2020-11-05', '工号2', '未支付');
INSERT INTO `jinhuoxinxi` VALUES ('3', '2020-11-05 22:10:40', '订单编号3', '商品名称3', '商品类型3', null, '价格3', '3', '3', '2020-11-05', '工号3', '未支付');
INSERT INTO `jinhuoxinxi` VALUES ('1604587412271', '2020-11-05 22:43:31', '1604587403', '七喜饮料', '饮料', null, '3', '500', '1500', '2020-10-26', '1', '已支付');
INSERT INTO `jinhuoxinxi` VALUES ('1604587966716', '2020-11-05 22:52:45', '1604587960', '七喜饮料', '饮料', '1', '3', '100', '300', '2020-10-26', '1', '未支付');

-- ----------------------------
-- Table structure for `liaotianhuifu`
-- ----------------------------
DROP TABLE IF EXISTS `liaotianhuifu`;
CREATE TABLE `liaotianhuifu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `biaoti` varchar(200) NOT NULL COMMENT '标题',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  `liaotianhuifu` longtext COMMENT '聊天回复',
  `huifuriqi` date DEFAULT NULL COMMENT '回复日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1604587526850 DEFAULT CHARSET=utf8 COMMENT='聊天回复';

-- ----------------------------
-- Records of liaotianhuifu
-- ----------------------------
INSERT INTO `liaotianhuifu` VALUES ('1', '2020-11-05 22:10:40', '标题1', '工号1', '聊天回复1', '2020-11-05');
INSERT INTO `liaotianhuifu` VALUES ('2', '2020-11-05 22:10:40', '标题2', '工号2', '聊天回复2', '2020-11-05');
INSERT INTO `liaotianhuifu` VALUES ('3', '2020-11-05 22:10:40', '标题3', '工号3', '聊天回复3', '2020-11-05');
INSERT INTO `liaotianhuifu` VALUES ('1604587526849', '2020-11-05 22:45:26', '老板好', '1', '好的鉴于你最近的表现很不错，非常勤快，给你下个月涨500工资', '2020-10-27');

-- ----------------------------
-- Table structure for `liaotianxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `liaotianxinxi`;
CREATE TABLE `liaotianxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `biaoti` varchar(200) NOT NULL COMMENT '标题',
  `liaotianneirong` longtext COMMENT '聊天内容',
  `riqi` date DEFAULT NULL COMMENT '日期',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1604587274168 DEFAULT CHARSET=utf8 COMMENT='聊天信息';

-- ----------------------------
-- Records of liaotianxinxi
-- ----------------------------
INSERT INTO `liaotianxinxi` VALUES ('1', '2020-11-05 22:10:40', '标题1', '聊天内容1', '2020-11-05', '工号1');
INSERT INTO `liaotianxinxi` VALUES ('2', '2020-11-05 22:10:40', '标题2', '聊天内容2', '2020-11-05', '工号2');
INSERT INTO `liaotianxinxi` VALUES ('3', '2020-11-05 22:10:40', '标题3', '聊天内容3', '2020-11-05', '工号3');
INSERT INTO `liaotianxinxi` VALUES ('1604587274167', '2020-11-05 22:41:13', '老板好', '我要涨工资', '2020-09-27', '1');

-- ----------------------------
-- Table structure for `shangpinleixing`
-- ----------------------------
DROP TABLE IF EXISTS `shangpinleixing`;
CREATE TABLE `shangpinleixing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shangpinleixing` varchar(200) NOT NULL COMMENT '商品类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1604587298252 DEFAULT CHARSET=utf8 COMMENT='商品类型';

-- ----------------------------
-- Records of shangpinleixing
-- ----------------------------
INSERT INTO `shangpinleixing` VALUES ('1', '2020-11-05 22:10:40', '饮料');
INSERT INTO `shangpinleixing` VALUES ('2', '2020-11-05 22:10:40', '零食');
INSERT INTO `shangpinleixing` VALUES ('3', '2020-11-05 22:10:40', '水果');
INSERT INTO `shangpinleixing` VALUES ('1604587073537', '2020-11-05 22:37:52', '杂货');
INSERT INTO `shangpinleixing` VALUES ('1604587298251', '2020-11-05 22:41:37', '生活用品');

-- ----------------------------
-- Table structure for `shangpinxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `shangpinxinxi`;
CREATE TABLE `shangpinxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shangpinbianhao` varchar(200) NOT NULL COMMENT '商品编号',
  `shangpinmingcheng` varchar(200) NOT NULL COMMENT '商品名称',
  `shangpinleixing` varchar(200) NOT NULL COMMENT '商品类型',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  `jiage` int(11) NOT NULL COMMENT '价格',
  `shuliang` int(11) NOT NULL COMMENT '数量',
  `xiangqing` longtext COMMENT '详情',
  `shangjiariqi` date DEFAULT NULL COMMENT '上架日期',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1604586982863 DEFAULT CHARSET=utf8 COMMENT='商品信息';

-- ----------------------------
-- Records of shangpinxinxi
-- ----------------------------
INSERT INTO `shangpinxinxi` VALUES ('1', '2020-11-05 22:10:40', '1002', '雪花啤酒', '饮料', 'http://localhost:8080/jsppzl5K/upload/1604587000628.jpg', '100', '100', '喝出精彩\r\n', '2020-03-01', '工号1');
INSERT INTO `shangpinxinxi` VALUES ('2', '2020-11-05 22:10:40', '1003', '垃圾袋', '杂货', 'http://localhost:8080/jsppzl5K/upload/1604587049172.jpg', '20', '20', '详情2\r\n', '2020-11-05', '工号2');
INSERT INTO `shangpinxinxi` VALUES ('3', '2020-11-05 22:10:40', '1005', '香蕉', '水果', 'http://localhost:8080/jsppzl5K/upload/1604587109445.jpg', '10', '30', '详情3\r\n', '2020-11-05', '工号3');
INSERT INTO `shangpinxinxi` VALUES ('1604586982862', '2020-11-05 22:36:21', '1001', '七喜易拉罐', '饮料', 'http://localhost:8080/jsppzl5K/upload/1604586948114.jpg', '5', '100', '冰爽口感，喝了停不下来\r\n', '2020-10-27', '1');

-- ----------------------------
-- Table structure for `token`
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES ('1', '1', 'abo', 'users', '管理员', 'uo3uc3ag4teaqcbcpiono79927cc3ooi', '2020-11-05 22:33:54', '2020-11-05 23:44:09');
INSERT INTO `token` VALUES ('2', '1604586875902', '1', 'yuangong', '员工', 'qp067ajtsi82qxddmpanlrax2zdwvyyi', '2020-11-05 22:34:54', '2020-11-05 23:52:52');
INSERT INTO `token` VALUES ('3', '1604586887636', '1', 'gongyingshang', '供应商', 'lrliiguktvmutxn2l7iumrhgmoxf3wh9', '2020-11-05 22:39:25', '2020-11-05 23:53:02');

-- ----------------------------
-- Table structure for `tousuxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `tousuxinxi`;
CREATE TABLE `tousuxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `biaoti` varchar(200) NOT NULL COMMENT '标题',
  `tousuneirong` longtext COMMENT '投诉内容',
  `tousuriqi` date DEFAULT NULL COMMENT '投诉日期',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1604587254543 DEFAULT CHARSET=utf8 COMMENT='投诉信息';

-- ----------------------------
-- Records of tousuxinxi
-- ----------------------------
INSERT INTO `tousuxinxi` VALUES ('1', '2020-11-05 22:10:40', '标题1', '投诉内容1', '2020-11-05', '工号1', '否', '');
INSERT INTO `tousuxinxi` VALUES ('2', '2020-11-05 22:10:40', '标题2', '投诉内容2', '2020-11-05', '工号2', '否', '');
INSERT INTO `tousuxinxi` VALUES ('3', '2020-11-05 22:10:40', '标题3', '投诉内容3', '2020-11-05', '工号3', '否', '');
INSERT INTO `tousuxinxi` VALUES ('1604587254542', '2020-11-05 22:40:53', '我要投诉XX', '上班经常偷懒干活不积极', '2020-10-26', '1', '是', '经过核实确实有这回事，已经进行教育，');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'abo', 'abo', '管理员', '2020-11-05 22:10:40');

-- ----------------------------
-- Table structure for `xiaoshoutongji`
-- ----------------------------
DROP TABLE IF EXISTS `xiaoshoutongji`;
CREATE TABLE `xiaoshoutongji` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mingcheng` varchar(200) NOT NULL COMMENT '名称',
  `zhouqi` varchar(200) DEFAULT NULL COMMENT '周期',
  `yingyezonge` int(11) DEFAULT NULL COMMENT '营业总额',
  `dengjiriqi` date DEFAULT NULL COMMENT '登记日期',
  `gonghao` varchar(200) DEFAULT NULL COMMENT '工号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1604587220439 DEFAULT CHARSET=utf8 COMMENT='销售统计';

-- ----------------------------
-- Records of xiaoshoutongji
-- ----------------------------
INSERT INTO `xiaoshoutongji` VALUES ('1', '2020-11-05 22:10:40', '名称1', '每日', '1', '2020-11-05', '工号1');
INSERT INTO `xiaoshoutongji` VALUES ('2', '2020-11-05 22:10:40', '名称2', '每日', '2', '2020-11-05', '工号2');
INSERT INTO `xiaoshoutongji` VALUES ('3', '2020-11-05 22:10:40', '名称3', '每日', '3', '2020-11-05', '工号3');
INSERT INTO `xiaoshoutongji` VALUES ('1604587220438', '2020-11-05 22:40:20', '1月销售额统计', '每日', '15000', '2020-01-01', '1');

-- ----------------------------
-- Table structure for `yuangong`
-- ----------------------------
DROP TABLE IF EXISTS `yuangong`;
CREATE TABLE `yuangong` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gonghao` varchar(200) NOT NULL COMMENT '工号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shenfenzheng` varchar(200) DEFAULT NULL COMMENT '身份证',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gonghao` (`gonghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1604586875903 DEFAULT CHARSET=utf8 COMMENT='员工';

-- ----------------------------
-- Records of yuangong
-- ----------------------------
INSERT INTO `yuangong` VALUES ('1', '2020-11-05 22:10:40', '员工1', '123456', '姓名1', '男', '440300199101010001', '020-89819991');
INSERT INTO `yuangong` VALUES ('2', '2020-11-05 22:10:40', '员工2', '123456', '姓名2', '男', '440300199202020002', '020-89819992');
INSERT INTO `yuangong` VALUES ('3', '2020-11-05 22:10:40', '员工3', '123456', '姓名3', '男', '440300199303030003', '020-89819993');
INSERT INTO `yuangong` VALUES ('1604585713580', '2020-11-05 22:15:13', '001', '001', '', null, '', '');
INSERT INTO `yuangong` VALUES ('1604586875902', '2020-11-05 22:34:35', '1', '1', '刘倩', '女', '441412141214121', '15214121412');
