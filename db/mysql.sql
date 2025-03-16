DROP DATABASE IF EXISTS jsppzl5K;

CREATE DATABASE jsppzl5K default character set utf8mb4 collate utf8mb4_general_ci;

USE jsppzl5K;

DROP TABLE IF EXISTS `yuangong`;

CREATE TABLE `yuangong` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`gonghao` varchar(200) NOT NULL UNIQUE   COMMENT '工号',
	`mima` varchar(200) NOT NULL   COMMENT '密码',
	`xingming` varchar(200)    COMMENT '姓名',
	`xingbie` varchar(200)    COMMENT '性别',
	`shenfenzheng` varchar(200)    COMMENT '身份证',
	`shouji` varchar(200)    COMMENT '手机',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工';

INSERT INTO yuangong(gonghao,mima,xingming,xingbie,shenfenzheng,shouji) VALUES('员工1','123456','姓名1','男','440300199101010001','020-89819991');
INSERT INTO yuangong(gonghao,mima,xingming,xingbie,shenfenzheng,shouji) VALUES('员工2','123456','姓名2','男','440300199202020002','020-89819992');
INSERT INTO yuangong(gonghao,mima,xingming,xingbie,shenfenzheng,shouji) VALUES('员工3','123456','姓名3','男','440300199303030003','020-89819993');


DROP TABLE IF EXISTS `gongyingshang`;

CREATE TABLE `gongyingshang` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`zhanghao` varchar(200) NOT NULL UNIQUE   COMMENT '账号',
	`mima` varchar(200) NOT NULL   COMMENT '密码',
	`gongsimingcheng` varchar(200) NOT NULL   COMMENT '公司名称',
	`fuzeren` varchar(200)    COMMENT '负责人',
	`dianhua` varchar(200)    COMMENT '电话',
	`dizhi` varchar(200)    COMMENT '地址',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商';

INSERT INTO gongyingshang(zhanghao,mima,gongsimingcheng,fuzeren,dianhua,dizhi) VALUES('供应商1','123456','公司名称1','负责人1','020-89819991','地址1');
INSERT INTO gongyingshang(zhanghao,mima,gongsimingcheng,fuzeren,dianhua,dizhi) VALUES('供应商2','123456','公司名称2','负责人2','020-89819992','地址2');
INSERT INTO gongyingshang(zhanghao,mima,gongsimingcheng,fuzeren,dianhua,dizhi) VALUES('供应商3','123456','公司名称3','负责人3','020-89819993','地址3');


DROP TABLE IF EXISTS `shangpinxinxi`;

CREATE TABLE `shangpinxinxi` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`shangpinbianhao` varchar(200) NOT NULL   COMMENT '商品编号',
	`shangpinmingcheng` varchar(200) NOT NULL   COMMENT '商品名称',
	`shangpinleixing` varchar(200) NOT NULL   COMMENT '商品类型',
	`tupian` varchar(200)    COMMENT '图片',
	`jiage` int NOT NULL   COMMENT '价格',
	`shuliang` int NOT NULL   COMMENT '数量',
	`xiangqing` longtext    COMMENT '详情',
	`shangjiariqi` date    COMMENT '上架日期',
	`gonghao` varchar(200)    COMMENT '工号',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品信息';

INSERT INTO shangpinxinxi(shangpinbianhao,shangpinmingcheng,shangpinleixing,tupian,jiage,shuliang,xiangqing,shangjiariqi,gonghao) VALUES('商品编号1','商品名称1','商品类型1','shangpinxinxi_tupian1',1,1,'详情1',CURRENT_TIMESTAMP,'工号1');
INSERT INTO shangpinxinxi(shangpinbianhao,shangpinmingcheng,shangpinleixing,tupian,jiage,shuliang,xiangqing,shangjiariqi,gonghao) VALUES('商品编号2','商品名称2','商品类型2','shangpinxinxi_tupian2',2,2,'详情2',CURRENT_TIMESTAMP,'工号2');
INSERT INTO shangpinxinxi(shangpinbianhao,shangpinmingcheng,shangpinleixing,tupian,jiage,shuliang,xiangqing,shangjiariqi,gonghao) VALUES('商品编号3','商品名称3','商品类型3','shangpinxinxi_tupian3',3,3,'详情3',CURRENT_TIMESTAMP,'工号3');


DROP TABLE IF EXISTS `shangpinleixing`;

CREATE TABLE `shangpinleixing` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`shangpinleixing` varchar(200) NOT NULL   COMMENT '商品类型',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类型';

INSERT INTO shangpinleixing(shangpinleixing) VALUES('商品类型1');
INSERT INTO shangpinleixing(shangpinleixing) VALUES('商品类型2');
INSERT INTO shangpinleixing(shangpinleixing) VALUES('商品类型3');


