pipeline {
    agent any

    environment {
        IMAGE_NAME = "nishajudha/trend-app-project"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t trend-app-project:$BUILD_NUMBER .'
            }
        }

        stage('Push Image') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub-creds']) {
                    sh 'docker push trend-app-project:$BUILD_NUMBER'
                }
            }
        }
    }
}
