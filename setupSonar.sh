#!/bin/sh

echo "-----> Set sonar.properties"
echo "       sonar.web.port is set to ${PORT}"
sed -i -e "s/@PORT@/${PORT}/g" ./conf/sonar.properties

echo "-----> Start sonar.sh start"
./bin/linux-x86-64/sonar.sh start
