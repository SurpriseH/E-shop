<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'manage_order.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/my.css">
  </head>
  
  <body>
    <div class="container">
    	<div class="navbar">
  			<div class="navbar-inner">
  				<a class="brand" href="page/index.jsp">首页</a>
  				<ul class="nav">
  					<li><a href="page/admin/manage_customer.jsp">会员管理</a></li>
  					<li><a href="page/admin/manage_trade.jsp">商品管理</a></li>
  					<li><a href="page/admin/manage_order.jsp">订单管理</a></li>
  				</ul>
  			</div>
  		</div>
    	<div class="container-fluid">
   			<div class="row-fluid">
   				<div class="span2" style="background-color: #bbd8e9; border-radius:4px 4px 4px 4px; height:650px;">
   				<a href="page/admin/check_customer_order.jsp" class="span2_a" target="iframe_a" style="margin-top:40px;">用户订单</a>
   				<a href="page/admin/check_trade_order.jsp" class="span2_a" target="iframe_a">商品订单</a>
   				</div>
   				<div class="span10" style="border-radius:4px 4px 4px 4px; height:650px;">
   					<iframe name="iframe_a" style="width:100%;height:100%;" frameborder=0></iframe>
   				</div>
   			</div>
   		</div>
    </div>
  </body>
</html>
