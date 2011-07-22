package com.trent.techcluster.jms.lisener;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestMain {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("classpath:/META-INF/spring/applicationContext-jms.xml");
		TestBean tb = (TestBean)ctx.getBean("testBean");
		tb.go();
	}
}
