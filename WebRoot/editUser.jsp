<%@page import="entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'editUser.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	input{
		height: 30px;
	}
</style>
</head>
<%
  	User u=(User)session.getAttribute("user");
  	
  %>
<body>
	<form action="editUserSvt" method="post">
	<table>
		<tr>
			<td>用户名：</td>
			<td><%=u.getLoginName() %></td>
		</tr>
		<tr>
			<td>昵称：</td>
			<td><input type="text" value="<%=u.getName()%>" name="name"/></td>
		</tr>
		
		<tr>
			<td>原密码：</td>
			<td><input type="password" value="" name="password"/></td>
		</tr>
		<tr>
			<td>密码：</td>
			<td><input type="password" value="" name="pwd"/></td>
		</tr>
		<tr>
			<td>确认密码：</td>
			<td><input type="password" value="" name="repwd"/></td>
		</tr>
	</table>
	<br>
	&nbsp;<input type="submit" value="修改" style="margin-left: 80px"/>
	</form>
</body>
</html>
