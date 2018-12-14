<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<!-- 导入js 有顺序 -->

<script type="text/javascript"
	src="${pageContext.request.contextPath }/static/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/static/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/static/js/easyui-lang-zh_CN.js"></script>

<!-- 导入css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/static/themes/default/easyui.css"
	type="text/css"></link>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/static/themes/icon.css"
	type="text/css"></link>

<style type="text/css">
.footer {
	text-align: center;
	color: gray;
	font-weight: bold;
	line-height: 28px;
	background-color: #E6EFFF;
}

#titSpan a {
	color: white;
	text-decoration: none;
}

#titSpan a:hover {
	color: orange;
}
</style>

<script type="text/javascript">
	$(function() {
		
		// 点击树状菜单时的操作
		$("#easyui-tree")
				.tree(
						{
							url : '${pageContext.request.contextPath}/user/initMenu',
 							"onClick" : function(node) {
 								//node是点击树的节点
 								//调用easyui-tree的isleaf方法
 								//alert(node.text);
 								var flag=$("#easyui-tree").tree("isLeaf",node.target);
 								//alert("叶子节点："+flag);
 							
 								if(flag){
 									//点击就是叶子节点
 									//判断选中节点对应页签是否已经打开
 									//alert("叶子节点");
 									var tabs = $("#tabMain");
 									var tab = tabs.tabs("getTab",node.text);
 								//	alert("tabMain:"+tab);
 									if(tab){
 										//已经打开，选中已经打开页签
 										tabs.tabs("select",node.text);
 									}else{
 										//没有打开,新增页签：设置页签标题，加载url对应jsp里面，可以关闭
 										tabs.tabs("add",{
 											title:node.text,
 											 closable:true,
 											 href:'${pageContext.request.contextPath}/'+node.url
 										})
 									}
 								}
							} 
						});
		
/* 		
		// 安全退出
		$("#quit").click(function() {
			$.messager.confirm("确认", "确认退出吗?", function(r) {
				if (r) {
					// 跳转到登录页面
					window.location.href = "login?method=quit";
				}
			});
		});

		// 显示修改密码的窗口
		$("#updPwd").click(function() {
			$("#pwdWin").window("open");
			$("#pwdWin input").val("");
		});

		// 取消密码修改
		$("#pwdCanc").click(function() {
			$("#pwdWin").window("close");
		});

		// 修改密码
		$("#pwdConf").click(
				function() {
					if ($(":password:eq(0)").val() == "") {
						$.messager.alert("警告", "请输入初始密码!", "warning");
					} else if ($(":password:eq(1)").val() == "") {
						$.messager.alert("警告", "请输入新的密码!", "warning");
					} else if ($(":password:eq(2)").val() == "") {
						$.messager.alert("警告", "请输入确认密码!", "warning");
					} else if ($(":password:eq(2)").val() != $(
							":password:eq(1)").val()) {
						$.messager.alert("错误", "两次密码输入不一致!", "error");
					} else {
						$.get("login", {
							"id" : "${sessionScope.user.id}",
							"opwd" : $(":password:eq(0)").val(),
							"npwd" : $(":password:eq(1)").val(),
							"method" : "updPwd"
						}, function(data) {
							if (data == "true") {
								$("#pwdWin").window("close");
								$.messager.show({
									"title" : "系统消息",
									"msg" : "密码修改成功!<br />您当前的密码为:"
											+ $(":password:eq(1)").val(),
									"timeout" : 2000,
									"showType" : "slide"
								});
							} else if (data == "false") {
								$.messager.show({
									"title" : "系统消息",
									"msg" : "密码修改失败!<br />初始密码错误!",
									"timeout" : 2000,
									"showType" : "slide"
								});
							}
						});
					}
				});
 */

	});
</script>
</head>

<body class="easyui-layout">
	<!-- 北: 顶部 -->
	<div data-options="region:'north', border: false"
		style="height: 30px; background: url('${pageContext.request.contextPath }/static/images/layout-browser-hd-bg.gif') repeat-x center;">
		<span style="margin-left: 10px;"> <img
			src="${pageContext.request.contextPath }/static/images/blocks.gif"
			style="margin-top:4px;" width="20" alt="" />&nbsp; <font size="4"
			color="white">汽车租赁后台管理系统</font>
		</span> <span id="titSpan"
			style="float: right; color: white; line-height: 30px; margin-right: 10px;">
			欢迎 ${loginUser.userName } 登录&nbsp;&nbsp; <a id="updPwd"
			href="javascript:void(0);">修改密码</a> | <a id="quit"
			href="javascript:void(0);">安全退出</a>
		</span>
	</div>
	<!-- 南: 底部 -->
	<div data-options="region:'south'" style="height: 30px;">
		<div class="footer">&copy; 2008-2018 北京尚学堂304班所有 侵权必究</div>
	</div>

	<%-- 	<!-- 西: 左边 -->
	<div data-options="region:'west', title:'系统菜单', split:true"
		style="width: 200px;">
		<div class="easyui-accordion" data-options="fit:true, border:false,selected:true">
			<c:forEach items="${sessionScope.loginUser.menus }" var="menu">
				<div data-options="title:'${menu.menuName }'">
					<ul class="easyui-tree">
						 <c:forEach items="${menu.subMenus }" var="subMenu">
							<li data-options="attributes:{'url':'${pageContext.request.contextPath }/${subMenu.connUrl }'}"><span>${subMenu.menuName }</span></li>
						</c:forEach>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div> --%>
	<!-- 西: 左边 -->
	<div data-options="region:'west', title:'系统菜单', split:true"
		style="width: 200px;">

		<ul id="easyui-tree" class="easyui-tree">
			
		</ul>

	</div>
	<!-- 中间 -->
	<div data-options="region:'center'">
		<div id="tabMain" class="easyui-tabs"
			data-options="fit:true, border:false">
			<div data-options="title:'首页'">
				<div style="text-align: center; overflow: hidden;">
					<img
						src="${pageContext.request.contextPath }/static/images/welcome1.png"
						height="568px" />
				</div>
			</div>
		</div>
	</div>
	<!-- 修改密码的窗口 -->
	<div id="pwdWin" class="easyui-window"
		data-options="modal:true, collapsible:false, minimizable:false, maximizable:false, closed:true"
		title="修改密码" style="width:300px; height:150px">
		<table style="text-align: center; margin-left: 25px;">
			<tr>
				<td>初始密码:</td>
				<td><input type="password" /></td>
			</tr>
			<tr>
				<td>新的密码:</td>
				<td><input type="password" /></td>
			</tr>
			<tr>
				<td>确认密码:</td>
				<td><input type="password" /></td>
			</tr>
			<tr>
				<td colspan="2"><a id="pwdConf" href="javascript:void(0);"
					class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认</a> <a
					id="pwdCanc" href="javascript:void(0);" class="easyui-linkbutton"
					data-options="iconCls:'icon-cancel'">取消</a></td>
			</tr>
		</table>
	</div>
</body>
</html>
