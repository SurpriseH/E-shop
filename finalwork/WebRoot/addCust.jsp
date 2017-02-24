<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册用户</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<script type="text/javascript" src="js/my.js"></script>
  </head>
  
  <body>
    <div class="container">
    	<div class="hero-unit" style="margin-top:10%">
    		<h3 class="text-center">注册用户</h3>
    		<form action="servlet/AddCustServlet" class="form-horizontal" method="post" name="myform">
    			<div class="control-group">
    				<label class="control-label">姓名：</label>
    				<div class="controls">
      					<input type="text" name="name">
    				</div>
  				</div>
  				<div class="control-group">
    				<label class="control-label">密码：</label>
    				<div class="controls">
      					<input type="password" name="password1">
    				</div>
  				</div>
  				<div class="control-group">
    				<label class="control-label">再次确认密码：</label>
    				<div class="controls">
      					<input type="password" name="password2">
    				</div>
  				</div>
  				<div class="control-group">
    				<label class="control-label">性别：</label>
    				<div class="controls">
      					<input type="radio" name="sex" value="男" checked="true">男
      					<input type="radio" name="sex" value="女">女
    				</div>
  				</div>
  				<div class="control-group">
    				<label class="control-label">手机：</label>
    				<div class="controls">
      					<input type="text" name="phone">
    				</div>
  				</div>
  				<div class="control-group">
    				<label class="control-label">电子邮件：</label>
    				<div class="controls">
      					<input type="text" name="email">
    				</div>
  				</div>
  				<div class="control-group">
    				<label class="control-label"></label>
    				<div class="controls">
      					<input type="button" class="btn btn-primary" value="提交" onclick="add()">
    				</div>
  				</div>
    		</form>
    	</div>
    </div>
  </body>
</html>
