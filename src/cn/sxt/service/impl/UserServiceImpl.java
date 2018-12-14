package cn.sxt.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.registry.infomodel.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sxt.mapper.LoginLogsMapper;
import cn.sxt.mapper.RoleMapper;
import cn.sxt.mapper.UserMapper;
import cn.sxt.pojo.LoginLogs;
import cn.sxt.pojo.Pagination;
import cn.sxt.pojo.Roles;
import cn.sxt.pojo.Users;
import cn.sxt.service.UserService;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private LoginLogsMapper loginLogsMapper;

	public Users login(Users user) {
		return userMapper.getUserByNameAndPwd(user);
	}

	@Override
	public boolean addUser(Users user) {

		userMapper.addUser(user);
		System.out.println("service中picture:" + user.getPicture());
		return true;
	}
	@Override
	public Pagination<Users> selUser(int page, int rows, Users user) {

		Pagination<Users> p = new Pagination<>();
		int start = (page - 1) * rows;
		int total = 0;
		List<Users> list = new ArrayList<>();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("startIndex", start);
		param.put("rows", rows);
		param.put("abc", user);
		// System.out.println("service:start:" + start);
		// System.out.println("rows:" + rows);
		System.out.println("service 中接收到的user:" + user.toString());

		list = userMapper.getUserByCondition(param);
		total = userMapper.getCountByCondition(param);

		p.setRows(list);
		p.setTotal(total);
		System.out.println("userservice:" + p);
		return p;
	}

	@Override
	public void deleteUser(Users user) {
		System.out.println("userService:delete的名字" + user.getUserName());
		userMapper.deleteByUserName(user);
	}

	@Override
	public void updateUser(Users user) {
		userMapper.updateUser(user);
	}

	@Override
	public List<Roles> getRoles() {
		List<Roles> roles = roleMapper.getAllRoles();
		return roles;
	}

	@Override
	public void addLoginLog(LoginLogs loginLogs) {
		// 直接调用LoginLogsMapper就可以
		try {
			System.out.println("service中的loginLogs:" + loginLogs);
			loginLogsMapper.add(loginLogs);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<Users> getAllUsers() {

		List<Users> users = userMapper.getAllUsers();
		return users;
	}
}
