package com.trent.core.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.trent.core.cache.CacheService;
import com.trent.core.common.entity.Teacher;
import com.trent.core.common.service.ITeacherService;
import com.trent.core.common.util.StringUtil;
import com.trent.dbUtil.hibernate.dao.BaseDaoSupport;

@Service
public class TeacherServiceImpl extends BaseDaoSupport<Teacher> implements
		ITeacherService {

	@Autowired
	CacheService cacheService;
	
	public List<Teacher> findByPositional(String value) {
		return super.findByProperty("positional", value);
	}
	
	public Teacher findByName(String name){
		Teacher teacher = cacheService.get(StringUtil.join("_","teacher",name));
		logger.info("query from cache!!");
		if (null == teacher) {
			logger.info("query from db!!");
			List<Teacher> list = super.findByProperty("name", name);
			teacher = list.get(0);
			if (null != teacher) {
				cacheService.set(StringUtil.join("_", "teacher", teacher.getName()), 0, teacher);
			}
		}
		return teacher;
	}
}
