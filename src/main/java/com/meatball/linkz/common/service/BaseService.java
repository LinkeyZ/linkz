package com.meatball.linkz.common.service;

import java.util.List;

import com.meatball.linkz.common.Constants;
import com.meatball.linkz.common.dao.BaseDao;
import com.meatball.linkz.common.exception.DealException;
import com.meatball.linkz.common.pagination.Page;
import com.meatball.linkz.common.pagination.PageUtil;
public abstract class BaseService<M extends java.io.Serializable, PK extends java.io.Serializable> {
	
	/** 数据访问基础类 **/
	protected BaseDao<M, PK> baseDao;
	
	/**
	 * <p>Title: setBaseDao</p>
	 * <p>Description: 初始化BaseDao</p>
	 * @param baseDao
	 */
	public abstract void setBaseDao(BaseDao<M, PK> baseDao);
    
    /**
     * <p>Title: save</p>
     * <p>Description: 保存业务对象</p>
     * @param model
     * @return
     */
    public PK save(M model) {
    	return baseDao.save(model);
    }
    
    /**
     * <p>Title: merge</p>
     * <p>Description: 更新业务对象</p>
     * @param model
     */
    public void merge(M model) {
        baseDao.merge(model);
    }
    
    /**
     * <p>Title: saveOrUpdate</p>
     * <p>Description: 保存更新业务对象</p>
     * @param model
     */
    public void saveOrUpdate(M model) {
        baseDao.saveOrUpdate(model);
    }

    /**
     * <p>Title: update</p>
     * <p>Description: 更新对象</p>
     * @param model
     */
    public void update(M model) {
        baseDao.update(model);
    }
    
    /**
     * <p>Title: delete</p>
     * <p>Description: 删除业务对象</p>
     * @param id 编号
     */
    public void delete(PK id) {
        baseDao.delete(id);
    }

    /**
     * <p>Title: deleteObject</p>
     * <p>Description: 删除业务对象</p>
     * @param model 对象
     */
    public void deleteObject(M model) {
        baseDao.deleteObject(model);
    }

    /**
     * <p>Title: get</p>
     * <p>Description: 获取对象</p>
     * @param id
     * @return
     */
    public M get(PK id) {
        return baseDao.get(id);
    }
    
    /**
     * <p>Title: countAll</p>
     * <p>Description: 获取总记录数</p>
     * @return
     */
    public int countAll() {
        return baseDao.countAll();
    }
    
    /**
     * <p>Title: listAll</p>
     * <p>Description: 获取全部业务对象</p>
     * @return
     */
    public List<M> listAll() {
        return baseDao.listAll();
    }
    

}
