package com.trent.dbUtil.ibatis.support;

public class ObjectNotFoundException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public ObjectNotFoundException(String string) {
		super(string);
	}

	public ObjectNotFoundException(String string, Throwable cause) {
		super(string, cause);
	}
}
