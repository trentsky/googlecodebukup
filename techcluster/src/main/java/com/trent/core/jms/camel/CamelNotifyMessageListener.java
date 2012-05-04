package com.trent.core.jms.camel;

import org.apache.camel.Body;
import org.apache.camel.Header;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.trent.core.email.MailService;

@Component
public class CamelNotifyMessageListener{

	private static Logger logger = LoggerFactory.getLogger(CamelNotifyMessageListener.class);
	
	@Autowired
	private MailService defaultMailService;

	public void process(@Header("userName") String username,
			@Header("email") String email,@Body String body) {
		try {
			logger.info("用户信息==UserName:{}, Email:{}, Body:{}",new String[]{username,email,body});
			if (defaultMailService != null) {
				defaultMailService.send("springside3.demo@gmail.com", email, "ccccccccc", username);
			}
		} catch (Exception e) {
			logger.error("处理消息时发生异常.", e);
		}
	}
}
