<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			url : '${pageContext.request.contextPath }/car/selByIsrenting',
			 queryParams:{
				"identity":$("#identity").val()
    	     
    		},  
			columns : [ [ 
			 {
				field : 'carType',
				title : '型号',
				width : 50
			},{
				field : 'carNumber',
				title : '车牌号',
				width : 50
			},{
				field : 'color',
				title : '颜色',
				width : 50
			}, {
				field : 'price',
				title : '价格',
				width : 50
			},{
				field : 'rentPrice',
				title : '租金',
				width : 50
			}, {
				field : 'deposit',
				title : '押金',
				width : 50
			},{
				field : 'carPicture',
				title : '图片', 
				width : 50,
				formatter:function(carPicture,row){
			    	 var str = "";
			    	if(carPicture!="" || carPicture!=null){
			    	str = "<img style=\"height: 30px;width: 30px;\" src=${pageContext.request.contextPath }\""+carPicture+"\"/>";
			          return str;
			    	} 
				}
			}
			 ] ],
			
			title : "未出租汽车信息",
			toolbar : "#tb",
			fit : true,
			fitColumns : true,
			singleSelect : true,
			
			striped : true,
			rownumbers : true
		}); 
		$("#btnSrch").click(function() {
			//alert($("#identity").val());
				$('#dg').datagrid({
				url : '${pageContext.request.contextPath }/car/selByCustomerIdentity',
				 queryParams:{
					"identity":$("#identity").val()
	    	     
	    		}, 
				columns : [ [ 
				 {
					field : 'carType',
					title : '型号',
					width : 50
				},{
					field : 'carNumber',
					title : '车牌号',
					width : 50
				},{
					field : 'color',
					title : '颜色',
					width : 50
				},{
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
				},{
					field : 'carPicture',
					title : '图片', 
					width : 50,
					formatter:function(carPicture,row){
				    	var str = "";
				    	if(carPicture!="" || carPicture!=null){
				    	str = "<img style=\"height: 30px;width: 30px;\" src=${pageContext.request.contextPath }\""+carPicture+"\"/>";
				          return str;
				    	} 
					}
				}
				 ] ],
				
				title : "已租汽车信息",
				toolbar : "#tb",
				fit : true,
				fitColumns : true,
				singleSelect : true,
				
				striped : true,
				rownumbers : true
			}); 
		}); 
		// 给出租按钮绑定事件
		$("#btnUpd").click(function() {
			//alert($('#srchValue').val());
			var selected = $("#dg").datagrid("getSelected");
			if (selected == null) {
				$.messager.alert("警告", "请先选中!", "warning");
			} else {
				$("#userName").combobox({
					url : '${pageContext.request.contextPath }/rent/getAllUsers',
					valueField : 'userName',
					textField : 'userName',
					editable : false
				});
				$("#dlgUpd").dialog({
					width : "400",
					height : "350",
					title : "生成出租单",
					buttons : "#dlgBtn",
					modal : true,
                    onOpen:function(){
                    	$('#carId').val(selected.carNumber); 
                    	$('#shouldPayPrice').val(selected.rentPrice); 
                    	$('#custId').val($('#srchValue').val());
                    	$('#imprest').val(selected.rentPrice+1000);
                    	$('userName').combobox('getValue')
                    	}
                   
				});
				//$("#carNumber").form("load", selected.carNumber);
			}
			
		});

		$("#btnNo").click(function() {
			$("#dlgUpd").dialog("close");
		});

				// 给出租按钮绑定事件
		$("#btnOk").click(function() {
			$("#fm").form('submit', {
				url : "${pageContext.request.contextPath }/rent/makeRenttable",
				success : function(data) {
					//alert(data=="true")
					var msg = "";
					if (data == "true") {
						msg = "出租成功!";
						$("#fm").form("clear");
						$("#dlgUpd").dialog("close");
						$("#dg").datagrid("reload");
					} else {
						msg = "出租失败!";
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
		
		$("#btnReturn").click(function() {
			$('#dg').datagrid({
				url : '${pageContext.request.contextPath }/car/selByIsrenting',
				 queryParams:{
					"identity":$("#identity").val()
	    	     
	    		},  
				columns : [ [ 
				 {
					field : 'carType',
					title : '型号',
					width : 50
				},{
					field : 'carNumber',
					title : '车牌号',
					width : 50
				},{
					field : 'color',
					title : '颜色',
					width : 50
				}, {
					field : 'rentPrice',
					title : '租金',
					width : 50
				}, {
					field : 'deposit',
					title : '押金',
					width : 50
				},{
					field : 'carPicture',
					title : '图片', 
					width : 50,
					formatter:function(carPicture,row){
				    	var str = "";
				    	if(carPicture!="" || carPicture!=null){
				    	str = "<img style=\"height: 30px;width: 30px;\" src=${pageContext.request.contextPath }\""+carPicture+"\"/>";
				          return str; 
				    	}
					}
				}
				 ] ],
				
				title : "未出租汽车信息",
				toolbar : "#tb",
				fit : true,
				fitColumns : true,
				singleSelect : true,
				
				striped : true,
				rownumbers : true
			}); 
		});
	});
	
</script>
<body>
	<table id="dg"></table>

	<div id="tb" style="padding:3px">
		
		请输入客户身份证号:<input id="srchValue" style="line-height:26px;border:1px solid #ccc"/> 
		
		<!-- <a id="btnSrch" href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-search'">查询</a> -->
		<a id="btnUpd" href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-search'">出租</a>
		<a id="btnReturn" href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-search'">返回</a>
	</div>
	<!-- 修改的窗口 -->
	<div id="dlgUpd" >
		<center>
			<form id="fm"  method="post" style="margin-top:20px;">
				
				<table>
					
					<tr>
						<td>起租日期:</td>
						<td><input type="text" name="beginDate" class="easyui-datebox" data-options="editable:false"  /></td>
					</tr>
					<tr>
						<td>应归还日期:</td>
						<td><input type="text" name="shouldReturnDate" class="easyui-datebox" data-options="editable:false"/></td>
					</tr>
					<tr>
						<td>应付金:</td>
						<td><input type="text" name="shouldPayPrice" id="shouldPayPrice" /></td>
					</tr>
					<tr>
						<td>预付金:</td>
						<td><input type="text" name="imprest" id="imprest"/>当前车辆押金为：1000</td>
					</tr>
					<tr>
						<td>实际交付金额:</td>
						<td><input type="text" name="price"  /></td>
					</tr>
					
					<tr>
						<td>车牌号:</td>
						<td><input type="text" name="carId" id="carId"/></td>
					</tr>
					<tr>
						<td>客户编号:</td>
						<td><input type="text" name="custId" id="custId"/></td>
					</tr>
					<tr>
						<td>服务人员名称:</td>
						<td><select id="userName" name="userName" class="easyui-combobox" style="width:50px"></td>
						</select> 
					</tr>
				</table>
			</form>
		</center>
	</div>
	<!-- 对话框中的按钮 -->
	<div id="dlgBtn">
		<a id="btnOk" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">出租</a>
		<a id="btnNo" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>
	</div>
</body>
</html>
