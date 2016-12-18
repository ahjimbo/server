FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ADD /target/feign-eureka-hello-server-0.0.1-SNAPSHOT.jar app.jar
ADD /env.sh env.sh
RUN sh -c 'touch /app.jar'
RUN sh -c 'touch /env.sh'
RUN chmod +x /env.sh
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "source ./env.sh" ]