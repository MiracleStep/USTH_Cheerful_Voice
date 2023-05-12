package com.mirac.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mirac.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper extends BaseMapper<User> {
	int add(User user);

	int update(User user);

	User query(@Param("username")String username,@Param("password") String password);

	List<User> queryByName(@Param("username") String username);

	int updateState(User user);

	/**
	 * 更新用户密码
	 * @param user
	 * @return
	 */
	int updatePw(User user);

	/**
	 * 验证用户名是否存在
	 * @param username 用户名
	 * @return  true：存在 false：不存在
	 */
    boolean isExist(String username);
}
