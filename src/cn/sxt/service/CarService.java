package cn.sxt.service;

import java.util.List;

import cn.sxt.pojo.Cars;
import cn.sxt.pojo.Pagination;

public interface CarService {
	/**
	 * 查询所有的汽车
	 * 
	 * @return
	 */
	public Pagination<Cars> selAllCars(int page, int rows, String srchVal);

	// /**
	// * 根据此车牌号查询（模糊查询）
	// *
	// * @param carName
	// * @return
	// */
	// public List<Cars> selByCarNumber(String carNumber);

	/**
	 * 删除汽车
	 * 
	 * @param carNumber
	 */
	public boolean delCar(Cars cars);

	/**
	 * 修改汽车
	 * 
	 * @param cars
	 */
	public void updCar(Cars cars);

	/**
	 * 添加汽车信息
	 * 
	 * @param cars
	 */
	public void insCar(Cars cars);

	/**
	 * 根据客户身份证查询汽车信息
	 * 
	 * @param identity
	 * @return
	 */
	public List<Cars> selByCustomerIdentity(String srchValue);

	/**
	 * 查询未出租汽车信息
	 * 
	 * @return
	 */
	public List<Cars> selByIsrenting();

	/**
	 * 根据车牌号查询汽车信息
	 * 
	 * @param carNumber
	 * @return
	 */
	public List<Cars> selOneByCarNumber(String carNumber);

	/**
	 * 根据车牌号修改出租状态为0
	 * 
	 * @param carNumber
	 */
	public boolean updIsrentingZero(String carNumber);

}
