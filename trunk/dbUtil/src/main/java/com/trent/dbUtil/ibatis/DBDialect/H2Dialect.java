package com.trent.dbUtil.ibatis.DBDialect;



public class H2Dialect extends Dialect {

    public boolean supportsLimit() {
        return true;
    }

	public String getPageDataString(String sql, int startRow, int maxRow) {
		return new StringBuffer(sql.length() + 40).
			append(sql).
			append((startRow > 0) ? " limit "+startRow+" offset "+maxRow : " limit "+startRow).
			toString();
	}

}