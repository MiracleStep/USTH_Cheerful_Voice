package com.mirac.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.pagehelper.PageInfo;
import com.mirac.entity.Info;

import java.util.List;


public interface IInfoService extends IService<Info> {
    //添加通知
    int addInfo(Info info);

    //获取所有通知
    List<Info> getAll();

    //获取通知带分页
    PageInfo<Info> getInfoByPage(Integer pageNum, Integer pageSize);

    //删除通知，物理删除
    int deleteInfo(int infoid);

}
