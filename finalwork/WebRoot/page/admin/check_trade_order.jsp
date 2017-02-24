<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品订单</title>
    
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
    		<h4>请输入商品名或者商品id</h4>
    		<form class="form-horizontal" name="checkTradeOrderForm" action="page/admin/show_trade_order.jsp" method="post">
      			<div class="control-group">
       				<label class="control-label">商品名:</label>
        			<div class="controls">
         			 	<input type="text" name="tname">
       				</div>
      			</div>
      			<div class="control-group">
       				<label class="control-label">商品id:</label>
        			<div class="controls">
         					<input type="text" name="tid">
       				</div>
      			</div>
      			<div class="control-group">
       				<label class="control-label"></label>
        			<div class="controls">
         					<input type="button" value="查询" onclick="checkTradeOrder()" class="btn btn-info">
       				</div>
      			</div>
   			</form>
    	</div>
    </div>
  </body>
</html>
