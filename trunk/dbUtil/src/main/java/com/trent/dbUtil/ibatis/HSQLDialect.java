package com.trent.dbUtil.ibatis;
public class HSQLDialect extends Dialect{

	public boolean supportsLimit() {
		return true;
	}

	public boolean supportsLimitOffset() {
		return true;
	}

	public String getPageDataString(String sql, int startRow, int maxRow) {
		boolean hasOffset = startRow>0;
		return new StringBuffer( sql.length() + 10 )
		.append( sql )
		.insert( sql.toLowerCase().indexOf( "select" ) + 6, hasOffset ? " limit "+startRow+" "+maxRow : " top "+startRow )
		.toString();
	}
}
