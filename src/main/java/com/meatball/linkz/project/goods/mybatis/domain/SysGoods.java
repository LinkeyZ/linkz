package com.meatball.linkz.project.goods.mybatis.domain;

import java.util.Date;

public class SysGoods {
    private Integer goodsId;

    private String createman;

    private Date createtime;

    private Date endtime;

    private String goodsName;

    private Integer isValid;

    private Integer goodstypeGoodsTypeId;

    public SysGoods(Integer goodsId, String createman, Date createtime, Date endtime, String goodsName, Integer isValid, Integer goodstypeGoodsTypeId) {
        this.goodsId = goodsId;
        this.createman = createman;
        this.createtime = createtime;
        this.endtime = endtime;
        this.goodsName = goodsName;
        this.isValid = isValid;
        this.goodstypeGoodsTypeId = goodstypeGoodsTypeId;
    }

    public SysGoods() {
        super();
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getCreateman() {
        return createman;
    }

    public void setCreateman(String createman) {
        this.createman = createman == null ? null : createman.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public Integer getIsValid() {
        return isValid;
    }

    public void setIsValid(Integer isValid) {
        this.isValid = isValid;
    }

    public Integer getGoodstypeGoodsTypeId() {
        return goodstypeGoodsTypeId;
    }

    public void setGoodstypeGoodsTypeId(Integer goodstypeGoodsTypeId) {
        this.goodstypeGoodsTypeId = goodstypeGoodsTypeId;
    }
}