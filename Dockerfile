FROM tomcat:8.0
MAINTAINER Abhaya Ghatkar
EXPOSE 9000
RUN rm -fr /usr/local/tomcat/webapps/ROOT
COPY target/hello-world.war /usr/local/tomcat/webapps/
COPY target/dependency/webapp-runner.jar /usr/local/tomcat/webapps/
#CMD java -jar /usr/local/tomcat/webapps/webapp-runner.jar --port 9000 /usr/local/tomcat/webapps/*.war

