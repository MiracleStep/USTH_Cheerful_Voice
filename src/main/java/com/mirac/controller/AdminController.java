package com.mirac.controller;

import com.mirac.vo.ResponseResultVo;
import com.mirac.entity.Admin;
import com.mirac.entity.Info;
import com.mirac.service.IAdminService;
import com.mirac.service.IInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;


@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private IAdminService adminService;

    @Autowired
    private IInfoService infoService;


    //登录
    @RequestMapping(value = "/login.action", method = RequestMethod.POST,
            params = {"action", "username", "password"})
    @ResponseBody
    private Object login(HttpServletRequest request, HttpServletResponse response, String username, String password) throws ServletException, IOException {
        Admin admin = adminService.login(username, password);
        if (admin == null) {
            return ResponseResultVo.ADD_FAILURE;
        } else {
            //登录成功
            //用session保存数据
            request.getSession().setAttribute("admin", admin);
            return ResponseResultVo.ADD_SUCCESS;
        }

    }

    //退出
    @RequestMapping("/logout.action")
    @ResponseBody
    private Object logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("admin");
        return ResponseResultVo.WEL_NEXT_LOGIN;
    }

    //修改密码
    @RequestMapping("/update.action")
    @ResponseBody
    private Object update(HttpServletRequest request, HttpServletResponse response, String oldpassword, String newpassword) throws ServletException, IOException {
        //获取session中的admin
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        String name = admin.getName();
        String pwd = admin.getPwd();
        //验证session中的密码是否与输入的旧密码相同
        if (pwd.equals(oldpassword)) {
            admin.setName(name);
            admin.setPwd(newpassword);
            int res = adminService.updatepwd(admin);
            //将session中的pwd更换掉
            admin.setName(name);
            admin.setPwd(newpassword);
            request.getSession().setAttribute("admin", admin);
        }
        return ResponseResultVo.UPDATE_SUCCESS;
    }

    //发布通知
    @RequestMapping("/addInfo.action")
    @ResponseBody
    private Object add(HttpServletRequest request, HttpServletResponse response, Info info) throws ServletException, IOException {
        if (info.getContent() == null || info.getContent() == "" || info.getTargeturl() == null || info.getTargeturl() == ""
                || info.getTitle() == null || info.getTitle() == "") {
            return ResponseResultVo.INFO_FAILURE;
        }
        info.setInfotime(new Date());
        int rs = infoService.addInfo(info);

        if (rs > 0) {
            return ResponseResultVo.INFO_SUCCESSFULLY;
        } else {
            return ResponseResultVo.INFO_FAILURE;
        }
    }
}
