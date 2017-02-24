<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户订单</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/my.css">
	<script type="text/javascript" src="js/my.js"></script>
  </head>
  
  <body>
     <div class="container">
    	<div class="hero-unit">
    		<h4>请输入用户名或者用户id</h4>
    		<form class="form-horizontal" name="checkCustomerOrderForm" action="page/admin/show_customer_order.jsp" method="post">
      			<div class="control-group">
       				<label class="control-label">用户名:</label>
        			<div class="controls">
         			 	<input type="text" name="uname">
       				</div>
      			</div>
      			<div class="control-group">
       				<label class="control-label">用户id:</label>
        			<div class="controls">
         					<input type="text" name="uid">
       				</div>
      			</div>
      			<div class="control-group">
       				<label class="control-label"></label>
        			<div class="controls">
         					<input type="button" value="查询" onclick="checkCustomerOrder()" class="btn btn-info">
       				</div>
      			</div>
   			</form>
    	</div>
    </div>
  </body>
</html>
