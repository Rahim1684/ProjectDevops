#####stage BUILD######

FROM maven:3.8.6-openjdk-11-slim as builder 

WORKDIR /app

COPY  .     . 

RUN  mvn clean install package 

########Stage RUN#######

FROM tomcat:8-jre8

COPY --from=builder  /app/target/myapp-g14.war /usr/local/tomcat/webapps 