DROP TABLE IF EXISTS `gongyingshangshangpin`;

CREATE TABLE `gongyingshangshangpin` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`shangpinbianhao` varchar(200) NOT NULL   COMMENT '商品编号',
	`shangpinmingcheng` varchar(200) NOT NULL   COMMENT '商品名称',
	`shangpinleixing` varchar(200) NOT NULL   COMMENT '商品类型',
	`tupian` varchar(200)    COMMENT '图片',
	`jianshu` longtext    COMMENT '简述',
	`jiage` int    COMMENT '价格',
	`shuliang` int    COMMENT '数量',
	`yuexiaoliang` int    COMMENT '月销量',
	`shangjiariqi` date    COMMENT '上架日期',
	`zhanghao` varchar(200)    COMMENT '账号',
	`gongsimingcheng` varchar(200)    COMMENT '公司名称',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商商品';

INSERT INTO gongyingshangshangpin(shangpinbianhao,shangpinmingcheng,shangpinleixing,tupian,jianshu,jiage,shuliang,yuexiaoliang,shangjiariqi,zhanghao,gongsimingcheng) VALUES('商品编号1','商品名称1','商品类型1','gongyingshangshangpin_tupian1','简述1',1,1,1,CURRENT_TIMESTAMP,'账号1','公司名称1');
INSERT INTO gongyingshangshangpin(shangpinbianhao,shangpinmingcheng,shangpinleixing,tupian,jianshu,jiage,shuliang,yuexiaoliang,shangjiariqi,zhanghao,gongsimingcheng) VALUES('商品编号2','商品名称2','商品类型2','gongyingshangshangpin_tupian2','简述2',2,2,2,CURRENT_TIMESTAMP,'账号2','公司名称2');
INSERT INTO gongyingshangshangpin(shangpinbianhao,shangpinmingcheng,shangpinleixing,tupian,jianshu,jiage,shuliang,yuexiaoliang,shangjiariqi,zhanghao,gongsimingcheng) VALUES('商品编号3','商品名称3','商品类型3','gongyingshangshangpin_tupian3','简述3',3,3,3,CURRENT_TIMESTAMP,'账号3','公司名称3');


DROP TABLE IF EXISTS `jinhuoxinxi`;

CREATE TABLE `jinhuoxinxi` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`dingdanbianhao` varchar(200)  UNIQUE   COMMENT '订单编号',
	`shangpinmingcheng` varchar(200)    COMMENT '商品名称',
	`shangpinleixing` varchar(200)    COMMENT '商品类型',
	`zhanghao` varchar(200)    COMMENT '账号',
	`jiage` varchar(200)    COMMENT '价格',
	`shuliang` int    COMMENT '数量',
	`zongjiage` int    COMMENT '总价格',
	`jinhuoriqi` date    COMMENT '进货日期',
	`gonghao` varchar(200)    COMMENT '工号',
	`ispay` varchar(200)   default '未支付' COMMENT '是否支付',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='进货信息';

INSERT INTO jinhuoxinxi(dingdanbianhao,shangpinmingcheng,shangpinleixing,zhanghao,jiage,shuliang,zongjiage,jinhuoriqi,gonghao,ispay) VALUES('订单编号1','商品名称1','商品类型1','账号1','价格1',1,1,CURRENT_TIMESTAMP,'工号1','未支付');
INSERT INTO jinhuoxinxi(dingdanbianhao,shangpinmingcheng,shangpinleixing,zhanghao,jiage,shuliang,zongjiage,jinhuoriqi,gonghao,ispay) VALUES('订单编号2','商品名称2','商品类型2','账号2','价格2',2,2,CURRENT_TIMESTAMP,'工号2','未支付');
INSERT INTO jinhuoxinxi(dingdanbianhao,shangpinmingcheng,shangpinleixing,zhanghao,jiage,shuliang,zongjiage,jinhuoriqi,gonghao,ispay) VALUES('订单编号3','商品名称3','商品类型3','账号3','价格3',3,3,CURRENT_TIMESTAMP,'工号3','未支付');


DROP TABLE IF EXISTS `xiaoshoutongji`;

CREATE TABLE `xiaoshoutongji` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`mingcheng` varchar(200) NOT NULL   COMMENT '名称',
	`zhouqi` varchar(200)    COMMENT '周期',
	`yingyezonge` int    COMMENT '营业总额',
	`dengjiriqi` date    COMMENT '登记日期',
	`gonghao` varchar(200)    COMMENT '工号',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售统计';

INSERT INTO xiaoshoutongji(mingcheng,zhouqi,yingyezonge,dengjiriqi,gonghao) VALUES('名称1','每日',1,CURRENT_TIMESTAMP,'工号1');
INSERT INTO xiaoshoutongji(mingcheng,zhouqi,yingyezonge,dengjiriqi,gonghao) VALUES('名称2','每日',2,CURRENT_TIMESTAMP,'工号2');
INSERT INTO xiaoshoutongji(mingcheng,zhouqi,yingyezonge,dengjiriqi,gonghao) VALUES('名称3','每日',3,CURRENT_TIMESTAMP,'工号3');


