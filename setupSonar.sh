#!/bin/sh

echo "-----> Set sonar.properties"
echo "       sonar.web.port is set to ${PORT}"
sed -i -e "s/@PORT@/${PORT}/g" ./conf/sonar.properties

echo "       sonar.jdbc.username is set to ${JDBC_DATABASE_USERNAME}"
sed -i -e "s/@DB_USERNAME@/${JDBC_DATABASE_USERNAME}/g" ./conf/sonar.properties

echo "       sonar.jdbc.password is set to ${JDBC_DATABASE_PASSWORD}"
sed -i -e "s/@DB_PASSWORD@/${JDBC_DATABASE_PASSWORD}/g" ./conf/sonar.properties

echo "       sonar.jdbc.url is set to ${JDBC_DATABASE_URL}"
sed -i -e "s/@BD_URL@/${JDBC_DATABASE_URL}/g" ./conf/sonar.properties

JDBC_DATABASE_URL
echo "-----> Start sonar.sh start"
./bin/linux-x86-64/sonar.sh start
