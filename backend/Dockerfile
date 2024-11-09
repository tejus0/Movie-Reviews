FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:11-jdk-slim
COPY --from=build /target/movie-list-0.0.1-SNAPSHOT.jar MovieReview.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","MovieReview.jar"]