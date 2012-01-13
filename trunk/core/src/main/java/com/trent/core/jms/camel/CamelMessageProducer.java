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
		
		/**
		 * body部分，JMS定义了六种java类型，它们是：
		　　1 Message —The base message type. Used to send a message with no payload, only
		headers and properties. Typically used for simple event notification.
		　　2 TextMessage —A message whose payload is a String. Commonly used to send simple
		textual and XML data.
		　　3 MapMessage —Uses a set of name/value pairs as its payload. The names are of
		type String and the values are a Java primitive type.
		　　4 BytesMessage —Used to contain an array of uninterpreted bytes as the payload.
		　　5 StreamMessage—A message with a payload containing a stream of primitive Java
		types that’s filled and read sequentially.
		　　6 ObjectMessage—Used to hold a serializable Java object as its payload. Usually
		used for complex Java objects. Also supports Java collections.
		mailQueueProducer.sendBodyAndHeaders(null, headers);
		**/
	}
	
	public void sendTopicMessage(User user) {
		HashMap<String, Object> headers = new HashMap<String, Object>();
		headers.put("userName", user.getName());
		headers.put("email", user.getEmail());
		logger.info(user.toString());
		mailTopicProducer.sendBodyAndHeaders("邮件", headers);
	}
}
