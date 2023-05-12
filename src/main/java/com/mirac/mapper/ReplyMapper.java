package com.mirac.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mirac.entity.Reply;
import com.mirac.entity.ReplyInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

@Mapper
public interface ReplyMapper extends BaseMapper<ReplyInfo> {
	/**
	 * 回帖
	 * @param reply 回复内容
	 * @return
	 */
	int replyMsg(Reply reply);
	
	/**
	 * 根据帖子ID查询回复内容
	 * @param msgid 帖子ID
	 * @return
	 */
	List<ReplyInfo> queryBymsgid(int msgid);
	
	/**
	 * 根据时间查询回帖数量
	 * @param startDate 开始时间
	 * @param endDate 结束时间
	 * @return 
	 */
	long queryCountByDate(@Param("startDate")Date startDate,@Param("endDate")Date endDate);
}
