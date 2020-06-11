# first step
FROM java:8

# mapping the local path
VOLUME /tmp

# construct the virtualenv
ADD /target/eureka1-0.0.1-SNAPSHOT.jar app.jar

# open port 8761
EXPOSE 8761

# run jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]