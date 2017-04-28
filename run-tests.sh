echo "-- BEGIN TEST RUN ---"
echo "STOP RUNNING MOLGENIS"
/Users/connorstroomberg/Code/apache-tomcat-8.5.11/bin/catalina.sh stop
echo "MOLGENIS STOPPED"

echo "BACKUP THE CURRENT DATABASE STATE"
_now=$(date +"%m_%d_%Y")
_file="backup_$_now.sql"
pg_dump --dbname molgenis -U molgenis -f $_file
echo "BACKUP COMPPLETE"

echo "DROP THE EXISTING DATABASE"
psql -U postgres -c "DROP DATABASE IF EXISTS molgenis"
echo "DATABASE DROPED"

echo "PLACE DATABASE IN INITIAL TEST STATE"
psql -U postgres -c "CREATE DATABASE molgenis ENCODING 'utf-8' OWNER molgenis"
psql --dbname molgenis -U molgenis < nightwatch-backup.sql
echo "DATABASE IS READY"

echo "START MOLGENIS APPLICATION"
mv /Users/connorstroomberg/Code/apache-tomcat-8.5.11/webapps/ /Users/connorstroomberg/Code/apache-tomcat-8.5.11/webapps-backup
mkdir /Users/connorstroomberg/Code/apache-tomcat-8.5.11/webapps
cp /Users/connorstroomberg/Code/molgenis/molgenis-app/target/molgenis-app-4.1.0-SNAPSHOT.war /Users/connorstroomberg/Code/apache-tomcat-8.5.11/webapps/ROOT.war
/Users/connorstroomberg/Code/apache-tomcat-8.5.11/bin/catalina.sh start
until [ "`curl --silent --show-error --connect-timeout 1 -I http://localhost:8080 | grep 'Coyote'`" != "" ];
do
  echo --- sleeping for 10 seconds
  sleep 10
done

echo Tomcat is ready!
echo "MOLGENIS APPLICATION STARTED"

echo "RUN TEST SUITE"
nightwatch
echo "DONE RUNINNG TESTS"
