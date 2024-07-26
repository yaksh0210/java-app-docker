pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git url:'https://github.com/yaksh0210/java-app-docker.git', branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t yaksh0212/java-app .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: '9312c423-da11-4cd1-857a-9c5446d91de6')]) {
                    sh 'docker login'
                    sh 'docker push yaksh0212/java-app'
                }
            }
        }
        stage('Deploy Container') {
            steps {
                sh 'docker run -d -p 8089:8080 yaksh0212/java-app'
            }
        }
    }
}