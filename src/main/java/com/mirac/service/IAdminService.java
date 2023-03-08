package com.mirac.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mirac.entity.Admin;

/**
 * 管理员业务逻辑接口
 * @author Administrator
 *
 */
public interface IAdminService extends IService<Admin> {
	/**
	 * 管理员登录
	 * @param name
	 * @param pwd
	 * @return
	 */
	Admin login(String name,String pwd);
	
	/**
	 * 修改密码
	 * @param name
	 * @param pwd
	 * @return
	 */
	int updatepwd(Admin admin);
}
