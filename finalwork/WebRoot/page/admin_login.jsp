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
    
    <title>管理员入口</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/my.css">
	<script type="text/javascript" src="js/my.js"></script>
  </head>
  
  <div class="container">
  		<div class="navbar">
  			<div class="navbar-inner">
  				<a class="brand" href="page/admin_login.jsp">管理员</a>
  				<ul class="nav">
  				</ul>
  			</div>
  		</div>
    	<div class="hero-unit">
    	
    		<c:if test="${sessionScope.admin_haslogin==1}">
    			<c:redirect url="/page/admin/index.jsp"/>
    		</c:if>
    		    <form class="form-horizontal" name="adminLoginForm" action="page/admin/index.jsp" method="post">
      				<div class="control-group">
       					<label class="control-label">username:</label>
        				<div class="controls">
         			 		<input type="text" name="username">
       					</div>
      				</div>
      				<div class="control-group">
       					<label class="control-label">password:</label>
        				<div class="controls">
         			 		<input type="password" name="password">
       					</div>
      				</div>
      				<div class="control-group">
       					<label class="control-label"></label>
        				<div class="controls">
         			 		<input type="button" value="sign in" onclick="adminLogin()" class="btn">
       					</div>
      				</div>
   				</form>
    	</div>
    </div>
</html>
