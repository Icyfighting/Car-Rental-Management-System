<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

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
</head>
<script type="text/javascript">
	$(function() {
		$('#dg').datagrid({
			url : '${pageContext.request.contextPath }/customers/selAllcustomers',
			columns : [ [ {
			field : 'identity',
				title : '身份证号',
				width : 50
			},{
				field : 'custName',
				title : '客户名',
				width : 50
			}, {
				field : 'sex',
				title : '性别',
				width : 50
			},{
				field : 'address',
				title : '地址',
				width : 50
			}, {
				field : 'phone',
				title : '手机号',
				width : 50
			}, {
				field : 'career',
				title : '职业',
				width : 50
			}
			 ] ],
			pagination : true,
			title : "客户大全",
			toolbar : "#tb",
			fit : true,
			fitColumns : true,
			singleSelect : true,
			pageSize : 5,
			pageList : [ 5, 10, 15, 20 ],
			striped : true,
			rownumbers : true
		});

		$("#btnSrch").click(function() {
			$("#dg").datagrid('reload', {
				"srchVal" : $("#srchValue").val()
			});
		});
		// 给删除按钮绑定事件
		$("#btnDel").click(function() {
			var selected = $("#dg").datagrid("getSelected");
			if(selected == null) {
				$.messager.alert("警告", "请选中后再进行删除!", "warning");
			} else {
				$.messager.confirm("询问", "确认要删除[" + selected.custName + "]吗?", function(r) {
					if(r) {
						$.post("${pageContext.request.contextPath }/customers/delCustomers", { "identity":selected.identity}, 
						function(data) {
							var msg = "";
							if(data == true) {
								msg = "删除成功!";
								// 刷新当前页
								$("#dg").datagrid("reload");
							} else {
								msg = "删除失败!";
								}
							
		
							
							$.messager.show({
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
				$("#dlgUpd").dialog({
					width : "350",
					height : "300",
					title : "修改客户信息",
					buttons : "#dlgBtn",
					modal : true
				});
				$("#fm").form("load", selected);
			}
		});

		$("#btnNo").click(function() {
			$("#dlgUpd").dialog("close");
		});

		// 给修改按钮绑定事件
		$("#btnOk").click(function() {
			$("#fm").form('submit', {
				url : "${pageContext.request.contextPath }/customers/updCustomers",
				success : function(data) {
					var msg = "";
					if (data == "true") {
						msg = "修改成功!";
						$("#fm").form("clear");
						$("#dlgUpd").dialog("close");
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
	});
	
		
	
</script>

</head>

<body>
	<table id="dg"></table>

	<div id="tb" style="padding:3px">
		
		请输入身份证号:<input id="srchValue" style="line-height:26px;border:1px solid #ccc"> 
		<a id="btnSrch" href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-search'">查询</a>
		<a id="btnUpd" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
		<a id="btnDel" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
	</div>
	<!-- 修改的窗口 -->
	<div id="dlgUpd">
		<center>
			<form id="fm" action="" method="post" style="margin-top:30px;">
				
				<table>
					<tr>
						<td>身份证号:</td>
						<td><input type="text" name="identity" readonly /></td>
					</tr>
					<tr>
						<td>客户名:</td>
						<td><input type="text" name="custName" /></td>
					</tr>
					<tr>
						<td>性    别:</td>
						<td>
     				<select NAME="sex" id="sex" style="width: 80px;">
							<option value="男">男</option>
								<option value="女">女</option>
								</select>
    							  </td>
					</tr>
					<tr>
						<td>地    址:</td>
						<td><input type="text" name="address" /></td>
					</tr>
					
					<tr>
						<td>手机号:</td>
						<td><input type="text" name="phone" /></td>
					</tr>
					<tr>
						<td>职     业:</td>
						<td><input type="text" name="career" /></td>
					</tr>
					<tr>
						<td>密      码:</td>
						<td><input type="password" name="custPwd" /></td>
					</tr>
				</table>
			</form>
		</center>
	</div>
	<!-- 对话框中的按钮 -->
	<div id="dlgBtn">
		<a id="btnOk" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">修改</a>
		<a id="btnNo" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>
	</div>
</body>
</html>
