		function setMenu(){
			$('#nav').append("<li><a href=\"#\"><i class=\"icon-table\"></i> 个人中心 <span class=\"pull-right\"><i class=\"icon-chevron-right\"></i></span></a><ul style=\"\"><li><a href="+baseUrl+"jsp/modules/center/updatePassword.jsp"+">修改密码</a></li><li><a id=\"myinfo\" href="+baseUrl+"jsp/modules/center/info.jsp"+">个人信息</a></li></ul></li>")
			var role = window.sessionStorage.getItem('role');
			for(var i=0;i<menus.length;i++){
				// 找到当前登录角色的菜单
				if(menus[i].roleName == role){
					var menu = menus[i].backMenu;
					for(var j=0;j<menu.length;j++){  
						// 一级菜单
						var menuItem = document.createElement('li');
						//menuItem.setAttribute('class','has_sub');
						var itemHref = document.createElement('a');
						itemHref.setAttribute('href','#');
						//itemHref.setAttribute('class','subdrop');
						// 装图标的小盒子
						itemHref.innerHTML = "<i class=\"icon-table\"></i> "+menu[j].menu + " <span class=\"pull-right\"><i class=\"icon-chevron-right\"></i></span>";		
						menuItem.appendChild(itemHref);
						var menuChild = menu[j].child;
						var menuChildUl = document.createElement('ul');
						//menuChildUl.setAttribute('style','display: block;');
						var secondMenuName = "";
						for(var k=0;k<menuChild.length;k++){  
							// 二级菜单
							var menuChildLi = document.createElement('li');
							var menuChildHref = document.createElement('a');
							//console.log("\'"+menuChild[k].tableName+"\'");
							if(secondMenuName == menuChild[k].tableName && secondMenuName != ""){
								var childHrefAttr = "${pageContext.request.contextPath}/jsp/modules/" + menuChild[k].tableName + "/graph.jsp" ;
							}else{
								var childHrefAttr = "${pageContext.request.contextPath}/jsp/modules/" + menuChild[k].tableName + "/list.jsp" ;
								secondMenuName = menuChild[k].tableName;
							}
							menuChildHref.setAttribute('href',childHrefAttr);
							menuChildHref.innerHTML = menuChild[k].menu;
							menuChildLi.appendChild(menuChildHref);
							menuChildUl.appendChild(menuChildLi);
						}
						menuItem.appendChild(menuChildUl);
						$('#nav').append(menuItem);
					}
						
				}
			}
			if(hasMessage != null && hasMessage == '是' && role == '管理员'){
				$('#nav').append("<li><a href=\"#\"><i class=\"icon-table\"></i> 留言管理 <span class=\"pull-right\"><i class=\"icon-chevron-right\"></i></span></a><ul style=\"\"><li><a href="+baseUrl+"jsp/modules/messages/list.jsp"+">留言列表</a></li></ul></li>");
			}
		}