package com.trent.core.gtalk;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.joran.JoranConfigurator;
import ch.qos.logback.core.util.StatusPrinter;

public class GtalkTest {
	static public void main(String[] args) throws Exception {
		if (args.length != 2) {
			usage("Wrong number of arguments.");
		}
		int runLength = Integer.parseInt(args[0]);
		String configFile = args[1];
		// int runLength = Integer.parseInt("300");
		// String configFile="src/com/ttpod/mail/gmailSSL.xml";
		// String configFile = "src/com/ttpod/mail/gmailSTARTTLS.xml";
		// 自定义配置文件，得到日志固定格式
		LoggerContext lc = (LoggerContext) LoggerFactory.getILoggerFactory();
		JoranConfigurator configurator = new JoranConfigurator();
		lc.reset();
		configurator.setContext(lc);
		configurator.doConfigure(configFile);
		Logger logger = LoggerFactory.getLogger(GtalkTest.class);
		for (int i = 1; i <= runLength; i++) {
			if ((i % 10) < 9) {
				logger.debug("This is a debug message. Message number: " + i);
			} else {
				logger.warn("This is a warning message. Message number: " + i);
			}
		}
		// 定义一条error级别的日志输出
		logger.error("At last an error.", new Exception("Just testing"));
		// 打印logger内部状态
		StatusPrinter.printInCaseOfErrorsOrWarnings(lc);
	}
	static void usage(String msg) { // 当参数传入错误时，提供的处理惯例
		System.err.println(msg);
		System.err.println("Usage: java " + GtalkTest.class.getName()
				+ " runLength configFile\n"
				+ " runLength (integer) the number of logs to generate\n"
				+ " configFile a logback configuration file in XML format."
				+ " XML files must have a '.xml' extension.");
		System.exit(1); // 退出程序
	}
}
