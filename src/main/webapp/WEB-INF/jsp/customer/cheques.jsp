<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>核对收款信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="<%=basePath%>css/public.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
    <div id="dcMain">
		<!-- 当前位置 -->
		<div id="urHere">
			长沙ETC客户关系管理中心<b>></b>客户管理<b>></b><strong>核对收款信息</strong>
		</div>
		<div class="mainBox"
			style="height:auto!important;height:550px;min-height:550px;">
			<h3>
				核对收款信息
			</h3>
			
			<table class="tableBasic" width="100%" border="0" cellpadding="8" cellspacing="0">
				<tr>
					<td>客户姓名：</td>
					<td>${requestScope.uname }</td>
					<td>缴费金额：</td>
					<td>学费：${codeInfo.cpay }&nbsp;&nbsp;住宿费：${codeInfo.chostel }</td>
				</tr>
				<tr>
					<td>客户类型：</td>
					<td>${codeInfo.ctype }</td>
					<td>所属区域：</td>
					<td>${codeInfo.carea }</td>
				</tr>
				<tr>
					<td>一线销售：</td>
					<td>${codeInfo.conesale }</td>
					<td>二线销售：</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>收款时间：</td>
					<td><input type="text"/></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
  </body>
</html>
