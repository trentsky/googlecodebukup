package com.trent.techcluster.base.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.trent.techcluster.base.dao.IBaseDao;

public abstract class BaseService {

	@Autowired
	protected IBaseDao iBaseDao;
	protected final Logger log = Logger.getLogger(getClass());
}
