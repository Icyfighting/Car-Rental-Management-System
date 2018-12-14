<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<style type="text/css">
table {
	/* margin-left:100px; */
	margin-top:100px;
	width: 100%;
	border-collapse: collapse;
}

td {
	border: 1px solid gray;

}

</style>

</head>

<body>
	<div style="width: 400px; margin: 100px auto;">

		<form action="${pageContext.request.contextPath }/user/login"
			method="post">
			<table>
			<caption style="background-color: #6795B4; height: 30px; line-height: 30px; color: white; border: 1px solid gray; border-bottom: none;">汽车出租管理系统登陆</caption>
		
				<tr>
					<td>用户名:</td>
					<td><input type="text" name="userName"></td>
				</tr>
				<tr>
					<td>密码: </td>
					<td>
					<input type="password" name="userPwd">
					</td>

				</tr>
				<tr>
					<td colspan="2" align="center" height="50px"><input type="submit" value="登陆"></td>
				</tr>
			</table>
		</form>

	</div>
</body>
</html>