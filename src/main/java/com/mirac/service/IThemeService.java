package com.mirac.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.pagehelper.PageInfo;
import com.mirac.entity.Theme;

import java.util.List;

/**
 * 主题业务层接口
 * 
 * @author Administrator
 *
 */
public interface IThemeService extends IService<Theme> {
	int add(Theme theme);

	int delete(int theid);

	List getAll();

	PageInfo query(String key,Integer pageNum,Integer pageSize);
}
