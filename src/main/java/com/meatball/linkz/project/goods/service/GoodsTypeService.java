package com.meatball.linkz.project.goods.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.meatball.linkz.common.dao.BaseDao;
import com.meatball.linkz.common.service.BaseService;
import com.meatball.linkz.project.goods.dao.GoodsTypeDao;
import com.meatball.linkz.project.goods.model.GoodsType;

@Service
public class GoodsTypeService extends BaseService<GoodsType, Integer>{

	GoodsTypeDao goodsTypeDao;
	
	@Resource
	@Override
	public void setBaseDao(BaseDao<GoodsType, Integer> goodsTypeDao) {
		this.goodsTypeDao = (GoodsTypeDao) goodsTypeDao;
		this.baseDao = goodsTypeDao;
	}

}
