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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/my.css">
  </head>
  
  <body>
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     	url="jdbc:mysql://localhost:3306/javafinal?useUnicode=true&characterEncoding=UTF8"
     	user="root"  password=""/>
     	<c:if test="${not empty param.tname}">
     		<c:set var="mysql" value="select * from order_history,trade where trade.tname='${param.tname}' and trade.tid=order_history.tid group by date"></c:set>
     		<c:set var="name" value="${param.tname}"></c:set>
     	</c:if>
     	<c:if test="${not empty param.tid}">
     		<c:set var="mysql" value="select * from order_history,trade where order_history.tid='${param.tid}' and order_history.tid=trade.tid group by date"></c:set>
     	</c:if>
     	<sql:query dataSource="${snapshot}" var="result" sql="${mysql}"></sql:query>
     	<c:if test="${not empty param.tid}">
     		<c:set var="name" value="${result.rows[0].tname}"></c:set>
     	</c:if>
    <div class="container">
    	<h4 style="margin-left:30%;">${name}的订单</h4>
    	<c:forEach var="row" items="${result.rows}">
    	<div class="hero-unit" style="width:60%;">
    		<c:if test="${not empty param.tname}">
     			<c:set var="mysql" value="select * from order_history,customer,trade where trade.tname='${param.tname}' and trade.tid=order_history.tid and order_history.tid=trade.tid and date='${row.date}'"></c:set>
     		</c:if>
     		<c:if test="${not empty param.tid}">
     			<c:set var="mysql" value="select * from order_history,trade,customer where trade.tid='${param.tid}' and date='${row.date}' and order_history.tid=trade.tid and order_history.uid=customer.uid"></c:set>
     		</c:if>
    		<sql:query dataSource="${snapshot}" var="result2" sql="${mysql}"></sql:query>
    		<table class="table">
    		<caption>${row.date}的订单</caption>
    		<tr>
    			<td>用户名</td> <td>商品名</td> <td>商品数量</td> <td>商品折扣</td> <td>商品单价</td>
    		</tr>
    		<c:forEach var="row2" items="${result2.rows}">
    			<tr>
    				<td>${row2.uname}</td>
    				<td>${row2.tname}</td>
    				<td>${row2.tcount}</td>
    				<td>${row2.hisdiscount}</td>
    				<td>${row2.price}</td>
    			</tr>
    		</c:forEach>
    		</table>
    	</div>
    	</c:forEach>
    </div>
  </body>
</html>
