pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'dockercred'
        DOCKER_IMAGE_NAME = 'yashparmar04/day15'
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone the Git repository
                git branch: 'develop', url: 'https://github.com/yashparmar04/Ansible_Task.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build(DOCKER_IMAGE_NAME)
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Log in to Docker Hub and push the image
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        docker.image(DOCKER_IMAGE_NAME).push('latest')
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean up
            cleanWs()
        }
    }
}
