package com.trent.dbUtil.ibatis;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.engine.impl.ExtendedSqlMapClient;

public abstract class IbatisBaseDaoSupport extends SqlMapClientDaoSupport implements IbatisBaseDao{
	
	@Autowired
	private JdbcOperations jdbcOperations;

	@Autowired
	private SQLExecutor sqlExecutor;


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

	public Object queryForObject(String statementName, Object parameterObject) {
		return getSqlMapClientTemplate().queryForObject(statementName,
				parameterObject);
	}

	public List queryForList(String statementName, Object parameterObject) {
		return getSqlMapClientTemplate().queryForList(statementName,
				parameterObject);
	}

	private int getRowCount(String statementName, Object parameterObject) {
		SQL d = new SQL((ExtendedSqlMapClient) getSqlMapClient(),
				statementName, parameterObject);
		Dialect dialect = null;
		try {
			dialect = this.sqlExecutor.getCurrentDialect(getSqlMapClient().getCurrentConnection());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String sql = dialect.getPageCountString(d.getSql());

		Object[] parameters = d.getParameters();
		return this.jdbcOperations.queryForInt(sql, parameters);
	}

	public Page queryForPage(String statementName, Map parameterMap, Page page) {
		int pageNo = page.getPageNo();
		int pageSize = page.getPageSize();
		int skipResults = (pageNo - 1) * pageSize;
		int maxResults = pageNo * pageSize;
		int totalRows = getRowCount(statementName, parameterMap);
		page.setTotalRows(totalRows);
		List data = getSqlMapClientTemplate().queryForList(statementName,
				parameterMap, skipResults, maxResults);
		page.setData(data);
		return page;
	}

	public Page queryForPage(String statementName, Map parameterMap, int pageNo) {
		Page page = new Page(pageNo);
		queryForPage(statementName, parameterMap, page);
		return page;
	}

	public Page queryForPage(String statementName, Map parameterMap,
			int pageNo, int pageSize) {
		Page page = new Page(pageNo, pageSize);
		queryForPage(statementName, parameterMap, page);
		return page;
	}
}
