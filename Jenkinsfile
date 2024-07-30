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
                sh 'sudo -S {env.einfo} docker build -t yaksh0212/java-app .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Docker_credential')]) {
                    sh 'sudo -S {env.einfo} docker login'
                    sh 'sudo -S {env.einfo} docker push yaksh0212/java-app'
                }
            }
        }
        stage('Deploy Container') {
            steps {
                sh 'sudo -S {env.einfo} docker run -d -p 8089:8080 yaksh0212/java-app'
            }
        }
    }
}