# Gradle build container
FROM gradle:6.1 AS gradle_build
COPY build.gradle /tmp/
COPY src /tmp/src/
WORKDIR /tmp/

RUN gradle bootJar -i --stacktrace


FROM openjdk:8
EXPOSE 8085
USER root
WORKDIR /tmp/

#copy application to docker image from builder image
COPY --from=gradle_build /tmp/build/libs/docker-spring-boot.jar ./docker-spring-boot.jar

ENTRYPOINT ["java", "-jar", "/docker-spring-boot.jar"]
