package com.mirac.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mirac.mapper.AdminMapper;
import com.mirac.entity.Admin;
import com.mirac.entity.User;
import com.mirac.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements IAdminService {

	@Autowired
	private AdminMapper adminDao;

	@Override
	public Admin login(String username, String password) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		return adminDao.login(user);
	}

	@Override
	public int updatepwd(Admin admin) {
		return adminDao.updatepwd(admin);
	}

}
