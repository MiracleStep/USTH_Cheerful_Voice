package com.mirac.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.mirac.entity.MessageCriteria;
import com.mirac.vo.RestResponseVo;
import com.mirac.entity.MessageInfo;
import com.mirac.entity.ReplyInfo;
import com.mirac.service.IMessageService;
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
import java.io.IOException;


@Controller
@RequestMapping(value = "/message", produces = "application/json; charset=utf-8" )
public class MessageController extends HttpServlet {

	@Autowired
	private IMessageService messageservice;


    // 查看帖子详细信息
	@RequestMapping("/getMsg.action")
	@ResponseBody
	private Object getMsg(HttpServletRequest request, HttpServletResponse response,Integer msgId) throws ServletException, IOException  {
		MessageInfo messageInfo = messageservice.getMsg(msgId);
		return RestResponseVo.success(messageInfo);
	}

	// 查询帖子回复内容
	@RequestMapping("/getReply.action")
	private void getReply(HttpServletRequest request, HttpServletResponse response, Integer msgId,
						  @RequestParam(name = "pageNum", required = true, defaultValue = "1")Integer pageNum,
						  @RequestParam(name = "pageSize", defaultValue = "5")Integer pageSize) throws ServletException, IOException  {

		PageInfo<ReplyInfo> reply = messageservice.getReply(msgId, pageNum, pageSize);

//		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();

		String json = JSON.toJSONString(reply);
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().print("{\"reply\":"+json+"}");
	}

	// 最新帖子
	@RequestMapping("/topNew.action")
	@ResponseBody
	private Object topNew(HttpServletRequest request, HttpServletResponse response,
						  @RequestParam(name = "pageNum", required = true, defaultValue = "1")Integer pageNum,
						  @RequestParam(name = "pageSize", defaultValue = "5")Integer pageSize) throws ServletException, IOException  {

		PageInfo<MessageInfo> page = messageservice.queryNew(pageNum, pageSize);
		return RestResponseVo.success(page);
	}

	// 最热帖子
	@RequestMapping("/topHot.action")
	@ResponseBody
	private Object topHot(HttpServletRequest request, HttpServletResponse response,
						  @RequestParam(name = "pageNum", required = true, defaultValue = "1")Integer pageNum,
						  @RequestParam(name = "pageSize", defaultValue = "5")Integer pageSize) throws ServletException, IOException  {

		PageInfo<MessageInfo> page = messageservice.queryHot(pageNum, pageSize);

//		Gson gson = new GsonBuilder().setDateFormat("M/d").create();
//		String json=gson.toJson(page);
//		response.getWriter().print("{\"res\": 1,\"hotMsg\":"+json+"}");
		return RestResponseVo.success(page);
	}

	// 查询最热5主题的，最新帖
	@RequestMapping("/topTheme.action")
	@ResponseBody
	private Object topTheme(HttpServletRequest request, HttpServletResponse response,
							@RequestParam(name = "pageNum", required = true, defaultValue = "1")Integer pageNum,
							@RequestParam(name = "pageSize", defaultValue = "5")Integer pageSize) throws ServletException, IOException {

		PageInfo<MessageInfo> page = messageservice.queryTheme(pageNum, pageSize);
//		Gson gson = new GsonBuilder().setDateFormat("M/d").create();
//		String json=gson.toJson(page);
//		response.getWriter().print("{\"res\": 1, \"themeMsg\":"+json+"}");
		return RestResponseVo.success(page);
	}

	//获取和查询帖子（审核通过的，帖子状态为0或-1）
	@RequestMapping("/searchMsg.action")
	@ResponseBody
	private Object searchMsg(HttpServletRequest request, HttpServletResponse response,String key,String username,
							 @RequestParam(name = "theid", required = false, defaultValue = "-1") String theid,
							 @RequestParam(name = "state", required = false, defaultValue = "0")Integer state,
							 @RequestParam(name = "pageNum", required = true, defaultValue = "1")Integer pageNum,
							 @RequestParam(name = "pageSize", defaultValue = "10")Integer pageSize) throws IOException {

		MessageCriteria messageCriteria = new MessageCriteria();
		messageCriteria.setKey(key);
		messageCriteria.setState(state);
		messageCriteria.setUsername(username);
		messageCriteria.setTheid(Integer.parseInt(theid));
		messageCriteria.setOrderRule(MessageCriteria.OrderRuleEnum.ORDER_BY_MSG_TIME);

		PageInfo<MessageInfo> resPage = messageservice.search(messageCriteria, pageNum, pageSize);
		return RestResponseVo.success(resPage);
	}
}
