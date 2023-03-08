package com.mirac.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mirac.entity.Info;

import java.util.List;

/**
* 帖子信息数据访问接口
* @author Administrator
*
*/
public interface InfoMapper extends BaseMapper<Info> {

	int add(Info info);


	int delete(int msgid);



	List<Info> getAll();


	//查询通知带分页功能
    List<Info> queryByPage();
}
