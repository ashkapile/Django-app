pipeline {
    agent any

    environment {
        IMAGE_NAME = 'ashkapile/django-app'
        CONTAINER_NAME = 'django-app-container'
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'git-cendentials-id', 
                    url: 'https://github.com/ashkapile/Django-app.git', 
                    branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(IMAGE_NAME)
                }
            }
        }

        stage('Stop Old Container') {
            steps {
                script {
                    sh "docker rm -f ${CONTAINER_NAME} || true"
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh """
                    docker run -d --name ${CONTAINER_NAME} -p 8000:8000 ${IMAGE_NAME}
                    """
                }
            }
        }
    }

    post {
        always {
            echo "Pipeline finished"
        }
    }
}
