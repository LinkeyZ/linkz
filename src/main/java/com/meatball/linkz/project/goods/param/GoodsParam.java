package com.meatball.linkz.project.goods.param;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class GoodsParam {
	
	private String goodsName;
	
	private int goodsTypeId;
	
	private String isValid;
	
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	private Date date ;

	public int getGoodsTypeId() {
		return goodsTypeId;
	}

	public void setGoodsTypeId(int goodsTypeId) {
		this.goodsTypeId = goodsTypeId;
	}

	public String getIsValid() {
		return isValid;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public void setIsValid(String isValid) {
		this.isValid = isValid;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

}
