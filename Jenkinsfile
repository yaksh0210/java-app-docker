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
                // sh 'docker build -t yaksh0212/java-app .'
                script{
                    docker.withRegistry('',Docker_credentials){
                        def customImage = docker.build("yaksh0212/java-app .")
                        customImage.push()
                    }
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Docker_credential')]) {
                    sh ' docker login'
                    sh ' docker push yaksh0212/java-app'
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