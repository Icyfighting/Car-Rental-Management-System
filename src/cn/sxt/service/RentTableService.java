package cn.sxt.service;

import java.util.List;

import cn.sxt.pojo.Pagination;
import cn.sxt.pojo.RentTable;

public interface RentTableService {

	/**
	 * 生成出租单
	 * 
	 * @param rentTable
	 */
	public void makeRenttable(RentTable rentTable);

	/**
	 * 查询所有出租单
	 * 
	 * @return
	 */
	public List<RentTable> selAllRentTables();

	/**
	 * 得到所有的出租单编号
	 * 
	 * @return
	 */
	public List<RentTable> selAllTableId();

	/**
	 * 根据出租单编号查询信息
	 * 
	 * @param tableId
	 * @return
	 */
	public List<RentTable> selByTableID(Integer tableId);

	public Pagination<RentTable> selRentTable(int page, int rows,
			RentTable rentTable);

}
