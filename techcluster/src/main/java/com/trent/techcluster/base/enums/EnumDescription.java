package com.trent.techcluster.base.enums;


import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 枚举描述
 * 
 * @version 1.0
 */
@Target( {ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface EnumDescription {
	
	String value();
}
