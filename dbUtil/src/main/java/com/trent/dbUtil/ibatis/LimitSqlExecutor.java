//package com.trent.dbUtil.ibatis;
//
//import java.sql.Connection;
//import java.sql.SQLException;
//import java.util.Map;
//
//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;
//
//import com.ibatis.sqlmap.engine.execution.SqlExecutor;
//import com.ibatis.sqlmap.engine.mapping.statement.RowHandlerCallback;
//   
//public class LimitSqlExecutor extends SqlExecutor {     
//    private static final Log logger = LogFactory.getLog(LimitSqlExecutor.class);      
//       
//    private static final String MICROSOFT_SQL_SERVER = "Microsoft SQL Server";   
//    private static final String ORACLE_DATABASE = "Oracle";   
//    private static final String MYSQL_DATABASE = "mysql";   
//    private  String DataBase_Type = "" ;      
//          
//    private Dialect mySqlDialect;      
//    private Dialect oracleDialect;      
//    private Dialect sqlServerDialect;      
//    private Dialect dialect;      
//     
//    private boolean enableLimit = true;      
//     
//     
//    public boolean isEnableLimit() {      
//        return enableLimit;      
//    }      
//     
//    public void setEnableLimit(boolean enableLimit) {      
//        this.enableLimit = enableLimit;      
//    }      
//     
//    
//    public void executeQuery(StatementScope statementScope, Connection conn, String sql,      
//            Object[] parameters, int skipResults, int maxResults,      
//            RowHandlerCallback callback,Object parameterObject) throws SQLException {     
//        judgeDataBaseType(conn);//调用判断数据库 注入不同的dialect   
//           
//        //////////如果此处可以得到传入参数 最好是Map就可以解决很多问题了.   
//           
//           
//        if ((skipResults != NO_SKIPPED_RESULTS || maxResults != NO_MAXIMUM_RESULTS)      
//                && supportsLimit()) {     
//               
//               
//               
//               
//            String primaryKey = "";   
//            String orderBySubStr = "";   
//   
//            if(parameterObject instanceof Map){   
//                orderBySubStr= (String) ((Map) parameterObject).get("orderBy");   
//                    
//                primaryKey= (String)((Map) parameterObject).get("primaryKey");   
//                System.out.println("aaaaaaaaaaaaaaaa");   
//                System.out.println(orderBySubStr);   
//                System.out.println(primaryKey);   
//            }   
//               
//            //拼凑分页语句   
//            sql = dialect.getLimitString(sql, skipResults, maxResults , primaryKey , orderBySubStr);    
//               
//            if(logger.isDebugEnabled()){      
//                logger.debug(sql);      
//            }      
//            skipResults = NO_SKIPPED_RESULTS;      
//            maxResults = NO_MAXIMUM_RESULTS;     
//            System.out.println("sssssssssssssssssssss");   
//        }      
//           
//        System.out.println(sql);   
//        super.executeQuery(statementScope, conn, sql, parameters, skipResults,      
//                maxResults, callback);      
//    }      
//     
//    public boolean supportsLimit() {      
//        if (enableLimit && dialect != null) {      
//            return dialect.supportsLimit();      
//        }      
//        return false;      
//    }   
//   
//    //判断数据库类型.注入不同的dialect   
//    private void judgeDataBaseType(Connection conn) throws SQLException{   
//        DataBase_Type = conn.getMetaData().getDatabaseProductName();   
//        if(DataBase_Type.equalsIgnoreCase(MICROSOFT_SQL_SERVER)){   
//            dialect = sqlServerDialect;   
//        }else if(DataBase_Type.equalsIgnoreCase(ORACLE_DATABASE)){   
//            dialect = oracleDialect;   
//        }else if(DataBase_Type.equalsIgnoreCase("MYSQL_DATABASE")){//mysql的没写   
//            dialect = mySqlDialect;   
//        }   
//    }   
//    public void setMySqlDialect(MySQLDialect mySqlDialect) {   
//        this.mySqlDialect = mySqlDialect;   
//    }   
//   
//    public void setOracleDialect(OracleDialect oracleDialect) {   
//        this.oracleDialect = oracleDialect;   
//    }   
//   
//    public void setSqlServerDialect(SqlServerDialect sqlServerDialect) {   
//        this.sqlServerDialect = sqlServerDialect;   
//    }      
//     
//   
//}  
