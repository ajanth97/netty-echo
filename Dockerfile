FROM openjdk:8
COPY netty-http-echo-service.jar .
EXPOSE 8688
#ENTRYPOINT ["java", "-jar", "app.jar"]
