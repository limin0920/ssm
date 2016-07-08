<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'customer_management.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="<%=basePath%>css/datePicker.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/public.css" rel="stylesheet" type="text/css">
<link href=" <%=basePath%>css/add_stu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/pageGroup.css"/>

<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/global.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.autotextarea.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.tab.js"></script>
<script type="text/javascript" src="<%=basePath%>myjs/add_stu.js"></script>


<%-- <script type="text/javascript" src="<%=basePath%>js/jquery.date_input.pack.js"></script> --%>
</head>

<body>
	<input type="hidden" id="pagecount" value="${pages }">
	<input type="hidden" id="part" value="${loginper.pPart }">
	<div id="dcMain">
		<!-- 当前位置 -->
		<div id="urHere">
			长沙ETC客户关系管理中心<b>></b><strong>客户管理</strong>
		</div>
		<div class="mainBox"
			style="height:auto!important;height:550px;min-height:550px;">
			<h3>
				<c:if test="${loginper.pPart eq '1'}">  
					<a class="actionBtn add" onclick="ShowDiv('MyDiv','fade')">新增客户</a>
				</c:if>
				客户管理
			</h3>
			<script type="text/javascript">
				$(function() {
					$(".idTabs").idTabs();
				});
			</script>
			<div class="idTabs">
				<ul class="tab">
					<li>
						<a href="#customer_info" onclick="">客户信息</a>
					</li>
					<li>
						<a href="#customer_status" onclick="checkCustomerStatus(${loginper.pPart})">客户状态</a>
					</li>
					<li>
						<a href="#customer_from">客户来源</a>
					</li>
					<li>
						<a href="#customer_log">客户记录</a>
					</li>
					<li>
						<a href="#customer_contact">客户联系人</a>
					</li>
				</ul>
				<div class="#customer_info">
					<form action="" method="post" enctype="multipart/form-data">
						<div id="customer_info">
							<table width="100%" border="0" cellpadding="8" cellspacing="0"
								class="tableBasic" id="customerInfo">
								<tr>
									<th>姓名</th>
									<th>学校</th>
									<th>专业</th>
									<th>年级</th>
									<th>电话</th>
									<th>备注</th>
									<th>操作</th>
								</tr>
							<c:forEach items="${allCostomerInfo }" var="costomer" varStatus="status">
								<c:choose> 
									  <c:when test="${loginper.pPart eq '0' || loginper.pPart eq '2' }">   
										<tr>
											<td>${costomer.uname}</td>
											<td>${costomer.uschool }</td>
											<td>${costomer.umajor }</td>
											<td>${costomer.uclass }</td>
											<td>${costomer.utel }</td>
											<td>${costomer.uremark }</td>
											<td>没有操作权限 </td>
										</tr>
									</c:when> 
									<c:otherwise>   
										  <c:if test="${loginper.pid eq costomer.pid }">
											<tr>
												<td>${costomer.uname}</td>
												<td>${costomer.uschool }</td>
												<td>${costomer.umajor }</td>
												<td>${costomer.uclass }</td>
												<td>${costomer.utel }</td>
												<td>${costomer.uremark }</td>
												<td><a href="customer/selectOnecustomer.do?uid=${costomer.uid }">修改 </a></td>
											</tr>
										</c:if>
									 </c:otherwise> 
								</c:choose> 
							</c:forEach>
							</table>
						</div>
						
						<div id="customer_status">
							<table width="100%" border="0" cellpadding="8" cellspacing="0"
								class="tableBasic" id="customerStatusTable">
								
							</table>
						</div>
						<div id="customer_from">
							<table width="100%" border="0" cellpadding="8" cellspacing="0"
								class="tableBasic">
								<tr>
									<th width="131">名称</th>
									<th>内容</th>
								</tr>
							</table>
						</div>
						<div id="customer_log">
							<table width="100%" border="0" cellpadding="8" cellspacing="0"
								class="tableBasic">
								<tr>
									<th width="131">名称</th>
									<th>内容</th>
								</tr>
							</table>
						</div>
						<div id="customer_contact">
							<table width="100%" border="0" cellpadding="8" cellspacing="0"
								class="tableBasic">
								<tr>
									<th width="131">名称</th>
									<th>内容</th>
								</tr>
							</table>
						</div>
					</form>
				</div>
		</div>
		<div>
			<!-- <input type="text" ><input type="button" value="查询"> -->
			<div id="pageGro" class="cb">
				<div class="pageUp">上一页</div>
				    <div class="pageList">
				        <ul>
				            <li>1</li>
				            <li>2</li>
				            <li>3</li>
				            <li>4</li>
				            <li>5</li>
				        </ul>
				    </div>
			    <div class="pageDown">下一页</div>
			</div>
		</div>
		<script type="text/javascript" src="<%=basePath%>myjs/pageGroup.js"></script>
	</div>
	</div>

	<!--弹出层时背景层DIV-->
	<div id="fade" class="black_overlay"></div>
	<div id="MyDiv" class="white_content">

		<form id="payment" action="customer/addCustomer.do" method="post" onsubmit="return checkCoutomer()">
			<div style="text-align: right; cursor: default;">
				<span onclick="CloseDiv('MyDiv','fade')">×</span>
			</div>
			<fieldset>
				<legend>客户详细资料</legend>
				<ol>
					<li>
						<label for="uname">学生姓名：</label>
						<input id="uname" name="uname" type="text" placeholder="请输入用户名"
							required autofocus maxlength="20" onkeyup="value=value.replace(/[ -~]/g,'')">
					</li>
					<li>
						<label for="uschool">学校院系：</label>
						<input id="uschool" name="uschool" type="text" placeholder="请输入学校院系名称"
							required autofocus maxlength="30" onkeyup="value=value.replace(/[ -~]/g,'')">
					</li>
					<li>
						<label for="umajor">专业：</label>
						<input id="umajor" name="umajor" type="text" placeholder="请输入专业"
							required autofocus maxlength="20" onkeyup="value=value.replace(/[ -~]/g,'')">
					</li>
					<li>
						<label for="uclass">年级：</label>
						<input id="uclass" name="uclass" type="text" placeholder="请输入年级"
							required autofocus maxlength="10">
					</li>
					<li>
						<label for="utel">电话：</label>
						<input id="utel" name="utel" maxlength="11" onkeyup="value=value.replace(/[^\d]/g,'')"  type="tel"
							placeholder="010-12345678" required>
					</li>
					
					<li>
						<label for="whether_pay">是否签单：</label>
						<input type="radio" name="whether_pay" value="0" checked="checked" onclick="checkRadio(this,'no')">否
						<input type="radio" name="whether_pay" value="1" id="ispay" onclick="checkRadio(this,'yes')">是
					</li>
					<li id="paytime">
						<label for="cstime">签单时间：</label>
						<!-- <input type="text" name="cstime" id="cstime" class="date_picker"/> -->
						<input type="text" id="cstime" class="date_picker" placeholder="点击选择日期"/>
						<script type="text/javascript" src="<%=basePath %>>js/jquery.date_input.pack.js"></script> 
					</li>
					<li id="payli">
						<label for="ctype">业务类型和所属区域：</label>
						<select id="ctype" name="ctype">
							<option value="实习实训">实习实训</option>
							<option value="渠道培训">渠道培训</option>
							<option value="社招培训">社招培训</option>
							<option value="深度合作">深度合作</option>
							<option value="其他收入">其他收入</option>
						</select>
						<select id="carea" name="carea">
							<option value="湖南">湖南</option>
							<option value="湖北">湖北</option>
							<option value="广东">广东</option>
							<option value="广西">广西</option>
							<option value="云南">云南</option>
						</select>
					</li>
					<li id="paymoney">
						<label for="cpay">缴费金额：</label>
						<input id="cpay" name="cpay"  onkeyup="value=value.replace(/[^\d]/g,'')"  type="text"
							placeholder="16800" maxlength="10">￥
					</li>
					<li id="payhostel">
						<label for="chostel">住宿费：</label>
						<input id="chostel" name="chostel" maxlength="5" onkeyup="value=value.replace(/[^\d]/g,'')"  type="text"
							placeholder="500" >￥
					</li>
					<li>
						<label for="cremark">备注：</label>
						<textarea id="cremark" name="cremark"></textarea>
					</li>
				</ol>
			</fieldset>
			<div id="customerbtn">
				<button type="submit">确定</button>
				<button type="reset">取消</button>
			</div>
		</form>
	</div>
	<div class="clear"></div>
</body>
</html>
