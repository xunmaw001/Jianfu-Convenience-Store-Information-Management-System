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
	  <title>见福便利店信息管理系统登录</title>
	  <meta name="keywords" content="Bootstrap后台管理系统" />
	  <meta name="description" content="Bootstrap后台管理系统" />
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <meta name="author" content="">
	  <!-- Stylesheets -->
	  <link href="${pageContext.request.contextPath}/resources/style/bootstrap.css" rel="stylesheet">
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style/font-awesome.css">
	  <link href="${pageContext.request.contextPath}/resources/style/style.css" rel="stylesheet">
<%--	  <link href="style/bootstrap-responsive.css" rel="stylesheet">--%>
	  
	  <!-- HTML5 Support for IE -->
	  <!--[if lt IE 9]>
	  <script src="${pageContext.request.contextPath}/resources/js/html5shim.js"></script>
	  <![endif]-->

	  <!-- Favicon -->
	  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon/favicon.png">
	  <script>
		 <% String s = "";%>
		 <% JSONArray arr = JSON.parseArray(s);%>
		 	
		 <%@ include file="utils/menu.jsp"%>	
		 <%@ include file="utils/baseUrl.jsp"%>	
		 var role = "";
		 var accountTableName = "";  
	  	 //渲染角色选择
	  	 function setRoleOption(){
	  		 for(var i=0;i<menus.length;i++){
	  			 //console.log(menu[i].roleName)
	  			 var label = document.createElement('label');
	  			 label.innerHTML = menus[i].roleName;
	  			 var checkbox = document.createElement('input');
	  			 checkbox.setAttribute('type','radio');
	  			 checkbox.setAttribute('name','chk');
	  			 checkbox.setAttribute('value',menus[i].roleName);
	  			 var attr = "checkRole(" + "\'" + menus[i].roleName  + "\',\'"+  menus[i].tableName + "\')";
	  			 checkbox.setAttribute('onclick',attr);
	  			 label.setAttribute('class','checkbox inline');
	  			 label.appendChild(checkbox);
	  			 $('#roleOptions').append(label);
	  		 }
	  	 }
	  	 function checkRole(roleName,tableName){
			role = roleName;
			$('#loginForm').attr('action',baseUrl + tableName+ '/login');
			accountTableName = tableName;	  		 
	  	 }
		  function login() {		  	
				$(".form-horizontal").ajaxForm(function (res) {
				  if(role == "" || role == null){
					  alert("请选择角色后再登录");
				  }else{
					  if(res.code == 0) {
						  alert("登录成功");
						  var username = $('#username').val();
						  window.sessionStorage.setItem('accountTableName',accountTableName);
						  window.sessionStorage.setItem('username',username);
						  window.sessionStorage.setItem('token', res.token);
						  window.sessionStorage.setItem('role', role);
						  window.location.href="${pageContext.request.contextPath}/index.jsp";
					  }
					  else{
						  alert(res.msg);
					  }
				  }
				  
			  	});				  
		  }
		  function ready(){
			  setRoleOption();
			  //$('.form-horizontal').attr('action',baseUrl+'users/login');
		  }
		  document.addEventListener("DOMContentLoaded", ready);
	  </script>
	  <style>
  	  	body{
  	  		background: url("${pageContext.request.contextPath}/resources/img/background.jpg") no-repeat;
  	  		
  	  	}
  	  </style>
  </head>
  
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
	                <i class="icon-lock"></i> 登 录
	              </div>
	
	              <div class="widget-content">
	                <div class="padd">
	                  <!-- 登录表单 -->
	                  <form id="loginForm" class="form-horizontal" action="" method="post">
	                    <!-- 账号 -->
	                    <div class="form-group">
	                      <label class="control-label col-lg-3">账号</label>
	                      <div class="col-lg-9">
	                        <input type="text" id="username" name="username" class="form-control" placeholder="请输入账号" required>
	                      </div>
	                    </div>
	                    <!-- 密码 -->
	                    <div class="form-group">
	                      <label class="control-label col-lg-3">密码</label>
	                      <div class="col-lg-9">
	                        <input type="password" name="password" class="form-control" placeholder="请输入密码" required>
	                      </div>
	                    </div>	                                  
	                    <div class="form-group">
                    	  <label class="control-label col-lg-3">角色</label>
                    	  <div class="col-lg-9" id="roleOptions">
                    	  </div>
	                    </div>
	             
                        <div class="col-lg-9 col-lg-offset-2">
							<button type="submit" class="btn btn-danger" onclick="login()">登 录</button>
							<button type="reset" class="btn btn-default">重 置</button>
						</div>	                                        		                	                    
	                  </form>
					  
					</div>
	                </div>

	            </div>  
	      </div>
	      <div style="margin-left: 15px">
		      									<a href="modules/yuangong/register.jsp">员工注册</a>
							  									<a href="modules/gongyingshang/register.jsp">供应商注册</a>
							  							  							  							  							  							  							  							  							  	      </div>
	      
	    </div>
	  </div> 
	</div>

	<!-- JS -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
  </body>
</html>
