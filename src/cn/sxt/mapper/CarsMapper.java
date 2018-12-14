package cn.sxt.mapper;

import java.util.List;

import cn.sxt.pojo.Cars;

public interface CarsMapper {
	/**
	 * 查询所有的汽车
	 * 
	 * @return
	 */
	public List<Cars> selAllCars(int start, int size);

	/**
	 * 根据此车牌号查询（模糊查询）
	 * 
	 * @param carName
	 * @return
	 */
	public List<Cars> selByCarNumber(String carNumber, int start, int size);

	/**
	 * 查询汽车总数
	 * 
	 * @return
	 */
	public int selCarsCount();

	/**
	 * 待条件查询汽车总数
	 * 
	 * @param carNumber
	 * @return
	 */
	public int selCarsCountByCondition(String carNumber);

	/**
	 * 删除汽车
	 * 
	 * @param carNumber
	 */
	public void delCar(Cars cars);

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
	 * 根据客户身份证查询租车信息
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
	 * 根据出租状态修改汽车信息
	 * 
	 * @param isrenting
	 */
	public void updCarIsrenting(String carNumber);

	/**
	 * 查询已出租汽车信息
	 * 
	 * @return
	 */
	public List<Cars> selYesIsrenting();

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
	public void updIsrentingZero(String carNumber);

}
