package com.mirac.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.mirac.vo.ResponseResultVo;
import com.mirac.entity.Theme;
import com.mirac.service.IThemeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@Controller
@RequestMapping("/admin/theme")
public class AdminThemeController {

    @Autowired
    private IThemeService themeService;

    //搜索主题信息
    @RequestMapping("/searchTheme.action")
    private void searchTheme(HttpServletRequest request, HttpServletResponse response,String key,
                             @RequestParam(name = "pageNum", required = true, defaultValue = "1")Integer pageNum,
                             @RequestParam(name = "pageSize", defaultValue = "6")Integer pageSize)
            throws ServletException, IOException {

        PageInfo pageInfo = themeService.query(key, pageNum, pageSize);//根据关键字和分页信息查询主题信息
//        Gson gson=new Gson();
        String json = JSON.toJSONString(pageInfo);
//        String json=gson.toJson(pageInfo);//将page转化为json
        response.getWriter().println("{\"theme\":"+json+"}");
    }

    //添加主题
    @RequestMapping("/add.action")
    @ResponseBody
    private Object add(HttpServletRequest request, HttpServletResponse response,String thename) throws ServletException, IOException {
        Theme theme = new Theme();
        theme.setThename(thename);
        int result = themeService.add(theme);
        if (result > 0) {
            return ResponseResultVo.ADD_THEME_SUCCESS;
        } else {
            return ResponseResultVo.ADD_FAILURE;
        }
    }

    //删除信息
    @RequestMapping("/delete.action")
    @ResponseBody
    private Object delete(HttpServletRequest request, HttpServletResponse response,String theid) throws ServletException, IOException {
        int result = themeService.delete(Integer.parseInt(theid));
        if (result > 0) {
            return ResponseResultVo.DELETE_THEME_SUCCESS;
        } else {
            return ResponseResultVo.DELETE_THEME_FAILURE;
        }
    }

    //获取全部主题信息
    @RequestMapping("/getAllTheme.action")
    private void getAllTheme(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Theme> list = themeService.getAll();
//        Gson gson=new Gson();
        String json = JSON.toJSONString(list);
        response.getWriter().print("{\"theme\":"+json+"}");
    }
}
