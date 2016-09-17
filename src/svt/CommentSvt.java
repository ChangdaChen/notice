package svt;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MessageDao;
import dao.ReplyDao;
import entity.Reply;
import entity.User;

public class CommentSvt extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		String contents=request.getParameter("contents");
		SimpleDateFormat sdf=new SimpleDateFormat("HH:mm:ss");//大写的HH是二十四小时制，小写的hh是十二小时制
		Date now=new Date();
		Time createtime =Time.valueOf(sdf.format(now));
		User u= (User)session.getAttribute("user");
		int userId=u.getId();
		int messageid=Integer.valueOf(request.getParameter("MessageId"));
		System.out.println("meaages"+messageid);
		Reply r=new Reply();
		r.setUserId(userId);
		r.setMessageId(messageid);
		r.setCreateTime(createtime);
		System.out.println(createtime);
		r.setContents(contents);
		int flag=ReplyDao.getInstences().add(r);
		if(flag==-1){
			out.println("<script type='text/javascript'>alert('评论失败！');location='ReplySvt?id="+messageid+"';</script>");
		}else {
			out.println("<script type='text/javascript'>alert('评论成功！');location='ReplySvt?id="+messageid+"';</script>");
		}
	}

}
