pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/your-username/java-app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t your-dockerhub-username/java-app .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh 'docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}'
                    sh 'docker push your-dockerhub-username/java-app'
                }
            }
        }
        stage('Deploy Container') {
            steps {
                sh 'docker run -d -p 8080:8080 your-dockerhub-username/java-app'
            }
        }
    }
}