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
            environment {
                // 1. Force the API version to match your Windows Docker (image ff62065e)
                DOCKER_API_VERSION = '1.45'
                COMPOSE_API_VERSION = '1.45'
                // 2. Force Jenkins to look in the 'good' folder FIRST (image 25d8cb16)
                PATH = "/usr/local/bin:${env.PATH}"
            }
            steps {
                // 3. Run the build using the verified paths
                sh 'docker version'
                sh 'docker-compose up -d --build'
            }
        }
    }
}