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
    
    <title>查询商品</title>
    
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
   			<table class="table">
   				<tr>
   					<td><a href="page/admin/trade_count.jsp?" class="btn btn-info">库存数量最少的商品</a></td>
   					<td><a href="page/admin/trade_buycount.jsp" class="btn btn-info">购买数量最多的商品</a></td>
   				</tr>
   				<tr>
   					<td><br></td><td></td>
   				</tr>
   				<tr>
   					<td>
   						<form action="page/admin/trade_count.jsp" method="post" name="tradeBuyCountForm">
   							<table style="width:50%;">
   								<caption>查询商品库存数量</caption>
   								<tr><td>商品名：<input name="tname" type="text" style="width:100px;"></td></tr>
   								<tr><td>商品id：<input name="tid" type="text" style="width:100px;"></td></tr>
   								<tr><td><input type="button" value="查询" class="btn btn-info" onclick="checkBuyCount()"></td></tr>
   							</table>
   						</form>
   					</td>
   					<td>
   						<form action="page/admin/trade_buycount.jsp" method="post" name="tradeCountForm">
   							<table style="width:50%;">
   								<caption>查询商品购买数量</caption>
   								<tr><td>商品名：<input name="tname" type="text" style="width:100px;"></td></tr>
   								<tr><td>商品id：<input name="tid" type="text" style="width:100px;"></td></tr>
   								<tr><td><input type="button" value="查询" class="btn btn-info" onclick="checkCount()"></td></tr>
   							</table>
   						</form>
   					</td>
   				</tr>
   			</table>
   		</div>
   	</div>
  </body>
</html>
