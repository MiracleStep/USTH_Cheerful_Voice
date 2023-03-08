package com.mirac.interceptor;


import com.mirac.entity.Admin;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class ManagerLoginCheckInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session =  request.getSession();
        Admin admin = (Admin)session.getAttribute("admin");
        if(admin == null && !request.getRequestURI().equals("/admin/login.action") && !request.getRequestURI().contains("/admin/theme/getAllTheme.action")) {
            response.getWriter().println("{\"res\":-2, \"info\":\"未登录管理员账户！\"}");
        }else {
            return true;
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
