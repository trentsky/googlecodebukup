package com.trent.techcluster.transaction.service.impl;

import org.springframework.stereotype.Component;

import com.trent.techcluster.base.service.BaseService;
import com.trent.techcluster.transaction.domain.Transaction;
import com.trent.techcluster.transaction.service.TransactionService;

@Component
public class TransactionServiceImpl extends BaseService implements TransactionService{

	public Transaction findTransactions(String id) {
		return iBaseDao.getById(Transaction.class, id); 
	}

}
