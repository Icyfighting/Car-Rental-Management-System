package cn.sxt.mapper;

import java.util.List;
import java.util.Map;

import cn.sxt.pojo.Roles;

public interface RoleMapper {
	public List<Roles> getAllRoles();

	public void addRoleMenuByRoleId(Map<String, Object> param);

	public void deleteMenuByRoleId(Map<String, Object> param);

	public void addRole(Map<String, Object> param);

	public Roles getRoleByName(Map<String, Object> param);

}
