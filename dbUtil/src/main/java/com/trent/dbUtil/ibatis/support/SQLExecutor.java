package com.trent.dbUtil.ibatis.support;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.ibatis.sqlmap.engine.execution.SqlExecutor;
import com.ibatis.sqlmap.engine.mapping.statement.RowHandlerCallback;
import com.ibatis.sqlmap.engine.scope.RequestScope;
import com.trent.dbUtil.ibatis.DBDialect.Dialect;

@Service
public class SQLExecutor extends SqlExecutor {
	private static final Log logger = LogFactory.getLog(SQLExecutor.class);

	private Dialect currentDialect;

	@Override
	public void executeQuery(RequestScope request, Connection conn, String sql,
			Object[] parameters, int skipResults, int maxResults,
			RowHandlerCallback callback) throws SQLException {
		String newSql = sql;
		if ((skipResults != NO_SKIPPED_RESULTS || maxResults != NO_MAXIMUM_RESULTS)) {
			newSql = getCurrentDialect(conn).getPageDataString(newSql,
					skipResults, maxResults);
			if (logger.isDebugEnabled()) {
				logger.debug(sql);
			}
			skipResults = NO_SKIPPED_RESULTS;
			maxResults = NO_MAXIMUM_RESULTS;
		}
		super.executeQuery(request, conn, newSql, parameters, skipResults,
				maxResults, callback);
	}

	public Dialect getCurrentDialect(Connection conn) throws SQLException {
		String dialectName = conn.getMetaData().getDatabaseProductName();
		StringBuilder dbDialect = new StringBuilder();
		dbDialect.append("com.trent.dbUtil.ibatis.DBDialect").append(
				dialectName).append("Dialect");
		if (dialectName == null)
			logger.info("Could not get dialectName");
		try {
			currentDialect = (Dialect) ReflectionUtils.classForName(
					dbDialect.toString()).newInstance();
		} catch (ClassNotFoundException cnfe) {
			logger.info("Dialect class not found: " + dialectName
					+ " Exception Message:" + cnfe.getMessage());
		} catch (Exception e) {
			logger.info("Could not instantiate given dialect class: "
					+ dialectName, e);
		}
		return currentDialect;
	}

}
