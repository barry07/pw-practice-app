pipeline {
    agent any
    stages {
        stage('Cleanup') {
            steps {
                // This deletes the old, broken workspace before starting fresh
                deleteDir() 
            }
        }
        stage('Checkout') {
            steps {
                // This pulls the code using your 'github-key' credentials
                checkout scm 
            }
        }
        stage('Verify Tools') {
            steps {
                // Confirming our 'docker-compose' shortcut is working
                sh 'docker-compose --version' 
            }
        }
        stage('Run Tests') {
            steps {
                // Running the Bondar Academy app and tests
                sh 'docker-compose up --build --exit-code-from playwright-tests'
            }
        }
    }
}