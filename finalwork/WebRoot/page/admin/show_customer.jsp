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
    
    <title>My JSP 'show_customer.jsp' starting page</title>
    
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
    <div class="container">
    	<table class="table">
    		<tr>
    			<td>id</td><td>用户名</td> <td>会员类型</td>
    		</tr>
    		<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     			url="jdbc:mysql://localhost:3306/javafinal?useUnicode=true&characterEncoding=UTF8"
     				user="root"  password=""/>
     		<c:if test="${param.type==123}">
     			<c:set var="mysql" scope="page" value="select * from customer where type>0"></c:set>
     		</c:if>
     		<c:if test="${param.type!=123}">
     			<c:set var="mysql" scope="page" value="select * from customer where type=${param.type}"></c:set>
     		</c:if>
			<sql:query dataSource="${snapshot}" var="result" sql="${mysql}"></sql:query>
			<c:forEach var="row" items="${result.rows}">
				<tr>
					<td>${row.uid}</td>
					<td>${row.uname}</td>
					<c:choose>
						<c:when test="${row.type==1}"><td>白银会员</td></c:when>
						<c:when test="${row.type==2}"><td>黄金会员</td></c:when>
						<c:when test="${row.type==3}"><td>青铜会员</td></c:when>
					</c:choose>
				</tr>
			</c:forEach>
    	</table>
    </div>
  </body>
</html>
