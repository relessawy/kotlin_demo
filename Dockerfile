FROM registry.access.redhat.com/ubi8/ubi:latest

# Install Java 21
RUN yum install -y java-21-openjdk-devel && yum clean all

# Add S2I scripts
COPY ./s2i/bin/ /usr/local/s2i

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk
