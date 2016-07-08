<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>

    This is my JSP page. <br>
    <!-- <a href="result.do">插入</a> -->
    <form action="login.do" method="post">
    	<label>用户名：</label><input type="text" />
    	<label>密码：</label><input type="password" />
    	<input type="radio" name="role" value="1" checked="checked"/>销售
		<input type="radio" name="role" value="2" />经理
		<input type="radio" name="role" value="3" />管理员
		<input type="submit" value="登录">
    </form>
    
  </body>
</html>
