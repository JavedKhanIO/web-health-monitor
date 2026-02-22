pipeline {
	agent any

	stages {

		stage('checkout') {
			steps {
				checkout scm
			}
		}
		
		stage('Build Docker Image') {
			steps {
				sh 'docker build -t web-health-monitor ./app'
			}
		}

		stage('Terraform Init') {
			steps {
				sh 'cd terraform && terraform init'
			}
		}

		stage('Terraform Validate') {
			steps {
				sh 'cd terraform && terraform validate'
			}
		}
		stage('Terraform Plan') {
			steps {
				sh 'cd terraform && terraform plan'
			}
		}
	}
}
