package com.trent.core.common.service;

import java.util.List;

import com.trent.core.base.hibernate.dao.IBaseDao;
import com.trent.core.common.entity.Teacher;

public interface ITeacherService extends IBaseDao<Teacher> {
	
	public abstract List<Teacher> findByPositional(String value);
	
	public abstract Teacher findByName(String name);
}