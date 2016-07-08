<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			长沙ETC客户关系管理中心<b>></b>个人中心<b>></b><strong>修改个人信息</strong>
		</div>
		<div class="mainBox"
			style="height:auto!important;height:550px;min-height:550px;">
			<h3>
				修改个人信息
			</h3>
		<form action="sale/updataMyInfo.do" method="post" onsubmit="return check_editPerInfo()">
		<input name="pid" type="hidden" value="${loginper.pid }">
	  		<table class="tableBasic" width="100%" border="0" cellpadding="8" cellspacing="0">
	  			<tr>
	  				<td>姓名</td>
	  				<td>${loginper.pName}</td>
	  				<td>工资卡号</td>
					<td><input type="text" id="pCard" maxlength="25" name="pCard" value="${loginper.pCard}" onkeyup="value=value.replace(/[^\d]/g,'')" onfocus="focusdata(this)"/></td>
	  			</tr>
	  			<tr>
					<td>性别</td>
					<td>${loginper.pSex}</td>
					<td>登录名</td>
					<td>${loginper.pLoginid}</td>
				</tr>
				<tr>
					<td>身份证号码</td>
					<td><input type="text" id="pCardid" name="pCardid" value="${loginper.pCardid}" maxlength="18" required onfocus="focusdata(this)"/></td>
					<td>工作年限</td>
					<td><input type="text" name="pMariage" value="${loginper.pMariage}" onfocus="focusdata(this)"/></td>
				</tr>
				<tr>
					<td>所属部门</td>
					<td>
						${loginper.did}
					</td>
					<td>地址</td>
					<td><input type="text" name="pAddress" value="${loginper.pAddress}" onfocus="focusdata(this)"/></td>
				</tr>
				<tr>
					<td>学历</td>
					<td><input type="text" name="pEducation" value="${loginper.pEducation}" onfocus="focusdata(this)"/></td>
					<td>电话号码</td>
					<td><input type="text" id="pTel" name="pTel"  maxlength="11" onkeyup="value=value.replace(/[^\d]/g,'')" required value="${loginper.pTel}" onfocus="focusdata(this)"/></td>
				</tr>
				<tr>
					<td>qq</td>
					<td><input type="text" name="pQq" value="${loginper.pQq}" onkeyup="value=value.replace(/[^\d]/g,'')" onfocus="focusdata(this)"/></td>
					<td>工作邮箱</td>
					<td><input type="text" id="pPos" name="pPos" maxlength="20" required value="${loginper.pPos}" onfocus="focusdata(this)"/></td>
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
