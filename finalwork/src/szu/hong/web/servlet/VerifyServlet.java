package szu.hong.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import szu.hong.web.service.CustomerService;

/*
 * 邮箱验证的servlet，点击邮件中的网址，所到达的Servlet
 * */
public class VerifyServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf8;");
		request.setCharacterEncoding("utf8");
		String hisid=request.getParameter("id");
		int id=Integer.parseInt(hisid);
		CustomerService customerService=new CustomerService();
		boolean result=customerService.set_Activate(id);
		PrintWriter out = response.getWriter();
		if(result){
			out.print("<script>alert('验证成功。');</script>");
		}else{
			out.print("<script>alert('验证失败。');</script>");
		}
		out.print("<script>window.location.href='/finalwork/index.jsp';</script>");
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