DROP TABLE IF EXISTS `tousuxinxi`;

CREATE TABLE `tousuxinxi` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`biaoti` varchar(200) NOT NULL   COMMENT '标题',
	`tousuneirong` longtext    COMMENT '投诉内容',
	`tousuriqi` date    COMMENT '投诉日期',
	`gonghao` varchar(200)    COMMENT '工号',
	`sfsh` varchar(200)   default '否' COMMENT '是否审核',
	`shhf` longtext    COMMENT '审核回复',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投诉信息';

INSERT INTO tousuxinxi(biaoti,tousuneirong,tousuriqi,gonghao,sfsh,shhf) VALUES('标题1','投诉内容1',CURRENT_TIMESTAMP,'工号1','否','');
INSERT INTO tousuxinxi(biaoti,tousuneirong,tousuriqi,gonghao,sfsh,shhf) VALUES('标题2','投诉内容2',CURRENT_TIMESTAMP,'工号2','否','');
INSERT INTO tousuxinxi(biaoti,tousuneirong,tousuriqi,gonghao,sfsh,shhf) VALUES('标题3','投诉内容3',CURRENT_TIMESTAMP,'工号3','否','');


DROP TABLE IF EXISTS `liaotianxinxi`;

CREATE TABLE `liaotianxinxi` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`biaoti` varchar(200) NOT NULL   COMMENT '标题',
	`liaotianneirong` longtext    COMMENT '聊天内容',
	`riqi` date    COMMENT '日期',
	`gonghao` varchar(200)    COMMENT '工号',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天信息';

INSERT INTO liaotianxinxi(biaoti,liaotianneirong,riqi,gonghao) VALUES('标题1','聊天内容1',CURRENT_TIMESTAMP,'工号1');
INSERT INTO liaotianxinxi(biaoti,liaotianneirong,riqi,gonghao) VALUES('标题2','聊天内容2',CURRENT_TIMESTAMP,'工号2');
INSERT INTO liaotianxinxi(biaoti,liaotianneirong,riqi,gonghao) VALUES('标题3','聊天内容3',CURRENT_TIMESTAMP,'工号3');


DROP TABLE IF EXISTS `liaotianhuifu`;

CREATE TABLE `liaotianhuifu` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`biaoti` varchar(200) NOT NULL   COMMENT '标题',
	`gonghao` varchar(200)    COMMENT '工号',
	`liaotianhuifu` longtext    COMMENT '聊天回复',
	`huifuriqi` date    COMMENT '回复日期',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天回复';

INSERT INTO liaotianhuifu(biaoti,gonghao,liaotianhuifu,huifuriqi) VALUES('标题1','工号1','聊天回复1',CURRENT_TIMESTAMP);
INSERT INTO liaotianhuifu(biaoti,gonghao,liaotianhuifu,huifuriqi) VALUES('标题2','工号2','聊天回复2',CURRENT_TIMESTAMP);
INSERT INTO liaotianhuifu(biaoti,gonghao,liaotianhuifu,huifuriqi) VALUES('标题3','工号3','聊天回复3',CURRENT_TIMESTAMP);



DROP TABLE IF EXISTS `config`;

CREATE TABLE `config`(
	`id` bigint NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL COMMENT '配置参数名称',
	`value` varchar(100) COMMENT '配置参数值',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置文件';

insert into config(id,name) values(1,'picture1');
insert into config(id,name) values(2,'picture2');
insert into config(id,name) values(3,'picture3');
insert into config(id,name) values(4,'picture4');
insert into config(id,name) values(5,'picture5');
insert into config(id,name) values(6,'homepage');


DROP TABLE IF EXISTS `users`;

CREATE TABLE `users`(
	`id` bigint NOT NULL AUTO_INCREMENT,
	`username` varchar(100) NOT NULL COMMENT '用户名',
	`password` varchar(100) NOT NULL COMMENT '密码',
	`role` varchar(100) default '管理员' COMMENT '角色',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '新增时间',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

insert into users(id,username, password) values(1,'abo','abo');

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token`(
	`id` bigint NOT NULL AUTO_INCREMENT,
	`userid` bigint NOT NULL COMMENT '用户id',
	`username` varchar(100) NOT NULL COMMENT '用户名',
	`tablename` varchar(100) COMMENT '表名',
	`role` varchar(100) COMMENT '角色',
	`token` varchar(200) NOT NULL COMMENT '密码',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '新增时间',
	`expiratedtime` timestamp COMMENT '过期时间',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='token表';

