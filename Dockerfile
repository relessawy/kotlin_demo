# Use Red Hat UBI as the base image
FROM registry.access.redhat.com/ubi8/ubi:latest

# Install Java 21 and Maven
RUN yum install -y java-21-openjdk-devel maven && yum clean all

# Create Maven repository directory and set proper permissions
RUN mkdir -p /.m2/repository && chmod -R 777 /.m2

# Create the deployments directory with the necessary permissions
RUN mkdir -p /deployments && chmod -R 777 /deployments

# Add S2I scripts
COPY ./s2i/bin/ /usr/libexec/s2i
COPY target/demo-1.0-SNAPSHOT.jar /deployments/demo-1.0-SNAPSHOT.jar

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk \
    MAVEN_OPTS="-Dmaven.repo.local=/.m2/repository" \ 
    JAVA_APP_JAR=/deployments/demo-1.0-SNAPSHOT.jar

