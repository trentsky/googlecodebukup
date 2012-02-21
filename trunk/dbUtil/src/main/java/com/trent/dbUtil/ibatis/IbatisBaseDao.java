package com.trent.dbUtil.ibatis;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.engine.impl.ExtendedSqlMapClient;


public class IbatisBaseDao extends SqlMapClientDaoSupport{
	
    /** JDBC 执行接口**/
	private JdbcOperations jdbcOperations = null;
	
	/** ibatis SQL 执行者**/
	private SQLExecutor sqlExecutor = null;
 	
	public JdbcOperations getJdbcOperations(){
		return jdbcOperations;
	}

	public void setJdbcOperations(JdbcOperations jdbcOperations){
		this.jdbcOperations = jdbcOperations;
	}
	
	public SQLExecutor getSqlExecutor() {
		return sqlExecutor;
	}
	
	public void setSqlExecutor(SQLExecutor sqlExecutor) {
		this.sqlExecutor = sqlExecutor;
	}
	
    public void initialize()  throws Exception{
        if (sqlExecutor != null) {
            SqlMapClient sqlMapClient = getSqlMapClientTemplate().getSqlMapClient();
            //SqlMapExecutorDelegate delegate = ((ExtendedSqlMapClient) sqlMapClient).getDelegate();
            //MyReflectionUtils.writeField(delegate, "sqlExecutor", sqlExecutor);  
            MyReflectionUtils.setFieldValue(((ExtendedSqlMapClient) sqlMapClient).getDelegate(), "sqlExecutor", SQLExecutor.class,sqlExecutor);
        }
    }

    public Object insert(String statementName, Object parameterObject)throws DataAccessException {
		return getSqlMapClientTemplate().insert(statementName, parameterObject);
	}

    public  int update(String statementName,Object parameterObject)throws DataAccessException{
    	return getSqlMapClientTemplate().update(statementName, parameterObject);
    }
    
    public  int delete(String statementName,Object parameterObject)throws DataAccessException{
    	return getSqlMapClientTemplate().delete(statementName, parameterObject);
    }
    
    public Object queryForObject(String statementName,Object parameterObject){
    	return getSqlMapClientTemplate().queryForObject(statementName,parameterObject);
    }
    
    public List queryForList(String statementName, Object parameterObject){
		return getSqlMapClientTemplate().queryForList(statementName, parameterObject);
	}
    
	
    /* 
	public Page queryForPage(String statementName, Page page) {
		Map parameterObject = page.getParams();
		int pageNo = page.getPageNo();
		int pageSize = page.getPageSize();
		int skipResults = (pageNo - 1) * pageSize;
		int maxResults = pageNo * pageSize; 
 		int totalCount = getRowCount(statementName, parameterObject);  	
		List list = getSqlMapClientTemplate().queryForList(statementName, parameterObject, skipResults, maxResults);
		
		page.setTotalCount(totalCount); 
		page.setItems(list);
		return page;
		
		
		
		 //在applicationContext.xml中配置了dao注入sqlMapClient（这是给SqlMapClientDaoSupport的sqlMapClientTemplate属性赋值），
		 //所以，sqlMapClientTemplate属性的就是SqlMapClientFactoryBean的一个实例
		 
		 //当dao中的任何getSqlMapClientTemplate.query*格式方法执行时，都会交给SqlMapClientMapTemplate的SqlMapClient（这是个接口）
		 //的一个实例（因为在applicationContext.xml中已经配置了） 
	}
    */
    
    /**
     * autor:周小建
     * date:2011-12-01 09:30:00
     * description:
     		//这是个工具方法，专门用于分页使用，通过xml配置文件中的sql键和参数数组，来截获真正sql语句，并调用jdbcTemplate来执行
     		//这里需要注意一点：最后的查询操作不能使用ibatis，因为ibatis需要的第一个参数是xml的sql键，而不是真实sql，
     		//所以才使用ibatis之外的其它技术来实现这一点。
     */
	private int getRowCount(String statementName, Object parameterObject) {
		SQL d = new SQL((ExtendedSqlMapClient)getSqlMapClient(),statementName,parameterObject);
		Dialect dialect = sqlExecutor.getDialect();
		String sql = dialect.getPageCountString(d.getSql());	
		
		Object[] parameters =  d.getParameters();
		return jdbcOperations.queryForInt(sql, parameters);
	}
	
	
	/**
	 * author:周小建
	 * date：2011-12-01 10:00:00
	 * description:
	 		//这个方法既是后面两个方法的工具方法，
			//也可以直接被上层调用，这时的适应场景是：当用户需要自定义page对象，尤其是已经存在Page对象时可以直接当做参数传过来，而不用再分解开pageNo和pageSize分别传送，
			//这个方法的参数中包含Page对象page，最后又将这个page对象返回，看似很是矛盾有点画蛇添足，但是它却又独特的意义，因为它适应多种情况，有些情况不需要返回，而有些是需要的，尤其是上层直接调用的情况
	 */
	public Page queryForPage(String statementName, Map parameterMap, Page page){
		 /*
		 //这是原来的实现方式：
		 if (parameterMap != null) {
			if (page.getTotalRows() == 0) {
				int totalRows = ((Integer) smcTemplate.queryForObject(statementName + "Count", parameterMap))
						.intValue();
				page.setTotalRows(totalRows);
			}
			parameterMap.put("beginRow", new Integer(page.getStartRow()));
			parameterMap.put("endRow", new Integer(page.getEndRow()));
			parameterMap.put("pageSize", new Integer(page.getPageSize()));
			List data = smcTemplate.queryForList(statementName, parameterMap);
			page.setData(data);
		}
		*/
		
		//这是最新的实现方式
		int pageNo = page.getPageNo();
		int pageSize = page.getPageSize();
		int skipResults = (pageNo - 1) * pageSize;
		int maxResults = pageNo * pageSize;
 		int totalRows = getRowCount(statementName, parameterMap);
 		page.setTotalRows(totalRows);
		List data = getSqlMapClientTemplate().queryForList(statementName, parameterMap, skipResults, maxResults);
		page.setData(data);
		return page;
	}
	
	public Page queryForPage(String statementName, Map parameterMap, int pageNo){
		Page page = new Page(pageNo);
		queryForPage(statementName, parameterMap, page);
		return page;
	}

	public Page queryForPage(String statementName, Map parameterMap, int pageNo, int pageSize){
		Page page = new Page(pageNo, pageSize);
		queryForPage(statementName, parameterMap, page);
		return page;
	}
}