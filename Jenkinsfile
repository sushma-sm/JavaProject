pipeline {
    agent any  // Runs on any available agent (can specify 'slave' if needed)

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/sushma-sm/JavaProject.git'
            }
        }

        stage('Build') {
            steps {
                echo "Building the project..."
                sh 'echo Build successful' // Replace with actual build command
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                sh 'echo Tests passed' // Replace with actual test command
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying the application..."
                sh 'echo Deployment complete' // Replace with actual deployment steps
            }
        }
    }
}
