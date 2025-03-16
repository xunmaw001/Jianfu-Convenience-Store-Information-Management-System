<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
   	  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	  <meta charset="utf-8">
	  <!-- Title and other stuffs -->
	  <title>后台管理系统</title> 
	  <meta name="keywords" content="后台管理系统" />
	  <meta name="description" content="后台管理系统" />
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <meta name="author" content="">
	  <!-- Stylesheets -->
	  <link href="${pageContext.request.contextPath}/resources/style/bootstrap.css" rel="stylesheet">
	  <!-- Font awesome icon -->
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style/font-awesome.css">
	  <!-- jQuery UI -->
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style/jquery-ui.css">
	  <!-- Date picker -->
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style/bootstrap-datetimepicker.min.css">
	  <!-- CLEditor -->
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style/jquery.cleditor.css"> 
	  <!-- Bootstrap toggle -->
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style/bootstrap-switch.css">
	  <!-- Main stylesheet -->
	  <link href="${pageContext.request.contextPath}/resources/style/style.css" rel="stylesheet">
	  <!-- Widgets stylesheet -->
	  <link href="${pageContext.request.contextPath}/resources/style/widgets.css" rel="stylesheet">
		 
	  
	  <!-- HTML5 Support for IE -->
	  <!--[if lt IE 9]>
	  <script src="js/html5shim.js"></script>
	  <![endif]-->
	
	  <!-- Favicon -->
	  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon/favicon.png">
	  	<script type="text/javascript" charset="utf-8">
	    window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
		</script>
		<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
	  	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
	
		<!-- JS -->
		<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<!-- <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script> --> <!-- jQuery -->
		<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script> <!-- jQuery Form -->
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script> <!-- Bootstrap -->
		<script src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.9.2.custom.min.js"></script> <!-- jQuery UI -->
		<script src="${pageContext.request.contextPath}/resources/js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->

		<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/fileupload/jquery.fileupload.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script> <!--表单校验插件-->
		<script src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script> <!--校验语言包-->
		<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
		
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.min.js"></script> <!-- Date picker -->
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap-switch.min.js"></script> <!-- Bootstrap Toggle -->
		<script src="${pageContext.request.contextPath}/resources/js/jquery.cleditor.min.js"></script> <!-- CLEditor -->
		<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script> <!-- Custom codes -->
