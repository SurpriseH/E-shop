package szu.hong.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import szu.hong.web.domain.Customer;
import szu.hong.web.factory.MyServer;
import szu.hong.web.service.CustomerService;
import szu.hong.web.util.SendEmail;

/*
 * ����û���Servlet�����û��ύע����Ϣ�����ת����ҳ��
 * */
public class AddCustServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf8;");
		request.setCharacterEncoding("utf8");
		String name=request.getParameter("name");
		String password1=request.getParameter("password1");
		String password2=request.getParameter("password2");
		String sex=request.getParameter("sex");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		PrintWriter out = response.getWriter();
		if(!password1.equals(password2))
		{
			out.print("<script>alert('������������벻��ͬ��');</script>");
			out.print("<script>window.location.href='/finalwork/addCust.jsp';</script>");
			out.flush();
			out.close();
			return;
		}
		CustomerService customerService=new CustomerService();
		int result=customerService.insert_Customer(name,password1,sex, phone, email);
		if(result==1){
			String ip=MyServer.getLocalIp();
			Customer customer=customerService.select_by_name(name);
			int id=customer.getId();
			String content="http://"+ip+":8080/finalwork/servlet/VerifyServlet?id="+id;
			SendEmail.sendMessage(email, name+"������֤",content);
			out.print("<script>alert('�û���ӳɹ�,�뵽������֤��');</script>");
			out.print("<script>window.location.href='/finalwork/index.jsp';</script>");
		}else if(result==-1){
			out.print("<script>alert('�û����Ѵ��ڡ�');</script>");
			out.print("<script>window.location.href='/finalwork/addCust.jsp';</script>");
		}else if(result==0){
			out.print("<script>alert('�û����ʧ�ܡ�');</script>");
			out.print("<script>window.location.href='/finalwork/addCust.jsp';</script>");
		}
		customerService.free();
		out.flush();
		out.close();
	}
	public static void main(String[] args) {
		
	}
}
