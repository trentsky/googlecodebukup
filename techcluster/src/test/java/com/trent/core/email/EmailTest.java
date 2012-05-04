package com.trent.core.email;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.trent.core.common.entity.User;
import com.trent.core.jms.camel.CamelMessageProducer;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/spring/applicationContext.xml" })
public class EmailTest {

//	@Autowired
//	private AdvancedNotifyMessageProducer advancedNotifyMessageProducer;

	@Autowired
	private CamelMessageProducer camelMessageProducer;

	private static int measurements = 1; // 测量次数
	private static int threads = 1; // 线程个数

	@Test
	public void sendEmail() {
//		Nano.bench().measurements(measurements).threads(threads).measure(
//				"Jms Email测试", new Runnable() {
//					public void run() {
//						User user = new User();
//						user.setLoginName("admin");
//						user.setPlainPassword("123456");
//						user.setShaPassword("123456");
//						user.setStatus("1");
//						user.setVersion(3);
//						user.setEmail("2863779499@qq.com");
//						user.setName("Tom");
////						advancedNotifyMessageProducer.sendQueue(user);
//						camelMessageProducer.sendQueueMessage(user);
//					}
//				});

					User user = new User();
					user.setLoginName("admin");
					user.setPlainPassword("123456");
					user.setShaPassword("123456");
					user.setStatus("1");
					user.setVersion(3);
					user.setEmail("2863779499@qq.com");
					user.setName("Tom");
//					advancedNotifyMessageProducer.sendQueue(user);
//					camelMessageProducer.sendQueueMessage(user);
					camelMessageProducer.sendTopicMessage(user);
	}
}
