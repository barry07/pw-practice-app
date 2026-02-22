pipeline {
    agent any

    stages {
        stage('Clean Environment') {
            steps {
                // Ensure no old containers are running from a previous crash
                sh 'docker-compose down --remove-orphans'
            }
        }

        stage('Build and Start App') {
            steps {
                // Build the app container and start it in the background (-d)
                sh 'docker-compose up --build -d practice-app'
            }
        }

        stage('Run Playwright Tests') {
            steps {
                // Run the tests and ensure Jenkins gets the exit code
                sh 'docker-compose up --exit-code-from playwright-tests'
            }
        }
    }

    post {
        always {
            // Clean up containers after tests finish (pass or fail)
            sh 'docker-compose down'
        }
    }
}