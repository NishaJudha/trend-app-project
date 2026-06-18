pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t trend-app-project:${BUILD_NUMBER} .'
            }
        }

        stage('Push Image') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin

                    docker tag trend-app-project:${BUILD_NUMBER} \
                    nishajudha/trend-app-project:${BUILD_NUMBER}

                    docker push \
                    nishajudha/trend-app-project:${BUILD_NUMBER}
                    '''
                }
            }
        }
    }
}
