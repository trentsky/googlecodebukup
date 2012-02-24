package com.trent.dbUtil.ibatis;

public class SqlServerDialect implements Dialect {     
    protected static final String SQL_END_DELIMITER = ";";     
        
    /**  
        * @author: luyu  
        * @data: Sep 9, 2008  
        * @param sql  
        * @param pager 目标页面  
        * @param pageSize 页面大小  
        * @param primaryKey 主键.主要利用于sqlserver  
        * @param orderBySubStr orderby 子句  
        * @return  
        *  
        * @function: 拼凑分页语句  
        */   
    public String getLimitString(String sql, int pager, int pageSize, String primaryKey , String orderBySubStr){     
           sql = trim(sql);     
              
          // judgeSqlOrderBy(sql);   
              
           StringBuffer sb = new StringBuffer(sql.length() + 80);     
  
           //SELECT TOP PAGESIZE A.* FROM(SQL) AS A WHERE A.DID NOT IN   
           //(SELECT TOP PAGE*PAGESIZE B.DID FROM (SQL) AS B ORDER BY ID) ORDER BY ID   
              
           sb.append("SELECT TOP ").append(pageSize).append(" A.* FROM( ").append(sql);   
           sb.append(" ) AS A WHERE A.DID NOT IN (SELECT TOP ").append(pageSize * (pager - 1));   
           sb.append(" B.DID FROM ( ").append(sql).append(" ) AS B ORDER BY B.DID) ORDER BY A.DID");   
              
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
  
       public String getLimitString(String sql, boolean hasOffset) {   
           return null;   
       }

	@Override
	public String getPageCountString(String sql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getPageDataString(String sql, int startRow, int maxRow) {
		// TODO Auto-generated method stub
		return null;
	}     
}  
