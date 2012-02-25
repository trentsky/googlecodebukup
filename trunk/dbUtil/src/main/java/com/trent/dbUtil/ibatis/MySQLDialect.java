package com.trent.dbUtil.ibatis;

import java.util.regex.Pattern;



public class MySQLDialect implements Dialect {

	protected static final String SQL_END_DELIMITER = ";";

//	public String getPageCountString(String sql) {
//		return new StringBuffer(sql.length() + 20).append(trim(sql)).append(
//				" limit ?,?").append(SQL_END_DELIMITER).toString();
//	}
	private String pageNavigationRegEx = "^(?i)(\\s*select\\s+)(.+?)(?i)(\\s+from\\s+.+)$";
	//private static String REGEX = "^(?i)(\\s*select\\s+)(.+?)(?i)(\\s+from\\s+.+)$";
	private static String pageNavigationExtRegEx = "^(\\s*(?i)select\\s+)(.+?)(\\s+FROM\\s+.+)$";
	public String getPageCountString(String sql) {
		boolean isChildQueryExists = Pattern.compile(pageNavigationExtRegEx).matcher(sql).matches();
    	return sql.replaceAll("\n","").replaceFirst(isChildQueryExists ? pageNavigationExtRegEx : pageNavigationRegEx, "$1count(1)$3");
	}

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
