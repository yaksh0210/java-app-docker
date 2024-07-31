pipeline {
    agent any
    environment {
        registry = 'docker.io'  
        registryCredential = 'Docker_credentials' 
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/yaksh0210/java-app-docker.git', branch: 'main'
            }
        }
        stage('build image') {
            steps{
                script{
                    docker.withRegistry('', registryCredential){
                        def customImage = docker.build("yaksh0212/java-app:${env.BUILD_ID}")
                        customImage.push()

                    }
                }
            }
        }
        stage('Deploy Container') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        def runContainer = docker.image("yaksh0212/java-app:${env.BUILD_ID}").run('--name ${env.BUILD_ID} -d')
                        echo "Container ID: ${runContainer.id}"
                    }
                }
            }
        }
        stage('Output') {
            steps{
                script{
                    sh 'java HelloWorld.java'
                }
            }
        }
    }

}
 