<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
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
    
    <title>欢迎</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/my.css">
	<script type="text/javascript" src="js/my.js"></script>
  </head>
  <c:if test="${sessionScope.customer_id!=null}">
  	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/javafinal?useUnicode=true&characterEncoding=UTF8"
     user="root"  password=""/>
     <c:set var="mysql" scope="page" value="select * from customer where uid=${sessionScope.customer_id}"></c:set>
	<sql:query dataSource="${snapshot}" var="result" sql="${mysql}"></sql:query>
	<c:set var="customer_type" scope="session" value="${result.rows[0].type}"></c:set>
  </c:if>

  <body>
   	<div class="container">
   		<div class="navbar">
   			<div class="navbar-inner">
   				<a class="brand" href="page/index.jsp">首页</a>
   					<ul class="nav">
   						<li>
   							<a>欢迎，<c:out value="${sessionScope.customer_name}"></c:out>
   							<c:if test="${result.rows[0].type>0}">
   							<c:choose>
   								<c:when test="${result.rows[0].type==1}">（白银会员） </c:when>
   								<c:when test="${result.rows[0].type==2}">（黄金会员）</c:when>
   								<c:when test="${result.rows[0].type==3}">（钻石会员）</c:when>
   							</c:choose>
   							</c:if>
   							</a>
   						</li>
   						<li style="margin-left:550px;">
   							<a href="servlet/LoginOutServlet">注销</a>
						</li>
   					</ul>
   			</div>
   		</div>
   		<div class="container-fluid">
   			<div class="row-fluid">
   				<div class="span2" style="background-color: #bbd8e9; border-radius:4px 4px 4px 4px; height:650px;">
   				<a href="page/alltrade.jsp" class="span2_a">全部商品</a>
   				<a href="page/shopping_cart.jsp" class="span2_a">购物车</a>
   				<a href="page/order_history.jsp" class="span2_a">历史订单</a>
   				<c:if test="${sessionScope.customer_isadmin==1}">
   					<a href="page/admin_login.jsp" class="span2_a">管理员入口</a>
   				</c:if>
   				</div>
   				<div class="span10" style="border-radius:4px 4px 4px 4px; height:650px;">
   					<form class="form-horizontal" action="page/searchtrade.jsp" style="margin-top:10px;margin-left:20px;" method="get" name="searchform">
   						<table>
   							<tr>
   								<td>商品名：</td>
   								<td><input type="text" name="tradename" class="input-small"></td>
   							</tr>
   							<tr>
   								<td>价格区间：</td>
   								<td>
   								<input type="text" name="price1" style="width:40px;">
   								~<input type="text" name="price2" style="width:40px;">
   								</td>
   							</tr>
   							<tr>
   								<td></td>
   								<td><input type="button" class="btn btn-info" onclick="search()" value="查找"></input></td>
   							</tr>
   						</table>
   					</form>
   				</div>
   			</div>
   		</div>
   	</div>
  </body>
</html>
