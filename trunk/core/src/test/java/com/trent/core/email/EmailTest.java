package com.trent.core.email;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.trent.consumeTest.Nano;
import com.trent.core.common.entity.User;
import com.trent.core.jms.advanced.AdvancedNotifyMessageProducer;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/spring/applicationContext.xml" })
public class EmailTest {

	// @Autowired
	// private NotifyMessageProducer notifyMessageProducer;

	@Autowired
	private AdvancedNotifyMessageProducer advancedNotifyMessageProducer;

	private static int measurements = 1; // 测量次数
	private static int threads = 1; // 线程个数

	@Test
	public void sendEmail() {
		Nano.bench().measurements(measurements).threads(threads).measure(
				"Jms Email测试", new Runnable() {
					public void run() {
						User user = new User();
						user.setLoginName("admin");
						user.setPlainPassword("123456");
						user.setShaPassword("123456");
						user.setStatus("1");
						user.setVersion(3);
						user.setEmail("aaa");
						user.setName("Tom");
						System.out.println(user.toString());
						advancedNotifyMessageProducer.sendQueue(user);
					}
				});
	}
}
