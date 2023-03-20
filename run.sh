#!/usr/bin/env bash

cd "$(dirname "$0")"

export MAVEN_OPTS="--add-opens=java.base/java.util=ALL-UNNAMED --add-opens=java.base/java.lang.reflect=ALL-UNNAMED --add-opens=java.base/java.text=ALL-UNNAMED --add-opens=java.desktop/java.awt.font=ALL-UNNAMED --add-opens=java.base/java.io=ALL-UNNAMED"

mvn clean package

echo "-------------------------------------"
echo "Starting up at http://localhost:9393/"
echo "-------------------------------------"

docker run -v "$(pwd)/target/nanopub-query/":/usr/local/tomcat/webapps/ROOT -p 9393:8080 tomcat:10
