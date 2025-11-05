# Multi-stage Dockerfile for a Spring Boot (Java 21) app
# Build stage
FROM maven:3.10.1-eclipse-temurin-21 AS build
WORKDIR /workspace
COPY pom.xml .
COPY src ./src
# Build the jar (skip tests to speed up)
RUN mvn -B package -DskipTests

# Run stage - use a smaller JRE image
FROM eclipse-temurin:21-jre-jammy
ARG JAR_FILE=/workspace/target/*.jar
COPY --from=build /workspace/target/hellodocker-0.0.1-SNAPSHOT.jar /app/hellodocker.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/hellodocker.jar"]
