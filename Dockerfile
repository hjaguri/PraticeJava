
# Stage 1: Build the Java application
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
COPY Main.java

RUN mvn clean package -DskipTests

# Stage 2: Run the executable JAR
FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=build /app/target/java-hello-1.0-SNAPSHOT.jar app.jar

CMD ["java", "-jar", "app.jar"]
