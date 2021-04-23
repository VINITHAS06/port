FROM openjdk:11
ARG NAME=target/devOpsApp.war
ARG PORT=8086
ENV NAME=$NAME
COPY $NAME devOpsApp.war 
EXPOSE 8086
ENTRYPOINT ["java", "-jar", "devOpsApp.war", "--server.port=$PORT"]
