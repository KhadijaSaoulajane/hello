FROM java:8-jdk-alpine

COPY ./target/HelloWorld-0.0.1-SNAPSHOT.jar /usr/app/

EXPOSE 80

WORKDIR /usr/app

RUN sh -c 'touch HelloWorld0.0.1-SNAPSHOT.jar'

ENTRYPOINT ["java","-Dserver.port=8084","-jar","HelloWorld-0.0.1-SNAPSHOT.jar"]
