package com.trent.dbUtil.ibatis.support;

public class ObjectAccessException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;

	public ObjectAccessException(String string) {
		super(string);
	}

	public ObjectAccessException(String string, Throwable cause) {
		super(string, cause);
	}
}
