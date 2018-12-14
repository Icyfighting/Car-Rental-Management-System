package cn.sxt.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import cn.sxt.mapper.CustomersMapper;
import cn.sxt.pojo.Customers;
import cn.sxt.pojo.Pagination;
import cn.sxt.service.CustomersOperatorService;

@Component
@Service
public class CustomersServiceImpl implements CustomersOperatorService {
	@Autowired
	private CustomersMapper customersMapper;

	@Autowired
	private Pagination<Customers> p;

	public Pagination<Customers> selAllCustomers(int page, int rows,
			String srchVal) {
		int start = (page - 1) * rows;
		int size = rows;
		int total = 0;
		List<Customers> list = new ArrayList<Customers>();
		if (srchVal != null && !"".equals(srchVal)) {
			// System.out.println("dai" + srchVal);
			list = customersMapper.selByIdentity(srchVal, start, size);
			// list = customersMapper.selByIDENTITY(srchVal, start, size);
			System.out.println("dai" + list);
			total = customersMapper.selCustomersCountByCondition(srchVal);

			System.out.println("dai" + total);
		} else {
			// System.out.println("budai" + srchVal);
			list = customersMapper.selAllCustomers(start, size);
			total = customersMapper.selCustomersCount();
		}
		p.setRows(list);
		p.setTotal(total);
		return p;
	}

	public boolean delCustomers(Customers customers) {
		// System.out.println("service" + cars);
		try {
			customersMapper.delCustomers(customers);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;

	}

	public void updCustomers(Customers customers) {
		// System.out.println(cars.toString());
		customersMapper.updCustomers(customers);
	}

	public void addCustomers(Customers customers) {
		// TODO Auto-generated method stub
		customersMapper.addCustomers(customers);
	}

	public List<Customers> selOneById(String identity) {

		return customersMapper.selOneById(identity);
	}

}
