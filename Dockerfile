# Gradle build container
FROM gradle:6.1 AS gradle_build
COPY build.gradle /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN gradle clean build
RUN gradle bootJar


FROM openjdk:8
USER root
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} docker-spring-boot.jar
EXPOSE 8085

#copy application to docker image from builder image
COPY --from=gradle_build /tmp/build/libs/docker-spring-boot.jar ./docker-spring-boot.jar

ENTRYPOINT ["java", "-jar", "/docker-spring-boot.jar"]
