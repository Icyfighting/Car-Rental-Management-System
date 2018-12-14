package cn.sxt.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.sxt.pojo.LoginLogs;

@Repository
public interface LoginLogsMapper {

	public void add(LoginLogs loginLogs);

	public List<LoginLogs> selectLoginLogByCondition(Map<String, Object> param);

	public int getCountByCondition(Map<String, Object> param);

}
