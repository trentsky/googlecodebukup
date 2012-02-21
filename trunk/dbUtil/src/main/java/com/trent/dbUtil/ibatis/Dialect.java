package com.trent.dbUtil.ibatis;

public interface Dialect {
	 
	//public abstract String getCountString(String sql);
 
	//public abstract String getLimitString(String sql, int startRow, int maxRow);
	
	public String getPageCountString(String sql);
	
	public String getPageDataString(String sql, int startRow, int maxRow);

	public String[] getQueryStringArrayWithResultMap(String sql);

}
