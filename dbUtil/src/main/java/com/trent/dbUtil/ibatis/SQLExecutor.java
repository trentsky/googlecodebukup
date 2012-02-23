package com.trent.dbUtil.ibatis;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibatis.sqlmap.engine.execution.SqlExecutor;
import com.ibatis.sqlmap.engine.mapping.statement.RowHandlerCallback;
import com.ibatis.sqlmap.engine.scope.RequestScope;

@Service
public class SQLExecutor extends SqlExecutor {
	private static final Log logger = LogFactory.getLog(SQLExecutor.class);
	
	@Autowired
	private MySQLDialect mysqlDialect;
	
	public void executeQuery(RequestScope request, Connection conn, String sql,
			Object[] parameters, int skipResults, int maxResults,
			RowHandlerCallback callback) throws SQLException {
		String newSql = sql;
		if ((skipResults != NO_SKIPPED_RESULTS || maxResults != NO_MAXIMUM_RESULTS)) {
			newSql = mysqlDialect.getPageDataString(newSql, skipResults, maxResults);
			if(logger.isDebugEnabled()){
                logger.debug(sql);
            }
			skipResults = NO_SKIPPED_RESULTS;
			maxResults = NO_MAXIMUM_RESULTS;
		}
		super.executeQuery(request, conn, newSql, parameters, skipResults,maxResults, callback);
	}

	public Dialect getCurrentDialect() {
		return mysqlDialect;
	}
}
