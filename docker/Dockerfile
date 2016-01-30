FROM ubuntu:latest

# Install Java.
RUN \
  apt-get update && \
  apt-get install -y openjdk-7-jdk wget && \
  rm -rf /var/lib/apt/lists/*

# application
RUN mkdir /usr/local/ddlocal
RUN cd /usr/local/ddlocal && \
    wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz && \
    tar zxvf dynamodb_local_latest.tar.gz

# database
RUN mkdir /usr/local/ddlocal/db

# env
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

# run
CMD ["java", "-Djava.library.path=/usr/local/ddlocal/DynamoDBLocal_lib", "-jar", "/usr/local/ddlocal/DynamoDBLocal.jar", "-port", "8080", "-dbPath", "/usr/local/ddlocal/db"]
EXPOSE 8080