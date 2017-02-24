package szu.hong.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import szu.hong.web.service.OrderService;

public class CancelOrderServlet extends HttpServlet {
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
		String suid=request.getParameter("uid");
		int uid=Integer.parseInt(suid);
		OrderService orderService=new OrderService();
		boolean result=orderService.cancel_order(uid, str);
		orderService.free();
		PrintWriter out = response.getWriter();
		if(result){
			out.print("<script>alert('取消成功。');</script>");
		}else{
			out.print("<script>alert('取消失败。');</script>");
		}
		out.print("<script>window.location.href='/finalwork/page/order_history.jsp';</script>");
		out.flush();
		out.close();
	}

}
