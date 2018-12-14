package cn.sxt.mapper;

import java.util.List;

import cn.sxt.pojo.Menus;
import cn.sxt.pojo.TreeNode;

public interface MenusMapper {
	public List<Menus> getMenusByUserName(String userName);

	public List<TreeNode> getAllMenus();

	public List<Integer> getMenusByRoleId(Integer roleId);
}
