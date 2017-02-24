<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>历史订单</title>
    
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
    	<div class="navbar">
  			<div class="navbar-inner">
  				<a class="brand" href="page/index.jsp">首页</a>
  				<ul class="nav">
  					<li><a href="page/shopping_cart.jsp">购物车</a></li>
  					<li><a href="page/order_history.jsp">历史订单</a></li>
  				</ul>
  			</div>
  		</div>
    	<div class="hero-unit">
    		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     			url="jdbc:mysql://localhost:3306/javafinal?useUnicode=true&characterEncoding=UTF8"
     				user="root"  password=""/>
     		<c:set var="mysql" scope="page" value="select date from order_history where uid=${sessionScope.customer_id} group by date"></c:set>
			<sql:query dataSource="${snapshot}" var="result" sql="${mysql}"></sql:query>
			<c:forEach var="row" items="${result.rows}">
				<c:set var="mysql" scope="page" value="select * from order_history,trade where uid=${sessionScope.customer_id} and date='${row.date}' and order_history.tid=trade.tid"></c:set>
				<sql:query dataSource="${snapshot}" var="result2" sql="${mysql}"></sql:query>
				<table class="table table-striped">
					<caption>${row.date}的订单</caption>
					<tr>
						<td>商品名</td> <td>商品数量</td> <td>商品折扣</td> <td>商品单价</td>
					</tr>
					<c:set var="str" scope="page" value=""></c:set>
					<c:forEach var="row2" items="${result2.rows}">
						<tr>
							<td>${row2.tname}</td> <td>${row2.tcount}</td> <td>${row2.hisdiscount}</td> <td>${row2.price}</td>
						</tr>
						<c:set var="str" scope="page" value="${str}${row2.tid},${row2.tcount},${row2.hisdiscount},${row2.price},${row.date};"></c:set>
					</c:forEach>
					<tr>
						<td></td><td></td><td></td>
						<td>
							<form action="servlet/CancelOrderServlet" name="order_history_form" method="post">
								<input type="hidden" name="uid" value="${sessionScope.customer_id}">
								<input type="hidden" name="str" value="${str}">
								<input type="submit" value="取消订单" class="btn btn-info">
							</form>
						</td>
					</tr>
				</table>
				<br><br>
			</c:forEach>
    	</div>
    </div>
  </body>
</html>
