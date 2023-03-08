package com.mirac.controller;

import com.github.pagehelper.PageInfo;
import com.mirac.vo.ResponseResultVo;
import com.mirac.vo.RestResponseVo;
import com.mirac.entity.User;
import com.mirac.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Controller
@RequestMapping("/admin/adminUser")
public class AdminUserController extends HttpServlet {

	@Autowired
    IUserService iUserService;

	//恢复用户
	@RequestMapping("/restoreUser.action")
	@ResponseBody
	private Object restoreUser(HttpServletRequest request, HttpServletResponse response,
							   @RequestParam(name = "userid",required = true, defaultValue = "-1") Integer userid) throws IOException {

		User user = new User();
		user.setUserid(userid);
		user.setState(-1);
		int res = iUserService.restoreUser(user);
		
		if (res == 1){
			return ResponseResultVo.RESTORE_SUCCESS;
		} else {
			return ResponseResultVo.RESTORE_FAILURE;
		}
	}

	//删除用户
	@RequestMapping("/deleteUser.action")
	@ResponseBody
	private Object deleteUser(HttpServletRequest request, HttpServletResponse response,
							  @RequestParam(name = "userid",required = true, defaultValue = "-1") Integer userid) throws IOException {
		User user = new User();
		user.setUserid(userid);
		user.setState(-1);
		int res = iUserService.deleteUser(user);

		if (res == 1){
			return ResponseResultVo.DELETE_SUCCESS;
		}
		else {
			return ResponseResultVo.DELETE_SUCCESS;
		}
	}

	//获取用户和查询用户
	@RequestMapping("/getUser.action")
	@ResponseBody
	private Object getUser(HttpServletRequest request, HttpServletResponse response,
						   @RequestParam(name = "username", required = false)String username,
						   @RequestParam(name = "pageNum", required = true, defaultValue = "1")Integer pageNum,
						   @RequestParam(name = "pageSize", defaultValue = "5")Integer pageSize) throws IOException, ServletException {

		PageInfo resPage = iUserService.searchByName(username, pageNum, pageSize);

		return RestResponseVo.success(resPage);
	}
}
