<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'edit_pwd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="<%=basePath%>css/public.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript" src="<%=basePath %>/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>myjs/editInfo.js"></script>
  </head>
	
  <body>
  	<div id="dcMain">
		<!-- 当前位置 -->
		<div id="urHere">
			长沙ETC客户关系管理中心<b>></b><strong>修改登录密码</strong>
		</div>
		<div class="mainBox"
			style="height:auto!important;height:550px;min-height:550px;">
			<h3>
				修改登录密码
			</h3>
			<form action="sale/updatePwd.do" method="post" onsubmit="return checkPwd(${loginper.pid })" target="_parent">
				<input type="hidden" name="pid" value="${loginper.pid }"/>
				<table  class="tableBasic" width="100%" border="0" cellpadding="8" cellspacing="0">
					<tr>
						<td></td>
						<td>请输入原始密码</td>
						<td><input id="oldPwd" name="oldPwd" type="password" required ></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td>请输入新的密码</td>
						<td><input id="newPwd" name="pPassword" id="pPassword" maxlength="30" type="password" required></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td>情确认新的密码</td>
						<td><input id="rnewPwd" name="rnewpwd" id="rnewpwd" maxlength="30" type="password" required></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="4"><input type="submit" class="btn" value="确定"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
  </body>
</html>
