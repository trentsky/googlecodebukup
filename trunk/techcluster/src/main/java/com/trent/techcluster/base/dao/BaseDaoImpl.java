package com.trent.techcluster.base.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Component;

@Component
@SuppressWarnings("unchecked")
public class BaseDaoImpl implements IBaseDao {

	@PersistenceContext(unitName = "persistenceUnit")
	protected EntityManager em;

	public void save(Object obj) {
		em.persist(obj);
	}

	public void update(Object obj) {
		em.merge(obj);
	}

	public <T> List<T> query(String sql) {
		return em.createQuery(sql).getResultList();
	}

	public <T> void delete(Class<T> cls, Object[] ids) {
		T obj = null;
		for (Object id : ids) {
			obj = em.find(cls, id);
			em.remove(obj);
		}
	}

	public <T> T getById(Class<T> cls, Object id) {
		return em.find(cls, id);
	}

	public <T> List<T> getAll(Class<T> cls) {
		return getBy(false, false, cls, null, 0, 0);
	}

	@Override
	public <T> long getRowSize(Class<T> cls) {
		return new Long(getBy(true, true, cls, null, 0, 0).get(0).toString());
	}

	@Override
	public <T> long getRowSizeByEqual(Class<T> cls,
			Map<String, Object> paramsMap) {
		return new Long(getBy(true, false, cls, paramsMap, 0, 0).get(0)
				.toString());
	}

	@Override
	public <T> long getRowSizeByLike(Class<T> cls, Map<String, String> paramsMap) {
		Map<String, Object> map = toStringObjectMap(paramsMap);
		return new Long(getBy(true, true, cls, map, 0, 0).get(0).toString());
	}

	@Override
	public <T> List<T> getSub(Class<T> cls, int from, int size) {
		return getBy(false, false, cls, null, from, size);
	}

	@Override
	public <T> List<T> getSubByEqual(Class<T> cls,
			Map<String, Object> paramsMap, int from, int size) {
		return getBy(false, false, cls, paramsMap, from, size);
	}

	@Override
	public <T> List<T> getByEqual(Class<T> cls, Map<String, Object> paramsMap) {
		return getBy(false, false, cls, paramsMap, 0, 0);
	}

	@Override
	public <T> List<T> getSubByLike(Class<T> cls,
			Map<String, String> paramsMap, int from, int size) {
		Map<String, Object> map = toStringObjectMap(paramsMap);
		return getBy(false, true, cls, map, from, size);
	}

	@Override
	public <T> List<T> getByLike(Class<T> cls, Map<String, String> paramsMap) {
		Map<String, Object> map = toStringObjectMap(paramsMap);
		return getBy(false, true, cls, map, 0, 0);
	}

	/**
	 * 可构造性的原始查询
	 * 
	 * @param <T>
	 * @param getRowCount
	 *            是否计算记录条数的查询（即，select count(*)）
	 * @param isVagou
	 *            是否模糊查询like（相对于精确查询equal）
	 * @param cls
	 *            对应的实体类名
	 * @param paramsMap
	 *            查询字段映射数据
	 * @param from
	 *            起始记录序号
	 * @param size
	 *            本次查询的记录数
	 * @return
	 */

	private <T> List<T> getBy(boolean getRowCount, boolean isVagou,
			Class<T> cls, Map<String, Object> paramsMap, int from, int size) {
		String paramTag = null; // sql语句中的占位参数标记名
		String paramValue = null; // sql语句中的参数值
		String entityValue = null; // sql语句中的实体参数名
		String className = cls.getSimpleName(); // 对应的类名
		String preSql = getRowCount ? "select count(e) from "
				: "select e from ";
		StringBuffer sql = new StringBuffer(preSql);
		sql.append(className).append(" e where e.id!=0 and 1=1 ");
		Query query = null;

		if (null != paramsMap) {
			// 构型
			for (String key : paramsMap.keySet()) {
				paramTag = ":".concat(key.replace(".", "_"));
				entityValue = "lower(e.".concat(key).concat(")");
				if (!isVagou) {
					sql.append(" and ").append(entityValue).append("=")
							.append(paramTag).append(" ");
				} else if (paramTag.endsWith("_id")) {
					// 如果对应的是主键，则将like改为equal
					sql.append(" and ").append(entityValue).append("=")
							.append(paramTag).append(" ");
				} else {
					sql.append(" and ").append(entityValue).append(" like ")
							.append(paramTag).append(" ");
				}
				System.out.println("sql== " + sql.toString() + "---"
						+ paramsMap.get(key));
			}
		}
		query = em.createQuery(sql.toString());

		if (null != paramsMap) {
			// 填值
			for (String key : paramsMap.keySet()) {
				paramTag = key.replace(".", "_");
				paramValue = paramsMap.get(key).toString().toLowerCase();
				if (!isVagou) {
					try {
						query.setParameter(paramTag, new Long(paramValue));
					} catch (Exception ex) {
						query.setParameter(paramTag, paramValue);
					}
				} else {
					// 如果对应的是主键，则将like改为equal
					if (paramTag.endsWith("_id")) {
						query.setParameter(paramTag, new Long(paramValue));
					} else {
						query.setParameter(paramTag, "%" + paramValue + "%");
					}
				}
			}
		}
		if (from == 0 && size == 0) {
			return query.getResultList();
		}
		return query.setFirstResult(from).setMaxResults(size).getResultList();
	}

	/**
	 * 将<String, String>类型的映射转换为<String, Object>类型
	 * 
	 * @param paramsMap
	 * @return
	 */
	private Map<String, Object> toStringObjectMap(Map<String, String> paramsMap) {
		Map<String, Object> map = new HashMap<String, Object>();
		for (String key : paramsMap.keySet()) {
			map.put(key, paramsMap.get(key));
		}
		return map;
	}
}
