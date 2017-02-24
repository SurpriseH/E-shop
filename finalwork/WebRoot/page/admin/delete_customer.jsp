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
    
    <title>My JSP 'delete_customer.jsp' starting page</title>
    
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
     <c:if test="${param.type==123}">
     	<c:set var="mysql" scope="page" value="update customer set type=0"></c:set>
     </c:if>
     <c:if test="${param.type!=123}">
     	<c:set var="mysql" scope="page" value="update customer set type=0 where type=${param.type}"></c:set>
     </c:if>
     <sql:update dataSource="${snapshot}" var="count" sql="${mysql}"></sql:update>
     <c:if test="${count==1}"><p>删除成功</p></c:if>
     <c:if test="${count!=1}"><p>删除失败</p></c:if>
  </body>
</html>
