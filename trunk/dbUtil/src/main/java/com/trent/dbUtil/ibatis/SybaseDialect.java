package com.trent.dbUtil.ibatis;

public class SybaseDialect extends Dialect{

	@Override
	public String getPageDataString(String sql, int startRow, int maxRow) {
		throw new UnsupportedOperationException( "paged queries not supported" );
	}

}
