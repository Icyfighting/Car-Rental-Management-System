<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加客户信息</title>
<link rel="stylesheet" href="static/themes/default/easyui.css" />
<link rel="stylesheet" href="static/themes/icon.css" />
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="static/js/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" rev="stylesheet" href="static/css/style.css"
	type="text/css" media="all" />

<style type="text/css">

#father{
width:100%;
margin-left:100px;
margin-top:60px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#btnSave").click(function() {
			// 转换为ajax提交
			$("form").form({
				"url" : "${pageContext.request.contextPath }/customers/addCustomers",
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
						$("form").get(0).reset();
						msg = "保存成功!";
					} else {
						msg = "保存失败!";
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
		$("#btnSrch").click(function() {
			$("#dg").datagrid('reload', {
				"srchVal" : $("#srchValue").val()
			});
		});
		flag = flag == 0 ? false : true;
		//alert(flag);
		return flag;

	}
	
</script>
<!-- <script type="text/javascript">
		function btnSave(){
			document.forms[0].submit();
		}
	</script> -->
</head>

<body>
	<div id="father"><!-- addCustomer ${pageContext.request.contextPath }/custManager/viewCustomers-->
		<form id="form" action="${pageContext.request.contextPath }/customers/addCustomers" method="post">
			<table width="60%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<table id="subtree1" style="DISPLAY: " width="100%" border="0"
							cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<table width="95%" border="0" align="center" cellpadding="0"
										cellspacing="0">
										<tr>
											<td height="40">
												<table width="100%" border="0" cellpadding="4"
													cellspacing="1" class="CContent">
													<tr>
														<th class="tablestyle_title">添加客户信息</th>
													</tr>

													<tr>
														<td class="font42">
															<table border="0" cellpadding="0" cellspacing="0"
																style="width:100%">
																<tr>
																	<td width="100%">
																		<fieldset style="height:100%;">
																			<legend>添加客户</legend>
																			<table border="0" cellpadding="2" cellspacing="1"
																				style="width:100%">
																				<input type="hidden" name="method" value="addCustomers" />
																				<tr>
																					<td>身份证</td>
																					<td><input name="identity" type="text"
																						class="text" style="width:500px" value="" /></td>
																				</tr>
																				<tr>
																					<td>地址:</td>
																					<td><input class="text" type="text"
																						name="address" style="width:500px" value="" /></td>
																				</tr>

																				<tr>
																					<td>姓名:</td>
																					<td><input class="text" name='custName'
																						style="width:500px" value="" /></td>
																				</tr>
																				<tr>
																					<td>电话:</td>
																					<td><input class="text" name='phone'
																						style="width:500px" value="" /></td>
																				</tr>
																				<tr>
																					<td>性别:</td>
																					<td>
    																			 <select NAME="sex" id="sex" style="width: 80px;">
																							<option value="男">男</option>
																							<option value="女">女</option>
																							</select>
    																						  </td>
  																								  </tr>
																				</tr>
																				<tr>
																					<td>职业:</td>
																					<td><input class="text" name='career'
																						style="width:500px" value="" /></td>
																				</tr>
																				<tr>
																					<td>密码:</td>
																					<td><input type="password" name='custPwd'
																						style="width:500px" value="" /></td>
																				</tr>
																				
																				<tr>
																				
																
													<TD colspan="3" align="center" height="50px"><a
																href="javascript:void(0);" class="easyui-linkbutton"
																id="btnSave" data-options="iconCls:'icon-ok'">保存</a> 
																			</TD>
																
													
															<!-- <td id="btnReload" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-reload'">重置</a></td> -->
														</tr>
																			</table>
																			<br />
																		</fieldset>
																	</TD>

															</table>
														</td>
														
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						
																					
						</form>
						
</body>

		                                                      
</html>