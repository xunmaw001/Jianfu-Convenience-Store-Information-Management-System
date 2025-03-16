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
	 <script src="${pageContext.request.contextPath}/resources/js/echarts.min.js"></script>
	 <script src="${pageContext.request.contextPath}/resources/js/macarons.js"></script>
	 <style>
	 	.graph{
			margin: 10px auto;
		}
	 </style>
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
	        <h2 class="pull-left">聊天信息统计</h2>
	
	        <!-- Breadcrumb -->
	        <div class="bread-crumb pull-right">
	          <a href="index.html"><i class="icon-home"></i> 主页</a> 
	          <!-- Divider -->
	          <span class="divider">/</span> 
	          <a href="#" class="bread-current">聊天信息</a>
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
						<!--求和的都放同一个统计图里-->
	            		<!--<div id="main" style="width: 600px;height:400px;"></div>-->
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
		var tableName = "liaotianxinxi";
		var pageType = "graph";

																		
		var valueArr = []
		<%@ include file="../../utils/baseUrl.jsp"%>   
				
																		        function ready() {
			$('ul li .dropdown-toggle').html("<i class=\"icon-user\"></i>" + window.sessionStorage.getItem('username')+ "<b class=\"caret\"></b>")
			setMenu();
			<%@ include file="../../static/menuStyle.js"%>
			getDetails();
			//draw();
			<%@ include file="../../static/myInfo.js"%>
        }

		function draw(){
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('main'),'macarons');
	
						// 指定图表的配置项和数据
			var option = {
				title: {text : '聊天信息'},
				tooltip: {},
				legend: {},
				xAxis: {
									data : nameArr
								},
				yAxis: {
								},
				series: [{
					type: graphType,
					data: [
																																																		]
				}]
			};
			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option);
			
		}
		// 需要调group的字段，一个字段一个统计图
																				function getDetails(){
																																	}
		// 值 字段 数据绑定
		function dataBindByValue(list){
																													}

		//按值统计
		function byVal(){
		$.ajax({ 
			type: "GET",
			url: baseUrl+"value/liaotianxinxi/"+xColumnName+'/'+yColumnName,
			data:{ },
			beforeSend: function(xhr) {
				xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
			},
			success: function(res){               	
				if(res.code == 0){
					console.log(res.data)
					if(res.data != null){
						dataBindByValue(res.data);
					}
				}else if(res.code == 401){
					<%@ include file="../../static/toLogin.jsp"%>   		
				}else{
					alert(res.msg);
				}
			},
		});
		}

		//按类统计
		function group(colName){
			$.ajax({ 
                type: "GET",
                url: baseUrl+"group/liaotianxinxi/"+colName,
             	data:{	tableName: "liaotianxinxi",
                    	columnName: colName
					 },
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
                },
                success: function(res){               	
                	if(res.code == 0){
						console.log(res.data)
						if(res.data != null){
							groupDataBind(res.data,colName);
						}
					}else if(res.code == 401){
						<%@ include file="../../static/toLogin.jsp"%>   		
					}else{
						alert(res.msg);
					}
				},
			});
		}
		// 类字段的数据处理
		function groupDataBind(list,colName){
																																		
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
