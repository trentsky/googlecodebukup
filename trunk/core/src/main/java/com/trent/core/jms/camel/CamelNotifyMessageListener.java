package com.trent.core.jms.camel;

import org.apache.camel.Body;
import org.apache.camel.Header;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.trent.core.email.MimeMailService;

@Component
public class CamelNotifyMessageListener{

	private static Logger logger = LoggerFactory.getLogger(CamelNotifyMessageListener.class);
	
	@Autowired(required = false)
	private MimeMailService mimeMailService;

	public void process(@Header("userName") String username,
			@Header("email") String email,@Body String body) {
		try {
			logger.info("UserName:" + username + ", Email:" + email+", Body:"+body);
			if (mimeMailService != null) {
				mimeMailService.sendNotificationMail(username); //发送邮件
			}
		} catch (Exception e) {
			logger.error("处理消息时发生异常.", e);
		}
	}
}
