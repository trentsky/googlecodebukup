package com.trent.core.common.entity.base;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;


public class BaseEntity implements Serializable{
	private static final long serialVersionUID = 1L;
	
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}

}
