package com.trent.dbUtil.ibatis.DBDialect;

import java.util.regex.Pattern;


public class OracleDialect extends Dialect {
	
	public String[] getQueryStringArrayWithResultMap(String sql){
		boolean isChildQueryExists = Pattern.compile(pageNavigationExtRegEx).matcher(sql).matches();
		String fieldsString = sql.replaceAll("\r","").replaceAll("\n","").replaceFirst(isChildQueryExists ? pageNavigationExtRegEx : pageNavigationRegEx,"$2").replaceAll("\\w+\\s*\\.","").replaceAll("(?i)as","");
		//去掉回车，去掉换行，取字段部分，去掉别名和点，去掉as，成了最简单的字段部分
		String[] fields = fieldsString.split(",");
		//StringBuffer sb = new StringBuffer();
		String[] realFields = new String[fields.length];
		for(int i = 0; i < fields.length;i++){
			String[] tempFieldArray = fields[i].trim().split("(\\s+)");
			//因为如果原串中存在as，那么去掉as后就会成为两部分，后部分便是有效结果集字段。
			//这要求两点：1去掉as部分的正则表达式只能是(?i)as,或者(?i)\\s+as,或者(?i)as\\s+，三者皆可，
			//但不能是(?i)\\s*as\\s*，不能是(?i)\\s*as\\s+,不能是(?i)\\s+as\\s*,不能是(?i)\\s+as\\s+,总之不能左右都有空串，
			//否则左右两个字符就连在了一起，就无法区分了，即，至少要留个空串以便这里进行分隔
			//2这里必须先要trim，去掉左右空串，否则split后就无法判断length，也无法对有效部分进行定位
			String field = tempFieldArray[0];
			if(tempFieldArray.length >= 2){
				field = tempFieldArray[1];
			}
			//field = field.trim();//这里也可以不用trim，因为前面已经trim过，split("(\\s+)后的结果也都是没有左右空格的
			//sb.append(field);
			realFields[i] = field;
		}
		return realFields;
		
	}
	
	
	
	public String getPageDataString(String sql, int startRow, int maxRow) { 
		return new StringBuffer().append("select outer.* from (select inner.*, rownum rowno from (").append(sql).append(")inner where rownum <= " + maxRow + ")outer where outer.rowno > " + startRow).toString();
	}

}
