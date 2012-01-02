package com.trent.core.common.service;

import java.util.List;

import com.trent.core.base.hibernate.dao.IBaseDao;
import com.trent.core.common.entity.Teacher;

public interface ITeacherService extends IBaseDao<Teacher>
{
	/**
	 * 根据职称查找老师
	 * 
	 * @param value
	 *            职称
	 * @return 该职称的学生集
	 */
	public abstract List<Teacher> findByPositional(String value);
}