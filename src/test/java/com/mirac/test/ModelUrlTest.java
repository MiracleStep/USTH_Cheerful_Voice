package com.mirac.test;

import com.mirac.util.ModelApi;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest
@RunWith(SpringRunner.class)
public class ModelUrlTest {

    @Autowired
    private ModelApi modelApi;

    @Test
    public void testModelApi(){
        String ret = modelApi.getCategory("黑龙江科技大学");
        System.out.println(ret);
    }
}
