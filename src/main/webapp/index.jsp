<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@page import="cn.hutool.core.lang.Console"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
	<%@ include file="jsp/static/js-css.jsp"%>
  </head>
  
  <body>
	<%@ include file="jsp/static/banner.jsp"%>
	<%@ include file="jsp/static/header.jsp"%>  

	<div class="content">

	  	<!-- 导航栏 -->
		<%@ include file="jsp/static/sidebar.jsp"%>

  	  	<!-- Main bar -->
  	<div class="mainbar">
	    <!-- Page heading -->
    	
	   <h2 align="center" style="padding-top: 350px;"></h2>
    </div>
</div>
<!-- Content ends -->
<!-- Scroll to top -->
<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span> 
    <script>
    <%@ include file="jsp/utils/menu.jsp"%>	
    <%@ include file="jsp/utils/baseUrl.jsp"%>
	  <!--如果没登录跳转到登录页-->
	  function ready() {
		//我的后台,session信息转移
		if(window.localStorage.getItem("Token") != null && window.localStorage.getItem("Token") != 'null'){
			  if(window.sessionStorage.getItem("token") == null || window.sessionStorage.getItem("token") == 'null'){
				  window.sessionStorage.setItem("token",window.localStorage.getItem("Token"));
				  window.sessionStorage.setItem("role",window.localStorage.getItem("role"));
				  window.sessionStorage.setItem("accountTableName",window.localStorage.getItem("sessionTable"));
				  window.sessionStorage.setItem("username",window.localStorage.getItem("adminName"));
			  }
		  }
		  $('ul li .dropdown-toggle').html("<i class=\"icon-user\"></i>" + window.sessionStorage.getItem('username')+ "<b class=\"caret\"></b>")
		  setMenu();
		  $('h2').html("欢迎登陆" + projectName)
      	  <%@ include file="jsp/static/menuStyle.js"%>
		  var token = window.sessionStorage.getItem("token");
		  if(token == "null" || token == null){
		  	alert("请登录后再操作");
		  	window.location.href = ("jsp/login.jsp");
		  }
		  <%@ include file="jsp/static/myInfo.js"%>
	  }
	  <%@ include file="jsp/static/logout.jsp"%>
      <%@ include file="jsp/static/setMenu.js"%>
	  <!--加载主页先检查是否登录-->
	  document.addEventListener("DOMContentLoaded", ready);
  </script>
  </body>
</html>
