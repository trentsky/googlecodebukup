set MAVEN_OPTS= -Xms128m -Xmx512m
mvn liquibase:update -Plocal,update-db && mvn clean package -Plocal -Dmaven.test.skip=true && pause