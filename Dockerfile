FROM tomcat:8.0
MAINTAINER Abhaya Ghatkar
EXPOSE 8080
RUN rm -fr /usr/local/tomcat/webapps/ROOT
COPY target/java-tomcat-maven-example.war /usr/local/tomcat/webapps/
