<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add_code.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="<%=basePath%>css/public.css" rel="stylesheet" type="text/css">
	<link href="<%=basePath%>css/datePicker.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
  </head>
  
  <body>
  	
    <div id="dcMain">
		<!-- 当前位置 -->
		<div id="urHere">
			长沙ETC客户关系管理中心<b>></b>客户管理<b>></b><strong>新增签单</strong>
		</div>
		<div class="mainBox" style="height:auto!important;height:550px;min-height:550px;">
			<h3>
				新增签单
			</h3>
			<form action="customer/addonecode.do" method="post">
			<input type="hidden" name="uid" value="${requestScope.customerid }">
			<input type="hidden" name="cdepartment" value="${loginper.did }">
			<input type="hidden" name="conesale" value="${loginper.pName }">
    		<table class="tableBasic" width="100%" border="0" cellpadding="8" cellspacing="0">
    			<tr>
    				<td>学生姓名：</td>
    				<td>${requestScope.customername }</td>
    				<td></td>
    				<td>签单时间：</td>
    				<td>
						<input type="text" id="cstime" class="date_picker" placeholder="点击选择日期" required/>
						<script type="text/javascript" src="<%=basePath %>>js/jquery.date_input.pack.js"></script> 
					</td>
    			</tr>
    			<tr>
    				<td>业务类型：</td>
    				<td>
						<select id="ctype" name="ctype">
							<option value="1">实习实训</option>
							<option value="2">渠道培训</option>
							<option value="3">社招培训</option>
							<option value="4">深度合作</option>
							<option value="5">其他收入</option>
						</select>
    				</td>
    				<td></td>
    				<td>所属区域：</td>
    				<td>
    					<select id="carea" name="carea">
							<option value="1">湖南</option>
							<option value="2">湖北</option>
							<option value="3">广东</option>
							<option value="4">广西</option>
							<option value="5">云南</option>
						</select>
    				</td>
    			</tr>
    			<tr>
    				<td>缴费金额：</td>
    				<td>
						<input id="cpay" name="cpay" onkeyup="value=value.replace(/[^\d]/g,'')"  type="text" required placeholder="16800" maxlength="10">
    				</td>
    				<td></td>
    				<td>住宿费：</td>
    				<td>
						<input id="chostel" name="chostel" maxlength="5" onkeyup="value=value.replace(/[^\d]/g,'')" required type="text" placeholder="500" >
    				</td>
    			</tr>
    			<tr>
    				<td>备注：</td>
    				<td>
						<textarea id="cremark" name="cremark"></textarea>
    				</td>
    				<td></td>
    				<td colspan="2"><input type="submit" value="确定" class="btn" ></td>
    			</tr>
    		</table>
    		</form>
    	</div>
    </div>
  </body>
</html>
