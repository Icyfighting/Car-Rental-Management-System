package cn.sxt.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sxt.mapper.LoginLogsMapper;
import cn.sxt.mapper.LogsMapper;
import cn.sxt.mapper.MenusMapper;
import cn.sxt.mapper.RoleMapper;
import cn.sxt.pojo.LoginLogs;
import cn.sxt.pojo.Logs;
import cn.sxt.pojo.Menus;
import cn.sxt.pojo.Pagination;
import cn.sxt.pojo.Roles;
import cn.sxt.pojo.TreeNode;
import cn.sxt.pojo.Users;
import cn.sxt.service.SystemService;
@Service
public class SystemServiceImpl implements SystemService {
	@Autowired
	private MenusMapper menusMapper;
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private LoginLogsMapper loginLogsMapper;
	@Autowired
	private LogsMapper logsMapper;

	// private List<Roles> allRoles;
	@Override
	public List<TreeNode> getMenus(String roleIdString) {
		Integer roleId = 0;
		List<TreeNode> list = new ArrayList<>();
		// 无论是否由roleId，都查询下所有TreeNode
		list = menusMapper.getAllMenus();
		Map<Integer, TreeNode> map = new HashMap<>();
		for (TreeNode node : list) {
			map.put(node.getId(), node);
		}
		System.out.println("systemService中id和对象映射的map：" + map.toString());
		// 如果roleId有值，就查询出roleId对应的menus，根据menus中有的，修改TreeNode的list中的checked属性为true
		if (roleIdString != null && !"".equals(roleIdString)) {
			roleId = Integer.parseInt(roleIdString);
			System.out.println("systemService中的整数roleId：" + roleId);
			List<Integer> menuIds = menusMapper.getMenusByRoleId(roleId);
			for (Integer menuId : menuIds) {

				map.get(menuId).setChecked(true);
			}
		}

		// 对checked属性根据选中的role对应的menu来

		list = toTree(list);
		System.out.println("systemService中checked修改后的TreeNode:" + list);
		return list;
	}

	private List<TreeNode> toTree(List<TreeNode> nodes) {
		List<TreeNode> list = new ArrayList<>();

		// 创建一个临时容器, 用于将菜单和id一一对应
		Map<Integer, TreeNode> map = new HashMap<>();
		for (TreeNode node : nodes) {
			map.put(node.getId(), node);
		}
		System.out.println("临时map:" + map.toString());

		for (TreeNode node : nodes) {
			// 0级菜单
			if (node.getFatherId() == -1) {
				continue;
			}
			// 一级菜单
			if (node.getFatherId() == 1) {
				list.add(node);
				continue;
			}
			// 如果不是一级菜单，二三四级等通用
			TreeNode father = map.get(node.getFatherId());

			// 将子菜单放入父菜单的children集合中
			father.getChildren().add(node);
		}
		System.out.println("toTree返回的list：" + list);
		return list;
	}

	@Override
	public List<Roles> getRoles() {

		List<Roles> roles = roleMapper.getAllRoles();
		System.out.println("systemService中的role：" + roles);
		return roles;
	}

	@Override
	public boolean updRoleMenu(Map<String, Object> map) {
		// 将String 数组中解析成Integer数组，
		// 取到数组，更新的是roles_menus表格,因为权限有增加和减少的可能性，为了简便，就先根据roleId把表格中所有的menuid删除，
		// 再根据传过来的选择的Integer roleIdsNum和roleId,增加roles_menus

		try {
			roleMapper.deleteMenuByRoleId(map);
			roleMapper.addRoleMenuByRoleId(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean addRoleMenu(Map<String, Object> map) {
		// 增加用户需要修改两张表，一个是在role中增加roleId和roleName

		try {
			roleMapper.addRole(map);
			Roles roles = roleMapper.getRoleByName(map);
			// 一个是roles_menus表中增加roleId和MenuId
			Integer roleId = roles.getRoleId();
			map.put("roleId", roleId);
			System.out.println("systemservice中addRole之后，查询到的roleId：" + roleId);
			roleMapper.addRoleMenuByRoleId(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public Pagination<LoginLogs> selectLoginLogByCondition(int page, int rows,
			LoginLogs loginLogs) {
		Pagination<LoginLogs> p = new Pagination<>();
		int start = (page - 1) * rows;
		int total = 0;

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("startIndex", start);
		param.put("rows", rows);
		param.put("abc", loginLogs);
		List<LoginLogs> list = loginLogsMapper.selectLoginLogByCondition(param);
		total = loginLogsMapper.getCountByCondition(param);
		System.out.println("systemService中list：" + list);
		p.setRows(list);
		p.setTotal(total);
		System.out.println("systemservice的loginLogs:" + p);
		return p;
	}

	@Override
	public void addLogs(Logs logs) {
		logsMapper.add(logs);
	}

	@Override
	public Pagination<Logs> selectLogByCondition(int page, int rows, Logs logs) {
		Pagination<Logs> p = new Pagination<>();
		int start = (page - 1) * rows;
		int total = 0;

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("startIndex", start);
		param.put("rows", rows);
		param.put("abc", logs);
		List<Logs> list = logsMapper.selectLogByCondition(param);
		total = logsMapper.getCountByCondition(param);
		System.out.println("systemService中logs：===========" + logs);
		p.setRows(list);
		p.setTotal(total);
		System.out.println("systemservice的loginLogs:" + p);
		return p;

	}
}
