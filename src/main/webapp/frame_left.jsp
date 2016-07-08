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
    
    <title>My JSP 'frame_left.jsp' starting page</title>
    
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
	<div id="dcLeft">
		<div id="menu">
			<ul class="top">
				<li>
					<a href="index.html" target="main">
						<i class="home"></i><em>管理首页</em>
					</a>
				</li>
			</ul>
			<ul>
				<li>
					<a href="frame/customer_manager.do" target="main">
						<i class="productCat"></i><em>客户管理</em>
					</a>
				</li>
				<li>
					<a href="frame/employee_manager.do" target="main">
						<i class="articleCat"></i><em>员工管理</em>
					</a>
				</li>
				<li>
					<a href="frame/business_code.do" target="main">
						<i class="theme"></i><em>业务管理</em>
					</a>
				</li>
				<c:choose>
					<c:when test="${loginper.pPart eq '0' }">
						<li>
							<a href="frame/admin_manager.do" target="main">
								<i class="manager"></i><em>管理员</em>
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="frame/showMe.do" target="main">
								<i class="manager"></i><em>个人中心</em>
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
			<!-- <ul>
				<li>
					<a href="product_category.html" target="main">
						<i class="productCat"></i><em>商品分类</em>
					</a>
				</li>
				<li>
					<a href="product.html" target="main">
						<i class="product"></i><em>商品列表</em>
					</a>
				</li>
			</ul>
			<ul>
				<li>
					<a href="article_category.html" target="main">
						<i class="articleCat"></i><em>文章分类</em>
					</a>
				</li>
				<li>
					<a href="article.html" target="main">
						<i class="article"></i><em>文章列表</em>
					</a>
				</li>
			</ul>
			<ul class="bot">
				<li>
					<a href="backup.html" target="main">
						<i class="backup"></i><em>数据备份</em>
					</a>
				</li>
				<li>
					<a href="mobile.html" target="main">
						<i class="mobile"></i><em>手机版</em>
					</a>
				</li>
				<li>
					<a href="theme.html" target="main">
						<i class="theme"></i><em>设置模板</em>
					</a>
				</li>
				<li>
					<a href="manager.html" target="main">
						<i class="manager"></i><em>网站管理员</em>
					</a>
				</li>
				<li>
					<a href="manager.php?rec=manager_log">
						<i class="managerLog"></i><em>操作记录</em>
					</a>
				</li>
			</ul> -->
		</div>
	</div>
</body>
</html>
