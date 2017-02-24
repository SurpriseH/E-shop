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
    
    <title>全部商品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/my.css">
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
   		<div class="hero-unit" style="margin-top:5%;">
   			<c:set var="pagesize" value="12"></c:set>
   			<c:choose>
   				<c:when test="${param.pageno==null or param.pageno<=0}"> <!--获取url中的页码数，确定要显示的全部的商品页码数-->
   					<c:set var="num" value="1"></c:set>
   				</c:when>
   				<c:otherwise>
   					<c:set var="num" value="${param.pageno}"></c:set>
   				</c:otherwise>
   			</c:choose>
   			<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     			url="jdbc:mysql://localhost:3306/javafinal?useUnicode=true&characterEncoding=UTF8"
     				user="root"  password=""/>
					<sql:query dataSource="${snapshot}" var="result" sql="select * from trade limit ${(num-1)*pagesize},${pagesize};">
					</sql:query>
					<c:set var="i" scope="page" value="${0}"></c:set>
						<c:forEach var="row" items="${result.rows}">
							<c:set var="i" scope="page" value="${i+1}"></c:set> <!--用i做循环变量，实现每行3个商品的显示效果-->
							<c:choose>
								<c:when test="${i%4==1}">
									<div class="row-fluid">
										<div class="span12">
											<div class="span3">
												<div class="thumbnails">
													<c:if test="${row.img==null}">
														<a href="page/trade_information.jsp?tradeid=${row.tid}">
															<img class="trade_img" src="img/null.png">
														</a>
													</c:if>
													<c:if test="${row.img!=null}">
														<a href="page/trade_information.jsp?tradeid=${row.tid}">
															<img class="trade_img" src="${row.img}" alt="">
														</a>
													</c:if>
													<div class="caption">
														<p class="cont"><c:out value="${row.tname}"/></p>
														<p class="price">
															<c:out value="${row.price}"/>元
															<c:if test="${row.discount==1}">
																<c:out value="（会员折扣）"></c:out>
															</c:if>
														</p>
													</div>
												</div>
											</div>
								</c:when>
								<c:when test="${i%4==2 or i%4==3}">
											<div class="span3">
												<div class="thumbnails">
													<c:if test="${row.img==null}">
														<a href="page/trade_information.jsp?tradeid=${row.tid}">
															<img class="trade_img" src="img/null.png">
														</a>
													</c:if>
													<c:if test="${row.img!=null}">
														<a href="page/trade_information.jsp?tradeid=${row.tid}">
															<img class="trade_img" src="${row.img}" alt="">
														</a>
													</c:if>
													<div class="caption">
														<p class="cont"><c:out value="${row.tname}"/></p>
														<p class="price">
															<c:out value="${row.price}"/>元
															<c:if test="${row.discount==1}">
																<c:out value="（会员折扣）"></c:out>
															</c:if>
														</p>
													</div>
												</div>
											</div>
								</c:when>
								<c:when test="${i%4==0}">
											<div class="span3">
												<div class="thumbnails">
													<c:if test="${row.img==null}">
														<a href="page/trade_information.jsp?tradeid=${row.tid}">
															<img class="trade_img" src="img/null.png">
														</a>
													</c:if>
													<c:if test="${row.img!=null}">
														<a href="page/trade_information.jsp?tradeid=${row.tid}">
															<img class="trade_img" src="${row.img}" alt="">
														</a>
													</c:if>
													<div class="caption">
														<p class="cont"><c:out value="${row.tname}"/></p>
														<p class="price">
															<c:out value="${row.price}"/>元
															<c:if test="${row.discount==1}">
																<c:out value="（会员折扣）"></c:out>
															</c:if>
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${i%4!=0}"> <!--如何i不是以3的倍数结束循环的，说明页面缺乏ul、div的结束标签-->
							</div>
							</div>
						</c:if>
   		</div>
   		<!--获取全部商品的count，以实现分页显示按钮-->
   		<sql:query dataSource="${snapshot}" var="rownum"> 
						select count(*) as num from trade;
				</sql:query>
				<div class="pagination" style="margin-left:10%;">
 				 	<ul>
						<c:forEach  var="i" begin="1" end="${rownum.rows[0].num/pagesize+1}">
							<li><a href="page/alltrade.jsp?pageno=${i}">
								<c:out value="${i}"></c:out>
								</a></li>
						</c:forEach>
					</ul>
				</div>
   	</div>
  </body>
</html>
