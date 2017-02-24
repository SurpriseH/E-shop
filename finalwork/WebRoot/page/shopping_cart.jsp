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
    
    <title>购物车</title>
    
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
     		<c:set var="mysql" scope="page" value="select * from shopping_cart,customer,trade where shopping_cart.uid=customer.uid 
     		and shopping_cart.tid=trade.tid and shopping_cart.uid=${sessionScope.customer_id}"></c:set>
			<sql:query dataSource="${snapshot}" var="result" sql="${mysql}"></sql:query>
			<table class="table table-striped">
				<thead>
					<tr>
						<td>商品名</td> <td>商品数量</td> <td>商品折扣</td> <td>商品单价</td>
					</tr>
				</thead>
				<c:set var="total" value="0"></c:set>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td><c:out value="${row.tname}"></c:out></td>
						<td><c:out value="${row.tcount}"></c:out></td>
						<td><c:out value="${row.hisdiscount}"></c:out></td>
						<td><c:out value="${row.price}"></c:out></td>
						<td>
							<form action="servlet/ChangeTradeCountInShoppingCart" method="post" class="form-inline" name="changeCount">
								<input type="text" name="tcount" style="width:40px;" placeholder="数量"/>
								<input type="hidden" name="uid" value="${sessionScope.customer_id}">
								<input type="hidden" name="tid" value="${row.tid}">
								<a onclick="changeTCount()">修改</a>
							</form>
						</td>
						<td><a href="servlet/DeleteTradeFromShoppingCart?uid=${sessionScope.customer_id}&tid=${row.tid}">删除</a></td>
						<fmt:parseNumber var="cash" type="number" value="${row.price*row.hisdiscount*row.tcount/10}"></fmt:parseNumber>
						<c:set var="total" value="${total+cash}"></c:set>	
						<c:set var="str" value="${str}${row.tid},${row.tcount},${row.hisdiscount},${row.price};"></c:set>
					</tr>
				</c:forEach>
					<tr><td><p></p></td><td><p></p></td><td><p></p></td><td><p></p></td><td><p></p></td><td><p></p></td></tr>
					<tr>
						<td>总金额：${total}元</td>
						<td>
							<form action="servlet/SubmitOrderServlet" method="post" name="submitOrderForm">
								<input type="hidden" name="string" value="${str}">
								<input type="hidden" name="uid" value="${sessionScope.customer_id}">
								<input type="button" value="提交订单" class="btn btn-info" onclick="submitOrder()">
							</form>
						</td>
					</tr>
			</table>
    	</div>
    </div>
  </body>
</html>
