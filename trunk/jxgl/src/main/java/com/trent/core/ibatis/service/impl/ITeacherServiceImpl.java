package com.trent.core.ibatis.service.impl;

import org.springframework.stereotype.Service;

import com.trent.core.ibatis.entiey.Teacher;
import com.trent.core.ibatis.service.TeacherService;
import com.trent.dbUtil.ibatis.IbatisBaseDaoSupport;

@Service
public class ITeacherServiceImpl extends IbatisBaseDaoSupport<Teacher> implements TeacherService{

}
