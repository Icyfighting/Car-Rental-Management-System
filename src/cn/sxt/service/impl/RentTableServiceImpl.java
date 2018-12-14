package cn.sxt.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import cn.sxt.mapper.CarsMapper;
import cn.sxt.mapper.RentTableMapper;
import cn.sxt.mapper.UserMapper;
import cn.sxt.pojo.Pagination;
import cn.sxt.pojo.RentTable;
import cn.sxt.pojo.Users;
import cn.sxt.service.RentTableService;

@Component
@Service
public class RentTableServiceImpl implements RentTableService {
	@Autowired
	private RentTableMapper rentTableMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private CarsMapper carsMapper;

	public void makeRenttable(RentTable rentTable) {
		// System.out.println("service" + rentTable.toString());
		rentTable.setRentFlag(1);
		rentTableMapper.makeRenttable(rentTable);
		carsMapper.updCarIsrenting(rentTable.getCarId());

	}

	public List<Users> getAllUsers() {

		List<Users> users = userMapper.getAllUsers();
		return users;
	}

	public List<RentTable> selAllRentTables() {

		return rentTableMapper.selAllRentTables();
	}

	public List<RentTable> selAllTableId() {

		return rentTableMapper.selAllTableId();
	}

	public List<RentTable> selByTableID(Integer tableId) {

		return rentTableMapper.selByTableID(tableId);
	}

	@Override
	public Pagination<RentTable> selRentTable(int page, int rows,
			RentTable rentTable) {

		Pagination<RentTable> p = new Pagination<>();
		int start = (page - 1) * rows;
		int total = 0;
		List<RentTable> list = new ArrayList<>();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("startIndex", start);
		param.put("rows", rows);
		param.put("abc", rentTable);
		// System.out.println("service:start:" + start);
		// System.out.println("rows:" + rows);
		System.out.println("service 中接收到的user:" + rentTable.toString());

		list = rentTableMapper.getRentTableByCondition(param);
		total = rentTableMapper.getCountByCondition(param);

		p.setRows(list);
		p.setTotal(total);
		System.out.println("rentTableservice:" + p);
		return p;
	}

}
