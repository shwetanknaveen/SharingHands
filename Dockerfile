FROM maven:3.8.5-eclipse-temurin-8-alpine
WORKDIR /app
COPY ./ ./
CMD ["mvn", "spring-boot:run"]
