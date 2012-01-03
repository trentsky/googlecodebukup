package com.trent.core.common.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.trent.core.base.hibernate.dao.BaseDaoSupport;
import com.trent.core.common.entity.Teacher;
import com.trent.core.common.service.ITeacherService;

@Service
public class TeacherServiceImpl extends BaseDaoSupport<Teacher> implements
		ITeacherService {

	/*
	 * @see org.usc.services.student.IStudentService#findByName(java.lang.String)
	 */
	public List<Teacher> findByPositional(String value) {
		return super.findByProperty("positional", value);
	}

}
