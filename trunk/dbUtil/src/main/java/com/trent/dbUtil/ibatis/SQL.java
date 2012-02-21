package com.trent.dbUtil.ibatis;

import com.ibatis.sqlmap.engine.impl.ExtendedSqlMapClient;
import com.ibatis.sqlmap.engine.mapping.parameter.ParameterMap;
import com.ibatis.sqlmap.engine.mapping.sql.Sql;
import com.ibatis.sqlmap.engine.mapping.statement.MappedStatement;
import com.ibatis.sqlmap.engine.scope.RequestScope;

public class SQL {

	private ExtendedSqlMapClient sqlMapClient = null;

	private String statementName = null;

	private Object parameterObject = null;

	private RequestScope request = null;

	public SQL(ExtendedSqlMapClient sqlMapClient, String statementName,
			Object parameterObject) {
		this.sqlMapClient = sqlMapClient;
		this.statementName = statementName;
		this.parameterObject = parameterObject;

		this.request = newRequestScope(this.sqlMapClient, this.statementName,this.parameterObject);
	}

	private RequestScope newRequestScope(ExtendedSqlMapClient sqlMapClient,String statementName, Object parameterObject) {

		RequestScope request = new RequestScope();
		
		MappedStatement stmt = sqlMapClient.getMappedStatement(statementName);
		request.setStatement(stmt);
		
		Sql sql = stmt.getSql();
		request.setSql(sql);
		
		ParameterMap parameterMap = sql.getParameterMap(request,parameterObject);
		request.setParameterMap(parameterMap);
		return request;
	}

	public String getSql() {
		return request.getSql().getSql(request, parameterObject);
	}

	public Object[] getParameters() {
		return request.getParameterMap().getParameterObjectValues(request,parameterObject);
	}

}
