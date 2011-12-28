set MAVEN_OPTS= -Xms128m -Xmx512m
mvn liquibase:update -P70,update-db && mvn clean tomcat:deploy -P70 -Dmaven.test.skip=true && pause