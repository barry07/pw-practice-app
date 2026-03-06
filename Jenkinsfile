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
                // this will force every command in this stage to look in /usr/local/bin FIRST
                PATH = "/usr/local/bin:${env.PATH}"
            }
            steps {
                // Just starts the application containers in the background.
                sh '/usr/local/bin/docker version'
                //sh '/usr/local/bin/docker-compose up -d --build'
                sh 'docker-compose up -d --build'
            }
        }
    }
}