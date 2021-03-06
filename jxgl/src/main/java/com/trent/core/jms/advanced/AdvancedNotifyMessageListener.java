package com.trent.core.jms.advanced;

import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.MessageListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.trent.core.email.MailService;

/**
 * 消息的异步被动接收者.
 * 使用Spring的MessageListenerContainer侦听消息并调用本Listener进行处理.
 */
public class AdvancedNotifyMessageListener implements MessageListener {

	private static final Logger logger = LoggerFactory.getLogger(AdvancedNotifyMessageListener.class);
	
	@Autowired(required = false)
	private MailService mailService;

	/**
	 * MessageListener回调函数.
	 */
	public void onMessage(Message message) {
		try {
			MapMessage mapMessage = (MapMessage) message;

			//打印消息详情
			logger.info("UserName:" + mapMessage.getString("userName") + ", Email:" + mapMessage.getString("email")
					+ ", ObjectType:" + mapMessage.getStringProperty("objectType"));
			//发送邮件
			if (mailService != null&& null != mapMessage.getString("email")) {
				mailService.send("springside3.demo@gmail.com",  mapMessage.getString("email"), "ccccccccc", "dddddddddd");
			}
		} catch (Exception e) {
			logger.error("处理消息时发生异常.", e);
		}
	}
}
