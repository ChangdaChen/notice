package svt;
import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;
import entity.*;

public class UserSvt extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String urn=request.getParameter("username");
		User u=UserDao.getInstences().findOneByName(urn);
		request.setAttribute("usname", urn);
		List mymessagelist=MessageDao.getInstences().findMy(urn);//我的发帖
		List myreplylist=ReplyDao.getInstences().findListByuser(u.getId());//我的回复
		List List1=ReplyDao.getInstences().findAll();
		request.setAttribute("mymessagelist",mymessagelist );
		request.setAttribute("myreplylist",myreplylist );
		request.setAttribute("replylist",List1 );
		request.getRequestDispatcher("UserFrame.jsp").forward(request, response);
	}

}
