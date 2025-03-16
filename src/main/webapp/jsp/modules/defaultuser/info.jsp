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
									<div class="pull-left">详情</div>
									<div class="clearfix"></div>
								</div>
								<div class="widget-content">
									<div class="padd">

										<!-- 新增/修改 表单 -->
										<div class="form profile">
											<form class="form-horizontal" id="addOrUpdateForm"
												method="post">
												<input type="hidden" name="id" v-model="ruleForm.id">
												<div class="form-group">
													<label class="control-label col-lg-3">用户名</label>
													<div class="col-lg-6">
														<input id="username" v-model="ruleForm.username" readonly>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">密码</label>
													<div class="col-lg-6">
														<input id="mima" v-model="ruleForm.mima" readonly>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">姓名</label>
													<div class="col-lg-6">
														<input id="name" v-model="ruleForm.name" readonly>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">性别</label>
													<div class="col-lg-6">
														<input id="sex" v-model="ruleForm.sex" readonly>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">年龄</label>
													<div class="col-lg-6">
														<input id="age" v-model="ruleForm.age" readonly>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">电话</label>
													<div class="col-lg-6">
														<input id="phone" v-model="ruleForm.phone" readonly>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">照片</label>
													<div class="col-lg-6">
														<img id="pictureImg" src="" width="100" height="100">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">邮箱</label>
													<div class="col-lg-6">
														<input id="email" v-model="ruleForm.email" readonly>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-lg-3">创建时间</label>
													<div class="col-lg-6">
														<input id="addtime" v-model="ruleForm.addtime" readonly>
													</div>
												</div>

												<!-- 表单按钮 -->
												<div class="form-group">
													<div class="col-lg-6 col-lg-offset-1">
														<button id="exitBtn" type="button">返回</button>
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
		var pageType = "info";

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

		// 填充富文本框
		function setContent() {
		}

		// 获取当前详情
		function getDetails() {
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
							//window.sessionStorage.removeItem("id");
							ruleForm = res.data
							showImg()
							setContent();
							setMediaUrl();
							setDownloadBtn();
						} else if (res.code == 401) {
	<%@ include file="../../static/toLogin.jsp"%>
		} else {
							alert(res.msg);
						}
					},
				});
			}
		}

		function ready() {
			setMenu();
	<%@ include file="../../static/menuStyle.js"%>
		$('#exitBtn').on('click', function(e) {
				e.preventDefault();
				exit();
			});
			getDetails();

		}

		function exit() {
			window.sessionStorage.removeItem("id");
			window.location.href = "list.jsp";
		}

		function showImg() {
			var pictureFileName = "\"" + ruleForm.picture + "\"";
			$("#pictureImg")
					.attr("src", baseUrl + "upload/" + ruleForm.picture);
		}
		function fill() {
			//新增时填充字段
		}
		// 下载
		function download(fileName) {
			var url = baseUrl + 'file/download?fileName=' + fileName;
			window.open(url);
		}
		//设置下载
		function setDownloadBtn() {
		}
		//设置音视频播放链接
		function setMediaUrl() {
		}
		// 渲染菜单
	<%@ include file="../../static/setMenu.js"%>
		// 生命周期函数
		document.addEventListener("DOMContentLoaded", ready);
	</script>

</body>
</html>
