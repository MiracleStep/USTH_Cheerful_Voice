package com.mirac.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class MyBatisUtil {
    public static SqlSession getSqlSession()  {
        //1、读取核心配置文件
        String resource = "com/mirac/vo/mybatis-config2.xml";
        InputStream inputStream = null;
        try {
            inputStream = Resources.getResourceAsStream(resource);
            //2 通过加载配置文件创建会话工厂SqlSessionFactory
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
            //3 通过SqlSessionFactory得到SqlSession对象
            SqlSession sqlSession = sqlSessionFactory.openSession();
            return sqlSession;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
