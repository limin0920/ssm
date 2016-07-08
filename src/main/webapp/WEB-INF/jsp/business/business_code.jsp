<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<link href="<%=basePath %>css/public.css" rel="stylesheet" type="text/css">
<link href=" <%=basePath %>css/add_stu.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=basePath %>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/global.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery.autotextarea.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery.tab.js"></script>
<script type="text/javascript" src="<%=basePath %>js/add_stu.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#back").hide();
		$("#add_stu").hide();
		
	})
	
	
</script>
<style> 
  .black_overlay{ 
            display: none; 
            position: absolute; 
            top: 0%; 
            left: 0%; 
            width: 100%; 
            height: 100%; 
            background-color: black; 
            z-index:1001; 
            -moz-opacity: 0.8; 
            opacity:.80; 
            filter: alpha(opacity=88); 
        } 
    .black_overlay1{ 
            display: none; 
            position: absolute; 
            top: 0%; 
            left: 0%; 
            width: 100%; 
            height: 100%; 
            background-color: black; 
            z-index:1001; 
            -moz-opacity: 0.8; 
            opacity:.80; 
            filter: alpha(opacity=88); 
        } 
 .white_content { 
            display: none; 
            position: absolute; 
            top: 10%; 
            left: 20%; 
            width: 60%; 
            height: 60%; 
            padding: 20px; 
            border: 2px solid red; 
            background-color: white; 
            z-index:1002; 
            overflow: auto; 
        } 
  .win_content { 
            display: none; 
            position: absolute; 
            top: 10%; 
            left: 20%; 
            width: 60%; 
            height: 60%; 
            padding: 20px; 
            border: 2px solid red; 
            background-color: white; 
            z-index:1002; 
            overflow: auto; 
        } 
        
        
    </style> 
</head>

<body>

	<div id="dcMain">
   	<!-- 当前位置 -->
		<div id="urHere">长沙ETC客户关系管理中心<b>></b><strong>业务管理</strong></div>   
		<div class="mainBox" style="height:auto!important;height:550px;min-height:550px;">
	    	<h3><a class="actionBtn add" onclick="ShowDiv('MyDiv','fade')">新增</a>业务管理</h3>
		    <script type="text/javascript">
		     	$(function(){ $(".idTabs").idTabs(); });
		    </script>
			<div class="idTabs">
				<ul class="tab">
					<li>
						<a href="#customer_info">签单信息</a>
					</li>
					<li>
						<a href="#customer_status">收款信息</a>
					</li>
				</ul>
				<div class="#customer_info">
					<form action="" method="post"
						enctype="multipart/form-data">
						<div id="customer_info">
							<table width="100%" border="0" cellpadding="8" cellspacing="0"
								class="tableBasic">
								<tr>
									<th>签单编号</th>
									<th>签单人员</th>
									<th>被签单人</th>
									<th>签单部门</th>
									<th>一线销售</th>
									<th>二线销售</th>
									<th>是否签单</th>
									<th>签单区域</th>
									<th>操作</th>
								</tr>
								<tr>
									<td align="center">1</td>
									<td align="center">王二</td>
									<td align="center">李四</td>
									<td align="center">销售</td>
									<td align="center">妹子1号</td>
									<td align="center">帅哥2号</td>
									<td align="center">是</td>
									<td align="center">湖南</td>
									<td align="center">
										<a href = "javascript:void(0)" onclick = "document.getElementById('MyDiv').style.display='block';document.getElementById('fade').style.display='block'">编辑</a>
									</td>
							</tr>
							</table>
						</div>
						<div id="customer_status" >
							<table width="100%" border="1" cellpadding="8" cellspacing="0"
								class="tableBasic">
								<tr>
									<th>收款编号</th>
									<th>签单缴费</th>
									<th>住宿费</th>
									<th>退费</th>
									<th>合计</th>
									<th>备注</th>
								</tr>
							

							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
 	</div>
 	
 	<!--弹出层时背景层DIV-->	
	<div id="fade" class="black_overlay"></div>
	<div id="MyDiv" class="white_content">
		<div style="text-align: right; cursor: default; height: 40px;">
			<span style="font-size: 16px;" onclick="CloseDiv('MyDiv','fade')">关闭</span>
		</div>
		<p align="center" style="font-size: 18px">新增签单信息</p>
		<form action="" method="post">
			
 			<table align="center" border="1" >	
					<tr>
						<td>
							<label>签单编号</label>
						</td>
						<td>
							<input type="text" name="code_id" id="code_id"  >
						</td>
					</tr>
					<tr>
						<td>
							<label>签单人员</label>
						</td>
						<td>
							<input type="text" name="code_person" id="code_person"  >
						</td>
					</tr>
					<tr>
						<td>
							<label>被签单人</label>
						</td>
						<td>
							<input type="text" name="code_user" id="code_user"  >
						</td>
					</tr>
					<tr>
						<td>
							<label>签单部门</label>
						</td>
						<td>
							<input type="text" name="code_department" id="ode_department ">
						</td>
					</tr>
					<tr>
						<td>
							<label>一线销售</label>
						</td>
						<td>
							<input type="text" name="one_code" id="one_code"  >
						</td>
					</tr>
					<tr>
						<td>
							<label>二线销售</label>
						</td>
						<td>
							<input type="text" name="two_code" id="two_code"  >
						</td>
					</tr>
					<tr>
						<td>
							<label>是否签单</label>
						</td>
						<td>
							<input type="text" name="code_if" id="code_if"  >
						</td>
					</tr>
					<tr>
						<td>
							<label>签单缴费</label>
						</td>
						<td>
							<input type="text" name="code_if" id="code_if"  >
						</td>
					</tr>
					<tr>
						<td>
							<label>住  &nbsp; 宿&nbsp;费</label>
						</td>
						<td>
							<input type="text" name="code_if" id="code_if"  >
						</td>
					</tr>
					<tr>
						<td>
							<label>实交费用</label>
						</td>
						<td>
							<input type="text" name="code_if" id="code_if"  >
						</td>
					</tr>
					<tr >
						<td >
							<input type="submit" name="update" id="update">
						
						</td>
						<td>
						 <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">取消</a>							
						</td>
					</tr>
					
				</table>
			
		</form>
			</div>
</body>
</html>
