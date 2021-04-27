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

------------------------------------------------------------------
pipeline{
    agent {
        docker{ image 'centos:7'
                args '-u root'
                label 'docker2'
        }
    }

    stages{
        stage('dependencies'){
            steps{
                sh 'yum -y install python3 python3-pip zlib-devel gcc git'
            }
    }
        stage('copyart'){
            steps{
                copyArtifacts(projectName: 'pipeline1', flatten: true)
            }
        }
        stage('fetch'){
            steps{
                sh 'git clone https://github.com/linuxacademy/content-pipelines-cje-labs.git'
            }
        }
        stage('install'){
            steps{
                sh 'pip3 install -r content-pipelines-cje-labs/lab3_lab4/image_watermarker/requirements.txt'
            }
        }
        stage('exec'){
            steps{
                sh 'python3 content-pipelines-cje-labs/lab3_lab4/image_watermarker/watermark.py'
            }
        }
    }
    post{
        success{
            archiveArtifacts artifacts: '*watermarked.jpg'
        }
        cleanup{
            sh 'rm -rf content-pipelines-cje-labs *.jpg'
        }
    }
}
--------------------------------------------------------------
