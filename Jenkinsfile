pipeline {
    agent any

    stages {
        stage('Build Application') {
            steps {
                echo 'Run Unit Tests'
                echo 'Build Artifact'
                echo 'Publish Artifact in Artifact Repository'
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
        stage('INT - Deployment') {
            steps {
                echo 'Deploy application'
            }
        }
        stage('INT - Tests') {
            steps {
                echo 'Run Application Tests'
            }
        }
        stage('TEST - DB Migration') {
            environment {
                FLYWAY_LOCATIONS = 'filesystem:./sql'
                FLYWAY_URL = 'jdbc:postgresql://185.150.10.237:5432/evodb'
                FLYWAY_USER = 'flyway'
                FLYWAY_PASSWORD = 'flyways-secure-secret'
                FLYWAY_SCHEMAS = 'evolutionary-db-design'
            }
            steps {
                echo 'Run Flyway Migration'
                sh '/opt/flyway-5.1.3/flyway migrate'
            }
        }
        stage('TEST - Deployment') {
            steps {
                echo 'Deploy application'
            }
        }
        stage('Prod Deployment Approval') {
            steps {
                input "Deploy to prod?"
            }
        }
        stage('PROD - DB Migration') {
            environment {
                FLYWAY_LOCATIONS = 'filesystem:./sql'
                FLYWAY_URL = 'jdbc:postgresql://185.150.9.68:5432/evodb'
                FLYWAY_USER = 'flyway'
                FLYWAY_PASSWORD = 'flyways-secure-secret'
                FLYWAY_SCHEMAS = 'evolutionary-db-design'
            }
            steps {
                echo 'Run Flyway Migration'
                sh '/opt/flyway-5.1.3/flyway migrate'
            }
        }
        stage('PROD - Deployment') {
            steps {
                echo 'Deploy application'
            }
        }
    }
}
