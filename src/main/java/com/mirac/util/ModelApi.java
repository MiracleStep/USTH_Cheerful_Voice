package com.mirac.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;

//@ConfigurationProperties(prefix = "com.lll.db")
@Component
public class ModelApi {

    @Autowired
    private RestTemplate restTemplate;


    @Value("${model.model-url}")
    private String modelUrl;

    public String getCategory(String str){
        modelUrl = modelUrl+"?inputdata={inputdata}";
        HashMap<String, String> paramMap = new HashMap<>();
        paramMap.put("inputdata", str);

        String result = restTemplate.getForObject(modelUrl, String.class, paramMap);
        JSONObject jsonObject = JSONObject.parseObject(result);
        return jsonObject.getString("result");
    }
}
