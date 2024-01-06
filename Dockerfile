FROM maven:3.9.6-eclipse-temurin-21-jammy AS build
ADD . /build
RUN cd /build && mvn package --quiet -DskipTests

FROM eclipse-temurin:21-jre-alpine
COPY --from=build /build/target/*.jar /app.jar
ENTRYPOINT ["java", \
  "-jar", "/app.jar" \
  ]