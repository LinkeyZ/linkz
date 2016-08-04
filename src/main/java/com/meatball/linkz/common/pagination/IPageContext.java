package com.meatball.linkz.common.pagination;

import com.meatball.linkz.common.Constants;

public interface IPageContext<E> {
    /** 每页显示记录数 **/
    public static final int DEFAULT_PAGE_SIZE = Constants.DEFAULT_PAGE_SIZE;
    
    /**
     * <p>Title: getPageCount</p>
     * <p>Description: 计算总页数</p>
     * @return
     */
    public int getPageCount();
    
    /**
     * <p>Title: getPage</p>
     * <p>Description: 获取当前页</p>
     * @param index
     * @return
     */
    public Page<E> getPage(int index);
    
    /**
     * <p>Title: getPageSize</p>
     * <p>Description: 每页显示的记录数量</p>
     * @return
     */
    public int getPageSize();
    
    /**
     * <p>Title: getTotal</p>
     * <p>Description: 计算总记录数</p>
     * @return
     */
    public int getTotal();
}
