package com.trent.dbUtil.ibatis;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.ibatis.sqlmap.engine.execution.SqlExecutor;
import com.ibatis.sqlmap.engine.mapping.statement.RowHandlerCallback;
import com.ibatis.sqlmap.engine.scope.RequestScope;

@Service
public class SQLExecutor extends SqlExecutor {
	private static final Log logger = LogFactory.getLog(SQLExecutor.class);

	 private static final String MICROSOFT_SQL_SERVER = "Microsoft SQL Server";
	 private static final String ORACLE_DATABASE = "Oracle";
	 private static final String MYSQL_DATABASE = "mysql";

	private Dialect currentDialect;

	public void executeQuery(RequestScope request, Connection conn, String sql,
			Object[] parameters, int skipResults, int maxResults,
			RowHandlerCallback callback) throws SQLException {
		getCurrentDialect(conn);
		String newSql = sql;
		if ((skipResults != NO_SKIPPED_RESULTS || maxResults != NO_MAXIMUM_RESULTS)) {
			newSql = currentDialect.getPageDataString(newSql, skipResults,
					maxResults);
			if (logger.isDebugEnabled()) {
				logger.debug(sql);
			}
			skipResults = NO_SKIPPED_RESULTS;
			maxResults = NO_MAXIMUM_RESULTS;
		}
		super.executeQuery(request, conn, newSql, parameters, skipResults,
				maxResults, callback);
	}

//	public Dialect getCurrentDialect(Connection conn) throws SQLException {
//		String dialectName = conn.getMetaData().getDatabaseProductName();
//		if (dialectName == null)
//			logger
//					.info("The dialect was not set. Set the property hibernate.dialect.");
//		try {
//			currentDialect = (Dialect) ReflectionUtils
//					.classForName(dialectName).newInstance();
//		} catch (ClassNotFoundException cnfe) {
//			logger.info("Dialect class not found: " + dialectName
//					+ " Exception Message:" + cnfe.getMessage());
//		} catch (Exception e) {
//			logger.info("Could not instantiate given dialect class: "
//					+ dialectName, e);
//		}
//		return currentDialect;
//	}

	// 判断数据库类型.注入不同的dialect
	public Dialect getCurrentDialect(Connection conn) throws SQLException {
		String DataBase_Type = conn.getMetaData().getDatabaseProductName();
		if (DataBase_Type.equalsIgnoreCase(MICROSOFT_SQL_SERVER)) {
			currentDialect = new SqlServerDialect();
		} else if (DataBase_Type.equalsIgnoreCase(ORACLE_DATABASE)) {
			currentDialect = new OracleDialect();
		} else if (DataBase_Type.equalsIgnoreCase(MYSQL_DATABASE)) {
			currentDialect = new MySQLDialect();
		}
		return currentDialect;
	}
}
