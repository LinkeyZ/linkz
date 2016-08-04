package com.meatball.linkz.project.goods.service;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.meatball.linkz.common.dao.BaseDao;
import com.meatball.linkz.common.service.BaseService;
import com.meatball.linkz.project.goods.dao.GoodsDao;
import com.meatball.linkz.project.goods.model.Goods;

@Service
public class GoodsService extends BaseService<Goods, Integer>{

	
	public GoodsDao goodsDao;
	
	@Resource
	@Override
	public void setBaseDao(BaseDao<Goods, Integer> goodsDao) {
		this.baseDao = goodsDao;
		this.goodsDao = (GoodsDao) goodsDao;
	}

	
	public void updateGoods(Goods goods) {
		
		goodsDao.update(goods);
	}

	
}
