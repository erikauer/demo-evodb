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
                FLYWAY_URL = 'jdbc:postgresql://185.150.10.24:5432/evodb'
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
                sh './scripts/runFitnesseTests.sh'
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
