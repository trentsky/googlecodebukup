package com.trent.dbUtil.ibatis;

import java.util.List;
import java.util.Map;

import com.trent.dbUtil.hibernate.page.PageView;



public interface IbatisBaseDao<T> {
	
	public Object insert(String statementName, Object parameterObject);

    public  int update(String statementName,Object parameterObject);
    
    public  int delete(String statementName,Object parameterObject);
    
    public T queryForObject(String statementName,Object parameterObject);
    
    public List<T> queryForList(String statementName, Object parameterObject);
    
	public PageView<T> queryForPage(String statementName, Map<String,Object> parameterMap, PageView<T> page);
	
	public PageView<T> queryForPage(String statementName, Map<String,Object> parameterMap, int pageNo);

	public PageView<T> queryForPage(String statementName, Map<String,Object> parameterMap, int pageNo, int pageSize);
    
}