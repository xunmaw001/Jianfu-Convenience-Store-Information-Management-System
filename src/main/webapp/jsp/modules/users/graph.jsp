<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
     <%@ include file="../../static/js-css.jsp"%>
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style/font-awesome.min.css">
  </head>
  
  <body>
	  <%@ include file="../../static/banner.jsp"%>
	  <%@ include file="../../static/header.jsp"%>    
	
	<!-- Main content starts -->
	
	<div class="content">
	
	  	<!-- 导航栏 -->
		<%@ include file="../../static/sidebar.jsp"%>

	
	  	<!-- Main bar -->
	  	<div class="mainbar">
	
	      <!-- Page heading -->
	      <div class="page-head">
	        <h2 class="pull-left">员工信息统计</h2>
	
	        <!-- Breadcrumb -->
	        <div class="bread-crumb pull-right">
	          <a href="index.html"><i class="icon-home"></i> 主页</a> 
	          <!-- Divider -->
	          <span class="divider">/</span> 
	          <a href="#" class="bread-current">员工信息</a>
	        </div>
	
	        <div class="clearfix"></div>
	
	      </div>
	      <!-- Page heading ends -->
	
		    <!-- Matter -->
	
		    <div class="matter">
	        <div class="container">
	
	          <!-- Table -->
	
	            <div class="row">
	
	              <div class="col-md-12">

	                <div class="widget">
	            		 <div id="main" style="width: 600px;height:400px;"></div>
							<script type="text/javascript">
								// 基于准备好的dom，初始化echarts实例
								var myChart = echarts.init(document.getElementById('main'));
						
								// 指定图表的配置项和数据
								var option = {
									title: {
										text: '第一个 ECharts 实例'
									},
									tooltip: {},
									legend: {
										data:['销量']
									},
									xAxis: {
										data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
									},
									yAxis: {},
									series: [{
										name: '销量',
										type: 'bar',
										data: [5, 20, 36, 10, 10, 20]
									}]
								};
						
								// 使用刚指定的配置项和数据显示图表。
								myChart.setOption(option);
							</script>
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
		<%@ include file="../../utils/menu.jsp"%>	
		var tableName = "yuangongxinxi";
		var pageType = "graph";
		var dataList = [];
		<%@ include file="../../utils/baseUrl.jsp"%>   

        function ready() {
			setMenu();
			getRoleButtons();
			<%@ include file="../../static/menuStyle.js"%>
        }
        // 用户登出
        <%@ include file="../../static/logout.jsp"%>


		// 清除没有权限使用的按钮
		<%@ include file="../../static/getRoleButtons.js"%>
		// 渲染菜单
		<%@ include file="../../static/setMenu.js"%>
        document.addEventListener("DOMContentLoaded", ready);
    </script>
  </body>
</html>
