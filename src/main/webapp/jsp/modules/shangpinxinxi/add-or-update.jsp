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

	<div class="content">
	  	<!-- 侧边导航栏 -->
	    <%@ include file="../../static/sidebar.jsp"%>
	  	<div class="mainbar">
		    <div class="page-head">
		      <h2 class="pull-left">商品信息
	          <span class="page-meta"> 管理</span>
	        </h2>
	        <!-- 面包屑 -->
	        <div class="bread-crumb pull-right">
	          <a href="${pageContext.request.contextPath}/index.jsp"><i class="icon-home"></i>主页</a>
	          <!-- Divider -->
	          <span class="divider">/</span>
	          <a href="#" class="bread-current">商品信息</a>
	        </div>
	        <div class="clearfix"></div>
		    </div>
	
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
							<input id="updateId" name="id" type="hidden">
										<div class="form-group">
										<label class="control-label col-lg-3">商品编号</label>
										<div class="col-lg-6">
											<input id="shangpinbianhao" name="shangpinbianhao" placeholder="商品编号">
										</div>
									</div>	
											<div class="form-group">
										<label class="control-label col-lg-3">商品名称</label>
										<div class="col-lg-6">
											<input id="shangpinmingcheng" name="shangpinmingcheng" placeholder="商品名称">
										</div>
									</div>	
											<div class="form-group">
										<label class="control-label col-lg-3">商品类型</label>
										<div class="col-lg-6">
											<select id="shangpinleixingSelect" name="shangpinleixing">
																						</select>
										</div>
									</div>
											<div class="form-group">
																					<label class="control-label col-lg-3">图片</label>
																				<div class="col-lg-6">							
											<img id="tupianImg" src="" width="100" height="100">
											<input  name="file" type="file" id="tupianupload">
											<label id="tupianFileName">{{ruleForm.tupian}}</label>
											<input name="tupian" id="tupian-input" type="hidden">
										</div>
									</div>
											<div class="form-group">
										<label class="control-label col-lg-3">价格</label>
										<div class="col-lg-6">
											<input id="jiage" name="jiage" placeholder="价格">
										</div>
									</div>	
											<div class="form-group">
										<label class="control-label col-lg-3">数量</label>
										<div class="col-lg-6">
											<input id="shuliang" name="shuliang" placeholder="数量">
										</div>
									</div>	
													<div class="form-group">
										<label class="control-label col-lg-3">上架日期</label>
										<div class="col-lg-6">	
											<div id="shangjiariqi" class="input-append">
												<input id="shangjiariqi-input" name="shangjiariqi" data-format="yyyy-MM-dd" type="text" class="form-control dtpicker" style="max-width: 95px;">
												<span class="add-on">
													<i data-time-icon="icon-time" data-date-icon="icon-calendar" class="btn btn-info btn-lg"></i>
												</span>
											</div>
										</div>	
									</div>
											<div class="form-group">
										<label class="control-label col-lg-3">工号</label>
										<div class="col-lg-6">
											<input id="gonghao" name="gonghao" placeholder="工号">
										</div>
									</div>	
	
																																																																																																																																																																																																																	<div class="form-group">
											<label class="control-label col-lg-3">详情</label>
											<div class="col-lg-6">
												<input id="xiangqingupload" name="file" type="file">
												<script id="xiangqingEditor" type="text/plain" style="width:800px;height:230px;"></script>
												<script type="text/javascript">
												    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
												   //相见文档配置属于你自己的编译器
												 var xiangqingUe = UE.getEditor('xiangqingEditor', {
													toolbars: [
														[
															'undo', //撤销
															'bold', //加粗
															'redo', //重做
															'underline', //下划线
															'horizontal', //分隔线
															'inserttitle', //插入标题
															'cleardoc', //清空文档
															'fontfamily', //字体
															'fontsize', //字号
															'paragraph', //段落格式
															'inserttable', //插入表格
															'justifyleft', //居左对齐
															'justifyright', //居右对齐
															'justifycenter', //居中对
															'justifyjustify', //两端对齐
															'forecolor', //字体颜色
															'fullscreen', //全屏
															'edittip ', //编辑提示
															'customstyle', //自定义标题
															 ]
														]
													});
												</script>
												<input type="hidden" name="xiangqing" id="xiangqing-input">
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

	    </div>    	
	   <div class="clearfix"></div>
	</div>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
	<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span> 
	
	<script type="text/javascript">
		<%@ include file="../../utils/baseUrl.jsp"%>    
		<%@ include file="../../utils/menu.jsp"%>	
		var tableName = "shangpinxinxi";
		var pageType = "add-or-update";
		var updateId = "";
		var crossTableId = -1;
		var crossTableName = '';
		var ruleForm = {};
		var crossRuleForm = {};

																																															
						var shangpinleixingOptions = [];
							
							//普通下拉框渲染
				function shangpinleixingSelect(){	
					var url = "option/shangpinleixing/shangpinleixing";
					http(url,"GET",{},(res)=>{
						if(res.code == 0){
							shangpinleixingOptions = res.data;
							var shangpinleixingSelect = document.getElementById('shangpinleixingSelect');
							for(var i=0;i<shangpinleixingOptions.length;i++){
								var shangpinleixingOption = document.createElement('option');
								shangpinleixingOption.setAttribute('name','shangpinleixingOption');
								shangpinleixingOption.setAttribute('value',shangpinleixingOptions[i]);
								shangpinleixingOption.innerHTML = shangpinleixingOptions[i];									
								if(ruleForm.shangpinleixing == shangpinleixingOptions[i]){
									shangpinleixingOption.setAttribute('selected','selected');
								}
								shangpinleixingSelect.appendChild(shangpinleixingOption);
							}
						}
					});
				}
									
		var vm = new Vue({
		  el: '#addOrUpdateForm',
		  data:{
			  ruleForm : {},
			},
		  beforeCreate: function(){
			  var id = window.sessionStorage.getItem("id");
				if(id != null && id != "" && id != "null"){
					http("shangpinxinxi/info/" + id,"GET",{},(res)=>{
						if(res.code == 0){
							vm.ruleForm = res.data;
						}
					});
				}
			},
			methods: { }
	  });

		// 文件上传
		function upload(){
									$('#tupianupload').fileupload({
						url: baseUrl + 'file/upload',
						headers:{ token: window.sessionStorage.getItem("token")},
						dataType: 'json',
						done: function (e, data) {							
							document.getElementById('tupian-input').setAttribute('value',baseUrl+"upload/"+data.result.file);
							document.getElementById('tupianFileName').innerHTML = data.result.file +"";
							$("#tupianImg").attr("src",baseUrl+"upload/"+data.result.file);
						}
					});
									$('#xiangqingupload').fileupload({
						url: baseUrl + 'file/upload',
						headers:{ token: window.sessionStorage.getItem("token")},
						dataType: 'json',
						done: function (e, data) {	
							UE.getEditor('xiangqingEditor').execCommand('insertHtml','<img src=\"'+ baseUrl +'upload/'+ data.result.file + '\" width=900 height=560 >');					
						}
					});
					}
		// 表单提交
		function submit() {
				if(validform() == true && compare() == true){
				let data = {};
				getContent();
				let value = $('#addOrUpdateForm').serializeArray();
				$.each(value, function (index, item) { 
							data[item.name] = item.value;
						});
				var urlParam;
				var successMes = '';
				let flag = true;
				if(updateId !=null && updateId !="null" && updateId !=''){
					urlParam = 'update';
					successMes = '修改成功';
				}else{
					urlParam = 'save';
					successMes = '添加成功';
				}
				httpJson("shangpinxinxi/"+urlParam,"POST",data,(res)=>{
					if(res.code == 0){
																																																																																																																																	if(flag){
							alert(successMes);
						}
						if(window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true"){
							window.sessionStorage.removeItem('onlyme');
							window.location.href="${pageContext.request.contextPath}/index.jsp";
						}else{
							window.location.href="list.jsp";
						}
					}
				});   
			}else{
				alert("表单未填完整或有错误");
			}
		}		
		// 填充富文本框
		function setContent(){
																																														if(ruleForm.xiangqing != null && ruleForm.xiangqing != 'null' && ruleForm.xiangqing != ''){
						var xiangqingMes = '' + ruleForm.xiangqing;
						var xiangqingUeditor = UE.getEditor('xiangqingEditor');
						xiangqingUeditor.ready(function() {
							xiangqingUeditor.setContent(xiangqingMes);
						});
				}	
																				}  
		// 获取富文本框内容
		function getContent(){
																																														if(UE.getEditor('xiangqingEditor').hasContents()){
					$('#xiangqing-input').attr('value',UE.getEditor('xiangqingEditor').getPlainTxt());
				}	
																				}

		// 表单校验
		function validform() {
			return $("#addOrUpdateForm").validate({ 
				rules: {
					           				       			 	           										    shangpinmingcheng: {
															required: true,
														},
						       			 	           										    shangpinleixing: {
															required: true,
														},
						       			 	           										    tupian: {
														},
						       			 	           										    jiage: {
															required: true,
														},
						       			 	           										    shuliang: {
															required: true,
														},
						       			 	           										    xiangqing: {
														},
						       			 	           										    shangjiariqi: {
														},
						       			 	           										    gonghao: {
														},
						       			 					},
				messages: {
					
																													shangpinmingcheng: {
														required: "商品名称不能为空",
														},
																								shangpinleixing: {
														required: "商品类型不能为空",
														},
																								tupian: {
													},
																								jiage: {
														required: "价格不能为空",
														},
																								shuliang: {
														required: "数量不能为空",
														},
																								xiangqing: {
													},
																								shangjiariqi: {
													},
																								gonghao: {
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
		// 获取当前详情
		function getDetails() {
			var id = window.sessionStorage.getItem("id");
			if(id != null && id != "" && id != "null"){
				updateId = id;
				window.sessionStorage.removeItem('id');
				http("shangpinxinxi/info/" + id,"GET",{},(res)=>{
					if(res.code == 0){
						//window.sessionStorage.removeItem("id");
						ruleForm = res.data
						// 是/否下拉框回显
						setSelectOption();
						// 设置图片src
						showImg();
						// 数据填充
						dataBind();
						// 富文本框回显	
						setContent();						
																																																					shangpinleixingSelect();
																																																																																																	//注册表单验证
						$(validform());
					}
				});
			}else{
																																	shangpinleixingSelect();	
																																																																						 		fill()
								//注册表单验证
				$(validform());
			}
		}
		// 下拉框选项回显
		function setSelectOption(){
																																																																				}

		function ready() {
			$('ul li .dropdown-toggle').html("<i class=\"icon-user\"></i>" + window.sessionStorage.getItem('username')+ "<b class=\"caret\"></b>")
			//设置导航栏菜单
			setMenu();
			<%@ include file="../../static/menuStyle.js"%>
			//初始化上传按钮
			upload();
			//添加表单校验信息文本
			addValidation();
			
			$('#submitBtn').on('click', function(e) {
			    e.preventDefault();
			    //console.log("点击了...提交按钮");
			    submit();
			});
			//初始化日期插件
			datePick();
			getDetails();
			//单列求和
			calculationPre();
			//跨表
			crossTable();
			<%@ include file="../../static/myInfo.js"%>
			readonly();
		}
		// 关联下拉框改变
		function lvSelectChange(level){
			let data = {};
			let value = $('#addOrUpdateForm').serializeArray();
			$.each(value, function (index, item) { 
			            data[item.name] = item.value;
			        });
																																																																				}
		// 清除可能会重复渲染的下拉框Option
		function clear(className){
			var elements = document.getElementsByClassName(className);
        	for(var i = elements.length - 1; i >= 0; i--) { 
        	  elements[i].parentNode.removeChild(elements[i]); 
        	}
		}
		//计算
		function calculation(){
			//积
			var x = 0;
			//和
			var y = 0;
			var flag = 0;
																																																																				}
		function calculationSE(colName){
			//单列求和接口
			http("shangpinxinxi"+colName,"GET",{
				tableName: "shangpinxinxi",
				columnName: colName
			},(res)=>{
				if(res.code == 0){
						$("#"+colName).attr("value",res.data);
				}
			});
		}
		function calculationPre(){
			//进入该页面就填充"单列求和"的列
																																																																				}		
		
		
			//新增时填充字段
			function fill(){

				var username = window.sessionStorage.getItem('username');
				var accountTableName = window.sessionStorage.getItem('accountTableName');
				http(accountTableName+'/session','GET',{},(res)=>{
					if(res.code == 0){
						var myId = res.data.id;
															if(res.data !=null && res.data.gonghao != null && res.data.gonghao != ''){
							$('#gonghao').val(res.data.gonghao)
						}
							$(validform());
					}
				});
							
			}	
		
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
																																																													$(function() { 
						$('#shangjiariqi').datetimepicker({ 
						pickTime: false,
						pickDate: true,
						language:'zh-CN'
						});
					});
																}	
		function dataBind(){
			$("#updateId").val(ruleForm.id);	
												$("#shangpinbianhao").val(ruleForm.shangpinbianhao);	
																$("#shangpinmingcheng").val(ruleForm.shangpinmingcheng);	
																var shangpinleixingOptions = document.getElementsByClassName("shangpinleixingOption");
					for(var shangpinleixingCount = 0; shangpinleixingCount < shangpinleixingOptions.length;shangpinleixingCount++){
						if(shangpinleixingOptions[shangpinleixingCount].getAttribute('value') == ruleForm.shangpinleixing){
							shangpinleixingOptions[shangpinleixingCount].setAttribute('selected','selected');
						}
					}

																$("#tupian-input").val(ruleForm.tupian);
																$("#jiage").val(ruleForm.jiage);	
																$("#shuliang").val(ruleForm.shuliang);	
																$("#xiangqing").val(ruleForm.xiangqing);	
																$("#shangjiariqi-input").val(ruleForm.shangjiariqi);
																$("#gonghao").val(ruleForm.gonghao);	
									}
		//图片显示
		function showImg(){
																																	var tupianFileName = "\"" + ruleForm.tupian + "\"";
					$("#tupianImg").attr("src",ruleForm.tupian);
																																												}

        //跨表
        function crossTable(){
            crossTableName = window.sessionStorage.getItem('crossTableName');
			crossTableId = window.sessionStorage.getItem('crossTableId');
            if(crossTableName != null && crossTableName != '' && crossTableId != null && crossTableId != '' && crossTableId != -1){
				http(crossTableName + "/info/" + crossTableId,"GET",{},(res)=>{
					if(res.code == 0){
						crossRuleForm = res.data;
						$('#updateId').val(crossTableId);
												if(res.data != null && res.data != '' && res.data.shangpinbianhao != null && res.data.shangpinbianhao != ''){

															$("#shangpinbianhao").val(res.data.shangpinbianhao);
													}
												if(res.data != null && res.data != '' && res.data.shangpinmingcheng != null && res.data.shangpinmingcheng != ''){

															$("#shangpinmingcheng").val(res.data.shangpinmingcheng);
													}
												if(res.data != null && res.data != '' && res.data.shangpinleixing != null && res.data.shangpinleixing != ''){

															var shangpinleixingOptions = document.getElementsByClassName("shangpinleixingOption");
								for(var shangpinleixingCount = 0; shangpinleixingCount < shangpinleixingOptions.length;shangpinleixingCount++){
									if(shangpinleixingOptions[shangpinleixingCount].getAttribute('value') == res.data.shangpinleixing){
										shangpinleixingOptions[shangpinleixingCount].setAttribute('selected','selected');
									}
								}
													}
												if(res.data != null && res.data != '' && res.data.tupian != null && res.data.tupian != ''){

															$("#tupianImg").attr("src",res.data.tupian);
								$("#tupian-input").val(res.data.tupian);
													}
												if(res.data != null && res.data != '' && res.data.jiage != null && res.data.jiage != ''){

															$("#jiage").val(res.data.jiage);
													}
												if(res.data != null && res.data != '' && res.data.shuliang != null && res.data.shuliang != ''){

															$("#shuliang").val(res.data.shuliang);
													}
												if(res.data != null && res.data != '' && res.data.xiangqing != null && res.data.xiangqing != ''){

															$("#xiangqing").val(res.data.xiangqing);
													}
												if(res.data != null && res.data != '' && res.data.shangjiariqi != null && res.data.shangjiariqi != ''){

															$("#shangjiariqi-input").val(res.data.shangjiariqi);
								$('#shangjiariqiFileName').val(res.data.shangjiariqi)
													}
												if(res.data != null && res.data != '' && res.data.gonghao != null && res.data.gonghao != ''){

															$("#gonghao").val(res.data.gonghao);
													}
											}
				});  
            }
            window.sessionStorage.removeItem('crossTableName');
			window.sessionStorage.removeItem('crossTableId');
        }
		
		function crossTableUpdate(){
			let flag = crossTableUpdateValidation();
			if(flag){
				httpJson(crossTableName + "/update","POST",{
					id: crossTableId,
																																																																																																												},(res)=>{
					if(res.code == 0){
						console.log('跨表更新成功');
						return true;
					}
				});   
			}
			return false;
		}

		//跨表更新前验证
		function crossTableUpdateValidation(){
			//防止减法导致库存负值
																																																																					return true;
		}
		
		function readonly(){
			if(window.sessionStorage.getItem('role') != '管理员'){
				$('#jifen').attr('readonly','readonly');
				$('#money').attr('readonly','readonly');
			}
		}

		//比较大小
		function compare(){
			var largerVal = null;
			var smallerVal = null;
																																																												if(largerVal !=null && smallerVal != null){
				if(largerVal<=smallerVal){
					alert(smallerName+'不能大于等于'+largerName);
					return false;
				}
			}
			return true;
		}
		// 渲染菜单
		<%@ include file="../../static/setMenu.js"%>
		// 清除没有权限使用的按钮
		<%@ include file="../../static/getRoleButtons.js"%>
		// 用户登出
        <%@ include file="../../static/logout.jsp"%>
		// 生命周期函数
		document.addEventListener("DOMContentLoaded", ready);
  	</script>

  </body>
</html>
