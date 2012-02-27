<bean id="sqlMapClient"
	class="org.springframework.orm.ibatis.SqlMapClientFactoryBean">
	<property name="dataSource">
		<ref local="dataSource" />
	</property>
	<property name="configLocation">
		<value>SqlMapConfig_spring.xml</value>
	</property>
</bean>
	
<bean id="jdbcOperations" class="org.springframework.jdbc.core.JdbcTemplate">
    <property name="dataSource" ref="dataSource" />
</bean>