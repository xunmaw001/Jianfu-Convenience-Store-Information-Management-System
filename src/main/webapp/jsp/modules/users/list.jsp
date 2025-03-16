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
	        <h2 class="pull-left">管理员信息管理</h2>
	
	        <!-- Breadcrumb -->
	        <div class="bread-crumb pull-right">
	          <a href="index.html"><i class="icon-home"></i> 主页</a> 
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
	
	          <!-- Table -->
	
	            <div class="row">
	
	              <div class="col-md-12">

	                <div class="widget">

	                <div class="widget-head">
	                  <div class="pull-left">管理员信息列表</div>
	                  <div class="widget-icons pull-right"><!--<a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
	                    <a href="#" class="wclose"><i class="icon-remove"></i></a>-->
						  <form class="navbar-form navbar-left" id="searchForm" name="searchForm" role="search" style="margin: 3px 0 3px 0;" onsubmit="saveSearchForm()">
							  <div class="form-group" id="form-item-group">
									<label>用户名</label>
									<input name="username" placeholder="用户名">
																			         
							  </div>
						  </form>
						  <button class="查看" onclick="saveSearchForm()">查询</button>
						  <button class="删除" onclick="deleteMore()">批量删除</button>
						  <button class="btn btn-success 新增" onclick="window.location.href='add-or-update.jsp'">添加</button>

	                  </div>  
	                  <div class="clearfix"></div>
	                </div>

	                  <div class="widget-content">
	                    <table class="table table-striped table-bordered table-hover">
	                      <thead>
	                        <tr>
								<th><input type="checkbox" onclick="chooseAll()"/></th>
								<th onclick="sort('username')">用户名<i class="fa fa-sort"></i></th>
								<th>密码</th>
								<th>角色</th>
								<th onclick="sort('addtime')">创建时间<i class="fa fa-sort"></i></th>	
								<th>操作</th>
	                        </tr>
	                      </thead>
	                      <tbody id="tbMain">
	                      </tbody>
	                    </table>
	
	                    <div class="widget-foot">

                            <div class="pagination pull-left" id="paginationLeft">
								<select id="selectPageSize" onchange="changePageSize()">
									<option value="10" selected="selected">10</option>
									<option value="25">25</option>
									<option value="50">50</option>
									<option value="100">100</option>
								</select>
								<label>条每页</label>
							</div>
	                        <ul class="pagination pull-right" id="pageUl">
							  <li><input type="number" id="pageIndexInput" style="width: 60px; margin-left: 10px;"><button onclick="toThatPage()">跳转</button></li>
	                        </ul>
	                      <div class="clearfix"></div>
	
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
		<%@ include file="../../utils/menu.jsp"%>	
		var tableName = "yuangongxinxi";
		var pageType = "list";
	  	var searchForm = { key: ""};
		var pageIndex = 1;
		var pageSize = 10;
		var totalPage = 0;
		var dataList = [];
		var sortColumn = '';
		var sortOrder= '';
		<%@ include file="../../utils/baseUrl.jsp"%>   
		var ids = [];

		function init() {
			// 满足条件渲染提醒接口
		}
        // 改变每页记录条数
		function changePageSize() {
		    var selection = document.getElementById('selectPageSize');
		    var index = selection.selectedIndex;
			pageSize = selection.options[index].value;
			getDataList();
        }
		//排序
		function sort(columnName){
			if(sortColumn == '' || sortColumn != columnName){
				sortColumn = columnName;
				sortOrder = 'asc';
			}
			if(sortColumn == columnName){
				if(sortOrder == 'asc'){
					sortOrder = 'desc';
				}else{
					sortOrder = 'asc';
				}
			}
			getDataList();
		}
        // 获取数据列表
        function getDataList() {
			$.ajax({ 
                type: "GET",
                url: baseUrl+"users/page",
             	data: {	page: pageIndex,
						limit: pageSize,
						sort: sortColumn,
						order: sortOrder,
						username : searchForm.username,
						},
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
                },
                success: function(res){               	
                	clear();
                	if(res.code == 0){
    					dataList = res.data.list;
    					totalPage = res.data.totalPage;
    					var tbody = document.getElementById('tbMain');
    					for(var i = 0;i < dataList.length; i++){ //遍历一下表格数据  
    						var trow = setDataRow(dataList[i]); //定义一个方法,返回tr数据 
    						tbody.appendChild(trow);
    					}
    					pagination(); //渲染翻页组件
    				}else if(res.code == 401){
						<%@ include file="../../static/toLogin.jsp"%>
					}else {
						alert(res.msg);
    					dataList = [];
    					totalPage = 0;
    				}
                },
            });
        }
		// 渲染表格数据
		function setDataRow(item){
			var row = document.createElement('tr'); //创建行 
			row.setAttribute('class','useOnce');
			var chkTd = document.createElement('td');
			var checkbox = document.createElement('input'); //创建勾选框
			checkbox.setAttribute('type','checkbox');
			checkbox.setAttribute('name','chk');
			var onclickAtt = 'clickCheckbox(' + item.id + ')';
			checkbox.setAttribute('onclick',onclickAtt);
			chkTd.appendChild(checkbox);
			row.appendChild(chkTd);

			var usernameCell  = document.createElement('td');
			usernameCell.innerHTML = item.username;
			row.appendChild(usernameCell);

			var passwordCell  = document.createElement('td');
			passwordCell.innerHTML = item.password;
			row.appendChild(passwordCell);

			var roleCell  = document.createElement('td');
			roleCell.innerHTML = item.role;
			row.appendChild(roleCell);

			var addtimeCell  = document.createElement('td');
			addtimeCell.innerHTML = item.addtime; 
			row.appendChild(addtimeCell);

            var btnTd = document.createElement('td');            
			var btnGroup = document.createElement('div');
			btnGroup.setAttribute('class','btn-group1');	
			//修改按钮
			var editBtn = document.createElement('button');
			var editAttr = 'edit(' +  item.id + ')';
			editBtn.setAttribute('class','btn btn-xs btn-warning 修改');
			editBtn.setAttribute('onclick',editAttr);
			var editIcon = document.createElement('i');
			editIcon.setAttribute('class','icon-pencil');
			editBtn.appendChild(editIcon);
			btnGroup.appendChild(editBtn);
			//删除按钮
			var deleteBtn = document.createElement('button');
			deleteBtn.setAttribute('class','btn btn-xs btn-danger 删除');
			var deleteBtnAttri = 'remove(' + item.id + ')';
			deleteBtn.setAttribute('onclick',deleteBtnAttri);
			var deleteIcon = document.createElement('i');
			deleteIcon.setAttribute('class','icon-remove');
			deleteBtn.appendChild(deleteIcon);
			btnGroup.appendChild(deleteBtn);

			btnTd.appendChild(btnGroup)
			row.appendChild(btnTd);
			return row;
		}
        // 翻页
        function pageNumChange(val) {
            if(val == 'pre') {
                pageIndex--;
            }else if(val == 'next'){
                pageIndex++;
            }else{
                pageIndex = val;
            }
			getDataList();
        }
		// 跳转到指定页
		function toThatPage(){
			var index = document.getElementById('pageIndexInput').value;
			if(index<0 || index>totalPage){
				alert('请输入正确的页码');
			}else {
				pageNumChange(index);
			}
		}
		// 下载
		function download(fileName){
			var url = baseUrl+'file/download?fileName='+fileName;
			window.open(url);
		}
		// 渲染翻页组件
		function pagination() {
			var beginIndex = pageIndex;
			var endIndex = pageIndex;
			var point = 4;
			for(var i=0;i<3;i++){
				if(endIndex==totalPage){ break;}
				endIndex++;
				point--;
			}
			for(var i=0;i<3;i++){
				if(beginIndex==1){break;}
				beginIndex--;
				point--;
			}
			if(point>0){
				while (point>0){
					if(endIndex==totalPage){ break;}
					endIndex++;
					point--;
				}
				while (point>0){
					if(beginIndex==1){ break;}
					beginIndex--;
					point--
				}
			}
			// 渲染前一页按钮
			if(beginIndex>1){
				var prePage = document.createElement('li');
				prePage.setAttribute('class','useOnce');
				var preHref = document.createElement('a');
				preHref.setAttribute('href','#');
				preHref.setAttribute('onclick',"pageNumChange('pre')");
				preHref.innerHTML = '上一页';
				prePage.appendChild(preHref);
				$("#pageUl").append(prePage);
			}
			// 渲染页码按钮
			for(var i=beginIndex;i<=endIndex;i++){
				var pageNum = document.createElement('li');
				pageNum.setAttribute('class','useOnce');
				var pageHref = document.createElement('a');
				pageHref.setAttribute('href','#');
				if(i==pageIndex){
					pageHref.setAttribute('style','background-color: #eee;');
				}
				pageHref.innerHTML = i;
				pageNum.appendChild(pageHref);
				$("#pageUl").append(pageNum);
			}
			//渲染下一页按钮
			if(endIndex!=totalPage){
				var nextPage = document.createElement('li');
				nextPage.setAttribute('class','useOnce');
				var nextHref = document.createElement('a');
				nextHref.setAttribute('href','#');
				nextHref.innerHTML = '下一页';
				nextPage.appendChild(nextHref);
				$("#pageUl").append(nextPage);
			}
			//渲染当前x页 共y页
			var currentPageLabel = document.createElement('label');
			currentPageLabel.setAttribute('class','useOnce');
			var labelMes = '当前第 ' + pageIndex + ' 页,' + '共 ' + totalPage + ' 页';
			currentPageLabel.innerHTML = labelMes;
			$("#paginationLeft").append(currentPageLabel);
		}
		// 全选/全不选
		function chooseAll(){
			var boxs = document.getElementsByName("chk");
			for(var i=0;i<boxs.length;i++){
				boxs[i].click()
			}
		}
		// 勾选
		function clickCheckbox(id){ 
			var index = ids.indexOf(id);
			if(index == -1){
				ids.push(id);
			}else{
				ids.splice (index,1);
			}
		}
		// 批量删除
		function deleteMore(){
			if(ids.length == 0){
				alert('请勾选要删除的记录');
			}else{
				remove(ids);
			}
		}
        // 删除
        function remove(id) { 
            var mymessage = confirm("真的要删除吗？");
            if (mymessage == true) {
				var paramArray = [];
				if (id.length > 1){
					paramArray = id;
				}else{
					paramArray.push(id);
				}             
				$.ajax({ 
					type: "POST",
					url: baseUrl + "users/delete",
					contentType: "application/json",
					data: JSON.stringify(paramArray),
					beforeSend: function(xhr) {
						xhr.setRequestHeader("token", window.sessionStorage.getItem('token'));
					},
					success: function(res){               	
						if(res.code == 0){
							alert('删除成功');
							getDataList();		
						}else {
							alert(res.msg);		
						}
					},
				});
            }
            else {
                alert("已取消操作");
            }
        }
		//渲染查询表单所需属性和组件
		function setSearchForm() {
			//设置查询表单的url
			var url = baseUrl + 'users/page';
			var searchForm = document.getElementById('searchForm');
			searchForm.setAttribute('action',url);
			var fromGroup = document.getElementById('form-item-group');
			// 渲染当前页码
			var pageItem = document.createElement('input');
			pageItem.setAttribute('type','hidden');
			pageItem.setAttribute('value',1);
			pageItem.setAttribute('name','page');
			fromGroup.appendChild(pageItem);
			// 渲染每页大小
			var limitItem = document.createElement('input');
			limitItem.setAttribute('type','hidden');
			limitItem.setAttribute('value',pageSize);
			limitItem.setAttribute('name','limit');
			fromGroup.appendChild(limitItem);
		}
		// 第一次查询后保存查询表单的数据
		function saveSearchForm() {
			searchForm = { key: ""};
			pageIndex = 1;
			var username = document.forms["searchForm"]["username"].value;
			if(username != null && username != ""){
				searchForm.username = username
			}				 
			getDataList();
		}
        function ready() {
			setMenu();
			getRoleButtons();
			<%@ include file="../../static/menuStyle.js"%>
            getDataList();
        }
        // 用户登出
        <%@ include file="../../static/logout.jsp"%>

        //保存id到session中并跳转到修改页
        function edit(id) {
            window.sessionStorage.setItem('id', id)
            window.location.href = "add-or-update.jsp"
        }
		//清除会重复渲染的节点
        function clear(){
        	var elements = document.getElementsByClassName('useOnce');
        	for(var i = elements.length - 1; i >= 0; i--) { 
        	  elements[i].parentNode.removeChild(elements[i]); 
        	}
        }

		//DatePick相关初始化
		function datePick(){
			$.fn.datetimepicker.dates['zh-CN'] = { 
					days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
		            daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
		            daysMin:  ["日", "一", "二", "三", "四", "五", "六", "日"],
		            months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
		            monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
		            today: "今天",
		            suffix: [],
		            meridiem: ["上午", "下午"]
			};
		}
		// 清除没有权限使用的按钮
		<%@ include file="../../static/getRoleButtons.js"%>
		// 渲染菜单
		<%@ include file="../../static/setMenu.js"%>
        document.addEventListener("DOMContentLoaded", ready);
    </script>
  </body>
</html>
