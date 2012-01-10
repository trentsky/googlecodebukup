package com.trent.core.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.trent.core.base.hibernate.dao.BaseDaoSupport;
import com.trent.core.cache.CacheService;
import com.trent.core.common.entity.Teacher;
import com.trent.core.common.service.ITeacherService;
import com.trent.core.common.util.StringUtil;

@Service
public class TeacherServiceImpl extends BaseDaoSupport<Teacher> implements
		ITeacherService {

	@Autowired
	CacheService cacheService;
	
	public List<Teacher> findByPositional(String value) {
		return super.findByProperty("positional", value);
	}
	
	public Teacher findById(String id){
		Teacher teacher = cacheService.get(StringUtil.join("_",id));
		logger.info("query from cache!!");
		if (null == teacher) {
			logger.info("query from db!!");
			teacher = super.find(id);
			if (null != teacher) {
				cacheService.set(StringUtil.join("_", teacher.getId().toString()), 0, teacher);
			}
		}
		return teacher;
	}
}
