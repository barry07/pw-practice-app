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
        //stage('View version') {
          //  steps {
                // docker version
            //    sh 'docker version'
            //}
        //}
        stage('Build and Run test') {
            steps {
                    echo "Build app"
                    // We call the 'docker' binary and pass 'compose' as a command.
                    // This is the most stable way to run V2.
                    //sh '/usr/local/bin/docker compose up -d --build'
                    sh '/usr/local/bin/docker-compose up -d --build'
                }
        }
        post {
            success {
                // This triggers your second Jenkins job automatically
                 build job: 'Bondar-Playwright-Tests', wait: false
            }
        }
    }
}