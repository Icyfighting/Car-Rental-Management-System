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
			url : '${pageContext.request.contextPath }/cars/selAllCars',
			columns : [ [ {
				field : 'carNumber',
				title : '车牌号',
				width : 50
			}, {
				field : 'carType',
				title : '型号',
				width : 50
			},{
				field : 'color',
				title : '颜色',
				width : 50
			}, {
				field : 'price',
				title : '价格',
				width : 50
			}, {
				field : 'rentPrice',
				title : '租金',
				width : 50
			}, {
				field : 'deposit',
				title : '押金',
				width : 50
			}, {
				field : 'isrenting',
				title : '租用情况',
				width : 50
			}, {
				field : 'description',
				title : '简介',
				width : 50
			}
			 ] ],
			pagination : true,
			title : "汽车大全",
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
				$.messager.confirm("询问", "确认要删除[" + selected.carType + "]吗?", function(r) {
					if(r) {
						$.post("${pageContext.request.contextPath }/cars/delCar", { "carNumber":selected.carNumber}, function(data) {
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
					title : "修改汽车信息",
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
				url : "${pageContext.request.contextPath }/cars/updCar",
				success : function(data) {
					//alert(data=="true")
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
		
		请输入车牌号:<input id="srchValue" style="line-height:26px;border:1px solid #ccc"> 
		<a id="btnSrch" href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-search'">查询</a>
		<a id="btnUpd" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
		<a id="btnDel" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
	</div>
	<!-- 修改的窗口 -->
	<div id="dlgUpd">
		<center>
			<form id="fm" action="${pageContext.request.contextPath }/cars/updCar" method="post" style="margin-top:30px;">
				
				<table>
					<tr>
						<td>车牌号:</td>
						<td><input type="text" name="carNumber" readonly /></td>
					</tr>
					<tr>
						<td>型   号:</td>
						<td><input type="text" name="carType" /></td>
					</tr>
					<tr>
						<td>颜    色:</td>
						<td><input type="text" name="color" /></td>
					</tr>
					<tr>
						<td>价    格:</td>
						<td><input type="text" name="price" /></td>
					</tr>
					<tr>
						<td>租     金:</td>
						<td><input type="text" name="rentPrice" /></td>
					</tr>
					<tr>
						<td>押      金:</td>
						<td><input type="text" name="deposit" /></td>
					</tr>
					<tr>
						<td>租用情况:</td>
						<td><input type="text" name="isrenting" /></td>
					</tr>
					
					<tr>
						<td>简      介:</td>
						<td><input type="text" name="description" /></td>
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
