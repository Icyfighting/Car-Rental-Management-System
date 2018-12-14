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
		$("#tableId").combobox({
			url : '${pageContext.request.contextPath }/rent/selAllTableId',
			valueField : 'tableId',
			textField : 'tableId',
			editable : false
		});
		$('#dg').datagrid({
			url : '${pageContext.request.contextPath }/rent/selAllRentTables',
			
			columns : [ [ 
			 {
				field : 'tableId',
				title : '出租单编号',
				width : 50
			},{
				field : 'price',
				title : '实际交付金额',
				width : 50
			},{
				field : 'beginDate',
				title : '起租时间',
				width : 50,
				formatter: function (value, row, index) {  
                    return changeDateFormat(value)  }
			}, {
				field : 'shouldReturnDate',
				title : '应还时间',
				width : 50,
				formatter: function (value, row, index) {  
                    return changeDateFormat(value)  }
			},{
				field : 'custId',
				title : '客户号',
				width : 50
			}, {
				field : 'carId',
				title : '车牌号',
				width : 50
			},{
				field : 'userName',
				title : '服务人员编号', 
				width : 50
			}
			 ] ],
			
			title : "出租单信息",
			toolbar : "#tb",
			fit : true,
			fitColumns : true,
			singleSelect : true,
			
			striped : true,
			rownumbers : true
		}); 
		
		$("#btnSrch").click(function() {
			//alert($("#tableId").combobox('getValue'));
			$('#dg').datagrid({
				url : '${pageContext.request.contextPath }/rent/selByTableID',
				queryParams:{
					"tableId":$("#tableId").combobox('getValue')
	    		}, 
				columns : [ [ 
				 {
					field : 'tableId',
					title : '出租单编号',
					width : 50
				},{
					field : 'price',
					title : '实际交付金额',
					width : 50
				},{
					field : 'beginDate',
					title : '起租时间',
					width : 50,
					formatter: function (value, row, index) {  
	                    return changeDateFormat(value)  }
				}, {
					field : 'shouldReturnDate',
					title : '应还时间',
					width : 50,
					formatter: function (value, row, index) {  
	                    return changeDateFormat(value)  }
				},{
					field : 'custId',
					title : '客户号',
					width : 50
				}, {
					field : 'carId',
					title : '车牌号',
					width : 50
				},{
					field : 'userName',
					title : '服务人员编号', 
					width : 50
				}
				 ] ],
				
				title : "出租单信息",
				toolbar : "#tb",
				fit : true,
				fitColumns : true,
				singleSelect : true,
				
				striped : true,
				rownumbers : true
			}); 
		}); 
		// 给入库按钮绑定事件
		$("#btnUpd").click(function() {
			
			var selected = $("#dg").datagrid("getSelected");
			//alert("ceshi1:"+selected.tableId);
			if (selected == null) {
				$.messager.alert("警告", "请先选中!", "warning");
			} else {
				//alert(selected.tableId);
				$("#dlgUpd").dialog({
					width : "1000",
					height : "550",
					title : "入库",
					buttons : "#dlgBtn",
					modal : true,
					top:30
					
				});
				//alert(selected.tableId);
				
				$.post("${pageContext.request.contextPath }/car/selOneByCarNumber",
						{ "carNumber":selected.carId}, 
						function(data) {
							//alert(data);
							$("#fm1").form("load",data[0] );

						}
				);
				$.post("${pageContext.request.contextPath }/customers/selOneById",
						{ "identity":selected.custId}, 
						function(data) {
							//alert(data);
							$("#fm2").form("load",data[0] );

						}
				);
				//alert("ceshi2:"+selected.tableId);
				//$("#rentId").val(selected.tableId);
				$("form:eq(0) input:eq(0)").val(selected.tableId);
				//$("#carNumber").form("load", selected.carNumber);
				
			}
			
		});

		$("#btnNo").click(function() {
			$("#dlgUpd").dialog("close");
		});

				// 给入库按钮绑定事件

		
		$("#btnReturn").click(function() {
			$("#tableId").combobox({
				url : '${pageContext.request.contextPath }/rent/selAllTableId',
				valueField : 'tableId',
				textField : 'tableId',
				editable : false
			});
			$('#dg').datagrid({
				url : '${pageContext.request.contextPath }/rent/selAllRentTables',
				
				columns : [ [ 
				 {
					field : 'tableId',
					title : '出租单编号',
					width : 50
				},{
					field : 'price',
					title : '实际交付金额',
					width : 50
				},{
					field : 'beginDate',
					title : '起租时间',
					width : 50,
					formatter: function (value, row, index) {  
	                    return changeDateFormat(value)  }
				}, {
					field : 'shouldReturnDate',
					title : '应还时间',
					width : 50,
					formatter: function (value, row, index) {  
	                    return changeDateFormat(value)  }
				},{
					field : 'custId',
					title : '客户号',
					width : 50
				}, {
					field : 'carId',
					title : '车牌号',
					width : 50
				},{
					field : 'userName',
					title : '服务人员编号', 
					width : 50
				}
				 ] ],
				
				title : "出租单信息",
				toolbar : "#tb",
				fit : true,
				fitColumns : true,
				singleSelect : true,
				
				striped : true,
				rownumbers : true
			}); 
		});
		
		$("#btnOk").click(function() {
		//alert($("#carNumber").val());
			 $.post("${pageContext.request.contextPath }/car/updIsrentingZero",
			{ "carNumber":$("#carNumber").val()}, 
			function(data) {
				if(data==true){
					//alert(data==true);
					$("#fm3").form('submit', {
						url : "${pageContext.request.contextPath }/check/makeCheckTable",
						success : function(data) {
							var msg = "";
							//alert(data=="true");
							if(data=="true"){
								
								msg = "生成检查单成功!";
								$("#dlgUpd").dialog("close");
							}else {
								msg = "生成检查单失败!";
							}
							$.messager.show({
								"title" : "系统消息",
								"msg" : msg,
								"timeout" : 2000,
								"showType" : "slide"
							});
						}
					});
				}
				
				
			}
	);  
	
		});
		
	});
	
    function changeDateFormat(cellval) {
        if (cellval != null) {
        	var unixTimestamp = new Date(cellval) ;
        	commonTime = unixTimestamp.toLocaleString();
        	 //alert(commonTime);
        	 return commonTime;
        }
    }
	
