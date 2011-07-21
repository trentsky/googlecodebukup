package com.trent.techcluster.transaction.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.trent.techcluster.base.dao.IBaseDao;
import com.trent.techcluster.base.service.BaseService;
import com.trent.techcluster.transaction.domain.Transaction;
import com.trent.techcluster.transaction.service.TransactionService;

@Component
public class TransactionServiceImpl extends BaseService implements TransactionService{

	@Autowired
	IBaseDao iBaseDao;
	
	public Transaction findTransactions(String id) {
		return iBaseDao.getById(Transaction.class, id); 
	}

}
