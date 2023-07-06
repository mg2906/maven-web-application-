FROM tomcat:jre8-alpine
COPY /home/ubuntu/docker/workspace/docker_maven/target/maven-web-application.war /usr/local/tomcat/webapps/maven-web-application.war
