package com.trent.dbUtil.ibatis;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
/**
@author 周小建
@date 2011-08-01 9:00:00
@address 北京
@description 这是一个只封装了数据库操作逻辑的通用基类Service，它内部调用Ibatis的BaseDao。
             在上层的Action或Controller中，如果只是单独的执行一次数据库CRUD操作，
             则没有必要重复创建本Service内已经实现的数据库逻辑，
             包含具体业务逻辑的Service只需要简单的继承这个通用基类Service即可。
			 周小建
*/
public class IbatisBaseService {
	private IbatisBaseDao ibatisBaseDao;

	public IbatisBaseDao getIbatisBaseDao(){
		return ibatisBaseDao;
	}

	public void setIbatisBaseDao(IbatisBaseDao ibatisBaseDao){
		this.ibatisBaseDao = ibatisBaseDao;
	}
	
	public Object insert(String statementName, Object parameterObject)throws DataAccessException {
		return getIbatisBaseDao().insert(statementName, parameterObject);
	}

    public  int update(String statementName,Object parameterObject)throws DataAccessException{
    	return getIbatisBaseDao().update(statementName, parameterObject);
    }
    
    public  int delete(String statementName,Object parameterObject)throws DataAccessException{
    	return getIbatisBaseDao().delete(statementName, parameterObject);
    }
    
    public Object queryForObject(String statementName,Object parameterObject){
    	return getIbatisBaseDao().queryForObject(statementName,parameterObject);
    }
    
    public List queryForList(String statementName, Object parameterObject){
		return getIbatisBaseDao().queryForList(statementName, parameterObject);
	}
	
    public void queryForPage(String statementName, Map parameterMap, Page page) {
		if (parameterMap != null) {
			if (page.getTotalRows() == 0) {
				//int totalRows = ((Integer) getIbatisBaseDao().queryForObject(statementName + "Count", parameterMap)).intValue();
				Object o = getIbatisBaseDao().queryForObject(statementName + "Count", parameterMap);
				if(o == null){
					page.setData(null);
				}else{
					int totalRows = o instanceof Integer ? ((Integer)o).intValue() : ((Long)o).intValue();
					parameterMap.put("beginRow", new Integer(page.getStartRow()));
					parameterMap.put("endRow", new Integer(page.getEndRow()));
					parameterMap.put("pageSize", new Integer(page.getPageSize()));
					page.setTotalRows(totalRows);
					List data = getIbatisBaseDao().queryForList(statementName, parameterMap);
					page.setData(data);
				}
			}
		}
	}

	public Page queryForPage(String statementName, Map parameterMap, int pageNo) {
		Page page = new Page(pageNo);
		queryForPage(statementName, parameterMap, page);
		return page;
	}

	public Page queryForPage(String statementName, Map parameterMap, int pageNo, int pageSize) {
		Page page = new Page(pageNo, pageSize);
		queryForPage(statementName, parameterMap, page);
		return page;
	}
}