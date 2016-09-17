package svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MessageDao;
import dao.ReplyDao;
import entity.User;

public class DelSvt extends HttpServlet {

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
		HttpSession session = request.getSession();
		String op=request.getParameter("op");
		User u=(User)session.getAttribute("user");
		String username=u.getName();
		if ("delmassage".equals(op)) {
			int id=Integer.valueOf(request.getParameter("id"));
			int falg=MessageDao.getInstences().del(id);
			if(falg!=-1){
				out.println("<script type='text/javascript'>alert('删除成功！');location='UserSvt?username="+username+"';</script>");
			}
		}
		if ("delmassage1".equals(op)) {
			int id=Integer.valueOf(request.getParameter("id"));
			int falg=MessageDao.getInstences().del(id);
			if(falg!=-1){
				out.println("<script type='text/javascript'>alert('删除成功！');location='MessageSvt';</script>");
			}
		}
		if ("delreply".equals(op)) {
			int id=Integer.valueOf(request.getParameter("id"));
			int falg=ReplyDao.getInstences().del(id);
			if(falg!=-1){
				out.println("<script type='text/javascript'>alert('删除成功！');location='UserSvt?username="+username+"';</script>");
			}
		}
		if ("delreply1".equals(op)) {
			int id=Integer.valueOf(request.getParameter("id"));
			int mid=Integer.valueOf(request.getParameter("mid"));
			int falg=ReplyDao.getInstences().del(id);
			if(falg!=-1){
				out.println("<script type='text/javascript'>alert('删除成功！');location='ReplySvt?id="+mid+"';</script>");
			}
		}
	}

}
