pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-creds' // Jenkins credential ID
        DOCKER_IMAGE = 'lenoshka/ci-cd-app'       // Your DockerHub repo
    }

    triggers {
        githubPush() // Trigger pipeline on GitHub push
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub...'
                git branch: 'master', url: 'https://github.com/Anushk1a/ci-cd-app.git', credentialsId: 'github-creds'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                script {
                    docker.build("${DOCKER_IMAGE}:latest")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker image to DockerHub...'
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKERHUB_CREDENTIALS}") {
                        docker.image("${DOCKER_IMAGE}:latest").push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application...'
                // Optional: Add your deploy commands here
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully! ✅'
        }
        failure {
            echo 'Pipeline failed. ❌ Check logs!'
        }
    }
}
