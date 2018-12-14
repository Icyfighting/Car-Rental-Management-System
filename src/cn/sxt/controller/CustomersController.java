package cn.sxt.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.ResponseWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.sxt.pojo.Customers;
import cn.sxt.pojo.Pagination;
import cn.sxt.service.CustomersOperatorService;

@Controller
public class CustomersController {
	@Autowired
	private CustomersOperatorService customersOperatorService;

	/**
	 * 获取所有的客户
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/customers/selAllcustomers")
	public Pagination<Customers> selAllCustomers(int page, int rows,
			String srchVal, Pagination<Customers> P) throws Exception {
		P = customersOperatorService.selAllCustomers(page, rows, srchVal);
		/* System.out.println(srchVal); */
		return P;
	}

	@ResponseBody
	@RequestMapping("/customers/delCustomers")
	public boolean delCar(Customers customers) {
		// System.out.println("controller删除" + cars);
		boolean retVal = customersOperatorService.delCustomers(customers);
		return retVal;
	}

	@ResponseBody
	@RequestMapping("/customers/updCustomers")
	public String updCar(Customers customers) {
		customersOperatorService.updCustomers(customers);
		return "true";
	}
	@ResponseBody
	@RequestMapping("/customers/addCustomers")
	public boolean addCustomers(Customers customers, HttpServletRequest req) {
		customersOperatorService.addCustomers(customers);
		return true;

	}

	@RequestMapping("/customer/toList")
	public String toList() {
		return "WEB-INF/customer/customerslist";
	}

	@RequestMapping("/customer/toAdd")
	public String toAdd() {
		return "WEB-INF/customer/addCustomers";
	}

	@ResponseBody
	@RequestMapping("/customers/selOneById")
	public List<Customers> selOneById(String identity) {
		return customersOperatorService.selOneById(identity);
	}
}
