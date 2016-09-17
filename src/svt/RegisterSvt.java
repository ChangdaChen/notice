package svt;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import entity.User;

public class RegisterSvt extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String op=request.getParameter("op");
		if ("register".equals(op)) {

			String name = request.getParameter("name");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String repassword = request.getParameter("repassword");
			List list = UserDao.getInstences().findAll();
			boolean falg = true;
			if(!password.equals(repassword)){
				falg = false;
				out.println("<script type='text/javascript'>alert('两次密码不一致！');location='register.jsp';</script>");
			}
			for (Object o : list) {
				User us = (User) o;
				if (us.getName().equals(name)) {
					falg = false;
					out.println("<script type='text/javascript'>alert('昵称已占用！');location='register.jsp';</script>");
				}
				if (us.getLoginName().equals(username)) {
					falg = false;
					out.println("<script type='text/javascript'>alert('已注册！');location='register.jsp';</script>");
				}
			}
			if (falg) {
				if (password.equals(repassword)) {
					System.out.println("Register");
					User u = new User();
					u.setName(name);
					u.setLoginName(username);
					u.setLoginPwd(password);
					UserDao.getInstences().add(u);
					out.println("<script type='text/javascript'>alert('注册成功！');location='login.jsp';</script>");
				}
			}
		}
		if("logout".equals(op)){
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
}
