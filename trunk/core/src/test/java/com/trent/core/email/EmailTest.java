package com.trent.core.email;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.trent.core.common.User;
import com.trent.core.jms.advanced.AdvancedNotifyMessageProducer;
import com.trent.core.jms.simple.NotifyMessageProducer;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/spring/applicationContext.xml"})
public class EmailTest {
	
	@Autowired
	private NotifyMessageProducer notifyMessageProducer;
	
	@Autowired
	private AdvancedNotifyMessageProducer advancedNotifyMessageProducer;
	
	@Test
	public void sendEmail(){
		User user = new User();
		user.setEmail("aaa");
		user.setName("Tom");
		System.out.println(user.toString());
		advancedNotifyMessageProducer.sendQueue(user);
	}
}
