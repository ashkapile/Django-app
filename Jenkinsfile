pipeline {
    //agent any
    agent {
        docker {
            image 'docker:24.0.7'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    environment {
        IMAGE_NAME = 'ashkapile/django-app'
        DOCKERHUB_CREDS = 'dockerhub-credentials-id'
        CONTAINER_NAME = 'django-container'
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
                    sh """
                    docker build -t ${IMAGE_NAME} .
                    """
                }
            }
        }

        stage('Push to Dockerhub') {
            steps {
                script {
                    // docker.image('docker:24.0.7').inside('-v /var/run/docker.sock:/var/run/docker.sock') {
                    //     sh """
                    //     docker version
                    //     docker build -t ${IMAGE_NAME} .
                    //     """
                    // }
                    
                    withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDS}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh """
                        echo "DOCKER_PASS" | docker login -u "DOCKER_USER" --password-stdin
                        docker push ${IMAGE_NAME}
                        docker logout
                        """
                    }
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
