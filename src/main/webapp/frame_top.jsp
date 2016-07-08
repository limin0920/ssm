<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'frame_top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link href=" <%=basePath %>css/public.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<%=basePath %>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/global.js"></script>
  </head>
  
  <body>

	<div id="dcWrap">
		<div id="dcHead">
			<div id="head">
				<div class="logo">
					<a href="index.html">
						<img src="<%=basePath %>images/dclogo.gif" alt="logo">
					</a>
				</div>
				<div class="nav">
					<ul>
						<li>
							<a href="frame/customer_manager.do" target="main">客户信息</a>
						</li>
						<li>
							<a href="frame/employee_manager.do" target="main">员工信息</a>
						</li>
						<li>
							<a href="#" target="_blank">报表</a>
						</li>
					</ul>
					<ul class="navRight">
						<li  class="noRight">
							<a href="JavaScript:void(0);">您好，${loginper.pName }</a>
						</li>
						<li class="noRight">
							<a href="frame/editPwd.do" target="main">更改密码</a>
						</li>
						<li class="noRight">
							<a href="sale/cancellation.do" target="_top">退出</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- dcHead 结束 -->
		</div>

</body>
</html>
