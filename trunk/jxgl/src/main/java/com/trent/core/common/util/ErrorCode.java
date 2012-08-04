package com.trent.core.common.util;

public enum ErrorCode {

	OK("0", "成功"), ERROR("500", "服务器错误"), PARAMTER_ERROR("501", "参数错误"), MAC_ERROR("502", "Mac生成错误"),
	
	UserReg_PassMD5Error("070006", "加密密码错误");
	public String value;
	
	public String memo;
	
	ErrorCode(String value, String memo) {
		
		this.value = value;
		this.memo = memo;
	}
}
