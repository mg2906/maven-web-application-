FROM tomcat:jre8-alpine
COPY --from=0 ./target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
