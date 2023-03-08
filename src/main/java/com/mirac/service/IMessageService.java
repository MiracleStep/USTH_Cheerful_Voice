package com.mirac.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.pagehelper.PageInfo;
import com.mirac.entity.*;

import java.util.Date;

/**
 * 帖子信息业务接口层
 * @author Administrator
 *
 */
public interface IMessageService extends IService<MessageInfo> {
	/**
	 * 发帖
	 * @param message
	 * @return
	 */
	int addMsg(Message message);
	/**
	 * 回帖
	 * @param reply
	 * @return
	 */
	int replyMsg(Reply reply);
	
	/**
	 * 根据帖子ID查询帖子信息 
	 * @param msgid
	 * @return
	 */
	MessageInfo getMsg(int msgid);
	

	PageInfo<ReplyInfo> getReply(int msgid, int pageNum, int pageSize);
	

	PageInfo<MessageInfo> queryNew(int pageNum, int pageSize);

	PageInfo<MessageInfo> queryHot(int pageNum, int pageSize);

	PageInfo<MessageInfo> queryTheme(int pageNum, int pageSize);


	int deleteMsg(int msgId, int state);
	int restoreMsg(int msgId, int state);

//	int updateMsg(Message message);

	PageInfo<MessageInfo> search(MessageCriteria messageCriteria, int pageNum, int pageSize);
	
	long queryMsgCountByDate(Date startDate, Date endDate);	// 根据时间查发贴数量
	
	long queryReplyCountByDate(Date startDate, Date endDate);	// 根据时间回贴数量
}
