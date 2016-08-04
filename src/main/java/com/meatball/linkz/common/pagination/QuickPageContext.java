package com.meatball.linkz.common.pagination;

import java.util.List;

import com.meatball.linkz.common.Constants;
public class QuickPageContext<E> implements IPageContext<E> {
	
	/** 对象列表 **/
	private List<E> items;
	
    /** 总记录数 **/
    private int totalCount;
    
    /** 每页显示记录数 **/
    private int pageSize;
    
    /**
     * <p>Title: QuickPageContext</p>
     * <p>Description: 初始化</p>
     * @param totalCount
     * @param pageSize
     * @param items
     */
    public QuickPageContext(int totalCount, int pageSize, List<E> items) {
        this.totalCount = totalCount;
        this.pageSize = pageSize == 0 ? Constants.DEFAULT_PAGE_SIZE : pageSize;
        if (items != null) {
            this.items = items;
        }
    }

	public int getPageCount() {
		int div = totalCount / pageSize;
        int result = (totalCount % pageSize == 0) ? div : div + 1;
        return result;
	}

	public Page<E> getPage(int index) {
		Page<E> page = new Page<E>();
        page.setContext(this);
        int __index = index > getPageCount() ? 1 : index;
        page.setHasNext(__index < getPageCount());
        page.setHasPre(__index > 1);
        page.setIndex(__index);
        page.setItems(items);
        return page;
	}

	public int getPageSize() {
		return this.pageSize;
	}

	public int getTotal() {
		return this.totalCount;
	}

}
