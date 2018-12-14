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
			url : '${pageContext.request.contextPath }/check/select',
			columns : [ [ {
				field : 'checkId',
				title : '检查单ID',
				width : 100
			}, {
				field : 'checkDate',
				title : '检查日期',
				width : 200,
				formatter : function(value, row, index) {
					return changeDateFormat(value)
				} 
			}, {
				field : 'field',
				title : '属性',
				width : 100
			}, {
				field : 'problem',
				title : '问题',
				width : 100
			}, {
				field : 'paying',
				title : '赔付金额',
				width : 100
			}, {
				field : 'checkUser',
				title : '检查员',
				width : 100
			}, {
				field : 'rentId',
				title : '出租单ID',
				width : 100
			} ] ],
			/* onLoadSuccess : function(data) { 
				//alert("data.total:"+data.total);
			    if (data.total == 0) { 
			    	$.messager.alert("警告", "没有符合条件的结果!", "warning");
			       }  
			}, */
			pagination : true,
			title : "检查单列表",
			toolbar : "#tb",
			fit : true,
			fitColumns : true,
			singleSelect : true,
			pageSize : 5,
			pageList : [ 5, 10, 15, 20 ],
			striped : true,
			rownumbers : true
		});

		$("#btnOk1").click(function() {
		//alert($("#checkDate").datebox('getValue'));
			$("#dg").datagrid('reload', {
				"checkId" : $("#checkId").val(),//不能简单的使用$().val(),必须用这个...
				"checkDate" : $("#checkDate").datebox('getValue'),
				"checkUser" : $("#checkUser").val(),
				"rentId" : $("#rentId").val()

			});
			$("#form1").form("clear");
			$("#srchWindow").dialog("close");

		});

		$("#btnSrch").click(function() {

			$("#srchWindow").dialog({
				width : "500",
				height : "500",
				title : "检查单查询",
				buttons : "#dlgBtn1",
				modal : true
			});
			//$("#fm").form("load", selected);

		});

		//增加删除商品功能
		$("#btnDel")
				.click(
						function() {
							var selected = $("#dg").datagrid("getSelected");
							if (selected == null) {
								$.messager.alert("警告", "请选中后再进行删除!", "warning");
							} else {
								$.messager
										.confirm(
												"询问",
												"确认要删除[" + selected.checkId
														+ "]吗?",
												function(r) {
													if (r) {
														//根据商品编号删除对应商品在t_product中数据
														$
																.post(
																		"${pageContext.request.contextPath }/check/delete",
																		{
																			"checkId" : selected.checkId
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

		$("#btnNo1").click(function() {
			$("#srchWindow").dialog("close");
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

		// 给修改按钮绑定事件
		$("#btnUpd").click(function() {
			var selected = $("#dg").datagrid("getSelected");
			
			if (selected == null) {
				$.messager.alert("警告", "请先选中后修改!", "warning");
			} else {
				$("#updWindow").dialog({
					width : "500",
					height : "500",
					title : "修改信息",
					buttons : "#dlgBtn",
					modal : true
				});
				$("#form2").form("load", selected);
				
			}
		});

		$("#btnNo").click(function() {
			$("#updWindow").dialog("close");
		});

		// 给修改按钮绑定事件
		$("#btnOk").click(function() {
			
			$("#fm").form('submit', {
				url : "${pageContext.request.contextPath }/check/update",
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

	});

	//转换日期格式  
	function changeDateFormat(cellval) {
		if (cellval != null) {
			var unixTimestamp = new Date(cellval);
			commonTime = unixTimestamp.toLocaleString();
			//alert(commonTime);
			return commonTime;
		}
	}
</script>

</head>

<body>

	<table id="dg"></table>

	<div id="tb" style="padding:3px">
		<a id="btnSrch" href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-search'">查询检查单</a> <a id="btnDel"
			href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove'">删除检查单</a>
			 <!-- <a id="btnUpd"
			href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-edit'">修改检查单</a> -->
	</div>

	<div id="srchWindow">
		<center>
			<form id="form1" method="post">
				<center>
					<table id="table1" style="width:400px">
						<tr>
							<td>检查单编号：</td>
							<td><input name="checkId" id="checkId" type="text"
								class="text" style="width:158px" value="" /></td>
						</tr>
						<tr>
							<td>检查日期：</td>
							<td><input type="text" name="checkDate" id="checkDate"
								class="easyui-datebox" data-options="editable:false"
								style="width:158px" /></td>
						</tr>
						<tr>
							<td>检察员编号：</td>
							<td><input name="checkUser" id="checkUser" type="text"
								class="text" style="width:158px" value="" /></td>
						</tr>
						<tr>
							<td>出租单编号：</td>
							<td><input name="rentId" id="rentId" type="text"
								class="text" style="width:158px" value="" /></td>
						</tr>


					</table>
				</center>
			</form>
		</center>
	</div>


<%-- 	<div id="updWindow">
		<center>
			<form id="form2" method="post" style="margin-top:30px;">

				<table>
					<tr>
						<td>检查单编号：</td>
						<td><input type="text" name="checkId" readonly /></td>
					</tr>
					<tr>
						<td>检查日期：</td>
						<td><input type="text" name="checkDate" id="checkDate"
							class="easyui-datebox" data-options="editable:false"
							style="width:158px" /></td>
					</tr>
					<tr>
						<td>属性：</td>
						<td><input type="text" name="field"  /></td>
					</tr>
					<tr>
						<td>问题：</td>
						<td><input type="text" name="problem"  /></td>
					</tr>
					<tr>
						<td>赔付：</td>
						<td><input type="text" name="paying"  /></td>
					</tr>
					<tr>
						<td>检察员编号：</td>
						<td><input type="text" name="checkUser"  /></td>
					</tr>
					<tr>
						<td>出租单编号：</td>
						<td><input type="text" name="rentId"  /></td>
					</tr>

				</table>
			</form>
		</center>
	</div> --%>

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
