package com.trent.techcluster.transaction.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.trent.techcluster.base.dao.DAO;
import com.trent.techcluster.base.service.BaseService;
import com.trent.techcluster.transaction.domain.Transaction;
import com.trent.techcluster.transaction.service.TransactionService;

public class TransactionServiceImpl extends BaseService implements TransactionService{

	@Autowired
	DAO dao;
	
	public Transaction findTransactions() {
		return dao.find(Transaction.class, "id"); 
	}

}
