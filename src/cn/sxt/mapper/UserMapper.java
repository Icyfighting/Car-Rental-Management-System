package cn.sxt.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.sxt.pojo.Roles;
import cn.sxt.pojo.Users;
@Repository
public interface UserMapper {
	public Users getUserByNameAndPwd(Users user);

	public List<Users> getUserByCondition(Map<String, Object> param);

	public int getCountByCondition(Map<String, Object> param);

	public void deleteByUserName(Users user);

	public void updateUser(Users user);

	public List<Roles> getRoles();

	public void addUser(Users user);

	public List<Users> getAllUsers();
}
