package cn.sxt.service;

import java.util.List;

import cn.sxt.pojo.Funs;
import cn.sxt.pojo.Menus;

public interface PermissionService {

	public List<Menus> getMenuByUserName(String userName);

	public List<Funs> getFunsByUserName(String userName);

}
