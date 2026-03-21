pipeline {
    agent any
    stages {
        stage('Cleanup') {
            steps {
                sh "docker stop bondar-app || true"
                sh "docker rm bondar-app || true"
            }
        }
        stage('Build Image') {
            steps {
                // Build the production-ready Nginx image
                sh "docker build -t bondar-app-prod ."
            }
        }
        stage('Run App') {
            steps {
                // Run it on port 4201
                sh "docker run -d --name bondar-app -p 4201:80 bondar-app-prod"
                echo "App is now running at http://your-jenkins-ip:4201"
            }
        }
    }
}