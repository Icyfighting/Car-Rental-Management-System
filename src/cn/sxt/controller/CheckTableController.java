package cn.sxt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.sxt.pojo.CheckTable;
import cn.sxt.pojo.Pagination;
import cn.sxt.pojo.RentTable;
import cn.sxt.pojo.Users;
import cn.sxt.service.CheckTableService;
import cn.sxt.service.RentTableService;
import cn.sxt.service.UserService;

@Controller
public class CheckTableController {
	@Autowired
	private CheckTableService checkTableService;

	@RequestMapping("/check/toList")
	public String toList() {
		return "WEB-INF/check/checkTableList";
	}

	@ResponseBody
	@RequestMapping("/check/select")
	public Pagination<CheckTable> selCheckTable(int page, int rows,
			CheckTable checkTable) {
		System.out.println("controller中刚提交过来的checkTable:"
				+ checkTable.toString());
		Pagination<CheckTable> p = checkTableService.selCheckTable(page, rows,
				checkTable);
		System.out.println("checkcontroller:" + p);
		return p;
	}

	@ResponseBody
	@RequestMapping("/check/delete")
	public boolean deleteCheckTable(CheckTable CheckTable) {
		return checkTableService.deleteCheckTable(CheckTable);
	}

	@ResponseBody
	@RequestMapping("/check/makeCheckTable")
	public boolean makeCheckTable(CheckTable checkTable) {
		// System.out.println("controller---" + checkTable);
		boolean flag = checkTableService.makeCheckTable(checkTable);
		return flag;
	}
}
