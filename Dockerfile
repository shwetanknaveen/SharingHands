FROM openjdk:11
WORKDIR /app
COPY ./target/SharingHand-0.0.1-SNAPSHOT.jar ./
CMD ["java", "-jar", "SharingHand-0.0.1-SNAPSHOT.jar"]
