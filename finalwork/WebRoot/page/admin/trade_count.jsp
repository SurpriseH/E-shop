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
    
    <title>My JSP 'trade_count.jsp' starting page</title>
    
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
    		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     			url="jdbc:mysql://localhost:3306/javafinal?useUnicode=true&characterEncoding=UTF8"
     			user="root"  password=""/>
     		<c:choose>
     			<c:when test="${empty param.tname and empty param.tid}">
     				<c:set var="mysql" value="select * from trade order by count limit 0,10"></c:set>
     			</c:when>
     			<c:otherwise>
     				<c:if test="${not empty param.tname}">
     					<c:set var="mysql" value="select * from trade where tname like '%${param.tname}%'order by count limit 0,10"></c:set>
     				</c:if>
     				<c:if test="${not empty param.tid}">
     					<c:set var="mysql" value="select * from trade where tid=${param.tid}"></c:set>
     				</c:if>
     			</c:otherwise>
     		</c:choose>
     		<sql:query dataSource="${snapshot}" var="result" sql="${mysql}"></sql:query>
     		<table class="table" style="width:80%">
     		<tr>
     			<td>商品id</td><td>商品名</td><td>商品库存</td><td></td>
     		</tr>
     		<c:forEach var="row" items="${result.rows}">
     			<tr>
     				<td>${row.tid}</td>
     				<td>${row.tname}</td>
     				<td>${row.count}</td>
     				<td><a href="page/admin/change_tradecount.jsp?tid=${row.tid}" class="btn btn-info">修改数量</a></td>
     			</tr>	
     		</c:forEach>
     		</table>
    	</div>
    </div>
  </body>
</html>
