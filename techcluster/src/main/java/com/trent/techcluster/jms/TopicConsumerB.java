package com.trent.techcluster.jms;

public class TopicConsumerB {

	public void receive(FooMessage message) {
		System.out.println("*************************************** Topic B : " + message.getId());
	}
}
