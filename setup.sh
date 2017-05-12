# Create test db
psql -U postgres -c "CREATE DATABASE molgenis_test ENCODING 'utf-8' OWNER molgenis"

# Create a dump of image of db in the state we want to start with
pg_dump --dbname molgenis -U molgenis -f nightwatch_test.sql

# Load the start state into de test databse
psql -q --dbname molgenis_test -U molgenis < nightwatch_test.sql

#Create a 'home' dir for the test
mkdir test-home

echo "
user.password=admin
admin.password=admin
db_uri=jdbc\:postgresql\://localhost/molgenis_test?reWriteBatchedInserts\=true&autosave\=CONSERVATIVE
molgenis.version=31
db_password=molgenis
db_user=molgenis
" > molgenis.properties

# Start aplication in the backgroud
_foo = mvn -f ~/Code/molgenis-ui/web-app/ -Dmolgenis.home=./test-home jetty:run &

# get jetty process id
export JETTY_TEST_PID=$!

# Run test suite
nightwatch

kill -9 $JETTY_TEST_PID
