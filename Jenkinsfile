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
                FLYWAY_CONFIG_FILES = filesystem:./sql
                FLYWAY_URL = jdbc:postgresql://185.150.9.170:5432/testdb
                FLYWAY_USER = flyway
                FLYWAY_PASSWORD = flyways-secure-secret
                FLYWAY_SCHEMAS = evolutionary-db-design
            }
            steps {
                echo 'Run Flyway Migration'
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
            steps {
                echo 'Run Flyway Migration'
            }
        }
        stage('TEST - Deployment') {
            steps {
                echo 'Deploy application'
            }
        }
        stage('PROD - DB Migration') {
            steps {
                echo 'Run Flyway Migration'
            }
        }
        stage('PROD - Deployment') {
            steps {
                echo 'Deploy application'
            }
        }
    }
}
