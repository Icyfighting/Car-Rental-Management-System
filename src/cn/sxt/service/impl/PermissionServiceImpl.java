package cn.sxt.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sxt.mapper.FunsMapper;
import cn.sxt.mapper.MenusMapper;
import cn.sxt.pojo.Funs;
import cn.sxt.pojo.Menus;
import cn.sxt.service.PermissionService;
@Service
public class PermissionServiceImpl implements PermissionService {
	@Autowired
	private MenusMapper menusMapper;
	@Autowired
	private FunsMapper funsMapper;

	public List<Menus> getMenuByUserName(String userName) {
		List<Menus> menus = menusMapper.getMenusByUserName(userName);
		return toTree(menus);
	}

	public List<Funs> getFunsByUserName(String userName) {
		return funsMapper.getFunsByUserName(userName);
	}

	private List<Menus> toTree(List<Menus> menus) {
		List<Menus> list = new ArrayList<>();

		// 创建一个临时容器, 用于将菜单和id一一对应
		Map<Integer, Menus> map = new HashMap<>();
		for (Menus menu : menus) {
			map.put(menu.getId(), menu);
		}
		System.out.println("临时map:" + map.toString());

		for (Menus menu : menus) {
			// 0级菜单
			if (menu.getFatherId() == -1) {
				continue;
			}
			// 一级菜单
			if (menu.getFatherId() == 1) {
				list.add(menu);
				continue;
			}
			// 如果不是一级菜单，二三四级等通用
			Menus father = map.get(menu.getFatherId());
			// System.out.println(father.toString());
			if (father != null) {
				// 将子菜单放入父菜单的children集合中
				father.getChildren().add(menu);
			}

		}

		return list;
	}
}
