# HelloDocker - Spring Boot (Java 21) + Docker

This is a minimal Spring Boot application that exposes one endpoint `/` returning `Hello Docker!`.
The project is configured for **Java 21** and **Spring Boot 3.2.2**.

## Build locally (Maven + Java 21 installed)
1. Build the jar:
   ```
   mvn -B package
   ```
2. Run the app:
   ```
   java -jar target/hellodocker-0.0.1-SNAPSHOT.jar
   ```
3. Open http://localhost:8080/ — you should see `Hello Docker!`

## Build Docker image
```
docker build -t <your-dockerhub-username>/hellodocker:java21 .
```

## Run Docker container (map port 8080)
```
docker run -d -p 8080:8080 --name hellodocker_java21 <your-dockerhub-username>/hellodocker:java21
```

## Verify
- `docker images` should show the image.
- `docker ps` should show the running container.
- Visit http://localhost:8080/ to see `Hello Docker!`

## Push to Docker Hub
1. Tag (if needed) and push:
   ```
   docker push <your-dockerhub-username>/hellodocker:java21
   ```
2. Submit the Docker Hub image link and a screenshot showing `docker images` and `docker ps`.
