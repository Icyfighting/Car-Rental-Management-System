package cn.sxt.service;

import java.util.List;

import cn.sxt.pojo.LoginLogs;
import cn.sxt.pojo.Pagination;
import cn.sxt.pojo.Roles;
import cn.sxt.pojo.Users;

public interface UserService {
	/**
	 * 
	 * @param user
	 *            表单提交数据
	 * @return 比对后数据
	 */
	public Users login(Users user);

	public boolean addUser(Users user);

	public Pagination<Users> selUser(int page, int rows, Users user);

	public void deleteUser(Users user);

	public void updateUser(Users user);

	public List<Roles> getRoles();

	public void addLoginLog(LoginLogs loginLogs);

	public List<Users> getAllUsers();
}
