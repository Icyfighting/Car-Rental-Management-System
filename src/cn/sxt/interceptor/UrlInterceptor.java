package cn.sxt.interceptor;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.sxt.pojo.Funs;
import cn.sxt.pojo.Logs;
import cn.sxt.pojo.Users;
import cn.sxt.service.SystemService;

public class UrlInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	private SystemService systemService;

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// 1、 得到请求url，判断是否公共地址，是放行；不是，往下执行
		String contextPath = request.getContextPath();
		String url = request.getRequestURL().toString();
		if (url.indexOf("/login") != -1 || url.indexOf("/main") != -1
				|| url.indexOf("/addLogs") != -1) {
			return true;
		}
		// 2、 得到用户权限url集合（权限在登陆时候查询得到，设置给用户）
		Users user = (Users) request.getSession().getAttribute("loginUser");
		List<Funs> funs = user.getFuns();

		// 3、 遍历用户权限url集合，判断请求url是在在集合中。在，拥有此权限，放行；不在，无权操作
		for (Funs fun : funs) {
			if (fun.getFunUrl() != null && url.indexOf(fun.getFunUrl()) != -1) {
				// 请求url在权限集合中，拥有此权限，直接放行
				System.out.println("拦截器中的funUrl:" + fun.getFunUrl());
				// 放行之前，调用增加操作log的方法,放到session中
				Logs logs = addActionToLog(request);
				if (logs != null) {
					// 直接在拦截器中完成对Logs表格的添加操作。
					systemService.addLogs(logs);
				}
				System.out.println("url拦截器中从这返回true==========");
				return true;
			}
		}

		// 遍历完权限集合，也没有匹配上，说明没有此权限，跳转到警告页面

		response.sendRedirect(contextPath + "/fault.jsp");
		return false;
	}

	private Logs addActionToLog(HttpServletRequest request) {
		String action = null;
		Users user = (Users) request.getSession().getAttribute("loginUser");

		String url = request.getRequestURL().toString();
		if (url.indexOf("user/add") != -1) {// 说明是添加用户功能,而且必须是请求提交时候，真正操作数据库时候的方法
			action = "添加用户";
		} else if (url.indexOf("user/delete") != -1) {
			action = "删除用户";
		} else if (url.indexOf("user/update") != -1) {
			action = "更新用户";
		} else if (url.indexOf("system/updRole") != -1) {
			action = "更新角色";
		} else if (url.indexOf("system/addRole") != -1) {
			action = "新增角色";
		} else if (url.indexOf("cars/insCar") != -1) {
			action = "新增汽车";
		} else if (url.indexOf("cars/delCar") != -1) {
			action = "删除汽车";
		} else if (url.indexOf("cars/updCar") != -1) {
			action = "更新汽车";
		} else if (url.indexOf("customers/addCustomers") != -1) {
			action = "新增客户";
		} else if (url.indexOf("customers/delCustomers") != -1) {
			action = "删除客户";
		} else if (url.indexOf("customers/updCustomers") != -1) {
			action = "更新客户";
		} else if (url.indexOf("rent/makeRenttable") != -1) {
			action = "新增租车单";
		} else {
			// 哪个都没命中，说明不是增删改操作，无需记录。
			return null;
		}

		Logs logs = new Logs();
		logs.setAction(action);
		logs.setActionTime(new Date());
		logs.setUserName(user.getUserName());
		System.out.println("拦截器中的logs：" + logs);
		System.out.println("拦截其中的requestUrl:" + request.getRequestURL());
		request.getSession().setAttribute("logs", logs);
		request.getSession()
				.setAttribute("requestUrl", request.getRequestURL());
		return logs;

	}
}
