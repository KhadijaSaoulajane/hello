FROM java:8-jdk-alpine

COPY ./target/HelloWorld-0.0.1-SNAPSHOT.jar /usr/app/

WORKDIR /usr/app

RUN sh -c 'touch HelloWorld0.0.1-SNAPSHOT.jar'

ENTRYPOINT ["java","-jar","HelloWorld-0.0.1-SNAPSHOT.jar"]