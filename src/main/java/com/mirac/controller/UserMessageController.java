package com.mirac.controller;

import com.github.pagehelper.PageInfo;
import com.mirac.util.ModelApi;
import com.mirac.vo.ResponseResultVo;
import com.mirac.vo.RestResponseVo;
import com.mirac.entity.*;
import com.mirac.entity.MessageCriteria.OrderRuleEnum;
import com.mirac.service.IMessageService;
import com.mirac.util.HTMLReplace;
import com.mirac.util.IPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@Controller
@RequestMapping("/userMessage")
public class UserMessageController extends HttpServlet {

	@Autowired
	private IMessageService messageservice;

	@Autowired
	private ModelApi modelApi;


	//发帖
	@RequestMapping("/add.action")
	@ResponseBody
	private Object add(HttpServletRequest request, HttpServletResponse response, Message message) throws ServletException, IOException {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		int userid=user.getUserid();//用户ID
		String msgip=IPUtil.getIP(request);//发帖人的IP
		message.setMsgcontents(HTMLReplace.replace(message.getMsgcontents()));//帖子内容转换为HTML格式

		message.setUserid(userid);
		message.setMsgip(msgip);

		//调用模型进行分类
		String category = modelApi.getCategory(message.getMsgtopic());
		message.setCategory(category);
		int rs=messageservice.addMsg(message);

		if(rs>0){
			return ResponseResultVo.POST_SUCCESSFULLY;
		}else{
			return ResponseResultVo.POST_FAILURE;
		}
	}
	
	//查询我的帖子
	@RequestMapping("/getMyMsg.action")
	@ResponseBody
	private Object getMyMsg(HttpServletRequest request, HttpServletResponse response,
							@RequestParam(name = "pageNum", required = true, defaultValue = "1")Integer pageNum,
							@RequestParam(name = "pageSize", defaultValue = "5")Integer pageSize) throws ServletException, IOException {

		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		int  userid=user.getUserid();
		//创建封装查询条件对象
		MessageCriteria messageCriteria=new MessageCriteria();
		messageCriteria.setUserid(userid);
		messageCriteria.setOrderRule(OrderRuleEnum.ORDER_BY_MSG_TIME);//排序条件
		messageCriteria.setState(0);//查询非禁用状态
		PageInfo<MessageInfo> page = messageservice.search(messageCriteria, pageNum, pageSize);
		return RestResponseVo.success(page);
	}
	
	//回帖
	@RequestMapping("/replyMsg.action")
	@ResponseBody
	private Object replyMsg(HttpServletRequest request, HttpServletResponse response,String msgId, String replycontent) throws ServletException, IOException {
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		int userid=user.getUserid();//用户ID
		String replyip=IPUtil.getIP(request);//获取IP
		replycontent=HTMLReplace.replace(replycontent);
		Reply reply=new Reply();
		reply.setUserid(userid);
		reply.setMsgid(Integer.parseInt(msgId));
		reply.setReplycontents(replycontent);
		reply.setReplyip(replyip);
		int rs=messageservice.replyMsg(reply);
		if(rs>0){
			return ResponseResultVo.REPLY_SUCCESSFULLY;
		}else{
			return ResponseResultVo.REPLY_FAILURE;
		}
	}
}
