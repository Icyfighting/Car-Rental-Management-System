package cn.sxt.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sxt.mapper.CarsMapper;
import cn.sxt.mapper.CheckTableMapper;
import cn.sxt.mapper.RentTableMapper;
import cn.sxt.pojo.CheckTable;
import cn.sxt.pojo.Pagination;
import cn.sxt.pojo.RentTable;
import cn.sxt.service.CheckTableService;
@Service
public class CheckTableServiceImpl implements CheckTableService {
	@Autowired
	private CheckTableMapper checkTableMapper;

	@Autowired
	private CarsMapper carsMapper;
	@Autowired
	private RentTableMapper rentTableMapper;

	@Override
	public Pagination<CheckTable> selCheckTable(int page, int rows,
			CheckTable checkTable) {

		Pagination<CheckTable> p = new Pagination<>();
		int start = (page - 1) * rows;
		int total = 0;
		List<CheckTable> list = new ArrayList<>();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("startIndex", start);
		param.put("rows", rows);
		param.put("abc", checkTable);
		// System.out.println("service:start:" + start);
		// System.out.println("rows:" + rows);
		System.out.println("service 中接收到的user:" + checkTable.toString());

		list = checkTableMapper.getCheckTableByCondition(param);
		total = checkTableMapper.getCountByCondition(param);

		p.setRows(list);
		p.setTotal(total);
		System.out.println("rentTableservice:" + p);
		return p;
	}

	@Override
	public boolean deleteCheckTable(CheckTable checkTable) {
		try {
			checkTableMapper.deleteByTableId(checkTable);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean makeCheckTable(CheckTable checkTable) {
		try {
			checkTableMapper.makeCheckTable(checkTable);
			rentTableMapper.insReturnDate(checkTable);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

}
