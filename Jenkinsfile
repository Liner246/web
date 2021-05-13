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
				sh 'sudo docker run -it --rm -d -p 443:443 --name web nginx'
            }
        }
		stage('Test Nginx configuration') {
            agent {
                docker { image 'nginx' }
            }
            steps {
                sh 'nginx -t 2>> nginx_test.txt'
				
            }
        }
    }
	post{
        always{
            echo "Job execution complete."
        }
        success{
            echo "All is good."
			archiveArtifacts artifacts: '*index.html'
		}
        unsuccessful{
            echo "Job execution status is failed, please check error logs"
		
        }
	}
}

