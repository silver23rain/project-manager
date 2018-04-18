package org.project_manager.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final Logger LOGGER = LoggerFactory.getLogger(LoggingInterceptor.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	                       ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();

		if (modelAndView == null){
			modelAndView = new ModelAndView();
		}
		ModelMap  modelMap = modelAndView.getModelMap();
		Object userDTO = modelMap.get("user");
		Object dest = null;
		if(userDTO != null){

			session.setAttribute("loginUser", userDTO);

			dest = session.getAttribute("dest");
			session.removeAttribute("dest");
			session.removeAttribute("error");
			response.sendRedirect(dest!=null ? (String)dest : "/");

		}else{
			session.setAttribute("error","fail");
			response.sendRedirect("/user/login");
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		HttpSession session = request.getSession();

		if(session.getAttribute("loginUser") != null){
			session.removeAttribute("loginUser");
		}

		return true;
	}
}

