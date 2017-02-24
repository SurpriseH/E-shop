package szu.hong.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import szu.hong.web.domain.Customer;
import szu.hong.web.service.CustomerService;
/*
 * ��index.jsp�ύ��½��Ϣ�󣬽�����Ϣ��servlet
 * */
public class LoginServlet extends HttpServlet {
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

		response.setContentType("text/html;charset=utf8;");
		request.setCharacterEncoding("utf8");
		PrintWriter out = response.getWriter();
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		String remember=request.getParameter("remember");
		CustomerService customerService=new CustomerService();
		Customer customer=customerService.select_by_name(name);
		if(customer==null)
		{
			out.print("<script>alert('���Ҳ������û�����');</script>");
			out.print("<script>window.location.href='/finalwork/index.jsp';</script>");
		}
		else
		{
			if(!password.equals(customer.getPassword()))
			{
				out.print("<script>alert('�������');</script>");
				out.print("<script>window.location.href='/finalwork/index.jsp';</script>");
			}
			else
			{
				if(customer.getActivate()!=1)
				{
					out.print("<script>alert('�ʺ�δ����뵽���伤���ʺš�');</script>");
				}
				else
				{
					System.out.println("remember:"+remember);
					if(remember!=null)
					{
						System.out.println("loginservlet ����cookie");
						HttpSession session=request.getSession();
						session.setAttribute("customer_name", name);
						session.setAttribute("customer_id", customer.getId());
						session.setAttribute("customer_isadmin", customer.getAdmin());
						Cookie cookie=new Cookie("customer_id",String.valueOf(customer.getId()));
						cookie.setMaxAge(3600*24*30);
						cookie.setPath("/");
						response.addCookie(cookie);
					}
					else
					{
						HttpSession session=request.getSession();
						session.setAttribute("customer_name", name);
						session.setAttribute("customer_id", customer.getId());
						session.setAttribute("customer_isadmin", customer.getAdmin());
					}
				}
				
				out.print("<script>window.location.href='/finalwork/page/index.jsp';</script>");
			}
		}
		out.flush();
		out.close();
		customerService.free();	
	}

}
