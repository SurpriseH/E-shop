package szu.hong.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import szu.hong.web.service.TradeService;

public class ChangeTradeCountServlet extends HttpServlet {

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
		String stid=request.getParameter("tid");
		String sbuy_count=request.getParameter("buy_count");
		String scount=request.getParameter("count");
		int tid=Integer.parseInt(stid);
		int count=Integer.parseInt(scount);
		TradeService tradeService=new TradeService();
		boolean result=tradeService.changeCount(tid, count);
		tradeService.free();
		PrintWriter out = response.getWriter();
		if(result){
			out.print("<script>alert('修改成功');</script>");
		}else{
			out.print("<script>alert('修改失败');</script>");
		}
		out.print("<script>history.go(-3);</script>");
		out.flush();
		out.close();
	}

}
