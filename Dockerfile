FROM registry.access.redhat.com/ubi8/ubi:latest

# Install Java 21
RUN yum install -y java-21-openjdk-devel maven && yum clean all

# Create Maven repository directory and set proper permissions
RUN mkdir -p /.m2/repository && chmod -R 777 /.m2

# Add S2I scripts
COPY ./s2i/bin/ /usr/libexec/s2i

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk
