package com.mirac;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

//启动类
@Slf4j //添加日志功能： 可以直接调用log.info()
@SpringBootApplication
@ServletComponentScan // 扫描过滤器注解
@EnableTransactionManagement
@MapperScan("com.mirac.mapper")
public class AppServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(AppServerApplication.class, args);
    }
}
