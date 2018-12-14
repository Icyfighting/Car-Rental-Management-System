package cn.sxt.mapper;

import java.util.List;
import java.util.Map;

import cn.sxt.pojo.CheckTable;

public interface CheckTableMapper {

	public List<CheckTable> getCheckTableByCondition(Map<String, Object> param);

	public int getCountByCondition(Map<String, Object> param);

	public void deleteByTableId(CheckTable checkTable);

	/**
	 * 生成出租单
	 * 
	 * @param checkTable
	 */
	public void makeCheckTable(CheckTable checkTable);
}
