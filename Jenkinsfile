pipeline {
    agent { 
        label 'Node-1'
    }

    stages {
        stage('Clone sources') {
            steps {
                git branch: 'main', url: "https://github.com/Liner246/web.git"
            }
        }
        stage('Build') {
            steps {
                sh 'sudo docker build -t nginx .'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}