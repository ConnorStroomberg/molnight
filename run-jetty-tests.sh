#!/bin/bash
# Start aplication in the backgroud
echo "Start Jetty Server"
mvn -f ~/Code/molgenis-ui/web-app/ -Dmolgenis.home=./test-home jetty:run > ./jetty-out.log &

# get jetty process id
export JETTY_TEST_PID=$!
echo "Jetty running at "$JETTY_TEST_PID

STARTED='not yet'
while [[$STARTED != "Console reloading is ENABLED. Hit ENTER on the console to restart the context."]]
do
  echo --- sleeping for 5 seconds
  echo --- started is: $STARTED
  sleep 5
  STARTED=`tail -n 1 jetty-out.log | grep ENTER | cut -c14-`
done

# Run test suite
echo "---------------Start tests----------------"
nightwatch
echo "---------------Tests completed----------------"

echo "Kill Jetty at "$JETTY_TEST_PID
kill -9 $JETTY_TEST_PID
