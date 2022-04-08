FROM adoptopenjdk/openjdk11:latest
MAINTAINER demousr@gmail.com 

WORKDIR /app
COPY ./target/*.jar /app
EXPOSE 8080
ENTRYPOINT ["java","-jar","spring-petclinic-2.6.0-SNAPSHOT.jar"]