package org.project_manager.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	private void saveDest(HttpServletRequest request){
		String uri = request.getRequestURI();
		String query = request.getQueryString();

		if(query == null || query.equals(null)){
			query = "";
		}else{
			query = "?"+query;
		}

		if(request.getMethod().equals("GET")){
			request.getSession().setAttribute("dest", uri+query);
		}

	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		if(session.getAttribute("loginUser") == null){

			saveDest(request);
			response.sendRedirect("/user/login");

			return false;
		}

		return true;
	}
}
