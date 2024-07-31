FROM openjdk:8-jdk-alpine

WORKDIR /app

COPY . /app

RUN javac /src/main/java/HelloWorld.java

CMD [ "java","/src/main/java/HelloWorld" ]




