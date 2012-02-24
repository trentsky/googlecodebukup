package com.trent.dbUtil.ibatis;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ReflectionUtils {
	private static final Log logger = LogFactory.getLog(ReflectionUtils.class);

	/**
	 * 对象字段设置
	 */
	public static void writeField(Object obj, String filedName, Object value) {
		Class clazz = obj.getClass();
		try {
			Field field = clazz.getDeclaredField(filedName);
			writeField(obj, field, value);
		} catch (SecurityException e) {
			throw new ObjectAccessException("Could not get field"
					+ clazz.getName() + "." + filedName);
		} catch (NoSuchFieldException e) {
			throw new ObjectAccessException("No such field " + clazz.getName()
					+ "." + filedName);
		}
	}

	/**
	 * 对象字段设置
	 */
	public static void writeField(Object obj, Field field, Object value) {
		try {
			if (!field.isAccessible()) {
				field.setAccessible(true);
			}
			field.set(obj, value);
		} catch (IllegalArgumentException e) {
			throw new ObjectAccessException("Could not get field "
					+ field.getClass() + "." + field.getName(), e);
		} catch (IllegalAccessException e) {
			throw new ObjectAccessException("Could not get field "
					+ field.getClass() + "." + field.getName(), e);
		}
	}

	public static void setFieldValue(Object target, String fname, Class ftype,
			Object fvalue) {
		if (target == null
				|| fname == null
				|| "".equals(fname)
				|| (fvalue != null && !ftype
						.isAssignableFrom(fvalue.getClass()))) {
			return;
		}
		Class clazz = target.getClass();
		try {
			// Method method = clazz.getDeclaredMethod("set" +
			// Character.toUpperCase(fname.charAt(0)) + fname.substring(1),
			// ftype);
			Method method = clazz.getDeclaredMethod("set"
					+ Character.toUpperCase(fname.charAt(0))
					+ fname.substring(1), new Class[] { ftype });
			if (!Modifier.isPublic(method.getModifiers())) {
				method.setAccessible(true);
			}
			method.invoke(target, new Object[] { fvalue });

		} catch (Exception me) {
			if (logger.isDebugEnabled()) {
				logger.debug(me);
			}
			try {
				Field field = clazz.getDeclaredField(fname);
				if (!Modifier.isPublic(field.getModifiers())) {
					field.setAccessible(true);
				}
				field.set(target, fvalue);
			} catch (Exception fe) {
				if (logger.isDebugEnabled()) {
					logger.debug(fe);
				}
			}
		}
	}

	public static Class classForName(String name) throws ClassNotFoundException {
		try {
			ClassLoader contextClassLoader = Thread.currentThread()
					.getContextClassLoader();
			if (contextClassLoader != null)
				return contextClassLoader.loadClass(name);
		} catch (Throwable ignore) {
		}
		return Class.forName(name);
	}
}
