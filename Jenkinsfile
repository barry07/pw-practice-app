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
        stage('Force Build 80') {
    steps {
            echo "Forcing build #80 with new syntax"
            // We call the 'docker' binary and pass 'compose' as a command.
            // This is the most stable way to run V2.
            //sh '/usr/local/bin/docker compose up -d --build'
            sh 'which docker && /usr/local/bin/docker compose up -d --build'
        }
    }
    }
}