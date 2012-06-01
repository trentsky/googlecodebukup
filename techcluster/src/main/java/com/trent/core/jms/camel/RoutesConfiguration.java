package com.trent.core.jms.camel;

import javax.annotation.Resource;

import org.apache.camel.CamelContext;
import org.apache.camel.builder.RouteBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

@Component
public class RoutesConfiguration implements ApplicationListener<ContextRefreshedEvent> {
	
	private Logger logger = LoggerFactory.getLogger(RoutesConfiguration.class);

	@Resource(name="coreCamelContext")
	private CamelContext camelContext;
	
	@Value("${mailQueue}")
	private String mailQueue;
	
	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		logger.info("init camel routes.......");
		try {
			camelContext.addRoutes(new RouteBuilder() {
				@Override
				public void configure() throws Exception {
					deadLetterChannel("jms:queue:dead").maximumRedeliveries(-1).redeliveryDelay(3000);
					from("jms:queue:sendMailQueue?concurrentConsumers=" + mailQueue).to("bean:camelNotifyMessageListener?method=process").routeId("邮件服务");
//					from("jms:topic:sendMailTopic?concurrentConsumers=" + mailQueue).to("bean:camelNotifyMessageListener?method=process").routeId("邮件服务");
				}
			});
		} catch (Exception e) {
			logger.error("camel context start failed",e.getMessage());
			e.printStackTrace();
		}
	}
}
