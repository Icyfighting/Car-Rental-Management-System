package cn.sxt.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import cn.sxt.mapper.CarsMapper;
import cn.sxt.pojo.Cars;
import cn.sxt.pojo.Pagination;
import cn.sxt.service.CarService;

@Component
@Service
public class CarServiceImpl implements CarService {
	@Autowired
	private CarsMapper carsMapper;

	@Autowired
	private Pagination<Cars> p;

	public Pagination<Cars> selAllCars(int page, int rows, String srchVal) {
		int start = (page - 1) * rows;
		int size = rows;
		int total = 0;
		List<Cars> list = new ArrayList<Cars>();
		if (srchVal != null && !"".equals(srchVal)) {
			// System.out.println("dai" + srchVal);
			list = carsMapper.selByCarNumber(srchVal, start, size);
			System.out.println("dai" + list);
			total = carsMapper.selCarsCountByCondition(srchVal);
			System.out.println("dai" + total);
		} else {
			// System.out.println("budai" + srchVal);
			list = carsMapper.selAllCars(start, size);
			total = carsMapper.selCarsCount();
		}
		p.setRows(list);
		p.setTotal(total);
		return p;
	}

	public boolean delCar(Cars cars) {
		// System.out.println("service" + cars);
		try {
			carsMapper.delCar(cars);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;

	}

	public void updCar(Cars cars) {
		// System.out.println(cars.toString());
		carsMapper.updCar(cars);
	}

	public void insCar(Cars cars) {
		carsMapper.insCar(cars);
	}

	public List<Cars> selByCustomerIdentity(String srchValue) {

		List<Cars> list = carsMapper.selByCustomerIdentity(srchValue);

		return list;
	}

	public List<Cars> selByIsrenting() {
		List<Cars> list = carsMapper.selByIsrenting();
		return list;
	}

	public List<Cars> selOneByCarNumber(String carNumber) {

		return carsMapper.selOneByCarNumber(carNumber);
	}

	public boolean updIsrentingZero(String carNumber) {
		try {
			carsMapper.updIsrentingZero(carNumber);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

}
