FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ADD /target/feign-eureka-hello-server-0.0.1-SNAPSHOT.jar app.jar
RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS=""
RUN MANAGED_IP=$(curl --retry 3 --connect-timeout 2 --max-time 2  -s 169.254.169.254/latest/meta-data/local-ipv4)
RUN echo $MANAGED_IP
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar /app.jar" ]