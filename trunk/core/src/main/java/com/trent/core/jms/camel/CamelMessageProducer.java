package com.trent.core.jms.camel;

import java.util.HashMap;

import org.apache.camel.Produce;
import org.apache.camel.ProducerTemplate;

import com.trent.core.common.entity.User;

/**
 * JMS用户变更消息生产者.
 * 使用jmsTemplate将用户变更消息分别发送到queue与topic.
 */
public class CamelMessageProducer {


	@Produce(uri = "jms:topic:sendMail")
	private ProducerTemplate mailProducer;

	/**
	 * 使用ProducerTemplate的sendBodyAndHeaders发送Map类型的消息并在Message中附加属性用于消息过滤.
	 */
	@SuppressWarnings("unused")
	private void sendMessage(User user) {
		HashMap<String, Object> headers = new HashMap<String, Object>();
		headers.put("userName", user.getName());
		headers.put("email", user.getEmail());
		mailProducer.sendBodyAndHeaders(null, headers);
	}
}
