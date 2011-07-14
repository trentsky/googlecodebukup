package com.trent.techcluster.service;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextTestExecutionListener;

import com.dbluethink.test.SaveFixturesListener;
import com.trent.techcluster.transaction.service.impl.TransactionServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@TestExecutionListeners({ DependencyInjectionTestExecutionListener.class,
		SaveFixturesListener.class, DirtiesContextTestExecutionListener.class })
@ContextConfiguration(locations = {
		"classpath:/META-INF/spring/applicationContext.xml" })
@DirtiesContext
public class TransactionServcieTest {

	@Autowired
	TransactionServiceImpl transactionServiceImpl;
	
	@Test
	public void testFindTransactionById(){
		Assert.assertNotNull(transactionServiceImpl.findTransactions("20110527000000000000000000000004"));
	}
}
