package com.trent.dbUtil.ibatis;

import java.util.List;
import java.util.Map;



public interface IbatisBaseDao<T> {
	
	public Object insert(String statementName, Object parameterObject);

    public  int update(String statementName,Object parameterObject);
    
    public  int delete(String statementName,Object parameterObject);
    
    public T queryForObject(String statementName,Object parameterObject);
    
    public List<T> queryForList(String statementName, Object parameterObject);
    
	public Page<T> queryForPage(String statementName, Map<String,Object> parameterMap, Page<T> page);
	
	public Page<T> queryForPage(String statementName, Map<String,Object> parameterMap, int pageNo);

	public Page<T> queryForPage(String statementName, Map<String,Object> parameterMap, int pageNo, int pageSize);
    
}