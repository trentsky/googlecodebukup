package com.trent.core.hibernate;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.trent.consumeTest.Nano;
import com.trent.core.common.entity.Teacher;
import com.trent.core.common.service.ITeacherService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/spring/applicationContext.xml" })
public class ServiceTest {
	
	Logger logger =  LoggerFactory.getLogger(ServiceTest.class);
	private static int measurements = 100; // 测量次数
	private static int threads = 1000; //线程个数
	@Autowired
	private ITeacherService teacherService;
	
	@Test
	public void teacherServiceTest(){
		Nano.bench().measurements(measurements).threads(threads).measure(
				"C3p0 测试", new Runnable() {
					public void run() {
						List<Teacher> list = teacherService.findByPositional("讲师");
						for (Teacher teacher:list) {
							logger.info(teacher.toString());
						}
					}
				});
	}
}
