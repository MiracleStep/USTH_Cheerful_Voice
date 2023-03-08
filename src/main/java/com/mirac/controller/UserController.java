package com.mirac.controller;

import com.mirac.vo.ResponseResultVo;
import com.mirac.vo.RestResponseVo;
import com.mirac.entity.User;
import com.mirac.service.IUserService;
import com.mirac.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;


@Controller
@RequestMapping("/userhandler")
public class UserController extends HttpServlet {

	@Autowired
    private IUserService userService;

	//注销
	@RequestMapping("/logout.action")
	@ResponseBody
	private Object logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().invalidate();//使session无效
		//response.getWriter().print("{\"res\": 1, \"info\":\"欢迎下次登录！\"}");
		return ResponseResultVo.WEL_NEXT_LOGIN;
	}

	//注册
	@RequestMapping("/register.action")
	@ResponseBody
	private Object register(HttpServletRequest request, HttpServletResponse response,User user) throws IOException {
		boolean exist = userService.isExist(user.getUsername());
		if(exist){
			return ResponseResultVo.USER_EXISTS_ERROR;
		}
		user.setPassword(MD5Util.string2MD5(user.getPassword()+user.getUsername()));
		int res = userService.userRegister(user);
		if (res == 1){
			// 自动登录
			user = userService.userLogin(user.getUsername(), user.getPassword());

			// 登录成功
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			return RestResponseVo.success(user);
		}
		else {
			return ResponseResultVo.REGISTER_FAILURE;
		}
	}

	//登陆
	//"action" : "login", "username": username, "password": password,"remPwd":remPwd
	@RequestMapping(value = "/login.action",method = RequestMethod.POST,
			params = {"action","username","password","remPwd"})
	@ResponseBody
	private Object login(HttpServletRequest request, HttpServletResponse response, User user,String remPwd) throws IOException, ServletException {
		String username = user.getUsername();
		String password = user.getPassword();
		if(remPwd.equals("1")){
			Cookie userCookie = new Cookie("username",user.getUsername());
			Cookie passCookie = new Cookie("password", user.getPassword());
			userCookie.setMaxAge(60*60*60);
			passCookie.setMaxAge(60*60*60);
			response.addCookie(userCookie);
			response.addCookie(passCookie);
		}
		if (username == null || username.trim().length() < 6 || username.trim().length() > 16 || password == null
				|| password.trim().length() < 6 || password.trim().length() > 16) {
			// 信息有问题重新登录
			return ResponseResultVo.ERROR_CODE;
		}
		
		user = userService.userLogin(username, password);
		
		if (user == null){
			// 登录失败 用户名或密码错误
			return ResponseResultVo.USER_PASS_ERROR_LOGIN;
		} else if(user.getState() == -1){
			// 登录失败 帐号被封
			return ResponseResultVo.BANNED;
		}else{
			// 用户登录重复判断
			// 登录成功
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(30*60*60*24);
			session.setAttribute("user", user);
			return RestResponseVo.success(user);
		}
	}
}
