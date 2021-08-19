FROM openjdk:8u282-jre

# When build images, name with this tag
LABEL tag=config-ui

# Build arguments
ARG BUILD_VERSION=8.1.0-SNAPSHOT

# Create and use local user and group
RUN addgroup direct && adduser direct --ingroup direct

# Set application location
RUN mkdir -p /opt/app
RUN chown direct:direct /opt/app
ENV PROJECT_HOME /opt/app

# Set microservice
ENV SERVICE_PORT=8080
ENV SERVICE_USERNAME=admin
ENV SERVICE_PASSWORD=direct

# Set config-service access
ENV CONFIG_SERVICE_USER=admin
ENV CONFIG_SERVICE_PASSWORD=direct
ENV CONFIG_SERVICE_HOST=config-service
ENV CONFIG_SERVICE_PORT=8082

# Use local user and group
USER direct:direct

# Copy application artifact
COPY application.properties $PROJECT_HOME/application.properties
COPY target/config-ui-$BUILD_VERSION.war $PROJECT_HOME/config-ui.war

# Switching to the application location
WORKDIR $PROJECT_HOME

# Run application
CMD ["java","-jar","./config-ui.war"]
