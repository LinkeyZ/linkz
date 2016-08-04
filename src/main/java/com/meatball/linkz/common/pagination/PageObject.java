package com.meatball.linkz.common.pagination;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.meatball.linkz.common.util.CheckNull;

public class PageObject implements java.io.Serializable {

	/**
	 * 序列化数据
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 当前页面的数据
	 */
	private List<?> pageList;

	/**
	 * 总页数
	 */
	private int totalPage;

	/**
	 * 当前页
	 */
	private int currPage = 1;

	/**
	 * 每页数量
	 */
	private int onePageSize = 10;

	/** 总数量 **/
	private int sum;

	private int pagerRange = 5;

	/** 页面访问url **/
	private String pageUrl;

	/** 参数存放MAP **/
	private Map<String, Object> paraMap = new HashMap<String, Object>();

	/**
	 * <p>
	 * 设置参数
	 * </p>
	 * 
	 * @author Lennon.Wang
	 * @date 2015-9-2 上午09:58:31
	 * @param key
	 * @param value
	 */
	public void put(String key, Object value) {
		paraMap.put(key, value);
	}

	/**
	 * <p>
	 * 移除参数
	 * </p>
	 * 
	 * @author Lennon.Wang
	 * @date 2015-9-2 上午09:58:39
	 * @param key
	 * @return
	 */
	public Object remove(String key) {
		return paraMap.remove(key);
	}

	/**
	 * 创建一个新的实例 PageObject.
	 * 
	 */
	public PageObject() {
	}

	/**
	 * 创建一个新的实例 PageObject.
	 * 
	 * @param sum
	 *            总数量
	 */
	@SuppressWarnings("unchecked")
	public PageObject(int sum) {
		this.sum = sum;
		this.pageList = new ArrayList();
		if (onePageSize != 0) {
			int div = sum / onePageSize;
			this.totalPage = (sum % onePageSize == 0) ? div : div + 1;
		}
	}

	/**
	 * 获得当前页面的数据
	 * 
	 * @return 当前页面的数据
	 */
	public List<?> getPageList() {
		return pageList;
	}

	/**
	 * 设置当前页面的数据
	 * 
	 * @param pageList
	 *            当前页面的数据
	 */
	public void setPageList(List<?> pageList) {
		this.pageList = pageList;
	}

	/**
	 * 获得总数量
	 * 
	 * @return 总数量
	 */
	public Integer getSum() {
		return sum;
	}

	/**
	 * 设置总数量
	 * 
	 * @param sum
	 *            总数量
	 */
	public void setSum(Integer sum) {
		this.sum = sum;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getCurrPage() {
		return currPage;
	}

	public void setCurrPage(Integer currPage) {
		if (CheckNull.isNull(currPage)) {
			currPage = 1;
		}
		this.currPage = currPage;
	}

	public int getOnePageSize() {
		return onePageSize;
	}

	public void setOnePageSize(int onePageSize) {
		if (onePageSize != 0) {
			int div = sum / onePageSize;
			this.totalPage = (sum % onePageSize == 0) ? div : div + 1;
		}
		this.onePageSize = onePageSize;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public void setSum(int sum) {
		if (onePageSize != 0) {
			int div = sum / onePageSize;
			this.totalPage = (sum % onePageSize == 0) ? div : div + 1;
		}
		this.sum = sum;
	}

	public int getPagerRange() {
		return pagerRange;
	}

	public void setPagerRange(int pagerRange) {
		this.pagerRange = pagerRange;
	}

	public String getPageUrl() {
		return pageUrl;
	}

	public void setPageUrl(String pageUrl) {
		this.pageUrl = pageUrl;
	}

	public String toParamString() {
		StringBuffer sb = new StringBuffer();
		if (!CheckNull.isNull(paraMap)) {
			sb.append("&");
			Iterator<String> it = paraMap.keySet().iterator();
			String key = "";
			Object o = null;
			while (it.hasNext()) {
				key = it.next();
				o = paraMap.get(key);
				if (!CheckNull.isNull(o)) {
					sb.append(key).append("=").append(o).append("&");
				}
			}
		}
		String retStr = sb.toString();
		if (retStr.endsWith("&")) {
			retStr = retStr.substring(0, retStr.length() - 1);
		}
		return retStr;
	}

	/**
	 * 重写ToString方法
	 * 
	 * @return 字符串
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "PageObject [currPage=" + currPage + ", onePageSize=" + onePageSize + ", pageList=" + pageList
				+ ", pageUrl=" + pageUrl + ", pagerRange=" + pagerRange + ", sum=" + sum + ", totalPage=" + totalPage
				+ "]";
	}
}
