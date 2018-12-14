package cn.sxt.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.sxt.pojo.Pagination;
import cn.sxt.pojo.RentTable;
import cn.sxt.pojo.Users;
import cn.sxt.service.RentTableService;
import cn.sxt.service.UserService;

@Controller
public class RentTableController {
	@Autowired
	private RentTableService rentTableService;
	@Autowired
	private UserService userService;

	/**
	 * 生成出租单
	 * 
	 * @param rentTable
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/rent/makeRenttable")
	public boolean makeRenttable(RentTable rentTable) {

		rentTableService.makeRenttable(rentTable);

		return true;
	}

	@ResponseBody
	@RequestMapping("/rent/getAllUsers")
	public List<Users> getAllUsers() {
		return userService.getAllUsers();

	}

	@ResponseBody
	@RequestMapping("/rent/selAllRentTables")
	public List<RentTable> selAllRentTables() {
		return rentTableService.selAllRentTables();
	}

	@ResponseBody
	@RequestMapping("/rent/selAllTableId")
	public List<RentTable> selAllTableId() {
		return rentTableService.selAllTableId();
	}

	@ResponseBody
	@RequestMapping("/rent/selByTableID")
	public List<RentTable> selByTableID(Integer tableId) {
		System.out.println("controller----" + tableId);
		return rentTableService.selByTableID(tableId);
	}

	@RequestMapping("/rent/toReturn")
	public String toReturn() {
		return "WEB-INF/rent/returnCar";
	}

	@RequestMapping("/rent/toAdd")
	public String toAdd() {
		return "WEB-INF/rent/rentCar";
	}

	@RequestMapping("/rent/toList")
	public String toList() {
		return "WEB-INF/rent/rentTablelist";
	}

	@ResponseBody
	@RequestMapping("/rent/select")
	public Pagination<RentTable> selRentTable(int page, int rows,
			RentTable rentTable) {
		System.out
				.println("controller中刚提交过来的rentTable:" + rentTable.toString());
		Pagination<RentTable> p = rentTableService.selRentTable(page, rows,
				rentTable);
		System.out.println("usercontroller:" + p);
		return p;
	}

}
