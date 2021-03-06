<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:aop="http://www.springframework.org/schema/aop"
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:jee="http://www.springframework.org/schema/jee"
	xmlns:tx="http://www.springframework.org/schema/tx"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop-3.0.xsd         http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-3.0.xsd         http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-3.0.xsd         http://www.springframework.org/schema/jee http://www.springframework.org/schema/jee/spring-jee-3.0.xsd         http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx-3.0.xsd">

	<description>import project applicationContext listed files</description>
	<import resource="../email/applicationContext-email.xml" />
	<import resource="../jms/applicationContext-jms.xml" />
	<import resource="../ibatis/applicationContext-ibatis.xml" />
	<import resource="applicationContext-cache.xml" />
	<import resource="../jms/applicationContext-jms-advanced.xml" />
	
	<!-- This will automatically locate any and all property files you have 
		within your classpath, provided they fall under the META-INF/spring directory. 
		The located property files are parsed and their values can then be used within 
		application context files in the form of ${propertyKey}. -->
	<context:property-placeholder
		location="classpath*:META-INF/spring/*.properties" />
	<!-- Turn on AspectJ @Configurable support. As a result, any time you instantiate 
		an object, Spring will attempt to perform dependency injection on that object. 
		This occurs for instantiation via the "new" keyword, as well as via reflection. 
		This is possible because AspectJ is used to "weave" Roo-based applications 
		at compile time. In effect this feature allows dependency injection of any 
		object at all in your system, which is a very useful feature (without @Configurable 
		you'd only be able to dependency inject objects acquired from Spring or subsequently 
		presented to a specific Spring dependency injection method). Roo applications 
		use this useful feature in a number of areas, such as @PersistenceContext 
		injection into entities. -->
	<context:spring-configured />
	<!-- This declaration will cause Spring to locate every @Component, @Repository 
		and @Service in your application. In practical terms this allows you to write 
		a POJO and then simply annotate the new POJO as an @Service and Spring will 
		automatically detect, instantiate and dependency inject your service at startup 
		time. Importantly, you can then also have your new service injected into 
		any other class that requires it simply by declaring a field for your service 
		inside the relying class and Spring will inject it. Note that two exclude 
		filters are declared. The first ensures that Spring doesn't spend time introspecting 
		Roo-specific ITD aspects. The second ensures Roo doesn't instantiate your 
		@Controller classes, as these should be instantiated by a web tier application 
		context. Refer to web.xml for more details about the web tier application 
		context setup services. Furthermore, this turns on @Autowired, @PostConstruct 
		etc support. These annotations allow you to use common Spring and Java Enterprise 
		Edition annotations in your classes without needing to do any special configuration. 
		The most commonly used annotation is @Autowired, which instructs Spring to 
		dependency inject an object into your class. -->
	<context:component-scan base-package="com.trent.core">
		<!-- 不扫描带有@Controller注解的类。因为这些类已经随容器启动时，在webmvc-servlet.xml中扫描过一遍了 --> 
		<context:exclude-filter expression="org.springframework.stereotype.Controller" type="annotation" />
	</context:component-scan>
	<!--BoneCP数据源 -->
	<bean id="querySource" class="com.jolbox.bonecp.BoneCPDataSource"
		destroy-method="close">
		<property name="driverClass" value="${database.driverClassName}" />
		<property name="jdbcUrl" value="${queryDB.url}" />
		<property name="username" value="${queryDB.username}" />
		<property name="password" value="${queryDB.password}" />
		<property name="idleConnectionTestPeriodInMinutes" value="60" />
		<property name="idleMaxAgeInMinutes" value="240" />
		<property name="maxConnectionsPerPartition" value="20" />
		<property name="minConnectionsPerPartition" value="5" />
		<property name="partitionCount" value="${database.partitionCount}" />
		<property name="acquireIncrement" value="5" />
		<property name="statementsCacheSize" value="10" />
		<property name="releaseHelperThreads" value="3" />
	</bean>
	
	<bean id="productSource" class="com.jolbox.bonecp.BoneCPDataSource"
		destroy-method="close">
		<property name="driverClass" value="${database.driverClassName}" />
		<property name="jdbcUrl" value="${productDB.url}" />
		<property name="username" value="${productDB.username}" />
		<property name="password" value="${productDB.password}" />
		<property name="idleConnectionTestPeriodInMinutes" value="60" />
		<property name="idleMaxAgeInMinutes" value="240" />
		<property name="maxConnectionsPerPartition" value="20" />
		<property name="minConnectionsPerPartition" value="5" />
		<property name="partitionCount" value="${database.partitionCount}" />
		<property name="acquireIncrement" value="5" />
		<property name="statementsCacheSize" value="10" />
		<property name="releaseHelperThreads" value="3" />
	</bean> 
	
	<bean id="dataSource" class="com.trent.core.datasource.CustomerRoutingDataSource">  
	   <property name="targetDataSources">  
	      <map key-type="com.trent.core.datasource.CustomerType">  
	         <entry key="queryDB" value-ref="querySource"/>  
	      </map>  
	   </property>  
	   <property name="defaultTargetDataSource" ref="productSource"/>  
	</bean>  
	<!-- C3p0数据源 
	<bean id="dataSource"
        class="com.mchange.v2.c3p0.ComboPooledDataSource"
        destroy-method="close">
        <property name="driverClass" value="${database.driverClassName}"></property>
        <property name="jdbcUrl" value="${database.url}"></property>
        <property name="user" value="${database.username}"></property>
        <property name="password" value="${database.password}"></property>
        
        <property name="acquireIncrement"><value>5</value></property>
        <property name="initialPoolSize"><value>10</value></property>
        <property name="maxIdleTime"><value>100</value></property>
        <property name="maxPoolSize"><value>30</value></property>
        <property name="minPoolSize"><value>5</value></property>
        
        <property name="acquireRetryAttempts" value="10"></property>
        <property name="breakAfterAcquireFailure" value="false"></property>
    </bean>-->
	
	<!-- 配置数据源 
	<bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource"
		destroy-method="close">
		<property name="driverClassName" value="${database.driverClassName}" />
		<property name="url" value="${database.url}" />
		<property name="username" value="${database.username}" />
		<property name="password" value="${database.password}" />
		<property name="initialSize" value="10" />
		<property name="maxActive" value="100" />
		<property name="maxIdle" value="100" />
		<property name="minIdle" value="10" />
		<property name="maxWait" value="1000" />
		<property name="poolPreparedStatements" value="true" />
		<property name="defaultAutoCommit" value="false" />
	</bean>-->
	
	<!--session工厂，里面可以配置Hibernate的映射文件，使用annotatedClasses-->
	<bean id="sessionFactory"
		class="org.springframework.orm.hibernate3.annotation.AnnotationSessionFactoryBean">
		<property name="dataSource">
			<ref bean="dataSource" />
		</property>
		<!--主键Bean类-->
		<property name="annotatedClasses">
			<list>
				<value>com.trent.core.common.entity.Student</value>
				<value>com.trent.core.common.entity.Teacher</value>
			</list>
		</property>
	</bean>
	
	<!--
		<bean id="twodataSource" class="com.jolbox.bonecp.BoneCPDataSource"
		destroy-method="close">
		<property name="driverClass" value="${twodatabase.driverClassName}" />
		<property name="jdbcUrl" value="${twodatabase.url}" />
		<property name="username" value="${twodatabase.username}" />
		<property name="password" value="${twodatabase.password}" />
		<property name="idleConnectionTestPeriod" value="60" />
		<property name="idleMaxAge" value="240" />
		<property name="maxConnectionsPerPartition" value="10" />
		<property name="minConnectionsPerPartition" value="5" />
		<property name="partitionCount" value="2" />
		<property name="acquireIncrement" value="5" />
		<property name="statementsCacheSize" value="10" />
		<property name="releaseHelperThreads" value="3" />
		</bean>
	-->
	<bean class="org.springframework.orm.jpa.JpaTransactionManager"
		id="transactionManager">
		<property name="entityManagerFactory"
			ref="entityManagerFactory" />
	</bean>
	<tx:annotation-driven mode="aspectj"
		transaction-manager="transactionManager" />
	<bean
		class="org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean"
		id="entityManagerFactory">
		<property name="dataSource" ref="dataSource" />
	</bean>

	
		<bean id="taskExecutor"
		class="org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor"
		destroy-method="destroy">
		<property name="corePoolSize" value="20" />
		<property name="keepAliveSeconds" value="200" />
		<property name="maxPoolSize" value="100" />
		<property name="queueCapacity" value="1000" />
		<property name="waitForTasksToCompleteOnShutdown" value="true" />
		<property name="rejectedExecutionHandler">
		<bean class="java.util.concurrent.ThreadPoolExecutor.CallerRunsPolicy" />
		</property>
		</bean>
		<!-- 
		<bean id="otherExecutor"
		class="org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor"
		destroy-method="destroy">
		<property name="corePoolSize" value="2" />
		<property name="keepAliveSeconds" value="200" />
		<property name="maxPoolSize" value="4" />
		<property name="queueCapacity" value="1000" />
		<property name="waitForTasksToCompleteOnShutdown" value="true" />
		<property name="rejectedExecutionHandler">
		<bean class="java.util.concurrent.ThreadPoolExecutor.CallerRunsPolicy" />
		</property>
		</bean>
	-->
	<context:mbean-export />

</beans>
