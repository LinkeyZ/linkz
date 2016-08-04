package com.meatball.linkz.project.downLoad.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.meatball.linkz.common.dao.BaseDao;
import com.meatball.linkz.common.service.BaseService;
import com.meatball.linkz.project.downLoad.dao.PictureDao;
import com.meatball.linkz.project.downLoad.model.SysPicture;

@Service
public class PictureService extends BaseService<SysPicture, Integer>{
	
	@Resource
	PictureDao pictureDao;

	@Override
	public void setBaseDao(BaseDao<SysPicture, Integer> pictureDao) {
		
		this.baseDao = pictureDao;
		this.pictureDao = (PictureDao) pictureDao;
	}

}
