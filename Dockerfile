FROM openjdk:8
VOLUME /tmp
COPY build/libs/*.jar docker-spring-boot.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "docker-spring-boot.jar"]
