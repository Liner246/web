pipeline {
    agent { 
        label 'Node-1'
    }

    stages {
        stage('Clone sources') {
            steps {
                git url: 'https://github.com/Liner246/web.git'
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t nginx .'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}