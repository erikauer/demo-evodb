pipeline {
    agent any

    stages {
        stage('Build Application') {
            steps {
                echo 'Build Application'
            }
        }
        stage('INT - DB Migration') {
            environment {
                FLYWAY_LOCATIONS = 'filesystem:./sql'
                FLYWAY_URL = 'jdbc:postgresql://89.145.160.122:5432/evodb'
                FLYWAY_USER = 'flyway'
                FLYWAY_PASSWORD = 'flyways-secure-secret'
                FLYWAY_SCHEMAS = 'evolutionary-db-design'
            }
            steps {
                echo 'Run Flyway Migration'
                sh '/opt/flyway-5.1.3/flyway migrate'
            }
        }
        stage('INT - Fitnesse Tests') {
            steps {
                sh '/opt/dbfit/startFitnesse.sh -v -o -r "test/fitnesse" -f /opt/dbfit/plugins.properties -d "$(pwd)" -c "MainSuite?suite&format=text"'
            }
        }
        stage('INT - Deployment') {
            steps {
                echo 'Deploy application'
            }
        }
        stage('INT - Application Tests') {
            steps {
                echo 'Run Application Tests'
            }
        }
    }
}
