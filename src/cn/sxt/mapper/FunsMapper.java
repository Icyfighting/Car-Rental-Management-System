package cn.sxt.mapper;

import java.util.List;

import cn.sxt.pojo.Funs;

public interface FunsMapper {
	public List<Funs> getFunsByUserName(String userName);
}
