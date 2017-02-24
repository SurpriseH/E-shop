package szu.hong.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import szu.hong.web.service.ShoppingCartService;

public class AddTradeToShoppingCart extends HttpServlet {
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
		String tname=request.getParameter("tname");
		String shisdiscount=request.getParameter("hisdiscount");
		String stcount=request.getParameter("tcount");
		String sprice=request.getParameter("price");
		int uid=Integer.parseInt(suid);
		int tid=Integer.parseInt(stid);
		int hisdiscount=Integer.parseInt(shisdiscount);
		int tcount=Integer.parseInt(stcount);
		int price=Integer.parseInt(sprice);
		//System.out.println(uid+","+tid+","+tname+","+hisdiscount+","+price+","+tcount);
		ShoppingCartService addToShoppingCartService=new ShoppingCartService();
		boolean result=addToShoppingCartService.insert(uid, tid, tname, hisdiscount, price, tcount);
		addToShoppingCartService.free();
		PrintWriter out = response.getWriter();
		if(result)
		{
			out.print("<script>alert('加入购物车成功。');</script>");
		}
		else
		{
			out.print("<script>alert('加入购物车失败。');</script>");
		}
		out.print("<script>history.go(-1);</script>");
		out.flush();
		out.close();
	}

}
