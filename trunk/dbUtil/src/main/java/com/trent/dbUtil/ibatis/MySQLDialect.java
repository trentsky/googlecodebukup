package com.trent.dbUtil.ibatis;




public class MySQLDialect extends Dialect {

	protected static final String SQL_END_DELIMITER = ";";

	public String getPageDataString(String sql, int startRow, int maxRow) {
		sql = trim(sql);
		StringBuffer sb = new StringBuffer(sql.length() + 20);
		sb.append(sql);
		if (startRow > 0) {
			sb.append(" limit ").append(startRow).append(',').append(maxRow)
					.append(SQL_END_DELIMITER);
		} else {
			sb.append(" limit ").append(maxRow).append(SQL_END_DELIMITER);
		}
		return sb.toString();
	}

	public boolean supportsLimit() {
		return true;
	}

	private String trim(String sql) {
		sql = sql.trim();
		if (sql.endsWith(SQL_END_DELIMITER)) {
			sql = sql.substring(0, sql.length() - 1
					- SQL_END_DELIMITER.length());
		}
		return sql;
	}
}
