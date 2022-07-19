FROM openjdk:8-jdk-alpine

#ARG JAR_FILE=target/app.war
#COPY ${JAR_FILE} app.war
RUN mkdir /app
#COPY . /app
ENTRYPOINT ["java","-jar","/app/app.war"]