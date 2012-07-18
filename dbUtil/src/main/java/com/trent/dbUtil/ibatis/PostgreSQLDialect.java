package com.trent.dbUtil.ibatis;

public class PostgreSQLDialect extends Dialect{
	
	@Override
	public String getPageDataString(String sql, int startRow, int maxRow) {
		return new StringBuffer( sql.length()+20 )
		.append(sql)
		.append(startRow > 0 ? " limit "+startRow+" offset "+maxRow : " limit "+startRow)
		.toString();
	}
}
