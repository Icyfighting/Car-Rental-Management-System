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
			url : '${pageContext.request.contextPath}/system/searchLoginLog',
			columns : [ [ {
				field : 'loginLogId',
				title : '日志编号',
				width : 100
			}, {
				field : 'loginName',
				title : '登录用户',
				width : 100
			}, {
				field : 'loginIp',
				title : '登陆IP',
				width : 100
			}, {
				field : 'loginTime',
				title : '登陆时间',
				width : 100,
				formatter: function (value, row, index) {  
                    return changeDateFormat(value)  }
			}] ],
			/* onLoadSuccess : function(data) { 
				//alert("data.total:"+data.total);
                if (data.total == 0) { 
                	$.messager.alert("警告", "没有符合条件的结果!", "warning");
                   }  
            }, */
			pagination : true,
			title : "用户列表",
			toolbar : "#tb",
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
				"loginName" :$("#loginName").val(),//不能简单的使用$().val(),必须用这个...
				"loginIp" : $("#loginIp").val(),
				"loginTime" : $("#loginTime").datebox('getValue'),
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
<form id="form1">
	<table>
		<tr>
			<td>登录名：</td>
			<td><input id="loginName" name="loginName" style="width:158px;"
				value="" /></td>
		</tr>
		<tr>
			<td>登陆IP：</td>
			<td><input id="loginIp" name="loginIp" style="width:158px;"
				value="" /></td>
		</tr>
		<tr>
			<td>登陆时间：</td>
			<td><input type="text" name="loginTime" id="loginTime" class="easyui-datebox" data-options="editable:false" style="width:158px" /></td>
		</tr>

		<tr>
			<td colspan="2" align="center" height="50px">
				<a id="btnSrch" href="javascript:void(0);"
				class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认</a> <a
				id="btnNo" href="javascript:void(0);" class="easyui-linkbutton"
				data-options="iconCls:'icon-cancel'">取消</a>
			</td>
		<tr>
	</table>
</form>	
	<table id="dg"></table>
</body>
</html>
