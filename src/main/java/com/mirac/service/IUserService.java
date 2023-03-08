package com.mirac.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.pagehelper.PageInfo;
import com.mirac.entity.User;

public interface IUserService extends IService<User> {
	/**
	 * 用户注册
	 * @param user
	 * @return
	 */
	int userRegister(User user);
	
	/**
	 * 用户登录
	 * @param username
	 * @param password
	 * @return
	 */
	User userLogin(String username,String password);
	
	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	int update(User user,User nUser);
	
	/**
	 * 根据用户名和分页信息查询数据
	 * @param username
	 * @param page
	 * @return
	 */
	PageInfo<User> searchByName(String username, int pageNum, int pageSize);
	
	/**
	 * 删除信息
	 * @param userid
	 * @return
	 */
	int deleteUser(User user);
	
	/**
	 * 恢复状态
	 * @param userid
	 * @return
	 */
	int restoreUser(User user);
	//修改密码
	int updatePw(User user);

	int modifyUser(User user);
	/**
	 * 验证用户名是否存在
	 * @param username 用户名
	 * @return  true：存在 false：不存在
	 */
    boolean isExist(String username);
}

 
