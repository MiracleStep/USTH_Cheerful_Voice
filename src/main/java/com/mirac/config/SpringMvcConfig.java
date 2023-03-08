package com.mirac.config;

import com.mirac.interceptor.CharsetEncodingInterceptor;
import com.mirac.interceptor.ManagerLoginCheckInterceptor;
import com.mirac.interceptor.UserLoginCheckInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class SpringMvcConfig implements WebMvcConfigurer {

    @Autowired
    private CharsetEncodingInterceptor charsetEncodingInterceptor;

    @Autowired
    private UserLoginCheckInterceptor userLoginCheckInterceptor;

    @Autowired
    private ManagerLoginCheckInterceptor managerLoginCheckInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //配置拦截器
        registry.addInterceptor(charsetEncodingInterceptor).addPathPatterns("/**");
        registry.addInterceptor(userLoginCheckInterceptor).addPathPatterns("/user/**","/userMessage/add.action");
        registry.addInterceptor(managerLoginCheckInterceptor).addPathPatterns("/admin/**");
    }
}
