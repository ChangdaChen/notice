package svt;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import dao.*;
import entity.*;


public class LoginSvt extends HttpServlet {

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
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			List list=UserDao.getInstences().findAll();
			for(Object o : list){
				User user=(User)o;
				if(user.getLoginName().equals(username)&&user.getLoginPwd().equals(password)){
					session.setAttribute("user", user);
					request.setAttribute("username", user.getName());
					request.getRequestDispatcher("MessageSvt").forward(request, response);
				}else{
					out.println("<script type='text/javascript'>alert('账号密码有误，请重新登录！');location='login.jsp';</script>");
				}
			}
	}

}
