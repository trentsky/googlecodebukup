package com.trent.dbUtil.ibatis;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.engine.impl.ExtendedSqlMapClient;
import com.trent.dbUtil.hibernate.page.PageView;
import com.trent.dbUtil.ibatis.DBDialect.Dialect;
import com.trent.dbUtil.ibatis.support.ReflectionUtils;
import com.trent.dbUtil.ibatis.support.SQL;
import com.trent.dbUtil.ibatis.support.SQLExecutor;

@SuppressWarnings("unchecked")
public abstract class IbatisBaseDaoSupport<T> extends SqlMapClientDaoSupport implements IbatisBaseDao<T>{
	
	@Autowired
	private JdbcOperations jdbcOperations;

	@Autowired
	private SQLExecutor sqlExecutor;
	
	@Resource(name = "sqlMapClient")
	public void setSuperSqlMapClient(SqlMapClient sqlMapClient) {
		super.setSqlMapClient(sqlMapClient);
	}

	@PostConstruct
	public void initialize() throws Exception {
		if (this.sqlExecutor != null) {
			SqlMapClient sqlMapClient = getSqlMapClientTemplate()
					.getSqlMapClient();

			ReflectionUtils.setFieldValue(
					((ExtendedSqlMapClient) sqlMapClient).getDelegate(),
					"sqlExecutor", SQLExecutor.class, this.sqlExecutor);
		}
	}

	public Object insert(String statementName, Object parameterObject)
			throws DataAccessException {
		return getSqlMapClientTemplate().insert(statementName, parameterObject);
	}

	public int update(String statementName, Object parameterObject)
			throws DataAccessException {
		return getSqlMapClientTemplate().update(statementName, parameterObject);
	}

	public int delete(String statementName, Object parameterObject)
			throws DataAccessException {
		return getSqlMapClientTemplate().delete(statementName, parameterObject);
	}

	public T queryForObject(String statementName, Object parameterObject) {
		return (T) getSqlMapClientTemplate().queryForObject(statementName,
				parameterObject);
	}

	public List<T> queryForList(String statementName, Object parameterObject) {
		return getSqlMapClientTemplate().queryForList(statementName,
				parameterObject);
	}

	private Integer getRowCount(String statementName, Object parameterObject) {
		SQL d = new SQL((ExtendedSqlMapClient) getSqlMapClient(),
				statementName, parameterObject);
		Dialect dialect = null;
		try {
			dialect = this.sqlExecutor.getCurrentDialect(getDataSource().getConnection());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String sql = dialect.getPageCountString(d.getSql());
		Object[] parameters = d.getParameters();
		return this.jdbcOperations.queryForInt(sql, parameters);
	}

	public PageView queryForPage(String statementName, Map<String,Object> parameterMap, PageView<T> page) {
		int pageNo = page.getCurrentPage();
		int pageSize = page.getMaxResult();
		int skipResults = (pageNo - 1) * pageSize;
		int maxResults = pageNo * pageSize;
		int totalRows = getRowCount(statementName, parameterMap);
		page.setTotalRecord(totalRows);
		List<T> data = getSqlMapClientTemplate().queryForList(statementName,
				parameterMap, skipResults, maxResults);
		page.setRecords(data);
		return page;
	}

	public PageView queryForPage(String statementName, Map<String,Object> parameterMap, int pageNo) {
		PageView page = new PageView(pageNo);
		queryForPage(statementName, parameterMap, page);
		return page;
	}

	public PageView queryForPage(String statementName, Map<String,Object> parameterMap,
			int pageNo, int pageSize) {
		PageView page = new PageView(pageSize, pageNo);
		queryForPage(statementName, parameterMap, page);
		return page;
	}
	
}
