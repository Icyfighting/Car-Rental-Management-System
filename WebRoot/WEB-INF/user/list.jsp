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
<script type="text/javascript">
	$(function() {
		$('#dg').datagrid({
			url : '${pageContext.request.contextPath }/user/select',
			columns : [ [ {
				field : 'userName',
				title : '用户名',
				width : 100
			}, {
				field : 'identity',
				title : '身份证号',
				width : 100
			}, {
				field : 'fullName',
				title : '真实姓名',
				width : 100
			}, {
				field : 'sex',
				title : '性别',
				width : 100
			}, {
				field : 'address',
				title : '地址',
				width : 100
			}, {
				field : 'phone',
				title : '电话号码',
				width : 100
			}, {
				field : 'roleName',
				title : '权限角色',
				width : 100
			}, {
				field : 'position',
				title : '职位',
				width : 100
			} ] ],
			/* onLoadSuccess : function(data) { 
				//alert("data.total:"+data.total);
                if (data.total == 0) { 
                	$.messager.alert("警告", "没有符合条件的结果!", "warning");
                   }  
            }, */
			pagination : true,
			title : "用户列表",
			toolbar : "#tb",
			fit : true,
			fitColumns : true,
			singleSelect : true,
			pageSize : 5,
			pageList : [ 5, 10, 15, 20 ],
			striped : true,
			rownumbers : true
		});

		//查询功能。点击查询按钮，弹出页面，进行输入信息，然后提交查询结果回页面。
		$("#btnSrch").click(function() {

			$("#srchWindow").dialog({
				width : "400",
				height : "300",
				title : "用户查询",
				buttons : "#dlgBtn1",
				modal : true
			});
			//$("#fm").form("load", selected);

		});

		//增加删除商品功能
		$("#btnDel").click(
						function() {
							var selected = $("#dg").datagrid("getSelected");
							if (selected == null) {
								$.messager.alert("警告", "请选中后再进行删除!", "warning");
							} else {
								$.messager
										.confirm(
												"询问",
												"确认要删除[" + selected.userName
														+ "]吗?",
												function(r) {
													if (r) {
														//根据商品编号删除对应商品在t_product中数据
														$.post(
																		"${pageContext.request.contextPath }/user/delete",
																		{
																			"userName" : selected.userName
																		},
																		function(
																				data) {
																			var msg = "";
																			if (data == true) {
																				msg = "删除成功!";
																				// 刷新当前页
																				$(
																						"#dg")
																						.datagrid(
																								"reload");
																			} else {
																				msg = "删除失败!";
																			}
																			$.messager
																					.show({
																						"title" : "系统消息",
																						"msg" : msg,
																						"timeout" : 2000,
																						"showType" : "slide"
																					});
																		});
													}
												});
							}
						});

		// 给修改按钮绑定事件
		$("#btnUpd").click(function() {
			var selected = $("#dg").datagrid("getSelected");
			if (selected == null) {
				$.messager.alert("警告", "请先选中后修改!", "warning");
			} else {
				$("#updWindow").dialog({
					width : "500",
					height : "500",
					title : "修改检查单信息",
					buttons : "#dlgBtn",
					modal : true
				});
				$("#fm").form("load",selected);
			}
		});

		$("#btnNo").click(function() {
			$("#updWindow").dialog("close");
		});

		// 给修改按钮绑定事件
		$("#btnOk").click(function() {
			$("#fm").form('submit', {
				url : "${pageContext.request.contextPath }/user/update",
				success : function(data) {
					var msg = "";
					if (data == "true") {
						msg = "修改成功!";
						$("#fm").form("clear");
						$("#updWindow").dialog("close");
						$("#dg").datagrid("reload");
					} else {
						msg = "修改失败!";
					}
					$.messager.show({
						"title" : "系统消息",
						"msg" : msg,
						"timeout" : 2000,
						"showType" : "slide"
					});
				}
			});
		});
		
		$("#btnNo1").click(function() {
			$("#srchWindow").dialog("close");
		});

		// 给修改按钮绑定事件
		$("#btnOk1").click(function() {
			//对dg reload，但是要带几个参数，fm1中的几个查询条件带过去。
			$("#dg").datagrid('reload', {
				"userName" :$("#userName1").val(),
				"identity" :$("#identity1").val(),
				"fullName" : $("#fullName1").val(),
				"phone" : $("#phone1").val()
			});
			$("#fm1").form("clear");
			$("#srchWindow").dialog("close");
			
		});

	});
</script>

</head>

<body>
	<table id="dg"></table>

	<div id="tb" style="padding:3px">
		<a id="btnSrch" href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-search'">查询用户</a>- <a id="btnDel"
			href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove'">删除用户</a> <a id="btnUpd"
			href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-edit'">修改用户</a>
	</div>



	<div id="updWindow">
		<center>
			<form id="fm" method="post" style="margin-top:30px;">

				<table>
					<tr>
						<td>用户名:</td>
						<td><input type="text" name="userName" readonly /></td>
					</tr>
					<tr>
						<td>身份证号:</td>
						<td><input type="text" name="identity" readonly /></td>
					</tr>
					<tr>
						<td>真实姓名:</td>
						<td><input type="text" name="fullName" readonly /></td>
					</tr>
					<tr>
						<td>性别:</td>
						<td><input type="radio" name="sex" value="男" />男 <input
							type="radio" name="sex" value="女" />女</td>
					</tr>
					<tr>
						<td>地址:</td>
						<td><input type="text" name="address" /></td>
					</tr>
					<tr>
						<td>电话号码:</td>
						<td><input type="text" name="phone" /></td>
					</tr>
					<tr>
						<td>权限角色:</td>
						<td><input type="text" name="roleId" /></td>
					</tr>
					<tr>
						<td>职位:</td>
						<td><input type="text" name="position" /></td>
					</tr>

				</table>
			</form>
		</center>
	</div>

	<div id="srchWindow">
		<center>
			<form id="fm1" method="post" style="margin-top:30px;">

				<table>
					<tr>
						<td>用户名:</td>
						<td><input type="text" name="userName" id="userName1"/></td>
					</tr>
					<tr>
						<td>身份证号:</td>
						<td><input type="text" name="identity" id="identity1" /></td>
					</tr>
					<tr>
						<td>真实姓名:</td>
						<td><input type="text" name="fullName" id="fullName1" /></td>
					</tr>

					<tr>
						<td>电话号码:</td>
						<td><input type="text" name="phone" id="phone1" /></td>
					</tr>

				</table>
			</form>
		</center>
	</div>

	<div id="dlgBtn">
		<a id="btnOk" href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-ok'">修改</a> <a id="btnNo"
			href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-cancel'">取消</a>
	</div>
	<div id="dlgBtn1">
		<a id="btnOk1" href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-ok'">查询</a> <a id="btnNo1"
			href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-cancel'">取消</a>
	</div>
</body>
</html>
