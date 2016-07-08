package com.icss.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("进来拦截器了");
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("loginper");
		if(obj==null||"".equals(obj.toString())){
			System.out.println("没有登录过");
			response.sendRedirect("/login.jsp");
		}
		return super.preHandle(request, response, handler);
	}

}
