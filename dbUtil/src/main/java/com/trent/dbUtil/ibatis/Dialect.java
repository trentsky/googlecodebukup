package com.trent.dbUtil.ibatis;

import java.util.regex.Pattern;


public abstract class Dialect {
	 
	protected String pageNavigationRegEx = "^(?i)(\\s*select\\s+)(.+?)(?i)(\\s+from\\s+.+)$";
	protected static String pageNavigationExtRegEx = "^(\\s*(?i)select\\s+)(.+?)(\\s+FROM\\s+.+)$";
	public String getPageCountString(String sql) {
		int orderByIndex = sql.toLowerCase().lastIndexOf( "order by" );
		if (orderByIndex > 0) {
			sql = sql.substring( 0, orderByIndex );
		}
		boolean isChildQueryExists = Pattern.compile(pageNavigationExtRegEx).matcher(sql).matches();
    	return sql.replaceAll("\n","").replaceFirst(isChildQueryExists ? pageNavigationExtRegEx : pageNavigationRegEx, "$1count(*)$3");
	}
	
	public abstract String getPageDataString(String sql, int startRow, int maxRow);

}
