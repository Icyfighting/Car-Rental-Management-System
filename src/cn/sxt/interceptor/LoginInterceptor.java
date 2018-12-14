package cn.sxt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.sxt.pojo.Users;

public class LoginInterceptor implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// 1、 判断请求url是否是公共地址（“/login”），是的话放行
		String url = request.getRequestURL().toString(); //
		if (url.indexOf("/login") != -1) {
			// 是公共地址
			return true;
		}
		// 2、 从Session中取出用户信息，进行判断 /index
		Users user = (Users) request.getSession().getAttribute("loginUser");
		// 3、 为空，未登陆，回到登陆页面
		if (user == null) {
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/login.jsp");

			return false;
		}

		// 4、 不为空，已经登陆，放行 /index
		return true;
	}

	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
