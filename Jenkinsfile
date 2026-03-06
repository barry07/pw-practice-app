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
                // Force the API version to match your Windows Daemon (image ff62065e)
                DOCKER_API_VERSION = '1.45'
                COMPOSE_API_VERSION = '1.45'
                // Force priority for our known-good directory (image fdf215a5)
                PATH = "/usr/local/bin:${env.PATH}"
            }
            steps {
                // Use the full path to avoid any ambiguity or flag errors
                sh '/usr/local/bin/docker-compose up -d --build'
            }
        }
    }
}