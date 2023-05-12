package com.mirac.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mirac.entity.Admin;
import com.mirac.entity.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * 管理员数据访问接口
 * @author Administrator
 *
 */
@Mapper
public interface AdminMapper extends BaseMapper<Admin> {
	Admin login(User user);
	int updatepwd(Admin admin);
}
