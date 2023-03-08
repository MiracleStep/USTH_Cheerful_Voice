package com.mirac.controller;

import com.github.pagehelper.PageInfo;
import com.mirac.vo.ResponseResultVo;
import com.mirac.vo.RestResponseVo;
import com.mirac.entity.Admin;
import com.mirac.entity.Info;
import com.mirac.entity.MessageCriteria;
import com.mirac.entity.MessageInfo;
import com.mirac.service.IInfoService;
import com.mirac.service.IMessageService;
import com.mirac.util.DateUtil;
import com.mirac.util.HTMLReplace;
import com.mirac.util.IPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;


@Controller
@RequestMapping("/admin/message")
public class AdminMessageController {

    @Autowired
    IInfoService iInfoService;

    @Autowired
    IMessageService iMessageService;


    //发布通知
    @RequestMapping("/addInfo.action")
    @ResponseBody
    private Object addInfo(HttpServletRequest request, HttpServletResponse response, Info info) throws IOException {
        HttpSession session = request.getSession();
        Admin admin=(Admin) session.getAttribute("admin");
        int userid=admin.getId();//用户ID
        String msgip= IPUtil.getIP(request);//发帖人的IP
        info.setContent(HTMLReplace.replace(info.getContent()));//帖子内容转换为HTML格式
        info.setUserid(userid);
        info.setInfoip(msgip);
        Date date = new Date();
        info.setInfotime(DateUtil.getToday(date));

        int rs=iInfoService.addInfo(info);
        if(rs>0){
            return ResponseResultVo.POST_SUCCESSFULLY;
        }else{
            return ResponseResultVo.POST_SUCCESSFULLY;
        }
    }

    //查询帖子
    @RequestMapping("/searchMsg.action")
    @ResponseBody
    private Object searchMsg(HttpServletRequest request, HttpServletResponse response,String key,String username,
                             @RequestParam(name = "theid", required = false, defaultValue = "-1") String theid,
                             @RequestParam(name = "pageNum", required = true, defaultValue = "1")Integer pageNum,
                             @RequestParam(name = "pageSize", defaultValue = "5")Integer pageSize) throws IOException {

        MessageCriteria messageCriteria = new MessageCriteria();
        messageCriteria.setKey(key);
        messageCriteria.setUsername(username);
        messageCriteria.setTheid(Integer.parseInt(theid));
        messageCriteria.setOrderRule(MessageCriteria.OrderRuleEnum.ORDER_BY_MSG_TIME);

        PageInfo<MessageInfo> resPage = iMessageService.search(messageCriteria, pageNum, pageSize);
        return RestResponseVo.success(resPage);

    }

    //恢复帖子
    @RequestMapping("/restoreMsg.action")
    @ResponseBody
    private Object restoreMsg(HttpServletRequest request, HttpServletResponse response,
                              @RequestParam(name = "msgid", required = true, defaultValue = "-1") Integer msgid) throws IOException {

        int res = iMessageService.restoreMsg(msgid, 0);

        if (res == 1){
            return ResponseResultVo.RESTORE_SUCCESS;
        }
        else {
            return ResponseResultVo.RESTORE_FAILURE;
        }
    }

    //删除帖子
    @RequestMapping("/deleteMsg.action")
    @ResponseBody
    private Object deleteMsg(HttpServletRequest request, HttpServletResponse response,
                             @RequestParam(name = "msgid", required = true, defaultValue = "-1") Integer msgid) throws IOException {

        int res = iMessageService.deleteMsg(msgid, -1);

        if (res == 1){
            return ResponseResultVo.DELETE_SUCCESS;
        }
        else {
            return ResponseResultVo.DELETE_ERROR;
        }
    }

    //获取回复回复量
    @RequestMapping("/getReplyCount.action")
    private void getReplyCount(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Date date = new Date();

        // 本日发贴量
        long today = iMessageService.queryReplyCountByDate(DateUtil.getToday(date), DateUtil.getTomorrow(date));
        long week = iMessageService.queryReplyCountByDate(DateUtil.getWeekAgo(date), DateUtil.getTomorrow(date));
        long month = iMessageService.queryReplyCountByDate(DateUtil.getMonthAgo(date), DateUtil.getTomorrow(date));

        response.getWriter().print("{\"res\": 1, \"data\": {\"today\": "+today+", \"week\": "+week+", \"month\": "+month+"}}");
    }

    //获取发帖次数统计
    @RequestMapping("/getMsgCount.action")
    private void getMsgCount(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Date date = new Date();

        // 本日发贴量
        long today = iMessageService.queryMsgCountByDate(DateUtil.getToday(date), DateUtil.getTomorrow(date));
        long week = iMessageService.queryMsgCountByDate(DateUtil.getWeekAgo(date), DateUtil.getTomorrow(date));
        long month = iMessageService.queryMsgCountByDate(DateUtil.getMonthAgo(date), DateUtil.getTomorrow(date));

        response.getWriter().print("{\"res\": 1, \"data\": {\"today\": "+today+", \"week\": "+week+", \"month\": "+month+"}}");
    }
}
