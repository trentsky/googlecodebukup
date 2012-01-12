package com.trent.core.jms.camel;

import java.util.HashMap;

import org.apache.camel.Produce;
import org.apache.camel.ProducerTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.trent.core.common.entity.User;

@Service
public class CamelMessageProducer {

	private Logger logger = LoggerFactory.getLogger(CamelMessageProducer.class);
	
	@Produce(uri = "jms:queue:sendMailQueue")
	ProducerTemplate mailQueueProducer;
	
	@Produce(uri = "jms:topic:sendMailTopic")
	ProducerTemplate mailTopicProducer;

	public void sendQueueMessage(User user) {
		HashMap<String, Object> headers = new HashMap<String, Object>();
		headers.put("userName", user.getName());
		headers.put("email", user.getEmail());
		logger.info(user.toString());
		mailQueueProducer.sendBodyAndHeaders("邮件", headers);
	}
	
	public void sendTopicMessage(User user) {
		HashMap<String, Object> headers = new HashMap<String, Object>();
		headers.put("userName", user.getName());
		headers.put("email", user.getEmail());
		logger.info(user.toString());
		mailTopicProducer.sendBodyAndHeaders("邮件", headers);
	}
}
