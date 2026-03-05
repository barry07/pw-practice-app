pipeline {
    agent any
    stages {
        stage('Clean Workspace') {
            steps {
                deleteDir() // Ensures no Git metadata issues
            }
        }
        stage('Checkout') {
            steps {
                checkout scm // Pulls your code
            }
        }
        stage('View version') {
            steps {
                // docker version
                sh 'docker version'
            }
        }
        stage('Build App') {
            steps {
                // Just starts the application containers in the background
                sh 'docker-compose up -d --build'
            }
        }
    }
}