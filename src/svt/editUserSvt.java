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

public class editUserSvt extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
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
		User u=(User)session.getAttribute("user");
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		String pwd=request.getParameter("pwd");
		String repwd=request.getParameter("repwd");
		boolean flag=true;
		if(!pwd.equals(repwd)){
			flag=false;
			out.println("<script type='text/javascript'>alert('两次密码不一致，请重新输入！');location='editUser.jsp';</script>");
		}
		else if(name.equals("")){
			flag=false;
			out.println("<script type='text/javascript'>alert('昵称不能为空，请重新输入！');location='editUser.jsp';</script>");
		}
		else if(!u.getLoginPwd().equals(password)){
			flag=false;
			out.println("<script type='text/javascript'>alert('原密码错误，请重新输入！');location='editUser.jsp';</script>");
		}
		List list=UserDao.getInstences().findAll();
		for(Object o:list){
			User us=(User)o;
			if(name.equals(us.getName())&&u.getId()!=us.getId()){
				flag=false;
			out.println("<script type='text/javascript'>alert('昵称已占用，请重新输入！');location='editUser.jsp';</script>");
			}
		}
		if(flag){
			User user=new User();
			user.setId(u.getId());
			user.setName(name);
			user.setLoginName(u.getLoginName());
			if(pwd.equals("")){
				user.setLoginPwd(password);
			}else{
				user.setLoginPwd(pwd);
			}
			int i=UserDao.getInstences().upd(user);
			if(i!=-1){
				out.println("<script type='text/javascript'>alert('修改成功！');top.location='UserSvt?username="+name+"';</script>");
				session.setAttribute("user", user);
			}else {
				out.println("<script type='text/javascript'>alert('修改失败！');location='editUser.jsp';</script>");
			}
		}
		
	}

}
