pipeline {
    agent { 
        label 'Node-1'
    }

    stages {
        stage('Clone sources') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'sudo docker build -t nginx .'
            }
        }
        stage('Deploy') {
            steps {
                sh 'sudo docker stop web || true && sudo docker rm web || true'
				sh 'sudo docker run -it --rm -d -p 80:80 --name web nginx'
            }
        }
    }
	post{
        always{
            echo "Job execution complete."
        }
        success{
            echo "All is good."
		}
        unsuccessful{
            echo "Job execution status is failed, please check error logs"
		
        }
	}
}

