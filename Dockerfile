FROM frolvlad/alpine-oraclejdk8:slim
RUN apk add --update curl && \
    rm -rf /var/cache/apk/*
#VOLUME /tmp
ADD /target/feign-eureka-hello-server-0.0.1-SNAPSHOT.jar app.jar
ADD /env.sh env.sh
RUN sh -c 'touch /app.jar'
RUN sh -c 'touch /env.sh'
RUN chmod +x /env.sh
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-sc", "source ./env.sh" ]