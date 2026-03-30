stage('Build Docker Image') {
    steps {
        sh '/usr/local/bin/docker build -t $DOCKER_IMAGE .'
    }
}

stage('Push Image') {
    steps {
        withCredentials([usernamePassword(
            credentialsId: 'dockerhub',
            usernameVariable: 'USER',
            passwordVariable: 'PASS'
        )]) {

            sh 'echo $PASS | /usr/local/bin/docker login -u $USER --password-stdin'
            sh '/usr/local/bin/docker push $DOCKER_IMAGE'
        }
    }
}