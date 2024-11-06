FROM maven:4.0.0-openjdk-11 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:11.0.24-jdk-slim
COPY --from=build /target/movie-list-0.0.1-SNAPSHOT.jar MovieReview.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","MovieReview.jar"]