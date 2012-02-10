windows 开发环境设置：
1、安装oracle-xe：
	oracle instance name:xe
	port:1521 
	sys/system密码：123456
2、下载开发工具springsource
3、下载 m2.zip 解圧到 C:\Documents and Settings\Administrator\ 快速初始化lottery项目
5、eclipse 设置:
	a、alter+enter(或Properties) Resource Text encoding utf-8
	b、maven :enable.
6、设置环境变量:
	JAVA_HOME
	把%maven_home%/bin加path
7、常用的几个maven 命令:
	a、创建jrtsch用户:  	mvn sql:execute -U  -Plocal-create-db
	b、删除jrtsch:		mvn sql:execute -U  -Plocal-drop-db
	c、初始化数据库:	mvn liquibase:update -Plocal,update-db 
	d、加载junit test data:	mvn com.dbluethink.test:momo-test-plugin:saveFixtures
	e、命令行运行tomcat :	mvn tomcat:run
	f、run test:    mvn clean integration-test -Plocal -U
	g、db recreate: mvn sql:execute -Plocal,local-recreate-db
	h、db update:   mvn liquibase:update -Plocal,update-db

