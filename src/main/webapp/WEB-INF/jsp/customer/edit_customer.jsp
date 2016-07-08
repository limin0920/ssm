<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add_customer.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link href="<%=basePath%>css/public.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<%=basePath %>myjs/editInfo.js"></script>
	<script type="text/javascript" src="<%=basePath %>myjs/editInfo.js"></script>
  </head>
  
  <body>
  	<div id="dcMain">
		<!-- 当前位置 -->
		<div id="urHere">
			长沙ETC客户关系管理中心<b>></b>个人中心<b>></b><strong>修改客户信息</strong>
		</div>
		<div class="mainBox"
			style="height:auto!important;height:550px;min-height:550px;">
			<h3>
				修改客户信息
			</h3>
  
  		<form action="customer/edit_customer.do" method="post">
  			<input type="hidden" name="uid" value="${user.uid }">
	  		<table class="tableBasic" width="100%" border="0" cellpadding="8" cellspacing="0">
	  			<tr>
	  				<td>姓名</td>
	  				<td>${user.uname }</td>
	  			</tr>
	  			<tr>
						<td>学校</td>
						<td><input type="text" value="${user.uschool }" name="uschool" onfocus="focusdata(this)" maxlength="30" onkeyup="value=value.replace(/[ -~]/g,'')"/></td>
					</tr>
					<tr>
						<td>专业</td>
						<td><input type="text" value="${user.umajor }" name="umajor" onfocus="focusdata(this)" maxlength="20" onkeyup="value=value.replace(/[ -~]/g,'')"/></td>
					</tr>
					<tr>
						<td>年级</td>
						<td><input type="text" value="${user.uclass }" name="uclass" onfocus="focusdata(this)" maxlength="10"/></td>
					</tr>
					<tr>
						<td>电话</td>
						<td><input type="text" value="${user.utel }" name="utel" onfocus="focusdata(this)" maxlength="11" onkeyup="value=value.replace(/[^\d]/g,'')"/></td>
					</tr>
					<tr>
						<td>备注</td>
						<td><textarea name="uremark" rows="3" cols="15" onfocus="focusdata(this)">${user.uremark }</textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" class="btn" value="确定">
						</td>
					</tr>
	  		</table>
  		</form>
  	</div>
</div>
  </body>
</html>
