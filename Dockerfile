FROM java:8-jre

COPY target/hello-world-1.4.jar /opt

EXPOSE 9000

CMD ["java", "-jar", "hello-world-1.4.jar"]
