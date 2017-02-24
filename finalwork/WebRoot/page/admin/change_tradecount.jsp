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
    
    <title>My JSP 'change_tradecount.jsp' starting page</title>
    
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
	<script type="text/javascript" src="js/my.js"></script>
  </head>
  
  <body>
  	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/javafinal?useUnicode=true&characterEncoding=UTF8"
     user="root"  password=""/>
     <c:set var="mysql" value="select * from trade where tid=${param.tid}"></c:set>
     <sql:query dataSource="${snapshot}" var="result" sql="${mysql}"></sql:query>
    <div class="container">
    	<div class="hero-unit">
    		<c:forEach var="row" items="${result.rows}">
    			<form class="form-horizontal" name="checkTradeCountForm" action="servlet/ChangeTradeCountServlet" method="post">
    				<input type="hidden" value="${row.tid}" name="tid">
    				<div class="control-group">
       					<label class="control-label">商品名：</label>
        				<div class="controls">
         			 		<input type="text" value="${row.tname}" readOnly="true" style="height:30px;">
       					</div>
      				</div>
      				<div class="control-group">
       					<label class="control-label">库存</label>
        				<div class="controls">
         			 		<input type="text" name="count" value="${row.count}">
       					</div>
      				</div>
      				<div class="control-group">
       					<label class="control-label"></label>
        				<div class="controls">
         			 		<input type="button" value="修改" onclick="checkTradeCount()" class="btn btn-info">
       					</div>
      				</div>
   				</form>
    		</c:forEach>
    	</div>
    </div>
  </body>
</html>
