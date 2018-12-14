package cn.sxt.service;

import java.util.List;

import cn.sxt.pojo.Customers;
import cn.sxt.pojo.Pagination;

public interface CustomersOperatorService {
	/**
	 * 查询所有的客户
	 * 
	 * @return
	 */
	public Pagination<Customers> selAllCustomers(int page, int rows,
			String srchVal);

	// /**
	// * 根据身份证号查询（模糊查询）
	// *
	// * @param carName
	// * @return
	// */
	//
	public void addCustomers(Customers customers);
	/**
	 * 删除客户
	 * 
	 * @param identity
	 * 
	 */
	public boolean delCustomers(Customers customers);

	/**
	 * 修改客户
	 * 
	 * @param Customers
	 */
	public void updCustomers(Customers customers);

	/**
	 * 根据身份证号查询客户信息
	 * 
	 * @param identity
	 * @return
	 */
	public List<Customers> selOneById(String identity);
}
