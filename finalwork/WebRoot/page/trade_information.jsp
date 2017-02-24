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
    
    <title>商品详情</title>
    
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
  <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/javafinal?useUnicode=true&characterEncoding=UTF8"
     user="root"  password=""/>
     <c:set var="mysql" scope="page" value="select * from trade where tid=${param.tradeid}"></c:set>
	<sql:query dataSource="${snapshot}" var="result" sql="${mysql}"></sql:query>
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
    		<div class="container-fluid">
   				<div class="row-fluid">
   					<c:forEach var="row" items="${result.rows}">
   					<div class="span6" style="background-color: #bbd8e9;">
   						<img alt="" src="${row.img}" class="trade_img_show">
   					</div>
   					<div class="span6">
   						<h4>【网上商城】${row.tname}</h4>
   						<c:set var="hisdiscount" scope="page" value="10"></c:set>
   						<c:if test="${row.discount==1}">
   							<c:choose>
   								<c:when test="${sessionScope.customer_type==0}">
   									您不是会员无法享受折扣。
   								</c:when>
   								<c:when test="${sessionScope.customer_type==1}">
   									白银会员-${row.discount_one}折
   									<c:set var="hisdiscount" scope="page" value="${row.discount_one}"></c:set>
   								</c:when>
   								<c:when test="${sessionScope.customer_type==2}">
   									黄金会员-${row.discount_two}折
   									<c:set var="hisdiscount" scope="page" value="${row.discount_two}"></c:set>
   								</c:when>
   								<c:when test="${sessionScope.customer_type==3}">
   									钻石会员-${row.discount_three}折
   									<c:set var="hisdiscount" scope="page" value="${row.discount_three}"></c:set>
   								</c:when>
   							</c:choose>
   						</c:if>
   						<div class="trade_information_box">
   							<p>商品详情：${row.information}</p>
   						</div>
   						<form class="form-inline" action="servlet/AddTradeToShoppingCart" method="post" name="shoppingForm">
   							<input type="hidden" name="uid" value="${sessionScope.customer_id}">
   							<input type="hidden" name="tid" value="${param.tradeid}">
   							<input type="hidden" name="tname" value="${row.tname}">
   							<input type="hidden" name="hisdiscount" value="${hisdiscount}">
   							<input type="hidden" name="price" value="${row.price}">
   							<input type="text" class="input-small" placeholder="商品数量" name="tcount">
   							<input  type="button" onclick="addToShoppingCart()" class="btn btn-info" value="添加到购物车">
   						</form>
   					</div>
   					</c:forEach>
   				</div>
   			</div>
    	</div>
    </div>
  </body>
</html>
