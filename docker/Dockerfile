FROM openjdk:8-jre-alpine
VOLUME /tmp

# Download dockerize and cache that layer
ARG DOCKERIZE_VERSION

#RUN git config --global http.sslVerify false

RUN echo '************* DOCKERIZE_VERSION *************'
RUN echo ${DOCKERIZE_VERSION}
RUN echo '************* DOCKERIZE_VERSION *************'

# Below step was causing issues so have manually downloaded and copied in this container
#RUN wget --no-check-certificate -O dockerize.tar.gz https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-alpine-linux-amd64-${DOCKERIZE_VERSION}.tar.gz 

COPY dockerize.tar.gz .

RUN tar xzf dockerize.tar.gz
RUN chmod +x dockerize

# This is the first layer that won't be cached
ARG ARTIFACT_NAME
ADD ${ARTIFACT_NAME}.jar /app.jar

ARG EXPOSED_PORT
EXPOSE ${EXPOSED_PORT}

ENV SPRING_PROFILES_ACTIVE docker

ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
