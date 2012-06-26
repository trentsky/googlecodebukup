package com.trent.core.ibatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.trent.consumeTest.Nano;
import com.trent.core.ibatis.entiey.Teacher;
import com.trent.core.ibatis.service.TeacherService;
import com.trent.dbUtil.hibernate.page.PageView;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/spring/applicationContext.xml"})
public class IbatisServiceTest {

	private static final Logger logger = LoggerFactory.getLogger(IbatisServiceTest.class);
	private static int measurements = 2; // 测量次数
	private static int threads = 2; // 线程个数
	@Autowired
	private TeacherService teacherService;
	
	@Test
	public void testIbatisQueryForPage() {
		Nano.bench().measurements(measurements).threads(threads).measure("cache测试:", new Runnable() {
					public void run() {
						Map<String, Object> map = new HashMap<String, Object>();
						PageView<com.trent.core.ibatis.entiey.Teacher> page = teacherService.queryForPage("getAllUserForPage", map, 1, 5);
						List<com.trent.core.ibatis.entiey.Teacher> list = page.getRecords();
						for (com.trent.core.ibatis.entiey.Teacher teacher:list) {
							logger.info(teacher.toString());
						}
						logger.info("=============================================");
						PageView<Teacher> page1 = teacherService.queryForPage("getAllUserForPage", map, 1);
						List<com.trent.core.ibatis.entiey.Teacher> list1 = page1.getRecords();
						for (com.trent.core.ibatis.entiey.Teacher teacher:list1) {
							logger.info(teacher.toString());
						}
						
						logger.info("****************"+Thread.currentThread().getName()+"*******************");
					}
				});
	}
}
