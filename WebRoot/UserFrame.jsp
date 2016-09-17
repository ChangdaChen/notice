<%@page import="dao.MessageDao"%>
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
	display: inline-block;
	*display: inline;
	*zoom: 1;
	padding: 4px 10px 4px;
	margin-bottom: 0;
	font-size: 13px;
	line-height: 18px;
	color: #333333;
	text-align: center;
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
<script src="js/jquery.js"></script>
<script src="js/jquery.dialog.js"></script>
<link rel="stylesheet" href="css/jquery.dialog.css">
<script type="text/javascript" src="js/laydate/laydate.js"></script>
<script type="text/javascript">
		$(function(){
			$("#btnAdd").click(function(){
				var obj = '<iframe name="myFrame" src="editUser.jsp" frameborder="0" scrolling="no" height="450" width="950" style="margin:0;padding:0;"/></iframe>';
				$(obj).dialog({
					title : "我的信息"
				});
			});
		});
	</script>
</head>

<body>
	<%
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		if (session.getAttribute("user") != null){
	%>
	<center>
	<div class="top">
				<%User ur = (User) session.getAttribute("user");
				String us=ur.getName();
				int uid=ur.getId();
				String admin=ur.getLoginName();
				String user=(String)request.getAttribute("usname");
				%>
				<ul style="float: right;padding: 5px;margin-right: 40px;">
					<li style="display: inline"><a href="MessageSvt">首页</a></li>
					<li style="display: inline"><a id="btnAdd"> <span><%=us%>的信息</span></a></li>
					<li style="display: inline"><a href="LogoutSvt">注销</a></li>
				</ul><br>
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
				<p style="width: 100%;margin: 0px;padding: 10px">
					<strong><%=user %>的发帖</strong>
				</p>
			</div>
			
			<%
				if (request.getAttribute("mymessagelist") != null) {
					List list = (List) request.getAttribute("mymessagelist");
					for (Object o : list) {
						Message m = (Message) o;
						int i=0;
						if (request.getAttribute("myreplylist") != null) {
							List list1 = (List) request.getAttribute("replylist");
							for (Object c : list1) {
								Reply r=(Reply)c;
								if(m.getId()==r.getMessageId()){
									i++;
								}	
							}
						}
			%>
			<div class="mumber" style="width: 100%;">
				<table width="100%" style="padding: 20px;">

					<tr>
						<td width="10%" rowspan="2"><div style="background-color: #eaeaea;padding: 2px;text-align: center;width: 50px"><%=i %></div></td>
						<td width='60%'><a
							href="ReplySvt?id=<%=m.getId()%>"><font
								color="blue" ><strong><%=m.getTitle()%></strong></font></a></td>
						<td width='10%' rowspan='2'><a
							href="UserSvt?username=<%=m.getUserName()%>"><%=m.getUserName()%></a></td>
						<td width='10%' rowspan='2'><%=m.getCreateTime()%></td>
						<%
							if(m.getUserName().equals(us)||admin.equals("admin")){
						%>
						<td width='10%' rowspan='2'><a href="DelSvt?op=delmassage&id=<%= m.getId()%>">删除</a></td>
						<%} %>
					</tr>
					<tr>
						<td><%=m.getContents()%></td>
					</tr>
				</table>
			</div>
			<%
				}
			}
			%>
			<div style="width: 100%;height: 8%;background-color: #F4F4F4">
				<p style="width: 100%;margin: 0px;padding: 10px">
					<strong><%=user %>的回帖</strong>
				</p>
			</div>
			<%
				if (request.getAttribute("myreplylist") != null) {
					List list = (List) request.getAttribute("myreplylist");
					for (Object o : list) {
						Reply r = (Reply) o;
						Message m = MessageDao.getInstences().findOne(
								r.getMessageId());
						int i=0;
						List list1 = (List) request.getAttribute("replylist");
						for (Object o1 : list1) {
							Reply r1 = (Reply) o1;
							if(r1.getMessageId()==m.getId())
								i++;
						}
			%>
			<div class="mumber" style="width: 100%;">
				<table width="100%" style="padding: 20px;">

					<tr>
						<td width="10%" rowspan="2"><div style="background-color: #eaeaea;padding: 2px;text-align: center;width: 50px"><%=i %></div></td>
						<td width='60%'><a
							href="ReplySvt?id=<%=m.getId()%>"><font
								 color="blue"><strong><%=m.getTitle()%></strong></font></a></td>
						<td width='10%' rowspan='2'><a
							href="UserSvt?username=<%=m.getUserName()%>"><%=m.getUserName()%></a></td>
						<td width='10%' rowspan='2'><%=m.getCreateTime()%></td>
						<%
							if(r.getUserId()==uid||admin.equals("admin")){
						%>
						<td width='10%' rowspan='2'><a href="DelSvt?op=delreply&id=<%= r.getId()%>">删除</a></td>
						<%} %>
					</tr>
					<tr>
						<td><%=m.getContents()%></td>
					</tr>
				</table>
			</div>
			<%
				}
				}
			%>
		</div>
			<br> <br><br><br> <br><br>
	</center>
	<%} %>
</body>
</html>
