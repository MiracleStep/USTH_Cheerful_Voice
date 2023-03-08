package com.mirac.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mirac.entity.Admin;
import com.mirac.entity.Count;

/**
 * 帖子统计数据访问层接口
 * @author Administrator
 *
 */
public interface CountMapper extends BaseMapper<Count> {
	
	/**
	 * 更新帖子访问量
	 * @param msgid
	 * @return
	 */
	int updateAccessCount(int msgid);
	/**
	 * 更新帖子回复量
	 * @param msgid
	 * @return
	 */
	int updateReplyCount(int msgid);
}
