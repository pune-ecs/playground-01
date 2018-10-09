FROM java:8-jre

COPY target/hello-world-*.jar /opt

EXPOSE 9000

CMD ["java", "-jar", "/opt/hello-world-*.jar"]
