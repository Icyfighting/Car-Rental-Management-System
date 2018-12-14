package cn.sxt.service;

import java.util.List;
import java.util.Map;

import cn.sxt.pojo.LoginLogs;
import cn.sxt.pojo.Logs;
import cn.sxt.pojo.Pagination;
import cn.sxt.pojo.Roles;
import cn.sxt.pojo.TreeNode;

public interface SystemService {
	public List<TreeNode> getMenus(String comboRole);

	public List<Roles> getRoles();

	public boolean updRoleMenu(Map<String, Object> map);

	public boolean addRoleMenu(Map<String, Object> map);

	public Pagination<LoginLogs> selectLoginLogByCondition(int page, int rows,
			LoginLogs loginLogs);

	public void addLogs(Logs logs);

	public Pagination<Logs> selectLogByCondition(int page, int rows, Logs logs);
}
