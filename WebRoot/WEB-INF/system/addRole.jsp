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
		//alert("${pageContext.request.contextPath }/system/roles");

		$("#btnAdd").click(function() {
			$('#tt').tree({
				url : '${pageContext.request.contextPath }/system/roles',
			});
		});

		/* 	$("#btnUpd").click(function() {
				var roleId=$("#roleId").combobox("getValue");
				//alert(roleId);
				$('#tt').tree({
					url : '${pageContext.request.contextPath }/system/roles',
					onBeforeLoad:function(node,param){
						param.roleId=roleId;
					},
					checkbox:true
				});
			}); */

		$("#btnUpd").click(function() {

			$("#updWindow").dialog({
				width : "500",
				height : "500",
				title : "修改权限信息",
				buttons : "#dlgBtn",
				modal : true,
				left: 250,
				top:100
			});
			var roleId=$("#roleId").combobox("getValue");
			$('#tt').tree({
				url : '${pageContext.request.contextPath }/system/roles',
				onBeforeLoad : function(node, param) {
					param.roleId = roleId;
				},
				checkbox : true
			});

		});
			
			$("#btnAdd").click(function() {

				$("#addWindow").dialog({
					width : "500",
					height : "500",
					title : "修改权限信息",
					buttons : "#dlgBtn1",
					modal : true,
					left: 250,
					top:100
				});
				
				$('#tt1').tree({
					url : '${pageContext.request.contextPath }/system/roles',
					checkbox : true
				});

			});

		$("#roleId").combobox({
			url : '${pageContext.request.contextPath }/system/getAllRoles',
			valueField : 'roleId',
			textField : 'roleName',
			editable : false,
			onLoadSuccess : function() {//成功返回结果后，选中第一项为默认值，防止为空
				var data = $('#roleId').combobox('getData');//获取所有下拉框数据
				if (data.length > 0) {
					$('#roleId').combobox('select', data[0].roleId);
				}
			}
		});
		$("#btnOk").click(function() {
			var msg = "";
			var nodes = $('#tt').tree('getChecked');
			var nodeIds=new Array();
			if(nodes!=null && nodes.length>0){
				
				for(var i=0; i<nodes.length; i++){
					nodeIds[i]=nodes[i].id;//例如:菜单的menuID
					
				}
				//alert("${pageContext.request.contextPath}/system/updRole");
				/*  $.post('${pageContext.request.contextPath}/system/updRole',{nodeIds:nodeIds},function(data){
				        alert("Data: " + data);
				    }); */
				 
				 $.ajax({  
			            url:"${pageContext.request.contextPath}/system/updRole",  
			            data:{"menuIds[]":nodeIds,"roleId":$('#roleId').combobox("getValue")},  
			            type:"post",  
			            success:function(data){ 
			            	
							if (data == true) {
								msg = "修改成功!";
								
								$("#updWindow").dialog("close");
								
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

			}else{
				$.messager.alert("警告", "没有给该用户任何权限!", "warning");
			}
			
		});
		
		$("#btnOk1").click(function() {
			var msg = "";
			var nodes = $('#tt1').tree('getChecked');
			//alert("选中的是否为空:"+(nodes.length));
			var nodeIds=new Array();
			if(nodes!=null && nodes.length>0){
				for(var i=0; i<nodes.length; i++){
					nodeIds[i]=nodes[i].id;//例如:菜单的menuID
					
				}
				//alert("${pageContext.request.contextPath}/system/updRole");
				/*  $.post('${pageContext.request.contextPath}/system/updRole',{nodeIds:nodeIds},function(data){
				        alert("Data: " + data);
				    }); */
				// alert($('#roleName').val());
				 $.ajax({  
			            url:"${pageContext.request.contextPath}/system/addRole",  
			            data:{"menuIds[]":nodeIds,"roleName":$('#roleName').val()},  //roleId是新增的
			            type:"post",  
			            success:function(data){ 
			            	
							if (data == true) {
								msg = "创建成功!";
								$('#roleName').val("");
								$("#addWindow").dialog("close");
								
							} else {
								msg = "创建失败!";
							}
							$.messager.show({
								"title" : "系统消息",
								"msg" : msg,
								"timeout" : 2000,
								"showType" : "slide"
							});  
							
							
			            }  
			        });  
			}else{
				 $.messager.alert("警告", "没有给该用户任何权限!", "warning");
			}
		});
		
		$("#btnNo").click(function() {
			$("#updWindow").dialog("close");

		});
		$("#btnNo1").click(function() {
			$("#addWindow").dialog("close");

		});
		

	});
</script>

</head>

<body>
	<input id="roleId" name="roleId" style="width:158px;" value="" />
	<a id="btnUpd" href="javascript:void(0);" class="easyui-linkbutton"
		data-options="iconCls:'icon-search'">编辑</a>
	<a id="btnAdd" href="javascript:void(0);" class="easyui-linkbutton"
		data-options="iconCls:'icon-search'">新增角色</a>
	

	<div id="updWindow">
	
	<ul id="tt"></ul>
	</div>
	<div id="addWindow">
		<input name="roleName" id="roleName" type="text" class="text" style="width:154px" value="" />
		<ul id="tt1"></ul>
	</div>
	
	<div id="dlgBtn">
		<a id="btnOk" href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-ok'">确认</a> <a id="btnNo"
			href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-cancel'">取消</a>
	</div>
	
	<div id="dlgBtn1">
		<a id="btnOk1" href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-ok'">确认</a> <a id="btnNo1"
			href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-cancel'">取消</a>
	</div>

</body>
</html>
