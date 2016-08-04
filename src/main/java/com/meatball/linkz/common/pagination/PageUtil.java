package com.meatball.linkz.common.pagination;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import javax.persistence.Id;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.meatball.linkz.common.util.KeySynchronizer;
public class PageUtil {
	private static final Log log = LogFactory.getLog(PageUtil.class);
	
	/** 获取主键时缓存 **/
	private static Map<Class<?>, Field> classPKMap = new WeakHashMap<Class<?>, Field>();
	
	/**
	 * <p>Title: getPageStart</p>
	 * <p>Description: 不关心总数量</p>
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public static int getPageStart(int pageNumber, int pageSize) {
        return (pageNumber - 1) * pageSize;
    }
	
	/**
	 * <p>Title: getPageStart</p>
	 * <p>Description: 计算分页获取数据时游标的起始位置</p>
	 * @param totalCount 所有记录总和
	 * @param pageNumber 页码 从1开始
	 * @param pageSize 每页条数
	 * @return
	 */
	public static int getPageStart(int totalCount, int pageNumber, int pageSize) {
        int start = (pageNumber - 1) * pageSize;
        if (start >= totalCount) {
            start = 0;
        }
        return start;
    }
	
	/**
	 * <p>Title: getPage</p>
	 * <p>Description: 构造分页对象</p>
	 * @param totalCount 满足条件的所有记录总和
	 * @param pageNumber 当前分页的页码
	 * @param items 对象列表
	 * @param pageSize 页面大小
	 * @return
	 */
	public static <E> Page<E> getPage(int totalCount, int pageNumber, List<E> items, int pageSize) {
		QuickPageContext<E> pageContext = new QuickPageContext<E>(totalCount, pageSize, items);
        return pageContext.getPage(pageNumber);
    }
	
	public static Field getPkField(Class<?> cls) {
        Field pkField = classPKMap.get(cls);
        if(pkField == null) {
            synchronized (KeySynchronizer.acquire(cls)) {
                Field[] fields = cls.getDeclaredFields();
                for(Field field : fields) {
                    if(field.isAnnotationPresent(Id.class)) {
                        pkField = field;
                        pkField.setAccessible(true);
                        classPKMap.put(cls, pkField);
                    }
                }
            }
        }
        if(pkField == null) {
        	log.error("page error,{} : pk null");
        }
        return pkField;
	}
	
	public static <T> String getIdValue(T obj) {
        if(obj == null) {
            return "";
        }
        String retVal = "";
        Field pkField = getPkField(obj.getClass());
        try {
            retVal = pkField.get(obj).toString();
        } catch (Exception e) {
        	log.error("page error,{} : get id value", e);
        }
        return retVal;
    }
	
    public static <T> String getIdName(T obj) {
        if(obj == null) {
            return "";
        }
        String retVal = "";
        Field pkField = getPkField(obj.getClass());
        try {
            retVal = pkField.getName();
        } catch (Exception e) {
        	log.error("page error,{} : get id name", e);
        }
        return retVal;
    }
}