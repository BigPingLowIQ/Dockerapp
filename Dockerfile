FROM maven:3.8.5-jdk-11-slim as BUILD
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

FROM openjdk:11-jre-slim
COPY --from=build /usr/src/app/target/dockerapp-1.0.jar /usr/app/dockerapp-1.0.jar
ENTRYPOINT ["java","-jar","/usr/app/dockerapp-1.0.jar"]
#ENTRYPOINT ["java","-cp","/usr/app/dockerapp-1.0.jar","tk.bigpinglowiq.Main"]
#java -cp yourJar.jar your.main.Class