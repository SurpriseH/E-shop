package szu.hong.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import szu.hong.web.dao.ShoppingCartDao;
import szu.hong.web.service.ShoppingCartService;

public class DeleteTradeFromShoppingCart extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		String suid=request.getParameter("uid");
		String stid=request.getParameter("tid");
		int uid=Integer.parseInt(suid);
		int tid=Integer.parseInt(stid);
		ShoppingCartService shoppingCartService=new ShoppingCartService();
		boolean result=shoppingCartService.delete(uid, tid);
		shoppingCartService.free();
		PrintWriter out=response.getWriter();
		if(result){
			out.print("<script>alert('É¾³ý³É¹¦');</script>");
		}else{
			out.print("<script>alert('É¾³ýÊ§°Ü');</script>");
		}
		out.print("<script>window.location.href='/finalwork/page/shopping_cart.jsp';</script>");
		out.flush();
		out.close();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

}
