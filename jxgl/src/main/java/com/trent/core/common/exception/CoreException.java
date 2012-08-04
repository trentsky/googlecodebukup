package com.trent.core.common.exception;

import com.trent.core.common.util.ErrorCode;


public class CoreException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	private ErrorCode errorCode;
	
	public CoreException(String msg) {
		super(msg);
	}
	
	public CoreException(String msg, Throwable e) {
		super(msg, e);
	}
	
	public CoreException(ErrorCode errorCode) {
		super(errorCode.memo);
		this.errorCode = errorCode;
	}
	
	public ErrorCode getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(ErrorCode errorCode) {
		this.errorCode = errorCode;
	}
}
