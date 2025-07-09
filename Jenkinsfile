pipeline {
    agent any

    environment {
        TF_VAR_env = 'dev'
        TF_BACKEND_CONFIG = 'backend.tfvars'
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building the project...'
                // Example: sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // Example: sh 'mvn test'
            }
        }

        stage('Terraform Init') {
            steps {
                echo 'Initializing Terraform...'
                dir('terraform') {
                    sh 'terraform init -backend-config=${TF_BACKEND_CONFIG}'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                echo 'Planning Terraform changes...'
                dir('terraform') {
                    sh 'terraform plan -var="env=${TF_VAR_env}"'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: 'Approve Terraform Apply?'
                echo 'Applying Terraform changes...'
                dir('terraform') {
                    sh 'terraform apply -auto-approve -var="env=${TF_VAR_env}"'
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                // Example: sh './deploy.sh'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check the logs.'
        }
    }
}
