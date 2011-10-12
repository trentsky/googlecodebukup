package com.trent.techcluster.camel;

import javax.jms.ConnectionFactory;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.camel.CamelContext;
import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.component.jms.JmsComponent;
import org.apache.camel.impl.DefaultCamelContext;

public class Helloworld01 {
	public static void main(String[] args) throws Exception {
        CamelContext context = new DefaultCamelContext();
        context.addRoutes(new RouteBuilder() {
            public void configure() {
                from("jms:test.a").to("jms:test.b");

                from("jms:test.b").process(new Processor() {
                    public void process(Exchange e) {
                    	System.out.println("===========接收到消息===========");
                        System.out.println("Received exchange: " + e.getIn());
                    }
                });
            }
        });
        ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://localhost:61616");
        context.addComponent("jms", JmsComponent.jmsComponentAutoAcknowledge(connectionFactory)); 
        context.start(); 
    }
}
