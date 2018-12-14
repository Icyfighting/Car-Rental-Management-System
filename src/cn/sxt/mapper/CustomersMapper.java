package cn.sxt.mapper;

import java.util.List;

import cn.sxt.pojo.Cars;
import cn.sxt.pojo.Customers;

public interface CustomersMapper {
	/**
	 * 查询kehu
	 * 
	 * @return
	 */
	public List<Customers> selAllCustomers(int start, int size);

	/**
	 * 根据（模糊查询）
	 * 
	 * @param 身份证
	 * @return
	 */
	public List<Customers> selByIdentity(String Identity, int start, int size);

	/**
	 * 查询客户总数
	 * 
	 * @return
	 */
	public int selCustomersCount();

	/**
	 * 待条件查询客户总数
	 * 
	 * @param identity
	 * @return
	 */
	public int selCustomersCountByCondition(String identity);

	/**
	 * 删除客户
	 * 
	 * @param carNumber
	 */
	public void delCustomers(Customers customers);

	/**
	 * 修改客户
	 * 
	 * @param Customers
	 *            customers
	 */
	public void updCustomers(Customers customers);
	/**
	 * tianija
	 * */

	public void addCustomers(Customers customers);

	/**
	 * 根据身份证号查询客户信息
	 * 
	 * @param identity
	 * @return
	 */
	public List<Customers> selOneById(String identity);
}
