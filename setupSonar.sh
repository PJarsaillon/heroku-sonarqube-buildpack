#!/bin/sh

echo "-----> Set sonar.properties"
echo "       sonar.web.port is set to ${PORT}"
sed -i -e "s/@PORT@/${PORT}/g" ./conf/sonar.properties

echo "       sonar.jdbc.username is set to ${JDBC_DATABASE_USERNAME}"
sed -i -e "s/@DB_USERNAME@/${JDBC_DATABASE_USERNAME}/g" ./conf/sonar.properties

echo "       sonar.jdbc.password is set to ${JDBC_DATABASE_PASSWORD}"
sed -i -e "s/@DB_PASSWORD@/${JDBC_DATABASE_PASSWORD}/g" ./conf/sonar.properties

echo "       sonar.jdbc.url is set to ${JDBC_DATABASE_URL}"
databaseUrlEscaped=$(echo ${JDBC_DATABASE_URL} | sed -e 's/[\/&]/\\&/g')
sed -i -e "s/@DB_URL@/${databaseUrlEscaped}/g" ./conf/sonar.properties

echo "------------------------------------------------------" > ./logs/sonar.log

echo "-----> Start sonar.sh restart"
./bin/linux-x86-64/sonar.sh restart

echo "-----> Start loging"
tail -f ./logs/sonar.log
