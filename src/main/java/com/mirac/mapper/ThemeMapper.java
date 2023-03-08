package com.mirac.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mirac.entity.Theme;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 主题数据访问接口
 * @author Administrator
 *
 */
public interface ThemeMapper extends BaseMapper<Theme> {
	
	/**
	 * 新增主题
	 * @param theme
	 * @return
	 */
	int add(Theme theme);
	
	/**
	 * 删除主题
	 * @param theid
	 * @return
	 */
	int delete(int theid);
	
	/**
	 * 查询全部主题
	 * @return
	 */
	List<Theme> getAll();
	
	/**
	 * 根据关键字查询主题信息
	 * @param key
	 * @return
	 */
	List<Theme> query(@Param("key")String key);
}
