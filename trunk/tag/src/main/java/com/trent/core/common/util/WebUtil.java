package com.trent.core.common.util;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.util.WebUtils;

public class WebUtil{
	public static Map<String,Object> getQueryConditionStartWith(HttpServletRequest request,String startString){
		Map<String,Object> filterMap = WebUtils.getParametersStartingWith(request,startString);
		return filterMap;
	}

	public static Map<String,Object> getQueryConditionStartWith(HttpServletRequest request){
		return getQueryConditionStartWith(request,"search_");
	}

	public static Map<String,Object> getQueryConditionStartWithExt(HttpServletRequest request){
		Map<String,Object> map =  getQueryConditionStartWith(request,"search_");
		Set<Entry<String, Object>> set = map.entrySet();
		Iterator<Entry<String, Object>> iterator = set.iterator();
		while(iterator.hasNext()){
			Entry<String, Object> entry = iterator.next();
			String key = entry.getKey();
			String value = null;
			Object o = entry.getValue();
			if(o instanceof Object[]){
				value = (String)((Object[])o)[0];
			}else{
				value = (String)o;
			}
			map.put(key, value.trim().equals("")?null:value.trim());
			request.setAttribute("search_" + key,value);
		}
		return map;
	}
	
	public static void putQueryConditionStartWith(HttpServletRequest request,Map<String,Object> queryCondition){
		putQueryConditionStartWith(request,queryCondition,"search_");
	}
	
	public static void putQueryConditionStartWith(HttpServletRequest request,Map<String,Object> queryCondition,String startString){
		Iterator<Entry<String, Object>> entryIterator = queryCondition.entrySet().iterator();
		while(entryIterator.hasNext()){
			Entry<String, Object> entry = entryIterator.next();
			request.setAttribute(startString + entry.getKey(),entry.getValue());
		}
	}
}
