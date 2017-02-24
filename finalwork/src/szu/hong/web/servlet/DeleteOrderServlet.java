package szu.hong.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import szu.hong.web.service.OrderService;

public class DeleteOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		String str=request.getParameter("str");
		OrderService orderService=new OrderService();
		boolean result=orderService.delete_order(str);
		orderService.free();
		PrintWriter out = response.getWriter();
		if(result){
			out.println("<script>alert('É¾³ý³É¹¦');</script>");
		}else{
			out.println("<script>alert('É¾³ýÊ§°Ü');</script>");
		}
		out.println("<script>history.go(-2);</script>");
		out.flush();
		out.close();
	}

}
