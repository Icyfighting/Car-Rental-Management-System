package cn.sxt.mapper;

import java.util.List;
import java.util.Map;

import cn.sxt.pojo.CheckTable;
import cn.sxt.pojo.RentTable;

public interface RentTableMapper {

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

	public List<RentTable> getRentTableByCondition(Map<String, Object> param);

	public int getCountByCondition(Map<String, Object> param);

	/**
	 * 根据出租单编号修改出租状态为未出租
	 * 
	 * @param tableId
	 */
	public void updRentFlagByTableId(Integer tableId);

	/**
	 * 根据检查单生成日期插入归还日期
	 * 
	 * @param carId
	 */
	public void insReturnDate(CheckTable checkTable);
}
