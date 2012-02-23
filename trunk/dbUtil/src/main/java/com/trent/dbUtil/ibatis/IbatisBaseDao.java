package com.trent.dbUtil.ibatis;

import java.util.List;
import java.util.Map;



public interface IbatisBaseDao {
	
	public Object insert(String statementName, Object parameterObject);

    public  int update(String statementName,Object parameterObject);
    
    public  int delete(String statementName,Object parameterObject);
    
    public Object queryForObject(String statementName,Object parameterObject);
    
    public List queryForList(String statementName, Object parameterObject);
    
	public Page queryForPage(String statementName, Map parameterMap, Page page);
	
	public Page queryForPage(String statementName, Map parameterMap, int pageNo);

	public Page queryForPage(String statementName, Map parameterMap, int pageNo, int pageSize);
    
}