</script>
<body>
	<table id="dg"></table>

	<div id="tb" style="padding:3px">
		
		请输入出租单编号:<input id="tableId" class="easyui-combobox"  style="line-height:26px;border:1px solid #ccc"/> 
		 <a id="btnSrch" href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-search'">查询</a> 
		<a id="btnUpd" href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-search'">入库</a>
		<a id="btnReturn" href="javascript:void(0);" class="easyui-linkbutton"
			data-options="iconCls:'icon-search'">返回</a>
	</div>
	<!-- 修改的窗口 -->
	<div id="dlgUpd" style="margin-top: 10px">
		<div id="div3"　style="margin-top:20px;float: left">
			<form id="fm3"  method="post" style="margin-top:20px;margin-left:200px;">
			租单编号:<input type="text" name="rentId"　id="rentId" />　　　　　　　　　　　　检查时间:<input type="text" name="checkDate" class="easyui-datebox" data-options="editable:false" /><br>
			检查员　:<input type="text" name="checkUser"　id="checkUser" />　　　　　　　　　　　　属 　　性:<input type="text" name="field" />  <br>
			问　　题:<input type="text" name="problem" />　　　　　　　　　　　　赔　　 费:<input type="text" name="paying" /> 	
			</form>
		</div>
		<div id="div1" style="margin-top:100px;margin-left:100px ;float: left">	
			汽车信息：<form id="fm1"  method="post" style="margin-top:20px;">
				<table>
					<tr>
						<td>车牌号:</td>
						<td><input type="text" name="carNumber" id="carNumber" /></td>
					</tr>
					<tr>
						<td>汽车类型:</td>
						<td><input type="text" name="carType" /></td>
					</tr>
					<tr>
						<td>颜色:</td>
						<td><input type="text" name="color" id="shouldPayPrice" /></td>
					</tr>
					
					<tr>
						<td>价格:</td>
						<td><input type="text" name="price"  /></td>
					</tr>
					
					<tr>
						<td>租金:</td>
						<td><input type="text" name="rentPrice" id="rentPrice"/></td>
					</tr>
					<tr>
						<td>押金:</td>
						<td><input type="text" name="deposit" id="deposit"/></td>
					</tr>
					<tr>
						<td>出租状态:</td>
						<td><input type="radio" name="isrenting" id="isrenting" value="1"/>已出租</td>
					</tr>
					<tr>
						<td>描述:</td>
						<td><input type="text" name="description" id="description"/></td>
					</tr>
				</table>
			</form>
			</div>
		<div id="div2" style="margin-top:100px ;margin-left:300px;float: left">
			客户信息：<form id="fm2"  method="post" >
				
				<table>
					
					<tr>
						<td>身份证:</td>
						<td><input type="text" name="identity"  /></td>
					</tr>
					<tr>
						<td>姓名:</td>
						<td><input type="text" name="custName" /></td>
					</tr>
					<tr>
						<td>性别:</td>
						<td><input type="text" name="sex"  /></td>
					</tr>
					<tr>
						<td>地址:</td>
						<td><input type="text" name="address" /></td>
					</tr>
					<tr>
						<td>电话:</td>
						<td><input type="text" name="phone"  /></td>
					</tr>
					
					<tr>
						<td>职业:</td>
						<td><input type="text" name="career"/></td>
					</tr>
					
				</table>
			</form>
		</div>
	</div>
	<!-- 对话框中的按钮 -->
	<div id="dlgBtn">
		<a id="btnOk" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">入库</a>
		<a id="btnNo" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>
	</div>
</body>
</html>
