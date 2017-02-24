package szu.hong.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import szu.hong.web.service.ShoppingCartService;

public class ChangeTradeCountInShoppingCart extends HttpServlet {
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
		String suid=request.getParameter("uid");
		String stid=request.getParameter("tid");
		String stcount=request.getParameter("tcount");
		int uid=Integer.parseInt(suid);
		int tid=Integer.parseInt(stid);
		int tcount=Integer.parseInt(stcount);
		ShoppingCartService shoppingCartService=new ShoppingCartService();
		boolean result=shoppingCartService.change(uid, tid, tcount);
		PrintWriter out = response.getWriter();
		if(result){
			out.print("<script>alert('修改成功');</script>");
		}else{
			out.print("<script>alert('修改失败');</script>");
		}
		out.print("<script>window.location.href='/finalwork/page/shopping_cart.jsp';</script>");
		out.flush();
		out.close();
	}

}
