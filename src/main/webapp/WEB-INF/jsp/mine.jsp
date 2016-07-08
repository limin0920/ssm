<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mine.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=basePath%>css/public.css" rel="stylesheet" type="text/css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  	<div id="dcMain">
		<!-- 当前位置 -->
		<div id="urHere">
			长沙ETC客户关系管理中心<b>></b><strong>个人中心</strong>
		</div>
		<div class="mainBox"
			style="height:auto!important;height:550px;min-height:550px;">
			<h3>
				<a class="actionBtn edit" href="frame/editMyInfo.do">修改个人信息</a>
				个人中心
			</h3>
			<table class="tableBasic" width="100%" border="0" cellpadding="8" cellspacing="0">
				<tr>
					<td>姓名</td>
					<td>${loginper.pName}</td>
				</tr>
				<tr>
					<td>性别</td>
					<td>${loginper.pSex}</td>
				</tr>
				<tr>
					<td>身份证号码</td>
					<td>${loginper.pCardid}</td>
				</tr>
				<tr>
					<td>所属部门</td>
					<td>${loginper.did}</td>
				</tr>
				<tr>
					<td>学历</td>
					<td>${loginper.pEducation}</td>
				</tr>
				<tr>
					<td>工资卡号</td>
					<td>${loginper.pCard}</td>
				</tr>
				<tr>
					<td>登录名</td>
					<td>${loginper.pLoginid}</td>
				</tr>
				<tr>
					<td>工作年限</td>
					<td>${loginper.pMariage}</td>
				</tr>
				<tr>
					<td>地区</td>
					<td>${loginper.pAddress}</td>
				</tr>
				<tr>
					<td>电话号码</td>
					<td>${loginper.pTel}</td>
				</tr>
				<tr>
					<td>qq</td>
					<td>${loginper.pQq}</td>
				</tr>
				<tr>
					<td>工作邮箱</td>
					<td>${loginper.pPos}</td>
				</tr>
			</table>
		</div>
	</div>
  </body>
</html>
