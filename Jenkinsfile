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
            // We force the shell to use the specific GOOD file you verified in your terminal
            sh '/usr/local/bin/docker version'
            
            // We tell docker-compose EXACTLY where the good docker binary lives
            // This prevents it from 'finding' the 1.43 version in /usr/bin
            script {
                sh "export DOCKER_DEFAULT_PLATFORM=linux/amd64"
                sh "PATH=/usr/local/bin:\$PATH /usr/local/bin/docker-compose up -d --build"
            }
        }
        }
    }
}