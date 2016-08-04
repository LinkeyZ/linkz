package com.meatball.linkz.project.city.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.meatball.linkz.common.dao.BaseDao;
import com.meatball.linkz.common.service.BaseService;
import com.meatball.linkz.project.city.dao.CityDao;
import com.meatball.linkz.project.city.model.City;

@Service
public class CityService extends BaseService<City, Integer>{
	
	
	public CityDao cityDao;

	@Resource
	public void setBaseDao(BaseDao<City, Integer> cityDao) {
		this.baseDao = cityDao;
		this.cityDao = (CityDao) cityDao;
	}

}
