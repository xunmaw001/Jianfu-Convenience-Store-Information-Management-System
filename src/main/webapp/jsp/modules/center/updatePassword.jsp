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
					修改密码
					<!-- page meta -->
					<span class="page-meta"> 管理</span>
				</h2>
				<!-- 面包屑 -->
				<div class="bread-crumb pull-right">
					<a href="${pageContext.request.contextPath}/index.jsp"><i
						class="icon-home"></i>主页</a>
					<!-- Divider -->
					<span class="divider">/</span> <a href="#" class="bread-current">修改密码</a>
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
													<label class="control-label col-lg-3">原密码</label>
													<div class="col-lg-6">
														<input id="oldPassword" name="oldPassword" placeholder="原密码">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">新密码</label>
													<div class="col-lg-6">
														<input id="newPassword" name="newPassword" placeholder="新密码">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">确认密码</label>
													<div class="col-lg-6">
														<input id="confirmPassword" name="confirmPassword"
															placeholder="确认密码">
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
		var tableName = "xiugaimima";
		var pageType = "add-or-update";
		var updateId = "";
		var password = '';
		var accountTableName = ''

		var ruleForm = {};

		// 表单提交
		function submit() {
			if (validform() == true) {
				
				if(password == $('#oldPassword').val()){
					httpJson(accountTableName + "/update","POST",{
						id:updateId,
						mima: $('#newPassword').val(),
						password: $('#newPassword').val()
					},(res)=>{
						if(res.code == 0){
							window.location.href = '../../login.jsp';
							alert('修改成功，请重新登陆');
						}						
					});
					
				}else{
					alert('原密码输入错误')
				}

			} else {
				alert("表单未填完整或有错误");
			}
		}

		// 表单校验
		function validform() {
			return $("#addOrUpdateForm").validate({
				rules : {
					oldPassword : {
						required : true,
					},
					newPassword : {
						required : true,
					},
					confirmPassword : {
						required : true,
						equalTo: "#newPassword",
					},
				},
				messages : {
					oldPassword : {
						required : "原密码不能为空",
					},
					newPassword : {
						required : "新密码不能为空",
					},
					confirmPassword : {
						required : "确认密码不能为空",
						equalTo: "两次密码输入不一致",
					},
				}
			}).form();
		}

		function ready() {
			$('ul li .dropdown-toggle').html("<i class=\"icon-user\"></i>" + window.sessionStorage.getItem('username')+ "<b class=\"caret\"></b>")
			//设置导航栏菜单
			setMenu();
			<%@ include file="../../static/menuStyle.js"%>
			$('#submitBtn').on('click', function(e) {
				e.preventDefault();
				//console.log("点击了...提交按钮");
				submit();
			});
			getId();
			<%@ include file="../../static/myInfo.js"%>
		}


		function getId() {
			var userName = window.sessionStorage.getItem('username')
			accountTableName = window.sessionStorage.getItem('accountTableName')
			http(accountTableName+'/session','GET',{},(res)=>{
				if(res.code == 0){
					updateId = res.data.id;
					if(res.data != null && res.data.mima != null && res.data.mima != ''){
						password = res.data.mima;
					} else if(res.data != null && res.data.password != null && res.data.password != ''){
						password = res.data.password;
					}
					
				}		
			});
		}

		// 渲染菜单
	<%@ include file="../../static/setMenu.js"%>
		// 清除没有权限使用的按钮
	<%@ include file="../../static/getRoleButtons.js"%>
		// 用户登出
	<%@ include file="../../static/logout.jsp"%>
		// 生命周期函数
		document.addEventListener("DOMContentLoaded", ready);
	</script>

</body>
</html>
