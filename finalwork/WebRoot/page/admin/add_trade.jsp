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
    
    <title>My JSP 'add_trade.jsp' starting page</title>
    
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
    		<form class="form-horizontal" name="addTradeForm" method="post" action="servlet/AddTradeServlet" enctype="multipart/form-data">
      			<div class="control-group">
        			<label class="control-label">商品名：</label>
        			<div class="controls">
          				<input type="text" name="tname">
        			</div>
      			</div>
      			<div class="control-group">
        			<label class="control-label">价格：</label>
        			<div class="controls">
          				<input type="text" name="price">
        			</div>
      			</div>
      			<div class="control-group">
        			<label class="control-label">是否有折扣：</label>
        			<div class="controls">
          				<input type="radio" name="discount" value="1">是
          				<input type="radio" name="discount" value="0">否
        			</div>
      			</div>
      			<div class="control-group">
        			<label class="control-label">白银会员折扣：</label>
        			<div class="controls">
          				<input type="number" name="discount_one" min="1" max="10" style="width:80px">
        			</div>
      			</div>
      			<div class="control-group">
        			<label class="control-label">黄金会员折扣：</label>
        			<div class="controls">
          				<input type="number" name="discount_two" min="1" max="10"  style="width:80px">
        			</div>
      			</div>
      			<div class="control-group">
        			<label class="control-label">钻石会员折扣：</label>
        			<div class="controls">
          				<input type="number" name="discount_three" min="1" max="10"  style="width:80px">
        			</div>
      			</div>
      			<div class="control-group">
        			<label class="control-label">商品数量：</label>
        			<div class="controls">
          				<input type="text" name="count">
        			</div>
      			</div>
      			<div class="control-group">
        			<label class="control-label">图片：</label>
        			<div class="controls">
          				<input type="file" name="img">
        			</div>
      			</div>
      			<div class="control-group">
        			<label class="control-label">商品描述：</label>
        			<div class="controls">
          				<textarea name="information" rows="10" cols="30"></textarea>
        			</div>
      			</div>
      			<div class="control-group">
        			<label class="control-label"></label>
        			<div class="controls">
          				<input type="button" value="提交" onclick="addTrade()" class="btn btn-info">
        			</div>
      			</div>
    		</form>
    	</div>
    </div>
  </body>
</html>
