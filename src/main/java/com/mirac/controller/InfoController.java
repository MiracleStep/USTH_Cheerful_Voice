package com.mirac.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.mirac.vo.ResponseResultVo;
import com.mirac.vo.RestResponseVo;
import com.mirac.entity.Info;
import com.mirac.service.IInfoService;
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
import java.util.List;


@Controller
@RequestMapping("/info")
public class InfoController extends HttpServlet {

	@Autowired
	private IInfoService infoService;

	//查看所有重要通知
	@RequestMapping("/getAllInfo.action")
	private void getAllInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		List<Info> list = infoService.getAll();
		String json = JSON.toJSONString(list);
		response.getWriter().print("{\"info\":"+json+"}");
	}

	//查看所有重要通知(带分页)
	@RequestMapping("/getInfoByPage.action")
	@ResponseBody
	private Object getInfoByPage(HttpServletRequest request, HttpServletResponse response,
								 @RequestParam(name = "pageNum", required = true, defaultValue = "1")Integer pageNum,
								@RequestParam(name = "pageSize", defaultValue = "5")Integer pageSize) throws ServletException, IOException  {

		PageInfo<Info> resPage = infoService.getInfoByPage(pageNum, pageSize);

		return RestResponseVo.success(resPage);
	}

	//删除特定通知
	@RequestMapping("/deleteInfo.action")
	@ResponseBody
	private Object deleteInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String infoid = request.getParameter("infoid");
		if(infoid == null || infoid.equals("")){
			infoid = "-1";
		}
		int res = infoService.deleteInfo(Integer.parseInt(infoid));

		if (res == 1){
			return ResponseResultVo.DELETE_SUCCESS;
		}
		else {
			return ResponseResultVo.DELETE_ERROR;
		}
	}




}
