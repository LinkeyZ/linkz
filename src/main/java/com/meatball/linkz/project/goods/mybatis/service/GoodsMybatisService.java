package com.meatball.linkz.project.goods.mybatis.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.meatball.linkz.project.goods.mybatis.dao.SysGoodsMapper;
import com.meatball.linkz.project.goods.mybatis.domain.SysGoods;

@Service
public class GoodsMybatisService {
	
	@Resource
	SysGoodsMapper goodsMapper;
	
	public SysGoods selectByPrimaryKey(Integer goodsId){
		return goodsMapper.selectByPrimaryKey(goodsId);
	}

}
