<%@ page language="java" import="java.util.*,com.alibaba.fastjson.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
	  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	  <meta charset="utf-8">
	  <!-- Title and other stuffs -->
	  <title>员工注册</title>
	  <meta name="keywords" content="后台管理系统" />
	  <meta name="description" content="后台管理系统" />
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <meta name="author" content="">
	  <!-- Stylesheets -->
	  <link href="${pageContext.request.contextPath}/resources/style/bootstrap.css" rel="stylesheet">
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style/font-awesome.css">
	  <link href="${pageContext.request.contextPath}/resources/style/style.css" rel="stylesheet">
	  <%--<link href="style/bootstrap-responsive.css" rel="stylesheet">--%>
	  
	  <!-- HTML5 Support for IE -->
	  <!--[if lt IE 9]>
	  <script src="${pageContext.request.contextPath}/resources/js/html5shim.js"></script>
	  <![endif]-->

	  <!-- Favicon -->
	  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon/favicon.png">
	  <script>
		 <% String s = "";%>
		 <% JSONArray arr = JSON.parseArray(s);%>
		 	
		 <%@ include file="../../utils/baseUrl.jsp"%>	
		
		// 表单校验
		function validform() {
			return $("#registerForm").validate({ 
				rules: {
																													mima: {
															required: true,
														},
																								xingming: {
														},
																								xingbie: {
														},
																								shenfenzheng: {
															digits: true,
														},
																								shouji: {
															digits: true,
														},
															},
				messages: {
																													mima: {
															required: "密码不能为空",
														},
																								xingming: {
														},
																								xingbie: {
														},
																								shenfenzheng: {
															digits: "请输入整数",
														},
																								shouji: {
															digits: "请输入整数",
														},
															}
			}).form();
		}
		// 添加表单校验方法
		function addValidation(){
			jQuery.validator.addMethod("isPhone", function(value, element) {
					var length = value.length;
					var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
					return this.optional(element) || (length == 11 && mobile.test(value));
			}, "请填写正确的手机号码");
			jQuery.validator.addMethod("isIdCardNo", function(value, element) {
				return this.optional(element) || idCardNoUtil.checkIdCardNo(value);
			}, "请正确输入您的身份证号码");
		}

		// 表单提交
		function submit() {
			if(validform() ==true){
				let data = {};
				let value = $('#registerForm').serializeArray();
				$.each(value, function (index, item) { 
							data[item.name] = item.value;
						});
				let json = JSON.stringify(data);
				//console.log('json : ',json);
				$.ajax({ 
					type: "POST",
					url: baseUrl + "yuangong/register",
					contentType: "application/json",
					data:json,
					beforeSend: function(xhr) {xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));},
					success: function(res){    
						if(res.code == 0){
						alert("注册成功!");
						window.location.href="${pageContext.request.contextPath}/jsp/login.jsp";
						}else if(res.code == 401){
							<%@ include file="../../static/toLogin.jsp"%> 	
						}else{
							alert(res.msg)
						}
					},
				});      
			}else{
				alert("表单未填完整或有错误");
			}
		}    
		  function ready(){
			 addValidation();
			//注册表单验证
		    $(validform());
			$('#submitBtn').on('click', function(e) {
				e.preventDefault();
				//console.log("点击了...提交按钮");
				submit();
			});
		  }
		  document.addEventListener("DOMContentLoaded", ready);
	  </script>
  </head>
	<style>
		.error{
			color:red;
		}
	</style>
  <body>
	    <!-- Form area -->
	<div class="admin-form">
	  <div class="container">
	
	    <div class="row">
	      <div class="col-md-12">
	        <!-- Widget starts -->
	            <div class="widget worange">
	              <!-- Widget head -->
	              <div class="widget-head">
	                <i class="icon-lock"></i> 员工注册
	              </div>
	
	              <div class="widget-content">
	                <div class="padd">
	                  <!-- 登录表单 -->
	                  <form id="registerForm" class="form-horizontal" action="" method="post">
					  	                  							  									<div class="form-group">
								<label class="control-label col-lg-3">工号</label>
								<div class="col-lg-9">
									<input type="text" name="gonghao" class="form-control" placeholder="工号">
								</div>
								</div>
																			  									<div class="form-group">
								<label class="control-label col-lg-3">密码</label>
								<div class="col-lg-9">
									<input type="text" name="mima" class="form-control" placeholder="密码">
								</div>
								</div>
																			  									<div class="form-group">
								<label class="control-label col-lg-3">姓名</label>
								<div class="col-lg-9">
									<input type="text" name="xingming" class="form-control" placeholder="姓名">
								</div>
								</div>
																			  													  									<div class="form-group">
								<label class="control-label col-lg-3">身份证</label>
								<div class="col-lg-9">
									<input type="text" name="shenfenzheng" class="form-control" placeholder="身份证">
								</div>
								</div>
																			  									<div class="form-group">
								<label class="control-label col-lg-3">手机</label>
								<div class="col-lg-9">
									<input type="text" name="shouji" class="form-control" placeholder="手机">
								</div>
								</div>
														                  	                        <div class="col-lg-9 col-lg-offset-2">
								<button type="button" id="submitBtn" class="btn btn-danger">注 册</button>
								<button type="reset" class="btn btn-default">重 置</button>
							</div>
	                    <br />
	                  </form>

					</div>
	                </div>

	            </div>  
	      </div>
	    </div>
	  </div> 
	</div>

	<!-- JS -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
  </body>
</html>
