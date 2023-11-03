FROM eclipse-temurin:11
MAINTAINER yantracore.com
COPY ./build/libs/gateway-service-0.0.1-SNAPSHOT.jar gateway-service.jar
WORKDIR .
EXPOSE 8070

RUN apt install tzdata -y
ENV TZ="Asia/Kathmandu"

ENTRYPOINT [ "sh", "-c", "java -jar ./gateway-service.jar"]
