FROM ubuntu:latest

# install packages
RUN apt-get install openjdk-7-jdk

# application
RUN mkdir /ust/local/ddlocal
RUN cd /ust/local/ddlocal \
    curl -O http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz \
    tar zxvf dynamodb_local_latest.tar.gz

# database
RUN mkdir /usr/local/ddlocal/db

# run
CMD ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar DynamoDBLocal.jar", "-port", "8080", "-dbPath", "/usr/local/ddlocal/db"]
EXPOSE 8080