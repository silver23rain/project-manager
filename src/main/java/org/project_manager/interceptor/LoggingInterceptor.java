package org.project_manager.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;

public class LoggingInterceptor extends HandlerInterceptorAdapter {

	private static final Logger LOGGER = LoggerFactory.getLogger(LoggingInterceptor.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		String uri = removeLeadingPath(request.getRequestURI());
		LOGGER.info("uri :[{}] class:[{}]", uri, LoggingInterceptor.class);
		LOGGER.debug("param : [{}]", requestParamToString(request));
		return super.preHandle(request, response, handler);
	}

	private String requestParamToString(HttpServletRequest request) {
		StringBuilder stringBuilder = new StringBuilder();
		Enumeration<String> parameterNames = request.getParameterNames();
		while (parameterNames.hasMoreElements()) {
			String paramName = parameterNames.nextElement();
			stringBuilder
					.append("{")
					.append(paramName)
					.append(":")
					.append(request.getParameter(paramName))
					.append("},");
		}
		return stringBuilder.toString();
	}

	public static String removeLeadingPath(String path) {
		String result = "";
		if (path != null) {
			int index = path.indexOf("/");
			if (index == 0) {
				index = path.indexOf("/", 1);
			}

			if (index >= 0 && index < path.length() - 1) {
				result = path.substring(index);
			}
		}

		return result;
	}
}
