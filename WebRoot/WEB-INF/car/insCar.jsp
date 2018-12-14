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
<link rel="stylesheet"
  	rev="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css" 
 	type="text/css" media="all" />
</head>
<script type="text/javascript">
$(function() {
	
	$("#btnSave").click(function() {
		// 转换为ajax提交
		$("form").form({
			"url" : "${pageContext.request.contextPath }/cars/insCar",
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
				
			},
			"success" : function(data) {
				var msg = "";
				if (data == "true") {
					msg = "新增成功!";
					$("form").get(0).reset();
				} else {
					msg = "新增失败!该车牌号已存在";
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
	var t = $('form').serializeArray();
	//alert(t)//ajax中other方法，提供表单序列化
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
	<form  id="fom" method="post" enctype="multipart/form-data">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>
					<table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td height="40" class="font42">
											<table width="100%" border="0" cellpadding="4" cellspacing="1" class="CContent">
												<tr>
													<th class="tablestyle_title">汽车信息录入</th>
												</tr>

												<tr>
													<td class="font42">
														<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
															<TR>
																<TD width="100%">
																	<fieldset style="height:100%;">
																		<legend>添加汽车</legend>
																		<table border="0" cellpadding="2" cellspacing="1" style="width:100%">
																			
																			<tr>
																				<td>车牌号 :</td>
																				<td><input name="carNumber" type="text" id="carNumber" style="width:154px" value="" /></td>
																			</tr>
																			<tr>
																				<td>型     号:</td>
																				<td><input id="carType" type="text" name="carType" style="width:154px" value="" /></td>
																			</tr>
																			<tr>
																				<td>颜    色:</td>
																				<td><input id="color" type="text" name='color' style="width:154px" value="" /></td>
																			</tr>
																			<!-- <tr>
																				<td>出生日期:</td>
																				<td><input class="easyui-datebox" data-options="editable:false" name='udate' style="width:156px" /></td>
																			</tr> -->
																			<tr>
																				<td>价    格:</td>
																				<td><input id="price" type="text" name='price' style="width:154px" value="" /></td>
																			</tr>
																			<tr>
																				<td>租     金:</td>
																				<td><input id="rentPrice" type="text" name='rentPrice' style="width:154px" value="" /></td>
																			</tr>
																			<tr>
																				<td>押      金:</td>
																				<td><input id="deposit" type="text" name="deposit" style="width:154px"/></td>
																			</tr>
																			<tr>
																				<td>租用情况:</td>
																				
																				<td><input type="radio" name="isrenting" value="0" checked /> 未出租 <input type="radio" name="isrenting" value="1" /> 已出租</td>
																			</tr>
																			<tr>
																				<td>选择图片:</td>
																				<td><input type="file" name="upload"></td>
																			</tr>
																			<tr>
																				<td>简        介:</td>
																				<td colspan="3"><textarea  id="description" name="description" cols="100" rows="8"></textarea></td>
																			</tr>
																		</table>
																		<br />
																	</fieldset>
																</TD>

															</TR>

														</table>
													</td>
													<TR>
														<TD colspan="2" align="center" height="50px"><a href="javascript:void(0);" class="easyui-linkbutton" id="btnSave" data-options="iconCls:'icon-ok'">保存</a></TD>
													</TR>
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
