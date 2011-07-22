package com.trent.techcluster.jms;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestMain {
	
	public static String[] config = new String[] {
		"classpath:/META-INF/spring/applicationContext-activemq.xml" };
		static ApplicationContext ac = new ClassPathXmlApplicationContext(config);
	public static void main(String[] args) {
		
		TopicMessageProducer fmpa = (TopicMessageProducer) ac.getBean("topicMessageProducer");
		QueueMessageProducer fmpb = (QueueMessageProducer) ac.getBean("queueMessageProducer");
		int count = 1;
		while (true) {
			FooMessage fm = new FooMessage();
			fm.setId(count);
			fmpa.send(fm);
			fmpb.send(fm);
			count ++;
		}
	}
}
