package com.icss.interceptor;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFilter extends HttpServlet implements Filter {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest)request;    
        HttpServletResponse res = (HttpServletResponse)response;    
        String path = req.getContextPath();  
        String indexPath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+path+ "/login.jsp";  
        System.out.println(indexPath);
        System.out.println(req.getRequestURI());
        if(req.getRequestURI().endsWith("login.do"))  
        {  
            chain.doFilter(request, response);   
//            return;  
        }  
          
        Object loginuser = req.getSession().getAttribute("loginper");    
        System.out.println("********"+loginuser);
        if(loginuser == null){  
            res.sendRedirect(indexPath);    
            return;    
        }  
        chain.doFilter(request, response); 
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
