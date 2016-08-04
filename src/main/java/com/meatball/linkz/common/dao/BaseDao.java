package com.meatball.linkz.common.dao;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.persistence.Id;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.type.Type;

import com.meatball.linkz.common.dao.util.ConditionQuery;
import com.meatball.linkz.common.dao.util.OrderBy;
import com.meatball.linkz.common.pagination.PageObject;
import com.meatball.linkz.common.pagination.PageUtil;
import com.meatball.linkz.common.util.CheckNull;

public class BaseDao<M extends java.io.Serializable, PK extends java.io.Serializable> {
	// private static final Log log = LogFactory.getLog(BaseDao.class);

	private final Class<M> entityClass;
	private final String HQL_LIST_ALL;
	private final String HQL_COUNT_ALL;
	private final String HQL_OPTIMIZE_PRE_LIST_ALL;
	private final String HQL_OPTIMIZE_NEXT_LIST_ALL;
	private String pkName = null;

	@SuppressWarnings("unchecked")
	public BaseDao() {
		this.entityClass = (Class<M>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
		Field[] fields = this.entityClass.getDeclaredFields();
		for (Field f : fields) {
			if (f.isAnnotationPresent(Id.class)) {
				this.pkName = f.getName();
			}
		}

		// Assert.notNull(pkName);
		// TODO @Entity name not null
		HQL_LIST_ALL = "FROM " + this.entityClass.getSimpleName() + " ORDER BY " + pkName + " desc";
		HQL_OPTIMIZE_PRE_LIST_ALL = "FROM " + this.entityClass.getSimpleName() + " WHERE " + pkName + " > ? ORDER BY "
				+ pkName + " asc";
		HQL_OPTIMIZE_NEXT_LIST_ALL = "FROM " + this.entityClass.getSimpleName() + " WHERE " + pkName + " < ? ORDER BY "
				+ pkName + " desc";
		HQL_COUNT_ALL = " SELECT COUNT(*) FROM " + this.entityClass.getSimpleName();
	}

	protected SessionFactory sessionFactory;

	@Resource(name = "sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		// 事务必须是开启的(Required)，否则获取不到
		return sessionFactory.getCurrentSession();
	}

	/**
	 * <p>
	 * Title: save
	 * </p>
	 * <p>
	 * Description: 保存对象
	 * </p>
	 * 
	 * @param model
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public PK save(M model) {
		return (PK) getSession().save(model);
	}

	/**
	 * <p>
	 * Title: saveOrUpdate
	 * </p>
	 * <p>
	 * Description: 保存或更新对象
	 * </p>
	 * 
	 * @param model
	 */
	public void saveOrUpdate(M model) {
		getSession().saveOrUpdate(model);
	}

	/**
	 * <p>
	 * Title: update
	 * </p>
	 * <p>
	 * Description: 更新对象
	 * </p>
	 * 
	 * @param model
	 */
	public void update(M model) {
		getSession().merge(model);
		getSession().update(model);
	}

	/**
	 * <p>
	 * Title: merge
	 * </p>
	 * <p>
	 * Description: 更新对象
	 * </p>
	 * 
	 * @param model
	 */
	public void merge(M model) {
		getSession().merge(model);
	}

	/**
	 * <p>
	 * Title: delete
	 * </p>
	 * <p>
	 * Description: 根据ID删除对象
	 * </p>
	 * 
	 * @param id
	 */
	public void delete(PK id) {
		getSession().delete(this.get(id));
	}

	/**
	 * <p>
	 * Title: deleteObject
	 * </p>
	 * <p>
	 * Description: 删除对象
	 * </p>
	 * 
	 * @param model
	 */
	public void deleteObject(M model) {
		getSession().delete(model);
	}

	/**
	 * <p>
	 * Title: exists
	 * </p>
	 * <p>
	 * Description: 查看对象是否存在
	 * </p>
	 * 
	 * @param id
	 * @return
	 */
	public boolean exists(PK id) {
		return get(id) != null;
	}

	/**
	 * <p>
	 * Title: get
	 * </p>
	 * <p>
	 * Description: 根据ID获取对象
	 * </p>
	 * 
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public M get(PK id) {
		return (M) getSession().get(this.entityClass, id);
	}

	/**
	 * <p>
	 * Title: load
	 * </p>
	 * <p>
	 * Description: 根据ID获取对象
	 * </p>
	 * 
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public M load(PK id) {
		return (M) getSession().load(this.entityClass, id);
	}

	public int countAll() {
		Long total = aggregate(HQL_COUNT_ALL);
		return total.intValue();
	}

	public List<M> listAll() {
		return list(HQL_LIST_ALL);
	}


	/**
	 * <p>
	 * Title: flush
	 * </p>
	 * <p>
	 * Description: 释放资源
	 * </p>
	 */
	public void flush() {
		getSession().flush();
	}

	public void clear() {
		getSession().clear();
	}

	protected long getIdResult(String hql, Object... paramlist) {
		long result = -1;
		List<?> list = list(hql, paramlist);
		if (list != null && list.size() > 0) {
			return ((Number) list.get(0)).longValue();
		}
		return result;
	}

	protected List<M> listSelf(final String hql, final int pn, final int pageSize, final Object... paramlist) {
		return this.<M> list(hql, pn, pageSize, paramlist);
	}

	/**
	 * <p>
	 * Title: listWithIn
	 * </p>
	 * <p>
	 * Description: 根据HQL获取列表(in)
	 * </p>
	 * 
	 * @param <T>
	 * @param hql
	 * @param start
	 * @param length
	 * @param map
	 * @param paramlist
	 * @return
	 */
	@SuppressWarnings("unchecked")
	protected <T> List<T> listWithIn(final String hql, final int start, final int length,
			final Map<String, Collection<?>> map, final Object... paramlist) {
		Query query = getSession().createQuery(hql);
		query.setCacheable(true);
		setParameters(query, paramlist);
		for (Entry<String, Collection<?>> e : map.entrySet()) {
			query.setParameterList(e.getKey(), e.getValue());
		}
		if (start > -1 && length > -1) {
			query.setMaxResults(length);
			if (start != 0) {
				query.setFirstResult(start);
			}
		}
		List<T> results = query.list();
		return results;
	}

	@SuppressWarnings("unchecked")
	protected <T> List<T> list(final String hql, final int pn, final int pageSize, final Object... paramlist) {
		Query query = getSession().createQuery(hql);
		query.setCacheable(true);
		query.setCacheRegion("SpringCache");// query.setCacheRegion("myCacheRegion");//指定要使用的cacheRegion，可选
		setParameters(query, paramlist);
		if (pn > -1 && pageSize > -1) {
			query.setMaxResults(pageSize);
			int start = PageUtil.getPageStart(pn, pageSize);
			if (start != 0) {
				query.setFirstResult(start);
			}
		}
		if (pn < 0) {
			query.setFirstResult(0);
		}
		List<T> results = query.list();
		return results;
	}

	@SuppressWarnings("unchecked")
	protected <T> List<T> list(final String hql, List<Integer> ids) {
		Query query = getSession().createQuery(hql);
		query.setCacheable(true);
		query.setParameterList("ids", ids);
		List<T> results = query.list();
		return results;
	}

	@SuppressWarnings("unchecked")
	protected <T> List<T> listOfIndex(final String hql, final int index, final int size, final Object... paramlist) {
		Query query = getSession().createQuery(hql);
		query.setCacheable(true);
		setParameters(query, paramlist);
		int start = index;
		int maxNum = size;
		if (start > -1 && maxNum > -1) {
			query.setMaxResults(maxNum);
			query.setFirstResult(start);
		}
		if (start < 0) {
			query.setFirstResult(0);
		}
		List<T> results = query.list();
		return results;
	}

	@SuppressWarnings("unchecked")
	protected List<Object[]> listObjectOfIndex(final String hql, final int index, final int size,
			final Object... paramlist) {
		Query query = getSession().createQuery(hql);
		query.setCacheable(true);
		setParameters(query, paramlist);
		int start = index;
		int maxNum = size;
		if (start > -1 && maxNum > -1) {
			query.setMaxResults(maxNum);
			query.setFirstResult(start);
		}
		if (start < 0) {
			query.setFirstResult(0);
		}
		return query.list();
	}

	/**
	 * <p>
	 * Title: unique
	 * </p>
	 * <p>
	 * Description: 根据查询条件返回唯一一条记录
	 * </p>
	 * 
	 * @param hql
	 * @param paramlist
	 * @return
	 */
	@SuppressWarnings("unchecked")
	protected <T> T unique(final String hql, final Object... paramlist) {
		Query query = getSession().createQuery(hql);
		query.setCacheable(true);
		setParameters(query, paramlist);
		return (T) query.setMaxResults(1).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	protected <T> T aggregate(final String hql, final Map<String, Collection<?>> map, final Object... paramlist) {
		Query query = getSession().createQuery(hql);
		query.setCacheable(true);
		if (paramlist != null) {
			setParameters(query, paramlist);
			for (Entry<String, Collection<?>> e : map.entrySet()) {
				query.setParameterList(e.getKey(), e.getValue());
			}
		}
		return (T) query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	protected <T> T aggregate(final String hql, final Object... paramlist) {
		Query query = getSession().createQuery(hql);
		query.setCacheable(true);
		setParameters(query, paramlist);
		return (T) query.uniqueResult();
	}

	/**
	 * <p>
	 * Title: execteBulk
	 * </p>
	 * <p>
	 * Description: 执行批处理语句, 如insert, update, delete等
	 * </p>
	 * 
	 * @param hql
	 * @param ids
	 * @param paramlist
	 * @return
	 */
	protected int execteBulk(final String hql, final Integer[] ids, final Object... paramlist) {
		Query query = getSession().createQuery(hql);
		query.setCacheable(true);// 激活查询缓存
		query.setParameterList("ids", ids);
		// setParameters(query, paramlist);
		Object result = query.executeUpdate();
		return result == null ? 0 : ((Integer) result).intValue();
	}

	protected int execte(final String hql) {
		Query query = getSession().createQuery(hql);
		query.setCacheable(true);
		Object result = query.executeUpdate();
		return result == null ? 0 : ((Integer) result).intValue();
	}

	protected int execte(final String hql, final Object... paramlist) {
		Query query = getSession().createQuery(hql);
		query.setCacheable(true);
		setParameters(query, paramlist);
		Object result = query.executeUpdate();
		return result == null ? 0 : ((Integer) result).intValue();
	}

	protected int execteNativeBulk(final String natvieSQL, final Object... paramlist) {
		Query query = getSession().createSQLQuery(natvieSQL);
		query.setCacheable(true);
		setParameters(query, paramlist);
		Object result = query.executeUpdate();
		return result == null ? 0 : ((Integer) result).intValue();
	}

	@SuppressWarnings("unchecked")
	public <T> List<T> listByNative(final String nativeSQL, final int pn, final int pageSize,
			final List<Entry<String, Class<?>>> entityList, final List<Entry<String, Type>> scalarList,
			final Object... paramlist) {

		SQLQuery query = getSession().createSQLQuery(nativeSQL);
		query.setCacheable(true);
		if (entityList != null) {
			for (Entry<String, Class<?>> entity : entityList) {
				query.addEntity(entity.getKey(), entity.getValue());
			}
		}
		if (scalarList != null) {
			for (Entry<String, Type> entity : scalarList) {
				query.addScalar(entity.getKey(), entity.getValue());
			}
		}

		setParameters(query, paramlist);

		if (pn > -1 && pageSize > -1) {
			query.setMaxResults(pageSize);
			int start = PageUtil.getPageStart(pn, pageSize);
			if (start != 0) {
				query.setFirstResult(start);
			}
		}
		List<T> result = query.list();
		return result;
	}

	@SuppressWarnings("unchecked")
	protected <T> T aggregateByNative(final String natvieSQL, final List<Entry<String, Type>> scalarList,
			final Object... paramlist) {
		SQLQuery query = getSession().createSQLQuery(natvieSQL);
		query.setCacheable(true);
		if (scalarList != null) {
			for (Entry<String, Type> entity : scalarList) {
				query.addScalar(entity.getKey(), entity.getValue());
			}
		}

		setParameters(query, paramlist);

		Object result = query.uniqueResult();
		return (T) result;
	}

	protected <T> List<T> list(final String sql, final Object... paramlist) {
		return list(sql, -1, -1, paramlist);
	}

	@SuppressWarnings("unchecked")
	public <T> List<T> list(ConditionQuery query, OrderBy orderBy, final int pn, final int pageSize) {
		Criteria criteria = getSession().createCriteria(this.entityClass);
		criteria.setCacheable(true);
		query.build(criteria);
		orderBy.build(criteria);
		int start = PageUtil.getPageStart(pn, pageSize);
		if (start != 0) {
			criteria.setFirstResult(start);
		}
		criteria.setMaxResults(pageSize);
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	public <T> List<T> list(Criteria criteria) {
		criteria.setCacheable(true);
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	public <T> T unique(Criteria criteria) {
		criteria.setCacheable(true);
		return (T) criteria.uniqueResult();
	}

	public <T> List<T> list(DetachedCriteria criteria) {
		return list(criteria.getExecutableCriteria(getSession()));
	}

	@SuppressWarnings("unchecked")
	public <T> T unique(DetachedCriteria criteria) {
		return (T) unique(criteria.getExecutableCriteria(getSession()));
	}

	protected void setParameters(Query query, Object[] paramlist) {
		query.setCacheable(true);
		if (paramlist != null) {
			for (int i = 0; i < paramlist.length; i++) {
				if (paramlist[i] instanceof Date) {
					// TODO 难道这是bug 使用setParameter不行？？
					query.setTimestamp(i, (Date) paramlist[i]);
				} else {
					query.setParameter(i, paramlist[i]);
				}
			}
		}
	}

	/**
	 * <p>
	 * Title: 查询所有子机构id及其本身id
	 * </p>
	 * <p>
	 * Description: 返回的数据元素第一个无意义，占位使用
	 * </p>
	 * 
	 * @author Kevin
	 * @param organid
	 * @return String[]
	 */
	public List<Integer> getSubOrgan(String organid) {
		String sql = "SELECT getOrganlist(" + organid + ")";
		String res = (String) getSession().createSQLQuery(sql).uniqueResult();
		String[] array = res.split(",");
		List<Integer> temp = new ArrayList<Integer>();
		for (int i = 1; i < array.length; i++) {
			temp.add(Integer.valueOf(array[i]));
		}
		return temp;
	}

	public List<Integer> getParentList(String organid) {
		String sql = "SELECT getParentList(" + organid + ")";
		String res = (String) getSession().createSQLQuery(sql).uniqueResult();
		String[] array = res.split(",");
		List<Integer> temp = new ArrayList<Integer>();
		for (int i = 1; i < array.length; i++) {
			temp.add(Integer.valueOf(array[i]));
		}
		return temp;
	}

	public void queryPageHql(String sb, PageObject po) {
		// 返回对象

		// 获得查询后的记录数
		po.setSum(this.getCountByHql(sb).intValue());

		if (null != po && !CheckNull.isNullOrZero(po.getOnePageSize())) {
			int sumPage = po.getSum() / po.getOnePageSize();
			if (po.getSum() % po.getOnePageSize() != 0) {
				sumPage += 1;
			}

			if (sumPage < po.getCurrPage()) {
				po.setCurrPage(sumPage);
			}

			po.setPageList(this.findByHql(sb, po.getOnePageSize(), po.getCurrPage()));
		} else {
			po.setPageList(this.findByHql(sb, 0, 0));
		}
	}

	public Long getCountByHql(String hql) {
		return getCountByHql(hql, null, 0, 0);
	}

	public Long getCountByHql(String hql, Map<String, Object> map, int pageSize, int pageNo) {
		String totalHql = hql.substring(hql.toLowerCase().indexOf("from"), hql.length());
		totalHql = "SELECT COUNT(*) " + totalHql;
		return (Long) this.findByHql(totalHql, map, pageSize, pageNo).get(0);
	}

	public List<?> findByHql(String hql, Map<String, Object> map, int pageSize, int pageNo) {
		return this.getQuery(hql, map, pageSize, pageNo).list();
	}

	/**
	 * findByHql 执行hql分页查询
	 * 
	 * @param hql
	 *            HQL语句
	 * @param pageSize
	 *            一页条数
	 * @param pageNo
	 *            页数
	 * @return
	 */
	public List<?> findByHql(String hql, int pageSize, int pageNo) {
		return findByHql(hql, null, pageSize, pageNo);
	}

	/**
	 * @Title: getQuery
	 * @Description: 分页+参数来获得查询对象
	 * @param @param hql HQL语句
	 * @param @param map 参数MAP
	 * @param @param pageSize 一页数条数
	 * @param @param pageNo 页数
	 * @param @return
	 * @return Query
	 * @throws
	 */
	private Query getQuery(String hql, Map<String, Object> map, int pageSize, int pageNo) {
		// 通过HQL来获得HQL查询器
		Query query = this.createQuery(hql);

		// 给HQL查询器来设置过滤条件
		query = this.setParameter(query, map);

		// 给HQL查询器来设置分页
		query = this.setPageProperty(query, pageSize, pageNo);
		return query;
	}

	/**
	 * @Title: createQuery
	 * @Description: 通过HQL获得Query对象
	 * @param @param hql HQL语句
	 * @param @return
	 * @return Query
	 * @throws
	 */
	private Query createQuery(String hql) {
		return getSession().createQuery(hql);
	}

	/**
	 * @Title: setParameter
	 * @Description: 设置参数值来方便查询
	 * @param @param query 查询对象
	 * @param @param map 参数MAP
	 * @param @return
	 * @return Query
	 * @throws
	 */
	private Query setParameter(Query query, Map<String, Object> map) {
		if (!CheckNull.isNull(map)) {
			for (Entry<String, Object> entry : map.entrySet()) {
				Object obj = entry.getValue();

				// 这里考虑传入的参数是什么类型，不同类型使用的方法不同
				if (obj instanceof Collection) {
					query.setParameterList(entry.getKey(), (Collection<M>) obj);
				} else if (obj instanceof Object[]) {
					query.setParameterList(entry.getKey(), (Object[]) obj);
				} else {
					query.setParameter(entry.getKey(), obj);
				}
			}
		}
		return query;
	}

	/**
	 * @Title: setPageProperty
	 * @Description: 往Query对象中设置分页参数
	 * @param @param query 查询对象
	 * @param @param pageSize 一页的条数
	 * @param @param pageNo 页数
	 * @param @return
	 * @return Query
	 * @throws
	 */
	private Query setPageProperty(Query query, int pageSize, int pageNo) {
		if (pageNo != 0 && pageSize != 0) {
			query.setFirstResult((pageNo - 1) * pageSize);
			query.setMaxResults(pageSize);
		}
		return query;
	}

	/**
	 * findBySql 执行sql分页查询
	 * 
	 * @param sql
	 *            SQL语句
	 * @param pageSize
	 *            一页的条数
	 * @param pageNo
	 *            页数
	 * @return
	 */
	public List<?> findBySql(String sql, int pageSize, int pageNo) {
		return findBySql(sql, null, pageSize, pageNo);
	}

	/**
	 * @Title: queryPage
	 * @Description:分页工具方法
	 * @param @param sb
	 * @param @param pu
	 * @param @return
	 * @return PageObjectLogicBean
	 * @throws
	 */
	public List<?> queryPageSql(String sb, PageObject po) {
		// 获得查询后的记录数
		po.setSum(this.getCountBySql(sb).intValue());

		if (null != po && !CheckNull.isNullOrZero(po.getOnePageSize())) {
			int sumPage = po.getSum() / po.getOnePageSize();
			if (po.getSum() % po.getOnePageSize() != 0) {
				sumPage += 1;
			}

			if (sumPage < po.getCurrPage()) {
				po.setCurrPage(sumPage);
			}

			return this.findBySql(sb, po.getOnePageSize(), po.getCurrPage());
		} else {
			return this.findBySql(sb, 0, 0);
		}
	}

	/**
	 * 通过SQL来统计条数
	 * 
	 * @param sql
	 *            SQL语句
	 * @return
	 */
	public Long getCountBySql(String sql) {
		return getCountBySql(sql, null, 0, 0);
	}

	/**
	 * 通过SQL来查询条数
	 * 
	 * @param sql
	 *            SQL语句
	 * @param map
	 *            条件MAP
	 * @param pageSize
	 *            一页条数
	 * @param pageNo
	 *            页数
	 * @return
	 */
	public Long getCountBySql(String sql, Map<String, Object> map, int pageSize, int pageNo) {
		// 截取from后的SQL语句
		// String totalHql = sql.substring(sql.toLowerCase().indexOf(" from "),
		// sql
		// .length());

		// 加上前COUNT
		sql = "SELECT COUNT(*) from (" + sql + ") as ccsdfsdf";
		return (Long) ((BigInteger) this.findBySql(sql, map, pageSize, pageNo).get(0)).longValue();
	}

	/**
	 * 通过SQL条件来分页查询
	 * 
	 * @param sql
	 *            SQL语句
	 * @param map
	 *            条件MAP
	 * @param pageSize
	 *            一页条数
	 * @param pageNo
	 *            页数
	 * @return
	 */
	public List<?> findBySql(String sql, Map<String, Object> map, int pageSize, int pageNo) {
		List<?> list = this.getSQLQuery(sql, map, pageSize, pageNo).list();
		return list;
	}

	/**
	 * @Title: getSQLQuery
	 * 
	 * @Description: 通过SQL，过滤条件，分页来获得SQL查询器
	 * 
	 * @param @param sql SQL语句
	 * 
	 * @param @param map 过滤条件
	 * 
	 * @param @param pageSize 一页条数
	 * 
	 * @param @param pageNo 页数
	 * 
	 * @param @return
	 * 
	 * @return SQLQuery
	 * 
	 * @throws
	 */

	private SQLQuery getSQLQuery(String sql, Map<String, Object> map, int pageSize, int pageNo) {
		// 首选通过SQL语句来创建SQL查询器
		SQLQuery query = this.createSQLQuery(sql);

		// 给SQL查询器来设置过滤条件
		query = this.setParameter(query, map);

		// 给SQL查询器来设置分页条件
		query = this.setPageProperty(query, pageSize, pageNo);
		return query;
	}

	/**
	 * @Title: setParameter
	 * @Description: 给查询器设置一些过滤参数
	 * @param @param query 查询条件器
	 * @param @param map 参数
	 * @param @return
	 * @return SQLQuery
	 * @throws
	 */
	protected SQLQuery setParameter(SQLQuery query, Map<String, Object> map) {
		if (!CheckNull.isNull(map)) {
			for (Entry<String, Object> entry : map.entrySet()) {
				Object obj = entry.getValue();

				// 这里考虑传入的参数是什么类型，不同类型使用的方法不同
				if (obj instanceof Collection) {
					query.setParameterList(entry.getKey(), (Collection<M>) obj);
				} else if (obj instanceof Object[]) {
					query.setParameterList(entry.getKey(), (Object[]) obj);
				} else {
					query.setParameter(entry.getKey(), obj);
				}
			}
		}
		return query;
	}

	/**
	 * @Title: createSQLQuery
	 * @Description: 通过SQL获得SQL的查询器
	 * @param @param sql SQL语句
	 * @param @return
	 * @return SQLQuery
	 * @throws
	 */
	private SQLQuery createSQLQuery(String sql) {
		return getSession().createSQLQuery(sql);
	}

	/**
	 * @Title: setPageProperty
	 * @Description: 分页来获得查询数据
	 * @param @param query SQL查询器
	 * @param @param pageSize 一页条数
	 * @param @param pageNo 页数
	 * @param @return
	 * @return SQLQuery
	 * @throws
	 */
	private SQLQuery setPageProperty(SQLQuery query, int pageSize, int pageNo) {
		if (pageNo != 0 && pageSize != 0) {
			query.setFirstResult((pageNo - 1) * pageSize);
			query.setMaxResults(pageSize);
		}
		return query;
	}
}