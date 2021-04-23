FROM openjdk:11
ARG NAME=target/devOpsApp.war
ENV NAME=$NAME
COPY $NAME devOpsApp.war 
EXPOSE 8086
ENTRYPOINT ["java", "-jar", "devOpsApp.war", "--server.port=9090"]
