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
	ProducerTemplate mailProducer;

	/**
	 * 使用ProducerTemplate的sendBodyAndHeaders发送Map类型的消息并在Message中附加属性用于消息过滤.
	 */
	@SuppressWarnings("unused")
	public void sendMessage(User user) {
		HashMap<String, Object> headers = new HashMap<String, Object>();
		headers.put("userName", user.getName());
		headers.put("email", user.getEmail());
		logger.info(user.toString());
		mailProducer.sendBodyAndHeaders(null, headers);
	}
}
