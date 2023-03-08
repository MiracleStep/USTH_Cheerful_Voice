package com.mirac.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mirac.mapper.InfoMapper;
import com.mirac.entity.Info;
import com.mirac.service.IInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InfoServiceImpl extends ServiceImpl<InfoMapper, Info> implements IInfoService {

	@Autowired
	InfoMapper infoDao;

	@Override
	public int addInfo(Info info) {
		return infoDao.add(info);
	}

	@Override
	public List<Info> getAll() {
		return infoDao.getAll();
	}

	@Override
	public PageInfo<Info> getInfoByPage(Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Info> infos = infoDao.queryByPage();
		PageInfo<Info> pageInfos = new PageInfo<>(infos);
		return pageInfos;
	}

	@Override
	public int deleteInfo(int infoid) {
		return infoDao.delete(infoid);
	}
}
