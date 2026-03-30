pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "sudharsan1289/about-me-website"
    }

    stages {

        stage('Clone Code') {
            steps {
                git branch: 'main',
                url: 'https://github.com/sudharsan1289/docker-assignment.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Push Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {

                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                withCredentials([file(
                    credentialsId: 'kuberconfig',
                    variable: 'KUBECONFIG'
                )]) {

                    sh '''
                    export KUBECONFIG=$KUBECONFIG
                    kubectl apply -f deployment.yaml
                    '''
                }
            }
        }
    }
}