package cn.sxt.service;

import cn.sxt.pojo.CheckTable;
import cn.sxt.pojo.Pagination;

public interface CheckTableService {

	public Pagination<CheckTable> selCheckTable(int page, int rows,
			CheckTable checkTable);

	public boolean deleteCheckTable(CheckTable checkTable);

	/**
	 * 生成出租单
	 * 
	 * @param checkTable
	 */
	public boolean makeCheckTable(CheckTable checkTable);

}
