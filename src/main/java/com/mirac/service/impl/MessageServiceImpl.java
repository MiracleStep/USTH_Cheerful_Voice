package com.mirac.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mirac.entity.*;
import com.mirac.mapper.MessageMapper;
import com.mirac.mapper.ReplyMapper;
import com.mirac.service.IMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class MessageServiceImpl extends ServiceImpl<MessageMapper, MessageInfo> implements IMessageService{

	@Autowired
	private MessageMapper messagedao;



	@Autowired
	private ReplyMapper replydao;

	@Override
	public int addMsg(Message message) {
		return messagedao.add(message);
	}

	@Override
	@Transactional
	public int replyMsg(Reply reply) {
		return replydao.replyMsg(reply);
	}

	@Override
	@Transactional
	public MessageInfo getMsg(int msgid) {
		//增加浏览量
//		countdao.updateAccessCount(msgid);
		return messagedao.get(msgid);
	}

	@Override
	public PageInfo<ReplyInfo> getReply(int msgid, int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<ReplyInfo> replyInfos = replydao.queryBymsgid(msgid);
		PageInfo<ReplyInfo> replyInfoPageInfo = new PageInfo<>(replyInfos);
		return replyInfoPageInfo;
	}

	@Override
	public PageInfo<MessageInfo> queryNew(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<MessageInfo> messageInfos = messagedao.queryNew();
		PageInfo<MessageInfo> messageInfoPageInfo = new PageInfo<>(messageInfos);
		return messageInfoPageInfo;
	}

	@Override
	public PageInfo<MessageInfo> queryHot(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<MessageInfo> messageInfos = messagedao.queryHot();
		PageInfo<MessageInfo> messageInfoPageInfo = new PageInfo<>(messageInfos);
		return messageInfoPageInfo;
	}

	@Override
	public PageInfo<MessageInfo> queryTheme(int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<MessageInfo> messageInfos = messagedao.queryTheme();
		PageInfo<MessageInfo> messageInfoPageInfo = new PageInfo<>(messageInfos);
		return messageInfoPageInfo;
	}

	@Override
	public int deleteMsg(int msgId, int state) {
		return messagedao.updateState(msgId, state);
	}

	@Override
	public int restoreMsg(int msgId, int state) {
		return messagedao.updateState(msgId, state);
	}

//	@Override
//	public int updateMsg(Message message) {
//		return 0;
//	}

	@Override
	public PageInfo<MessageInfo> search(MessageCriteria messageCriteria, int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		if (messageCriteria.getOrderRule() == MessageCriteria.OrderRuleEnum.ORDER_BY_ACCESS_COUNT){
			messageCriteria.setOrderType("1");
		}else if (messageCriteria.getOrderRule() == MessageCriteria.OrderRuleEnum.ORDER_BY_MSG_TIME){
			messageCriteria.setOrderType("2");
		}
		List<MessageInfo> messageInfos = messagedao.query(messageCriteria);
		PageInfo<MessageInfo> messageInfoPageInfo = new PageInfo<>(messageInfos);
		return messageInfoPageInfo;
	}

	@Override
	public long queryMsgCountByDate(Date startDate, Date endDate) {
		return messagedao.queryCountByDate(startDate, endDate);
	}

	@Override
	public long queryReplyCountByDate(Date startDate, Date endDate) {
		return replydao.queryCountByDate(startDate, endDate);
	}

}
