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

        // stage('View version') {
        //     steps {
        //         sh 'docker version'
        //     }
        // }

        stage('Build and Run test') {
            steps {
                echo "Build app"
                // sh '/usr/local/bin/docker compose up -d --build'
                sh '/usr/local/bin/docker-compose up -d --build'
            }
        }
    }

    post {
        success {
            // This triggers your second Jenkins job automatically
            build job: 'Bondar-Playwright-Tests', wait: false
        }
    }
}