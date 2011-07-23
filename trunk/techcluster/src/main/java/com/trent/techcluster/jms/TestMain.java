package com.trent.techcluster.jms;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestMain {
	
	public static String[] config = new String[] {
		"classpath:/META-INF/spring/applicationContext-jms.xml" };
		static ApplicationContext ac = new ClassPathXmlApplicationContext(config);
	public static void main(String[] args) {
		send();
	}
	
	
	static ExecutorService exec = Executors.newFixedThreadPool(10);
	static TopicMessageProducer fmpa = (TopicMessageProducer) ac.getBean("topicMessageProducer");
	static QueueMessageProducer fmpb = (QueueMessageProducer) ac.getBean("queueMessageProducer");
	public static void send() {
		exec.submit((new Runnable() {
			int count = 1;
			public void run() {
				while (true) {
					FooMessage fm = new FooMessage();
					fm.setId(count);
					fmpa.send(fm);
					fmpb.send(fm);
					count ++;
				}
			}
		}));
	}
	
}
