# Use OpenJDK 17 image as the base
FROM registry.access.redhat.com/ubi8/openjdk-17

# Install Java 21
RUN yum install -y java-21-openjdk-devel && yum clean all

# Set JAVA_HOME to point to Java 21 (if required)
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk
