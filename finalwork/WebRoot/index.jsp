<%@page import="szu.hong.web.domain.Customer"%>
<%@page import="szu.hong.web.service.CustomerService"%>
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
    
    <title>网上商城</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<script type="text/javascript" src="js/my.js"></script>
  </head>
  
  <body>
	<c:if test="${not empty cookie.customer_id.value}">
		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     	url="jdbc:mysql://localhost:3306/javafinal?useUnicode=true&characterEncoding=UTF8"
     	user="root"  password=""/>
		<sql:query dataSource="${snapshot}" var="result" sql="select * from customer where uid='${cookie.customer_id.value}';"></sql:query>
		<c:forEach var="row" items="${result.rows}">
			<c:set var="customer_id" scope="session" value="${row.uid}"></c:set>
			<c:set var="customer_name" scope="session" value="${row.uname}"></c:set>
			<c:set var="customer_isadmin" scope="session" value="${row.admin}"></c:set>
		</c:forEach>
	</c:if>
	<c:if test="${not empty sessionScope.customer_name}">
		<c:redirect url="page/index.jsp"/>
	</c:if>
   	<div class="container">
    	<ul class="nav nav-pills">
    		<li class="active">
    			<a href="#">首页</a>
    		</li>
    		<li><a href="addCust.jsp">添加客户</a></li>
    	</ul>
    	<hr>
    	<div class="hero-unit">
    		<h4>welcome!</h4>
    		<form action="servlet/LoginServlet" class="form-horizontal" method="post" name="loginform">
    			<div class="control-group">
    				<label class="control-label">姓名：</label>
    				<div class="controls">
      					<input type="text" name="name">
    				</div>
  				</div>
  				<div class="control-group">
    				<label class="control-label">密码：</label>
    				<div class="controls">
      					<input type="password" name="password">
    				</div>
  				</div>
  				<div class="control-group">
    				<label class="control-label"></label>
    				<div class="controls">
      				<label><input type="checkbox" name="remember" value="true"> 30天内自动登陆</label>
    				</div>
  				</div>
  				<div class="control-group">
    				<label class="control-label"></label>
    				<div class="controls">
      					<input type="button" class="btn btn-primary" value="提交" onclick="login()">
    				</div>
  				</div>
    		</form>
    	</div>
    </div>
  </body>
</html>
