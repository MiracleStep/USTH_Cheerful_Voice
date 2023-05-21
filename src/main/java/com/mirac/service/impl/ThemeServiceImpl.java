package com.mirac.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mirac.mapper.MessageMapper;
import com.mirac.mapper.ThemeMapper;
import com.mirac.entity.Theme;
import com.mirac.service.IThemeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ThemeServiceImpl extends ServiceImpl<ThemeMapper, Theme> implements IThemeService {

	@Autowired
	private ThemeMapper themedao;

	@Autowired
	private MessageMapper messageMapper;

	@Override
	public int add(Theme theme) {
		return themedao.add(theme);
	}

	@Override
	public int delete(int theid) {
		messageMapper.deleteBytheId(theid);
		return themedao.delete(theid);
	}

	@Override
	public List<Theme> getAll() {
		return themedao.getAll();
	}

	@Override
	public PageInfo query(String key,Integer pageNum,Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Theme> themes = themedao.query(key);
		PageInfo pageInfo = new PageInfo(themes);
		return pageInfo;
	}

}
