<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
var menus = [{"backMenu":[{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"员工列表","menuJump":"列表","tableName":"yuangong"}],"menu":"员工管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"供应商列表","menuJump":"列表","tableName":"gongyingshang"}],"menu":"供应商管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"商品信息列表","menuJump":"列表","tableName":"shangpinxinxi"}],"menu":"商品信息管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"商品类型列表","menuJump":"列表","tableName":"shangpinleixing"}],"menu":"商品类型管理"},{"child":[{"buttons":["新增","查看","修改","删除","进货"],"menu":"供应商商品列表","menuJump":"列表","tableName":"gongyingshangshangpin"}],"menu":"供应商商品管理"},{"child":[{"buttons":["新增","查看","修改","删除","支付"],"menu":"进货信息列表","menuJump":"列表","tableName":"jinhuoxinxi"}],"menu":"进货信息管理"},{"child":[{"buttons":["新增","查看","修改","删除","报表"],"menu":"销售统计列表","menuJump":"列表","tableName":"xiaoshoutongji"}],"menu":"销售统计管理"},{"child":[{"buttons":["新增","查看","修改","删除","审核"],"menu":"投诉信息列表","menuJump":"列表","tableName":"tousuxinxi"}],"menu":"投诉信息管理"},{"child":[{"buttons":["新增","查看","修改","删除","回复"],"menu":"聊天信息列表","menuJump":"列表","tableName":"liaotianxinxi"}],"menu":"聊天信息管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"聊天回复列表","menuJump":"列表","tableName":"liaotianhuifu"}],"menu":"聊天回复管理"}],"frontMenu":[],"roleName":"管理员","tableName":"users"},{"backMenu":[{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"商品信息列表","menuJump":"列表","tableName":"shangpinxinxi"}],"menu":"商品信息管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"商品类型列表","menuJump":"列表","tableName":"shangpinleixing"}],"menu":"商品类型管理"},{"child":[{"buttons":["新增","查看","修改","删除","报表"],"menu":"销售统计列表","menuJump":"列表","tableName":"xiaoshoutongji"}],"menu":"销售统计管理"},{"child":[{"buttons":["查看","进货"],"menu":"供应商商品列表","menuJump":"列表","tableName":"gongyingshangshangpin"}],"menu":"供应商商品管理"},{"child":[{"buttons":["查看","删除","支付"],"menu":"进货信息列表","menuJump":"列表","tableName":"jinhuoxinxi"}],"menu":"进货信息管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"投诉信息列表","menuJump":"列表","tableName":"tousuxinxi"}],"menu":"投诉信息管理"},{"child":[{"buttons":["新增","查看"],"menu":"聊天信息列表","menuJump":"列表","tableName":"liaotianxinxi"}],"menu":"聊天信息管理"},{"child":[{"buttons":["查看"],"menu":"聊天回复列表","menuJump":"列表","tableName":"liaotianhuifu"}],"menu":"聊天回复管理"}],"frontMenu":[],"roleName":"员工","tableName":"yuangong"},{"backMenu":[{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"商品类型列表","menuJump":"列表","tableName":"shangpinleixing"}],"menu":"商品类型管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"供应商商品列表","menuJump":"列表","tableName":"gongyingshangshangpin"}],"menu":"供应商商品管理"},{"child":[{"buttons":["查看","删除"],"menu":"进货信息列表","menuJump":"列表","tableName":"jinhuoxinxi"}],"menu":"进货信息管理"}],"frontMenu":[],"roleName":"供应商","tableName":"gongyingshang"}];

var hasMessage = '';
