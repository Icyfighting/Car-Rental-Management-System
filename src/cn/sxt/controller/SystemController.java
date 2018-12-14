package cn.sxt.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.sxt.pojo.LoginLogs;
import cn.sxt.pojo.Logs;
import cn.sxt.pojo.Pagination;
import cn.sxt.pojo.Roles;
import cn.sxt.pojo.TreeNode;
import cn.sxt.pojo.Users;
import cn.sxt.service.SystemService;

@Controller
@RequestMapping("/system")
public class SystemController {
	@Autowired
	SystemService systemService;

	@ResponseBody
	@RequestMapping("/roles")
	public List<TreeNode> getMenus(String roleId) {
		System.out.println("systemController中下拉框选中的roleId========:" + roleId);
		List<TreeNode> list = new ArrayList<>();

		list = systemService.getMenus(roleId);
		System.out.println("systemController中的treenode返回:" + list);
		return list;
	}

	@RequestMapping("/toAddRole")
	public String toAddRole(Model model) {
		List<Roles> roles = systemService.getRoles();
		System.out.println("systemController的roles:" + roles);
		model.addAttribute("roles", roles);
		return "WEB-INF/system/addRole";
	}
	@ResponseBody
	@RequestMapping("/getAllRoles")
	public List<Roles> getAllRoles() {
		return systemService.getRoles();
	}
	@ResponseBody
	@RequestMapping("/updRole")
	public boolean updRole(HttpServletRequest request) {// 明天从这里开始写，先看看是否可以获取
		// System.out.println(Arrays.toString(request
		// .getParameterValues("nodeIds[]")));
		// System.out.println(request.getParameterValues("nodeIds[]")[1]);
		// 取出来MenuIds[]和roleId,放到Map中。
		String[] menuIds = request.getParameterValues("menuIds[]");
		String roleId = request.getParameter("roleId");
		Integer[] menuIdsNum = new Integer[menuIds.length];
		for (int i = 0; i < menuIds.length; i++) {
			menuIdsNum[i] = Integer.valueOf(menuIds[i]);
		}
		Integer roleIdNum = Integer.valueOf(roleId);

		System.out.println("systemService中转换为整数：" + (menuIdsNum[0] == 2));
		// 传参数roleId和roleIdsNum，所以需要Map
		Map<String, Object> map = new HashMap<>();
		map.put("menuIds", menuIdsNum);
		map.put("roleId", roleIdNum);
		boolean retVal = systemService.updRoleMenu(map);

		return retVal;
	}

	@ResponseBody
	@RequestMapping("/addRole")
	public boolean addRole(HttpServletRequest request) {// 明天从这里开始写，先看看是否可以获取
		System.out.println("进入/system/addRole");
		// System.out.println(Arrays.toString(request
		// .getParameterValues("nodeIds[]")));
		// System.out.println(request.getParameterValues("nodeIds[]")[1]);
		// 取出来MenuIds[]和roleId,放到Map中。
		String[] menuIds = request.getParameterValues("menuIds[]");
		String roleName = request.getParameter("roleName");
		Integer[] menuIdsNum = new Integer[menuIds.length];
		for (int i = 0; i < menuIds.length; i++) {
			menuIdsNum[i] = Integer.valueOf(menuIds[i]);
		}

		System.out.println("systemService中转换为整数：" + (menuIdsNum[0] == 2));
		System.out.println("systemService中roleName：" + roleName);
		// 传参数roleId和roleIdsNum，所以需要Map
		Map<String, Object> map = new HashMap<>();
		map.put("menuIds", menuIdsNum);
		map.put("roleName", roleName);
		boolean retVal = systemService.addRoleMenu(map);

		return retVal;
	}

	@RequestMapping("/toSearchLoginLog")
	public String toSearchLoginLog(Model model) {

		return "WEB-INF/system/searchLoginLog";
	}

	@ResponseBody
	@RequestMapping("/searchLoginLog")
	public Pagination<LoginLogs> SearchLoginLog(HttpServletRequest request,
			LoginLogs loginLogs, int page, int rows) {// 明天从这里开始写，先看看是否可以获取
		System.out.println("进入/system/SearchLoginLog");

		System.out.println("systemService中loginLogs：" + loginLogs.toString());
		Pagination<LoginLogs> p = systemService.selectLoginLogByCondition(page,
				rows, loginLogs);

		return p;
	}

	@RequestMapping("/toSearchLog")
	public String toSearchLog() {

		return "WEB-INF/system/searchLog";
	}

	@ResponseBody
	@RequestMapping("/searchLog")
	public Pagination<Logs> searchLog(HttpServletRequest request, Logs logs,
			int page, int rows) {// 明天从这里开始写，先看看是否可以获取
		System.out.println("进入/system/searchLog");

		System.out.println("systemController中Logs：" + logs.toString());
		Pagination<Logs> p = systemService.selectLogByCondition(page, rows,
				logs);

		return p;
	}

}
