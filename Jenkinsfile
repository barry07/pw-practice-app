pipeline {
    agent any
    stages {
        stage('Cleanup') {
            steps {
                // This stops and removes the containers defined in your yaml
                sh "docker-compose down --remove-orphans || true"
            }
        }
        stage('Build Image') {
            steps {
                echo "Building Production Angular Image..."
                // Compose uses the service name 'bondar-practice-app' from your yaml
                sh "docker-compose build bondar-practice-app"
            }
        }
        stage('Run App') {
            steps {
                echo "Starting App in Detached Mode..."
                sh "docker-compose up -d bondar-practice-app"
                echo "App should be live at http://<your-server-ip>:4201"
            }
        }
    }
}
