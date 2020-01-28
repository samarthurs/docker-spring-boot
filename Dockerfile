FROM openjdk:8
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} docker-spring-boot.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "/docker-spring-boot.jar"]
