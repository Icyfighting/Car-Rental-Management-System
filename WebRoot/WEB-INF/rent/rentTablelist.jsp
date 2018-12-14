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
			url : '${pageContext.request.contextPath }/rent/select',
			columns : [ [ {
				field : 'tableId',
				title : '出租单ID',
				width : 100
			}, {
				field : 'imprest',
				title : '预付金',
				width : 100
			}, {
				field : 'shouldPayPrice',
				title : '应付金',
				width : 100
			}, {
				field : 'price',
				title : '实付金额',
				width : 100
			}, {
				field : 'beginDate',
				title : '起租日期',
				width : 200,
				formatter: function (value, row, index) {  
                    return changeDateFormat(value)  }
			}, {
				field : 'shouldReturnDate',
				title : '应归还日期',
				width : 200,
				formatter: function (value, row, index) {  
                    return changeDateFormat(value)  }
			
			}, {
				field : 'returnDate',
				title : '归还日期',
				width : 200,
				formatter: function (value, row, index) {  
                    return changeDateFormat(value)  }
			},  {
				field : 'userName',
				title : '服务人员名',
				width : 100
			}, {
				field : 'carId',
				title : '车牌号',
				width : 100
			}, {
				field : 'custId',
				title : '客户名',
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
			//toolbar : "#tb",
			fit : false,
			fitColumns : true,
			singleSelect : true,
			pageSize : 5,
			pageList : [ 5, 10, 15, 20 ],
			striped : true,
			rownumbers : true
		});

		$("#btnSrch").click(function() {
			
			$("#dg").datagrid('reload', {
				"tableId" :$("#tableId").val(),//不能简单的使用$().val(),必须用这个...
				"beginDate" : $("#beginDate").datebox('getValue'),
				"shouldReturnDate" : $("#shouldReturnDate").datebox('getValue'),
				"returnDate" : $("#returnDate").datebox('getValue'),
				"userName" :$("#userName").val(),
				"carId" :$("#carId").val(),
				"custId" :$("#custId").val(),
				"rentFlag" :$("#rentFlag").combobox("getValue"),
				 onLoadSuccess:function(data){
					$("#form1").form("clear");
				} 
			});
			
		});
		
		
	});
	
	 //转换日期格式  
    function changeDateFormat(cellval) {
        if (cellval != null) {
        	var unixTimestamp = new Date(cellval) ;
        	commonTime = unixTimestamp.toLocaleString();
        	 //alert(commonTime);
        	 return commonTime;
        }
    }
</script>

</head>

<body>
	<div id="div1">
		<form id="form1" method="post">
		<center>
			<table id="table1" style="width:500px">
				<caption style="background-color: #6795B4; height: 30px; line-height: 30px; color: white; border: 1px solid gray; border-bottom: none;">出租单查询</caption>

				<!-- 	<input type="hidden" name="method" value="insProduct" /> -->
				<tr>
					<td>出租单编号：</td>
					<td><input name="tableId" id="tableId" type="text"
						class="text" style="width:158px" value="" /></td>
				</tr>
				<tr>
					<td>起租日期：</td>
					<td><input type="text" name="beginDate" id="beginDate"
						class="easyui-datebox" data-options="editable:false"
						style="width:158px" /></td>
				</tr>
				<tr>
					<td>应归还日期：</td>
					<td><input type="text" name="shouldReturnDate" id="shouldReturnDate"
						class="easyui-datebox" data-options="editable:false"
						style="width:158px" /></td>
				</tr>
				<tr>
					<td>归还日期：</td>
					<td><input type="text" name="returnDate" id="returnDate"
						class="easyui-datebox" data-options="editable:false"
						style="width:158px" /></td>
				</tr>
				<tr>
					<td>客户号:</td>
					<td><input class="text" type="text" name="custId"
						id="custId" style="width:158px" value="" /></td>
				</tr>
				<tr>
					<td>车牌号:</td>
					<td><input id="carId" name="carId" style="width:158px;"
						value="" /></td>
				</tr>
				<tr>
					<td>服务人员名:</td>
					<td><input id="userName" name="userName" style="width:158px;"
						value="" /></td>
				</tr>
 				<tr>
					<td>出租单状态:</td>
					<td><select id="rentFlag" name="rentFlag" class="easyui-combobox" style="width:158px">
							<option value="-1">所有状态</option>
							<option value="0">已入库</option>
							<option value="1">出租中</option>
						</select></td>
				</tr>
				
				

				<tr>
					<td colspan="2" align="center" height="50px"><a
						href="javascript:void(0);" class="easyui-linkbutton" id="btnSrch"
						data-options="iconCls:'icon-ok'">查询</a>&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="javascript:void(0);" class="easyui-linkbutton"
						id="btnCancel" data-options="iconCls:'icon-cancel'">取消</a></td>
				</tr>

			</table>
			</center>
		</form>

	</div>
	<table id="dg"></table>

	<!-- <div id="tb" style="padding:3px">
		<a id="btnSrch" href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-search'">查询出租单</a>- <a id="btnDel"
			href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove'">删除出租单</a> <a id="btnUpd"
			href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-edit'">修改出租单</a>
	</div> -->


</body>
</html>
