<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>收款明细</title>
<link href=" <%=basePath %>css/public.css" rel="stylesheet" type="text/css">
	<link href=" <%=basePath %>css/add_stu.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<%=basePath %>js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/global.js"></script>
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
	<div id="urHere">长沙ETC客户关系管理中心<b>></b><strong>公司管理</strong></div>   
		<div class="mainBox" style="height:auto!important;height:550px;min-height:550px;">
	    	<h3><a class="actionBtn add" onclick="ShowDiv('MyDiv','fade')">新增</a>其他管理</h3>
		    <script type="text/javascript">
		     	$(function(){ $(".idTabs").idTabs(); });
		    </script>
			<div class="idTabs">
				<ul class="tab">
					<li>
						<a href="#customer_info">员工信息</a>
					</li>
					<li>
						<a href="#customer_status">部门信息</a>
					</li>
				</ul>
	
	<div class="#customer_info">
		<form action="" method="post">
			<div id="customer_info">
				<table width="100%" border="0" cellpadding="8" cellspacing="0"
					class="tableBasic">
				<tr>
					<th>员工编号</th>
					<th>员工姓名</th>
					<th>员工部门</th>
					<th>员工职业</th>
					<th>员工手机</th>
					<th>员工邮箱</th>
					<th>员工操作</th>
				</tr>
				<tr>
					<th>1</th>
					<th>员工</th>
					<th>部门</th>
					<th>职业</th>
					<th>手机</th>
					<th>邮箱</th>
					<th>
						<a href="">查看具体信息
					</th>
				</tr>
				</table>
			</div>
	<!-- 点击查看详细信息弹出div窗口 -->		
			<div  id="customer_status" >
				<table align="center"  width="100%" border="0" cellpadding="8" cellspacing="0"
					class="tableBasic">
					<tr>
						<th>部门编号</th>
						<th>部门名称</th>
						<th>部门描述</th>
						<th>备注</th>
						<th>操作</th>
					</tr>
					<tr>
						<td align="center">1</td>	
						<td align="center">啊啊啊</td>
						<td align="center">搞销售的</td>
						<td align="center">。。。。</td>
						<td align="center">
							<a href="">增加</a>|
							<a href="">修改</a>|
							<a href="">删除</a>
						</td>
					</tr>
				</table>
			</div>
	<!-- 点击编辑的时候弹出div层 -->		
			<div id="fade" class="black_overlay"></div> 	
			<div id="light" class="white_content" >
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
							<input type="submit" name="update" id="update"><label>更新</label>
						
						</td>
						<td>
						 <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">取消</a>							
						</td>
					</tr>
					
				</table>
			</div>
     
        <div id="fade" class="black_overlay"></div> 			
	</form>
	</div>
</body>
</html>