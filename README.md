# config-ui

Configuration UI Web App based on  Direct Java RI8

## Build Component
This project is using maven pom.xml file for the build lifecyle.

`mvn clean install`

## Running Component
To run thins project locally with default configuration:

`java -jar config-ui-<version>.war`

For a custom configuration please use externalized `application.properties` along with the JAR file.

## Microservice health check

`config-ui` has available front end application at `http://<host>:<port>/`


## Microservice containerization

Microservice application should be built and ready to deploy using `mvn clean isntall` command or full package built form `direct-ri-build-microsrvcs` project.

To create docker image or `config-ui` run command below:

`docker build -t config-ui:latest .`

When running created image containerized microservice will start on default port `8080` with default `admin` user and `direct` password.

## Dependencies

Running `config-service` microservice with specified connection port to it in the `Dockerfile`