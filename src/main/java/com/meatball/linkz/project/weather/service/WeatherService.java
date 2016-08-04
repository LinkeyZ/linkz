package com.meatball.linkz.project.weather.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.meatball.linkz.common.dao.BaseDao;
import com.meatball.linkz.common.service.BaseService;
import com.meatball.linkz.project.weather.dao.WeatherDao;
import com.meatball.linkz.project.weather.model.Weather;

@Service
public class WeatherService extends BaseService<Weather, Integer>{
	
	private WeatherDao weatherDao; 

	@Override
	@Resource
	public void setBaseDao(BaseDao<Weather, Integer> weatherDao) {
		this.baseDao = weatherDao;
		this.weatherDao = (WeatherDao) weatherDao;
	}

	public boolean queryCityIsSaved(String date, String cityId) {
		StringBuffer hql = new StringBuffer();
		hql.append(" from Weather ");
		hql.append(" where cityId = '").append(cityId).append("'");
		hql.append(" and DATE_FORMAT(queryDate ,'%Y-%m-%d') = '").append(date).append("'");
		
		List<Weather> list = (List<Weather>) weatherDao.findByHql(hql.toString(), 0, 0);
		
		if(list != null && !list.isEmpty()){
			return true;
		}else{
			return false;
		}
		
		
	}

}
