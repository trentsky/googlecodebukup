package com.trent.techcluster.transaction.service;

import com.trent.techcluster.transaction.domain.Transaction;

public interface TransactionService {

	public Transaction findTransactions(String id);
}
