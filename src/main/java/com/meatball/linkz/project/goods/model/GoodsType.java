	package com.meatball.linkz.project.goods.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author zhxd
 *商品类别表
 */
@Entity
@Table(name="sys_goodstype")
public class GoodsType implements Serializable{

	private static final long serialVersionUID = 5595913969342228668L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="goods_type_id")
	private int goodsTypeId;
	
	@Column(name="goods_type_name")
	private String goodsTypeName;
	
	@Column(name="is_valid")
	private int isValid;
	
	private Date createTime;
	
	private String createMan;
	
	private String endTime;

	public int getGoodsTypeId() {
		return goodsTypeId;
	}

	public void setGoodsTypeId(int goodsTypeId) {
		this.goodsTypeId = goodsTypeId;
	}

	public String getGoodsTypeName() {
		return goodsTypeName;
	}

	public void setGoodsTypeName(String goodsTypeName) {
		this.goodsTypeName = goodsTypeName;
	}

	public int getIsValid() {
		return isValid;
	}

	public void setIsValid(int isValid) {
		this.isValid = isValid;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateMan() {
		return createMan;
	}

	public void setCreateMan(String createMan) {
		this.createMan = createMan;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	
}
