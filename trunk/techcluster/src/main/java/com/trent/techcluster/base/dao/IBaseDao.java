package com.trent.techcluster.base.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;


public interface IBaseDao {

	// 新增
	public void save(Object obj);

	// 删除
	public <T> void delete(Class<T> cls, Object[] ids);

	// 更新
	public void update(Object obj);

	// 获得所有记录
	public <T> List<T> getAll(Class<T> cls);

	// 按ID号查询
	public <T> T getById(Class<T> cls, Object id);

	// 获得总记录数
	public <T> long getRowSize(Class<T> cls);

	// 按精确匹配获得符合条件的记录数
	public <T> long getRowSizeByEqual(Class<T> cls, Map<String, Object> map);

	// 按模糊匹配获得符合条件的记录数
	public <T> long getRowSizeByLike(Class<T> cls, Map<String, String> map);

	// 原始查询
	public <T> List<T> query(String sql);

	// -----------------------------------------

	// 获得分页数据
	public <T> List<T> getSub(Class<T> cls, int from, int size);

	// 按字段是否相等来查询
	public <T> List<T> getByEqual(Class<T> cls, Map<String, Object> paramsMap);

	// 按字段是否相等来查询获得分页数据
	public <T> List<T> getSubByEqual(Class<T> cls,
			Map<String, Object> paramsMap, int from, int size);

	// 按字段模糊匹配查询
	public <T> List<T> getByLike(Class<T> cls, Map<String, String> map);

	// 按字段模糊匹配来查询获得分页数据
	public <T> List<T> getSubByLike(Class<T> cls, Map<String, String> map,
			int from, int size);

}
