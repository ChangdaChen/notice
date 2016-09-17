<%@page import="dao.MessageDao"%>
<%@page import="dao.UserDao"%>
<%@page import="entity.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	if (session.getAttribute("user") == null) {
		out.println("<script type='text/javascript'>alert('请登陆后操作！');location='login.jsp';</script>");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'MessageFrame.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body {
	background-color: #DCEFFE;
	margin: 0px;
}

.top {
	font-size: 18;
	color: blue;
	background-color: #DCEFFE;
	width: 100%;
	height: 70px;
}

.mumber {
	border-top: 1px solid #B8B7B7;
	background-color: white;
	background-repeat:repeat;
	height: auto;
	margin: 0px;
}

a:link {
	text-decoration: none;
	color: black;
} /* 未被访问的链接 */
a:visited {
	text-decoration: none;
	color: black;
} /* 已被访问的链接 */
a:hover {
	text-decoration: underline;
	color: red;
} /* 鼠标指针移动到链接上 */
a:active {
	text-decoration: underline;
	color: red;
} /* 正在被点击的链接 */
.btn {
	*zoom: 1;
	padding: 4px 10px 4px;
	margin-bottom: 0;
	font-size: 13px;
	color: #333333;
	text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
	vertical-align: middle;
	background-color: #f5f5f5;
	background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
	background-image: -ms-linear-gradient(top, #ffffff, #e6e6e6);
	background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff),
		to(#e6e6e6));
	background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
	background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
	background-image: linear-gradient(top, #ffffff, #e6e6e6);
	background-repeat: repeat-x;
	filter: progid:dximagetransform.microsoft.gradient(startColorstr=#ffffff,
		endColorstr=#e6e6e6, GradientType=0);
	border-color: #e6e6e6 #e6e6e6 #e6e6e6;
	border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
	border: 1px solid #e6e6e6;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	-moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.05);
	cursor: pointer;
	*margin-left: .3em;
}

.btn:hover,.btn:active,.btn.active,.btn.disabled,.btn[disabled] {
	background-color: #e6e6e6;
}

.btn-large {
	padding: 9px 14px;
	font-size: 15px;
	line-height: normal;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.btn:hover {
	color: #333333;
	text-decoration: none;
	background-color: #e6e6e6;
	background-position: 0 -15px;
	-webkit-transition: background-position 0.1s linear;
	-moz-transition: background-position 0.1s linear;
	-ms-transition: background-position 0.1s linear;
	-o-transition: background-position 0.1s linear;
	transition: background-position 0.1s linear;
}

.btn-primary,.btn-primary:hover {
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
	color: #ffffff;
}

.btn-primary.active {
	color: rgba(255, 255, 255, 0.75);
}

.btn-primary {
	background-color: #4a77d4;
	background-image: -moz-linear-gradient(top, #6eb6de, #4a77d4);
	background-image: -ms-linear-gradient(top, #6eb6de, #4a77d4);
	background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#6eb6de),
		to(#4a77d4));
	background-image: -webkit-linear-gradient(top, #6eb6de, #4a77d4);
	background-image: -o-linear-gradient(top, #6eb6de, #4a77d4);
	background-image: linear-gradient(top, #6eb6de, #4a77d4);
	background-repeat: repeat-x;
	filter: progid:dximagetransform.microsoft.gradient(startColorstr=#6eb6de,
		endColorstr=#4a77d4, GradientType=0);
	border: 1px solid #3762bc;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.4);
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px
		rgba(0, 0, 0, 0.5);
}

.btn-primary:hover,.btn-primary:active,.btn-primary.active,.btn-primary.disabled,.btn-primary[disabled]
	{
	filter: none;
	background-color: #4a77d4;
}

.btn-block {
	width: 60px;
}

* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-ms-box-sizing: border-box;
	-o-box-sizing: border-box;
	box-sizing: border-box;
}
</style>
</head>

<body>
	<%
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		if (session.getAttribute("user") != null){
	%>
	<center>
		<div class="top">
			<%
				User ur = (User) session.getAttribute("user");
				String us = ur.getName();
				int messageid = 0;
				int useriid=ur.getId();
				String admin=ur.getLoginName();
			%>
			<ul style="float: right;padding: 5px;margin-right: 40px;">
				<li style="display: inline"><a href="MessageSvt">首页</a></li>
				<li style="display: inline"><a href="UserSvt?username=<%=us%>">
						<span>欢迎：<%=us%></span>
				</a></li>
				<li style="display: inline"><a href="LogoutSvt">注销</a></li>
			</ul>
			<br>
		</div>
		<% 
			List listone=MessageDao.getInstences().findAll();
			int num=listone.size();
		%>
		<div style="width: 80%;">
			<img width="100%" src="image/bg.jpg" />
			<div style="width: 100%;height: 15%;background-color: #E9EBF0">
				<table style="margin-left: 2%;padding-top: 2%;padding-bottom: 2%;float: left">
					<tr>
						<td width="50px"><a href="MessageSvt"><img alt="" src="image/timg.jpg" style="border: 1px solid #fff"/></a></td>
						<td width="20px"></td>
						<td width="80px"><font style="font-family: 黑体;font-size: 25px"><strong>留言吧</strong></font></td>
					</tr>
				</table>
				<font style="font-family: 黑体;font-size: 15px;float: left;margin-top: 45px;color: #C6C6C6;">&nbsp;&nbsp;&nbsp;帖子：<span style="color: red;"><%=num %></span></font>
			</div>
			<div style="width: 100%;height: 8%;background-color: #F4F4F4">
			</div>
			<%
				if (request.getAttribute("message") != null) {
					Message m = (Message) request.getAttribute("message");
					messageid = m.getId();
			%>
			<div class="mumber" style="width: 100%;">
				<table width="100%" style="padding: 20px;">
					<tr>
						<td width="10%" ><center><a href="UserSvt?username=<%=m.getUserName()%>"><img src="image/User1.jpg"><font size="2px"><br/><br/><strong><%=m.getUserName()%></strong></font></a></center></td>
						<td width="78%"><font color="red"><strong><%=m.getContents()%></strong></font></td>
						<td width='8%'><%=m.getCreateTime()%></td>
					
					<%if(admin.equals("admin")){
							%>
						<td width='4%' rowspan='2'><a href="DelSvt?op=delmassage1&id=<%= m.getId()%>">删除</a></td>
					<%}%>
					</tr>
				</table>
			</div>
			<%
				}
			%>
			<%
				if (request.getAttribute("replylist") != null) {
					List list = (List) request.getAttribute("replylist");
					Message m = (Message) request.getAttribute("message");
					for (Object o : list) {
						Reply r = (Reply) o;
						User u = UserDao.getInstences().findOneById(r.getUserId());
			%>
			<div class="mumber" style="width: 100%;">
				<table width="100%" style="padding: 20px;">

					<tr>
						<td width="10%" rowspan='2'><center><a href="UserSvt?username=<%=u.getName()%>"><img src="image/User2.jpg"><font size="2px"><br/><br/><strong><%=u.getName()%></strong></font></a></center></td>
						<td width='78%'><font><%=r.getContents()%></font></a></td>
						<td width='8%'><%=r.getCreateTime()%></td>
						 <%
							if(m.getUserName().equals(us)||r.getUserId()==useriid||admin.equals("admin")){
						%> 
						<td width='4%' rowspan='2'><a href="DelSvt?op=delreply1&id=<%= r.getId()%>&mid=<%=m.getId()%>">删除</a></td>
						<%} %>
						
					</tr>
				</table>
			</div>
			<%
				}
				}
			%>
			<br>
			<br>
			<div style="background-color: #eaeaea">
				<form action="CommentSvt?MessageId=<%=messageid%>" method="post">
					<br> <font size="4px"
						style="float: left;font-family: 黑体;margin-left: 60px"><img
						src="image/edit.png" width="20px" height="20px" /><b>发表评论</b></font> <br>
					<br>
					<div
						style="background-color: #F4F4F4;width: 89%;padding: 10px;padding-top: 40px;">

						<textarea name="contents" placeholder="内容" required="required"
							style="width: 100%;height: 150px;resize:none;"></textarea>
					</div>
					<br>
					<button type="submit" class="btn btn-primary btn-block btn-large"
						style="float: left;margin-left: 60px;">发布</button>
					<br> <br> <br>
				</form>
			</div>
		</div>
		<br> <br><br>
	</center>
	<%} %>
</body>
</html>
