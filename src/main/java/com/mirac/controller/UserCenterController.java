package com.mirac.controller;


import com.mirac.vo.ResponseResultVo;
import com.mirac.vo.RestResponseVo;
import com.mirac.entity.User;
import com.mirac.service.IUserService;
import com.mirac.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@Controller
@RequestMapping("/userCenter")
public class UserCenterController extends HttpServlet {

	@Autowired
	private IUserService userService;

	//获取登陆用户
	@RequestMapping("/getUser.action")
	@ResponseBody
	private Object getUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// 登录成功
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		return RestResponseVo.success(user);
	}

	//修改用户密码
	@RequestMapping("/updatePw.action")
	@ResponseBody
	private Object updatePw(HttpServletRequest request, HttpServletResponse response,String newpassword, String oldpassword) throws IOException {
		//获取session中的user用户名
		User user = (User) request.getSession().getAttribute("user");
		String username = user.getUsername();
		String password = user.getPassword();
		oldpassword = MD5Util.string2MD5(oldpassword+username);

		//验证session中的密码是否与输入的旧密码相同
		if( password.equals(oldpassword) ){
			user.setUsername(username);
			newpassword = MD5Util.string2MD5(newpassword+username);
			user.setPassword(newpassword);
			userService.updatePw(user);
			user.setUsername(username);
			user.setPassword(newpassword);
			request.getSession().setAttribute("user", user);
		}
		return ResponseResultVo.UPDATE_SUCCESS;
	}


	//修改信息
	@RequestMapping("/update.action")
	@ResponseBody
    private Object update(HttpServletRequest request, HttpServletResponse response,User user) throws ServletException, IOException {
		// 获取当前用户对象
		HttpSession session = request.getSession();
		User sessionUser = (User) session.getAttribute("user");
		User nUser = sessionUser.clone();

		// 更新
		int res = userService.update(user, nUser);

		if (res == 1){	// 更新成功
			// 获取更新后的数据
			nUser = userService.userLogin(nUser.getUsername(), nUser.getPassword());

			// 更新Session
			session.setAttribute("user", nUser);
			return RestResponseVo.success(nUser);
		} else {
			return ResponseResultVo.UPDATE_FAILURE;
		}
	}

}
