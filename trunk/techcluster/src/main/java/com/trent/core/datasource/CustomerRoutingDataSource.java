package com.trent.core.datasource;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class CustomerRoutingDataSource extends AbstractRoutingDataSource  {

	protected Object determineCurrentLookupKey() {
		return CustomerContextHolder.getCustomerType();  
	}
	
}
