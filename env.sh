export MANAGED_IP=$(curl --retry 3 --connect-timeout 2 --max-time 2  -s 169.254.169.254/latest/meta-data/local-ipv4)
java $JAVA_OPTS -jar /app.jar