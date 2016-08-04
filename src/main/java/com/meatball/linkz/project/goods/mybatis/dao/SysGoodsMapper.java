package com.meatball.linkz.project.goods.mybatis.dao;

import com.meatball.linkz.project.goods.mybatis.domain.SysGoods;



public interface SysGoodsMapper {
    int deleteByPrimaryKey(Integer goodsId);

    int insert(SysGoods record);

    int insertSelective(SysGoods record);

    SysGoods selectByPrimaryKey(Integer goodsId);

    int updateByPrimaryKeySelective(SysGoods record);

    int updateByPrimaryKey(SysGoods record);
}