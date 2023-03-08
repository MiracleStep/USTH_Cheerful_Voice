package com.mirac.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mirac.mapper.UserMapper;
import com.mirac.entity.User;
import com.mirac.service.IUserService;
import com.mirac.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

	@Autowired
	UserMapper iUserDao;
	
	@Override
	public User userLogin(String username, String password) {
		// TODO Auto-generated method stub
		password = MD5Util.string2MD5(password + username);
		return iUserDao.query(username, password);
	}

	@Override
	@Transactional
	public int update(User user,User nUser) {
		// 获取参数
		String realname = user.getRealname();
		String sex = user.getSex();
		String hobbys = user.getHobbys();
		String birthday = user.getBirthday();
		String city = user.getCity();
		String email = user.getEmail();
		String qq = user.getQq();

		// 重设其值
		if (realname != null && realname.trim().length()>0){
			nUser.setRealname(realname);
		}
		if (sex != null && sex.trim().length()>0){
			nUser.setSex(sex);
		}
		if (hobbys != null && hobbys.trim().length()>0){
			nUser.setHobbys(hobbys);
		}
		if (birthday != null && birthday.trim().length()>0){
			nUser.setBirthday(birthday);
		}
		if (city != null && city.trim().length()>0){
			nUser.setCity(city);
		}
		if (email != null && email.trim().length()>0){
			nUser.setEmail(email);
		}
		if (qq != null && qq.trim().length()>0){
			nUser.setQq(qq);
		}
		return iUserDao.update(nUser);
	}

	@Override
	public int userRegister(User user) {
		// TODO Auto-generated method stub
		return iUserDao.add(user);
	}

	@Override
	public PageInfo<User> searchByName(String username, int pageNum, int pageSize) {

		PageHelper.startPage(pageNum, pageSize);
		List<User> uers = iUserDao.queryByName(username);
		PageInfo<User> userInfos = new PageInfo<>(uers);
		return userInfos;
	}

	@Override
	public int deleteUser(User user) {
		return iUserDao.updateState(user);
	}

	@Override
	public int restoreUser(User user) {
		return iUserDao.updateState(user);
	}

	@Override
	@Transactional
	public int updatePw(User user) {
		return iUserDao.updatePw(user);
	}

	@Override
	public int modifyUser(User user) {
		return iUserDao.updateState(user);
	}

	@Override
	public boolean isExist(String username) {

		return iUserDao.isExist(username);
	}

}
