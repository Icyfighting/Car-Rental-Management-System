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
table {
	margin-left: 200px;
	margin-top: 100px;
	width: 50%;
	border-collapse: collapse;
}

td {
	border: 1px solid gray;
}
</style>
<script type="text/javascript">
	$(function() {

		$("#roleId").combobox({
			url : '${pageContext.request.contextPath }/user/roles',
			valueField : 'roleId',
			textField : 'roleName',
			editable : false
		});

		$("#btnSave").click(function() {
			// 转换为ajax提交
			$("form").form({
				"url" : "${pageContext.request.contextPath }/user/add",
				"onSubmit" : function() {
					//提交前的判断，各个字段不能为空
					if (!checkFields()) {
						msg = "每个字段都不能为空!";
						$.messager.show({
							"title" : "系统消息",
							"msg" : msg,
							"timeout" : 2000,
							"showType" : "slide"
						});
						return false;
					}
					
					
					return true;
				},
				"success" : function(data) {
					var msg = "";
					if (data == "true") {
						msg = "新增成功!";
						$("form").get(0).reset();
					} else {
						msg = "新增失败!";
					}
					$.messager.show({
						"title" : "系统消息",
						"msg" : msg,
						"timeout" : 2000,
						"showType" : "slide"
					});
				}
			});
			$("form").submit();
		});
		$("#btnCancel").click(function() {
			$("#form").form("clear");

		});
	});

	function checkFields() {
		var t = $('#form').serializeArray();//ajax中other方法，提供表单序列化
		var flag = true;
		$.each(t, function() {
			//alert(this.value);
			if (this.value == "") {
				flag &= false;
			}
		});
		flag = flag == 0 ? false : true;
		//alert(flag);
		return flag;

	}
</script>
</head>


<body>

	<form id="form" method="post" enctype="multipart/form-data">
		<table id="table">
			<caption
				style="background-color: #6795B4; height: 30px; line-height: 30px; color: white; border: 1px solid gray; border-bottom: none;">添加商品信息</caption>

			<!-- 	<input type="hidden" name="method" value="insProduct" /> -->
			<tr>
				<td>用户名：</td>
				<td><input name="userName" id="userName" type="text" class="text"
					style="width:154px" value="" />
				</td>
			</tr>
			<tr>
				<td>密码:</td>
				<td><input class="text" type="password" name='userPwd' id='userPwd' style="width:154px"
					value="" /></td>
			</tr>
			<tr>
				<td>身份证号:</td>
				<td><input class="text" type="text" name="identity" id="identity"
					style="width:154px" value="" /></td>
			</tr>
			<tr>
				<td>真实姓名:</td>
				<td><input id="fullName" name="fullName" style="width:158px;"
					value="" /></td>
			</tr>
			<tr>
				<td>性别:</td>
				<td><input type="radio" name="sex" value="男" />男 <input type="radio" name="sex" value="女" />女</td>
			</tr>
			<tr>
				<td>地址:</td>
				<td><input class="text" name='address' id='address' style="width:154px"
					value="" /></td>
			</tr>
			<tr>
				<td>电话号码:</td>
				<td><input class="text" name='phone'  id='phone' style="width:154px"
					value="" /></td>
			</tr>
			<tr>
				<td>用户角色:</td>
				<td><input id="roleId" name="roleId"
							style="width:158px;" value="" /></td>
			</tr>
			
			<tr>
				<td>职位:</td>
				<td><input class="text" name='position' id='position' style="width:154px"
					value="" /></td>
			</tr>
			<tr>
				<td>上传头像:</td>
				<td><input type="file" name="uploadFile"></td>
			</tr>

			<tr>
				<td colspan="2" align="center" height="50px"><a
					href="javascript:void(0);" class="easyui-linkbutton" id="btnSave"
					data-options="iconCls:'icon-ok'">提交</a>&nbsp;&nbsp;&nbsp;&nbsp; <a
					href="javascript:void(0);" class="easyui-linkbutton" id="btnCancel"
					data-options="iconCls:'icon-cancel'">取消</a></td>
			</tr>

		</table>
	</form>

</body>

</html>