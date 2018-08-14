echo "If this script fails, try to execute it in the project root directory"
sh /opt/dbfit/startFitnesse.sh -v -o -r "test/fitnesse" -f /opt/dbfit/plugins.properties -d "$(pwd)" -c "MainSuite?suite&format=text"
