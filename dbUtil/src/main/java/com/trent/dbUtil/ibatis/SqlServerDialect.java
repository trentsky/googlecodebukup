package com.trent.dbUtil.ibatis;

public class SqlServerDialect extends Dialect {     
    protected static final String SQL_END_DELIMITER = ";";     
        
    public String getPageDataString(String sql, int startRow, int maxRow) {     
           StringBuffer sb = new StringBuffer(trim(sql).length() + 80);     
           sb.append("SELECT TOP ").append(maxRow).append(" A.* FROM( ").append(trim(sql));   
           sb.append(" ) AS A WHERE A.DID NOT IN (SELECT TOP ").append(maxRow * (startRow - 1));   
           sb.append(" B.DID FROM ( ").append(trim(sql)).append(" ) AS B ORDER BY B.DID) ORDER BY A.DID");   
              
           return sb.toString();     
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
