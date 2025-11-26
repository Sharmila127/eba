pipeline {
    agent any

    environment {
        IMAGE_NAME = "eba-app"
        CONTAINER_NAME = "eba-container"
        PORT = "3000"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Sharmila127/eba.git'
            }
        }

        stage('Docker Build') {
            steps {
                // Build Docker image
                sh """
                    docker build -t ${IMAGE_NAME}:latest .
                """
            }
        }

        stage('Docker Run') {
            steps {
                // Stop and remove existing container if it exists
                sh """
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                    docker run -d -p ${PORT}:${PORT} --name ${CONTAINER_NAME} ${IMAGE_NAME}:latest
                """
            }
        }
    }

    post {
        success { echo "✅ App Running on PORT ${PORT}" }
        failure { echo "❌ Deployment Failed" }
    }
}
