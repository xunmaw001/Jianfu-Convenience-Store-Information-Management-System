<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="../../static/js-css.jsp"%>
</head>
<style>
.error {
	color: red;
}
</style>
<body>
	<%@ include file="../../static/banner.jsp"%>
	<%@ include file="../../static/header.jsp"%>

	<!-- Main content starts -->
	<div class="content">

		<!-- 侧边导航栏 -->
		<%@ include file="../../static/sidebar.jsp"%>
		<!-- Main bar -->
		<div class="mainbar">
			<!-- Page heading -->
			<div class="page-head">
				<!-- Page heading -->
				<h2 class="pull-left">
					注册用户
					<!-- page meta -->
					<span class="page-meta"> 管理</span>
				</h2>
				<!-- 面包屑 -->
				<div class="bread-crumb pull-right">
					<a href="${pageContext.request.contextPath}/index.jsp"><i
						class="icon-home"></i>主页</a>
					<!-- Divider -->
					<span class="divider">/</span> <a href="#" class="bread-current">注册用户</a>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- Page heading ends -->

			<!-- Matter -->
			<div class="matter">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="widget wred">
								<div class="widget-head">
									<div class="pull-left">编辑</div>
									<div class="clearfix"></div>
								</div>
								<div class="widget-content">
									<div class="padd">

										<!-- 新增/修改 表单 -->
										<div class="form profile">
											<form class="form-horizontal" id="addOrUpdateForm"
												method="post">
												<input id="updateId" name="id" type="hidden">
												<div class="form-group">
													<label class="control-label col-lg-3">用户名</label>
													<div class="col-lg-6">
														<input id="username" name="username" placeholder="用户名">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">密码</label>
													<div class="col-lg-6">
														<input id="mima" name="mima" placeholder="密码">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">姓名</label>
													<div class="col-lg-6">
														<input id="name" name="name" placeholder="姓名">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">性别</label>
													<div class="col-lg-6">
														<select id="sexSelect" name="sex">
															<option class="sexOption" value=" "></option>
															<option class="sexOption" value="男">男</option>
															<option class="sexOption" value="女">女</option>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">年龄</label>
													<div class="col-lg-6">
														<input id="age" name="age" placeholder="年龄">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">电话</label>
													<div class="col-lg-6">
														<input id="phone" name="phone" placeholder="电话">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">照片</label>
													<div class="col-lg-6">
														<img id="pictureImg" src="" width="100" height="100">
														<input name="file" type="file" id="pictureupload">
														<label id="pictureFileName">{{ruleForm.picture}}</label> <input
															name="picture" id="picture-input" type="hidden">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">邮箱</label>
													<div class="col-lg-6">
														<input id="email" name="email" placeholder="邮箱">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">创建时间</label>
													<div class="col-lg-6">
														<input id="addtime" name="addtime" readonly="readonly">
													</div>
												</div>

												<!-- 表单按钮 -->
												<div class="form-group">
													<div class="col-lg-6 col-lg-offset-1">
														<button id="submitBtn" type="button"
															class="btn btn-success">提交</button>
														<button type="reset" class="btn btn-default">重置</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Matter ends -->
		</div>
		<!-- Mainbar ends -->
		<div class="clearfix"></div>
	</div>
	<!-- Content ends -->
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
	<!-- Scroll to top -->
	<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span>

	<script type="text/javascript">
		
	<%@ include file="../../utils/baseUrl.jsp"%>
		
	<%@ include file="../../utils/menu.jsp"%>
		var tableName = "defaultuser";
		var pageType = "add-or-update";
		var updateId = "";

		var ruleForm = {};
		var vm = new Vue({
			el : '#addOrUpdateForm',
			data : {
				ruleForm : {},
			},
			beforeCreate : function() {
				var id = window.sessionStorage.getItem("id");
				if (id != null && id != "" && id != "null") {
					$.ajax({
						type : "GET",
						url : baseUrl + "defaultuser/info/" + id,
						beforeSend : function(xhr) {
							xhr.setRequestHeader("token", window.sessionStorage
									.getItem('token'));
						},
						success : function(res) {
							if (res.code == 0) {
								vm.ruleForm = res.data;
							} else if (res.code == 401) {
	<%@ include file="../../static/toLogin.jsp"%>
		} else {
								alert(res.msg)
							}
						},
					});
				}
			},
			methods : {}
		});

		// 文件上传
		function upload() {
			$('#pictureupload')
					.fileupload(
							{
								url : baseUrl + 'file/upload',
								headers : {
									token : window.sessionStorage
											.getItem("token")
								},
								dataType : 'json',
								done : function(e, data) {
									document.getElementById('picture-input')
											.setAttribute('value',
													data.result.file);
									document.getElementById('pictureFileName').innerHTML = data.result.file
											+ "";
									$("#pictureImg").attr(
											"src",
											baseUrl + "upload/"
													+ data.result.file);
								}
							});
		}
		// 表单提交
		function submit() {
			if (validform() == true) {
				let data = {};
				getContent();
				let value = $('#addOrUpdateForm').serializeArray();
				$.each(value, function(index, item) {
					data[item.name] = item.value;
				});
				let json = JSON.stringify(data);
				console.log('json : ', json);
				var urlParam;
				var successMes = '';
				if (updateId != null && updateId != "null" && updateId != '') {
					urlParam = 'update';
					successMes = '修改成功';
				} else {
					urlParam = 'save';
					successMes = '添加成功';
				}
				$.ajax({
					type : "POST",
					url : baseUrl + "defaultuser/" + urlParam,
					contentType : "application/json",
					data : json,
					beforeSend : function(xhr) {
						xhr.setRequestHeader("token", window.sessionStorage
								.getItem('token'));
					},
					success : function(res) {
						if (res.code == 0) {
							alert(successMes);
							window.location.href = "list.jsp";
						} else if (res.code == 401) {
	<%@ include file="../../static/toLogin.jsp"%>
		} else {
							alert(res.msg)
						}
					},
				});
			} else {
				alert("表单未填完整或有错误");
			}
		}
		// 填充富文本框
		function setContent() {
		}
		// 获取富文本框内容
		function getContent() {
		}

		// 表单校验
		function validform() {
			return $("#addOrUpdateForm").validate({
				rules : {
					mima : {
						required : true,
					},
					name : {},
					sex : {},
					age : {
						digits : true,
					},
					phone : {},
					picture : {},
					email : {},
					addtime : {
						number : true,
					},
				},
				messages : {

					mima : {
						required : "密码不能为空",
					},
					name : {},
					sex : {},
					age : {
						digits : "请输入整数",
					},
					phone : {},
					picture : {},
					email : {},
					addtime : {
						number : "请输入数字",
					},
				}
			}).form();
		}
		// 添加表单校验方法
		function addValidation() {
			jQuery.validator
					.addMethod(
							"isPhone",
							function(value, element) {
								var length = value.length;
								var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
								return this.optional(element)
										|| (length == 11 && mobile.test(value));
							}, "请填写正确的手机号码");
			jQuery.validator.addMethod("isIdCardNo", function(value, element) {
				return this.optional(element)
						|| idCardNoUtil.checkIdCardNo(value);
			}, "请正确输入您的身份证号码");
		}
		// 获取当前详情
		function getDetails() {
			var id = window.sessionStorage.getItem("id");
			if (id != null && id != "" && id != "null") {
				updateId = id;
				window.sessionStorage.removeItem('id');
				$.ajax({
					type : "GET",
					url : baseUrl + "defaultuser/info/" + id,
					beforeSend : function(xhr) {
						xhr.setRequestHeader("token", window.sessionStorage
								.getItem('token'));
					},
					success : function(res) {
						if (res.code == 0) {
							//window.sessionStorage.removeItem("id");
							ruleForm = res.data
							// 是/否下拉框回显
							setSelectOption();
							// 设置图片src
							showImg();
							// 数据填充
							dataBind();
							// 富文本框回显	
							setContent();
							//注册表单验证
							$(validform());
						} else if (res.code == 401) {
	<%@ include file="../../static/toLogin.jsp"%>
		} else {
							alert(res.msg);
						}
					},
				});
			} else {
				//注册表单验证
				$(validform());
			}
		}
		// 下拉框选项回显
		function setSelectOption() {
		}
		//跨表
		function crossTable() {
			var crossTabName = window.sessionStorage.getItem('crossTableName');
			var id = window.sessionStorage.getItem('crossTableId');
			if (crossTabName != null && crossTabName != '' && id != null
					&& id != '') {
				$.ajax({
					type : "GET",
					url : baseUrl + crossTabName + "/info/" + id,
					beforeSend : function(xhr) {
						xhr.setRequestHeader("token", window.sessionStorage
								.getItem('token'));
					},
					success : function(res) {
						if (res.code == 0) {
							$("#username").val(res.data.username)
							$("#mima").val(res.data.mima)
							$("#name").val(res.data.name)
							$("#sex").val(res.data.sex)
							$("#age").val(res.data.age)
							$("#phone").val(res.data.phone)
							$("#picture").val(res.data.picture)
							$("#email").val(res.data.email)
							$("#addtime").val(res.data.addtime)
						} else if (res.code == 401) {
	<%@ include file="../../static/toLogin.jsp"%>
		} else {
							alert(res.msg);
						}
					},
				});
			}
			window.sessionStorage.removeItem('crossTableName');
			window.sessionStorage.removeItem('crossTableId');
		}
		function ready() {
			//设置导航栏菜单
			setMenu();
	<%@ include file="../../static/menuStyle.js"%>
		//初始化上传按钮
			upload();
			//添加表单校验信息文本
			addValidation();

			$('#submitBtn').on('click', function(e) {
				e.preventDefault();
				//console.log("点击了...提交按钮");
				submit();
			});
			//初始化日期插件
			datePick();
			getDetails();
			//单列求和
			calculationPre();
			//跨表
			crossTable();
		}
		// 关联下拉框改变
		function lvSelectChange(level) {
			let data = {};
			let value = $('#addOrUpdateForm').serializeArray();
			$.each(value, function(index, item) {
				data[item.name] = item.value;
			});
		}
		// 清除可能会重复渲染的下拉框Option
		function clear(className) {
			var elements = document.getElementsByClassName(className);
			for (var i = elements.length - 1; i >= 0; i--) {
				elements[i].parentNode.removeChild(elements[i]);
			}
		}
		//计算
		function calculation() {
			//积
			var x = 0;
			//和
			var y = 0;
			var flag = 0;
		}
		function calculationSE(colName) {
			//单列求和接口
			$.ajax({
				type : "GET",
				url : baseUrl + "defaultuser" + colName,
				data : {
					tableName : "defaultuser",
					columnName : colName
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader("token", window.sessionStorage
							.getItem('token'));
				},
				success : function(res) {
					if (res.code == 0) {
						$("#" + colName).attr("value", res.data);
					} else if (res.code == 401) {
	<%@ include file="../../static/toLogin.jsp"%>
		} else {
						alert(res.msg);
					}
				},
			});
		}
		function calculationPre() {
			//进入该页面就填充"单列求和"的列
		}

		function datePick() {
			$.fn.datetimepicker.dates['zh-CN'] = {
				days : [ "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日" ],
				daysShort : [ "周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日" ],
				daysMin : [ "日", "一", "二", "三", "四", "五", "六", "日" ],
				months : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月",
						"九月", "十月", "十一月", "十二月" ],
				monthsShort : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月",
						"九月", "十月", "十一月", "十二月" ],
				today : "今天",
				suffix : [],
				meridiem : [ "上午", "下午" ]
			};
		}
		function dataBind() {
			$("#updateId").val(ruleForm.id);
			$("#username").val(ruleForm.username);
			$("#mima").val(ruleForm.mima);
			$("#name").val(ruleForm.name);
			var sexOptions = document.getElementsByClassName("sexOption");
			for (var sexCount = 0; sexCount < sexOptions.length; sexCount++) {
				if (sexOptions[sexCount].getAttribute('value') == ruleForm.sex) {
					sexOptions[sexCount].setAttribute('selected', 'selected');
				}
			}

			$("#age").val(ruleForm.age);
			$("#phone").val(ruleForm.phone);
			$("#picture-input").val(ruleForm.picture);
			$("#email").val(ruleForm.email);
			$("#addtime").val(ruleForm.addtime);
		}
		//图片显示
		function showImg() {
			var pictureFileName = "\"" + ruleForm.picture + "\"";
			$("#pictureImg")
					.attr("src", baseUrl + "upload/" + ruleForm.picture);
		}
		// 渲染菜单
	<%@ include file="../../static/setMenu.js"%>
		// 清除没有权限使用的按钮
	<%@ include file="../../static/getRoleButtons.js"%>
		// 生命周期函数
		document.addEventListener("DOMContentLoaded", ready);
	</script>

</body>
</html>
