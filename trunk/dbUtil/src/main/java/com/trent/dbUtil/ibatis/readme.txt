<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<beans xmlns="http://www.springframework.org/schema/beans" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:context="http://www.springframework.org/schema/context"  
    xsi:schemaLocation="http://www.springframework.org/schema/beans  
    http://www.springframework.org/schema/beans/spring-beans-2.5.xsd  
    http://www.springframework.org/schema/context  
    http://www.springframework.org/schema/context/spring-context-2.5.xsd">
    
    <context:component-scan base-package="com.trent" />  
    <context:annotation-config />
	<bean id="sqlMapClient"
		class="org.springframework.orm.ibatis.SqlMapClientFactoryBean">
		<property name="dataSource">
			<ref bean="dataSource"/>
		</property>
		<property name="configLocation">
			<value>classpath:/META-INF/ibatis/SqlMapConfig_spring.xml</value>
		</property>
	</bean>
	
	<bean id="jdbcOperations" class="org.springframework.jdbc.core.JdbcTemplate">
        <property name="dataSource" ref="dataSource" />
    </bean>
</beans>
