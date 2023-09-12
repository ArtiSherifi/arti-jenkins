def BUILD_TYPE
pipeline {
    agent any
    tools {
       terraform 'Terraform'
    }
    stages {
	stage('build type'){
	steps{
		script{
			if(env.BRANCH_NAME == 'main'){
		 		 BUILD_TYPE = 'release'	
			} else{
		 		BUILD_TYPE = 'integrate'
			}
		}
	    }
	}
        stage('terraform format check') {
            steps{
                sh 'terraform fmt'
            }
        }
        stage('terraform Init') {
            steps{
                sh 'terraform init'
            }
        }
	stage('terraform Plan') {
            steps{
		withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: "aws_cred",
                    accessKeyVariable: 'AKIAUUTQHAXHUIYEM2X7',
                    secretKeyVariable: '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'
                ]]) {
		sh 'terraform plan'
		}
            }
        }
        stage('terraform apply') {
            steps{
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: "aws_cred",
                    accessKeyVariable: 'AKIAUUTQHAXHUIYEM2X7',
                    secretKeyVariable: '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'
                ]]) {
                    script {
                    if(BUILD_TYPE == 'release'){
                        sh 'terraform apply --auto-approve'
                    } else {
			echo "Different build"
			}
                    }
                }
            }
        }
    }
	post {
       		 always {
        		sh 'echo finished'
		}
    }
}