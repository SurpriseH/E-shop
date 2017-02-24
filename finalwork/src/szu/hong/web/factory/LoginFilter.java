package szu.hong.web.factory;

/*
 * 这是一个登陆过滤器，以防止用户未登录就访问被保护页面
 * */
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest myrequest=(HttpServletRequest)request;
		HttpServletResponse myresponse=(HttpServletResponse)response;
		Cookie cookies[]=myrequest.getCookies();
		HttpSession session=myrequest.getSession();
		String name=(String) session.getAttribute("customer_name");
		if(name==null)
		{
			int i=0;
			for(i=0;i<cookies.length;i++)
			{
				if(cookies[i].getName().equals("customer_name"))
				{
					name=cookies[i].getValue();
					break;
				}
			}
			session.setAttribute("customer_name",name);
		}
		if(name==null)
		{
			myresponse.sendRedirect("/finalwork/index.jsp");
		}
		chain.doFilter(request, response);//这句话很重要，如果权限过滤器忘了写，会出现页面空白的情况。
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
