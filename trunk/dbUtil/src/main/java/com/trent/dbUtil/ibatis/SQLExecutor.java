package com.trent.dbUtil.ibatis;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.ibatis.sqlmap.engine.execution.SqlExecutor;
import com.ibatis.sqlmap.engine.mapping.statement.RowHandlerCallback;
import com.ibatis.sqlmap.engine.scope.RequestScope;

public class SQLExecutor extends SqlExecutor {
	private static final Log logger = LogFactory.getLog(SQLExecutor.class);
	private Dialect dialect = null;
	public Dialect getDialect() {	
		return dialect;
	}
	public void setDialect(Dialect dialect) {
		this.dialect = dialect;
	}
	public void executeQuery(RequestScope request, Connection conn, String sql,
			Object[] parameters, int skipResults, int maxResults,
			RowHandlerCallback callback) throws SQLException {
		String newSql = sql;
		if ((skipResults != NO_SKIPPED_RESULTS || maxResults != NO_MAXIMUM_RESULTS)) {
			newSql = dialect.getPageDataString(newSql, skipResults, maxResults);
			if(logger.isDebugEnabled()){
                logger.debug(sql);
            }
			skipResults = NO_SKIPPED_RESULTS;
			maxResults = NO_MAXIMUM_RESULTS;
		}
		super.executeQuery(request, conn, newSql, parameters, skipResults,maxResults, callback);
	}
}
