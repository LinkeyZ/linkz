package com.meatball.linkz.common.pagination;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
public class Page<E> {
	
	/** 是否为首页 **/
	private boolean hasPre;
	
	/** 是否为尾页 **/
	private boolean hasNext;
	
	/** 对象列表 **/
	private List<E> items = new ArrayList<E>();
	
	/** 当前页页码(起始为1) **/
	private int index;
	
	/** 分页上下文 **/
	private QuickPageContext<E> context;

	public boolean isHasPre() {
		return hasPre;
	}

	public void setHasPre(boolean hasPre) {
		this.hasPre = hasPre;
	}

	public boolean isHasNext() {
		return hasNext;
	}

	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}

	public List<E> getItems() {
		return this.items == null ? Collections.<E>emptyList() : this.items;
	}

	public void setItems(List<E> items) {
		this.items = items;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public IPageContext<E> getContext() {
		return context;
	}

	public void setContext(QuickPageContext<E> context) {
		this.context = context;
	}
}
