<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
	<%@ include file="../../static/js-css.jsp"%>
  </head>
  	<style>
		.error{
			color:red;
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
		      <h2 class="pull-left">管理员
	          <!-- page meta -->
	          <span class="page-meta"> 管理</span>
	        </h2>
	        <!-- 面包屑 -->
	        <div class="bread-crumb pull-right">
	          <a href="${pageContext.request.contextPath}/index.jsp"><i class="icon-home"></i>主页</a>
	          <!-- Divider -->
	          <span class="divider">/</span>
	          <a href="#" class="bread-current">管理员信息</a>
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
						<form class="form-horizontal" id="addOrUpdateForm" method="post">
							<input type="hidden" name="id" v-model="ruleForm.id">
								<div class="form-group">
									<label class="control-label col-lg-3">用户名</label>
										<div class="col-lg-6">
											<input id="username" name="username" placeholder="用户名" v-model="ruleForm.username">
										</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-3">密码</label>
									<div class="col-lg-6">
										<input id="password" name="password" placeholder="密码" v-model="ruleForm.password">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-3">角色</label>
									<div class="col-lg-6">
										<input id="role" name="role" value="管理员" readonly>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-lg-3">创建时间</label>
									<div class="col-lg-6">
										<input id="addtime" name="addtime" placeholder="创建时间" v-model="ruleForm.addtime" readonly>
									</div>
								</div>

							<!-- 表单按钮 -->
							<div class="form-group">
								<div class="col-lg-6 col-lg-offset-1">
									<button id="submitBtn" type="button" class="btn btn-success">提交</button>
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
	<!-- Scroll to top -->
	<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span> 
	
		<script type="text/javascript">
		<%@ include file="../../utils/baseUrl.jsp"%>    
		<%@ include file="../../utils/menu.jsp"%>	
		var tableName = "users";
		var pageType = "add-or-update";
			      				      				      				      				      				      	
		var ruleForm = {};
		var vm = new Vue({
		  el: '#addOrUpdateForm',
		  data:{
			  ruleForm : {},
			},
		  beforeCreate: function(){
			  var id = window.sessionStorage.getItem("id");
				if(id != null && id != "" && id != "null"){
					$.ajax({ 
		                type: "GET",
		                url: baseUrl + "users/info/" + id,
		                beforeSend: function(xhr) {xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));},
		                success: function(res){               	
		                	if(res.code == 0){
		                		vm.ruleForm = res.data;
				    		}else if(res.code == 401) {
				    			<%@ include file="../../static/toLogin.jsp"%>    
				    		}else{ alert(res.msg)}
		                },
		            });
				}
			},
			methods: { }
	  });

		// 表单提交
		function submit() {
			if(validform() ==true){
				let data = {};
				//getContent();
				let value = $('#addOrUpdateForm').serializeArray();
				$.each(value, function (index, item) { 
							data[item.name] = item.value;
						});
				let json = JSON.stringify(data);
				console.log('json : ',json);
				var id = window.sessionStorage.getItem("id");
				var urlParam;
				var successMes = '';
				if(id==null || id=="null" || id==''){
					urlParam = 'save';
					successMes = '添加成功';
				}else{
					urlParam = 'update';
					successMes = '修改成功';
				}
				$.ajax({ 
					type: "POST",
					url: baseUrl + "users/"+urlParam,
					contentType: "application/json",
					data:json,
					beforeSend: function(xhr) {xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));},
					success: function(res){    
						if(res.code == 0){
						window.sessionStorage.removeItem('id');
						alert(successMes);
						window.location.href="list.jsp";
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

					
		// 表单校验
		function validform() {
			return $("#addOrUpdateForm").validate({ 
				rules: {
						username: "required",
						password: "required",
						},
				messages: {
							username: "请输入用户名",
							password: "请输入密码",
						  }
			}).form();
		}
		// 获取当前详情
		function getDetails() {
			var id = window.sessionStorage.getItem("id");
			if(id != null && id != "" && id != "null"){
				$("#submitBtn").addClass("修改");
				$.ajax({ 
	                type: "GET",
	                url: baseUrl + "users/info/" + id,
	                beforeSend: function(xhr) {xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));},
	                success: function(res){           
	                	if(res.code == 0){
	                		ruleForm = res.data
						}else if(res.code ==401){
			    			 <%@ include file="../../static/toLogin.jsp"%>	
			    		}else{
							 alert(res.msg);
						}
	                },
	            });
			}else{
				$("#submitBtn").addClass("新增");
			}
		}
		// 设置修改的id
		function setUpdateId(){
			var updateId = document.createElement('input');
			updateId.setAttribute('type','hidden');
			updateId.setAttribute('name','id');
			updateId.setAttribute('v-model','ruleForm.id');
			$('#addOrUpdateForm').appendChild(updateId);
		}
		function ready() {
			setMenu();
			getRoleButtons();
			<%@ include file="../../static/menuStyle.js"%>
			//注册表单验证
		    $(validform());
			$('#submitBtn').on('click', function(e) {
			    e.preventDefault();
			    console.log("点击了...提交按钮");
			    submit();
			});
			getDetails();
		}
		// 清除可能会重复渲染的selection
		function clear(className){
			var elements = document.getElementsByClassName(className);
        	for(var i = elements.length - 1; i >= 0; i--) { 
        	  elements[i].parentNode.removeChild(elements[i]); 
        	}
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
