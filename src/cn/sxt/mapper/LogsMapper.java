package cn.sxt.mapper;

import java.util.List;
import java.util.Map;

import cn.sxt.pojo.Logs;

public interface LogsMapper {
	public void add(Logs logs);

	public List<Logs> selectLogByCondition(Map<String, Object> param);

	public int getCountByCondition(Map<String, Object> param);
}
