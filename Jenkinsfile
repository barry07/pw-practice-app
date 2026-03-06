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
                // We force the PATH to ONLY look in /usr/local/bin first
                // And we point DOCKER_BINARY specifically to your good file
                script {
                    sh '''
                        export PATH=/usr/local/bin:$PATH
                        export DOCKER_BINARY=/usr/local/bin/docker
                        
                        /usr/local/bin/docker-compose up -d --build
                    '''
                }
            }
        }
    }
}