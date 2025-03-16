<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%@ include file="static/js-css.jsp"%>
</head>

<body>
	<%@ include file="static/banner.jsp"%>
	<%@ include file="static/header.jsp"%>

	<!-- Main content starts -->
	<div class="content">

		<!-- 侧边导航栏 -->
		<%@ include file="static/sidebar.jsp"%>
		<!-- Main bar -->
		<div class="mainbar">
			<!-- Page heading -->
			<div class="page-head">
				<!-- Page heading -->
				<h2 class="pull-left">
					支付
					<!-- page meta -->
					<span class="page-meta"></span>
				</h2>
				<!-- 面包屑 -->
				<div class="bread-crumb pull-right">
					<a href="${pageContext.request.contextPath}/index.jsp"><i
						class="icon-home"></i>主页</a>
					<!-- Divider -->
					<span class="divider">/</span> <a href="#" class="bread-current">支付</a>
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
									<div class="pull-left">请选择支付方式</div>
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
													<label class="col-lg-4 control-label">支付方式：</label>
													<div class="col-lg-8">
														
															<label> <input type="radio" name="optionsRadios"
																id="optionsRadios1" value="option1">
															<img src="${pageContext.request.contextPath}/resources/img/bank/微信支付.png" height="80px" width="200px">	
															</label>
														
														
															<label> <input type="radio" name="optionsRadios"
																id="optionsRadios2" value="option2">
															<img src="${pageContext.request.contextPath}/resources/img/bank/支付宝支付.png" height="80px" width="200px">	
															</label>
															
															<label> <input type="radio" name="optionsRadios"
																id="optionsRadios2" value="option2">
															<img src="${pageContext.request.contextPath}/resources/img/bank/交通银行.png" height="80px" width="200px">	
															</label>
															
															<label> <input type="radio" name="optionsRadios"
																id="optionsRadios2" value="option2">
															<img src="${pageContext.request.contextPath}/resources/img/bank/招商银行.png" height="80px" width="200px">	
															</label>
															<br>
															<label> <input type="radio" name="optionsRadios"
																id="optionsRadios2" value="option2">
															<img src="${pageContext.request.contextPath}/resources/img/bank/中国邮政储蓄银行.png" height="80px" width="200px">	
															</label>
															<label> <input type="radio" name="optionsRadios"
																id="optionsRadios2" value="option2">
															<img src="${pageContext.request.contextPath}/resources/img/bank/中国建设银行.png" height="80px" width="200px">	
															</label>
															<label> <input type="radio" name="optionsRadios"
																id="optionsRadios2" value="option2">
															<img src="${pageContext.request.contextPath}/resources/img/bank/中国农业银行.png" height="80px" width="200px">	
															</label>
															<label> <input type="radio" name="optionsRadios"
																id="optionsRadios2" value="option2">
															<img src="${pageContext.request.contextPath}/resources/img/bank/中国银行.png" height="80px" width="200px">	
															</label>
														
														
													</div>
												</div>




												<!-- 表单按钮 -->
												<div class="form-group">
													<div class="col-lg-6 col-lg-offset-1">
														<button id="submitBtn" type="button"
															class="btn btn-success">支付</button>
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
		
		<%@ include file="utils/baseUrl.jsp"%>	
		<%@ include file="utils/menu.jsp"%>
		// 渲染菜单
		<%@ include file="static/setMenu.js"%>
	
		var pageType = "pay";
		var updateId = "";

		function pay() {
           updateId = window.sessionStorage.getItem('id')
           var tableName = window.sessionStorage.getItem('tableName')
            $.ajax({ 
                type: "POST",
                url: baseUrl + tableName +"/update",
                contentType: "application/json",
                data:JSON.stringify({id: updateId, ispay: "已支付"}),
                beforeSend: function(xhr) {xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));},
                success: function(res){    
                    if(res.code == 0){
                    window.sessionStorage.removeItem('id');
                    window.sessionStorage.removeItem('tableName');
                    alert('支付成功');
                    window.location.href="modules/" + tableName +"/list.jsp";
                    }else if(res.code == 401){
                        <%@ include file="static/toLogin.jsp"%> 	
                    }else{
                        alert(res.msg)
                    }
                },
            });      
		}

		function ready() {
			setMenu();
			<%@ include file="static/menuStyle.js"%>
			$('#submitBtn').on('click', function(e) {
					e.preventDefault();
					//console.log("点击了...提交按钮");
					pay();
			});
			<%@ include file="static/myInfo.js"%>
		}
		
		// 生命周期函数
		document.addEventListener("DOMContentLoaded", ready);
	</script>

</body>
</html>
