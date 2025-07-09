pipeline {
    agent any

    parameters {
        string(name: 'GIT_CREDS_ID', defaultValue: 'devchaudcg', description: 'Jenkins Credential ID used for Git access')
        string(name: 'AWS_IAM_ROLE', defaultValue: 'JenkinsWorkloadAccountAccessRole', description: 'IAM role to assume in the AWS account for deployment')
        string(name: 'ENVIRONMENT', defaultValue: 'dev', description: 'Deployment environment')
        string(name: 'REGION', defaultValue: 'us-east-1', description: 'AWS Region')
        string(name: 'TF_ACTION', defaultValue: 'apply', description: 'Terraform action: plan/apply/destroy')
        string(name: 'GIT_REPO_URL', defaultValue: 'https://github.com/your/repo.git', description: 'Git repository URL')
        string(name: 'BRANCH', defaultValue: 'main', description: 'Git branch to checkout')
    }

    environment {
        DEPLOY_ENV     = "${params.ENVIRONMENT}"
        REGION         = "${params.REGION}"
        AWS_ACCOUNT_ID = "730335494494"
        AWS_IAM_ROLE   = "${params.AWS_IAM_ROLE}"
        TF_ACTION      = "${params.TF_ACTION}"
        GIT_REPO_URL   = "${params.GIT_REPO_URL}"
        BRANCH         = "${params.BRANCH}"
        GIT_CREDS_ID   = "${params.GIT_CREDS_ID}"
    }

    stages {
        stage('Print Config Details') {
            steps {
                script {
                    echo """
                    DEPLOY_ENV     : ${env.DEPLOY_ENV}
                    REGION         : ${env.REGION}
                    AWS_ACCOUNT_ID : ${env.AWS_ACCOUNT_ID}
                    AWS_IAM_ROLE   : ${env.AWS_IAM_ROLE}
                    TF_ACTION      : ${env.TF_ACTION}
                    GIT_REPO_URL   : ${env.GIT_REPO_URL}
                    BRANCH         : ${env.BRANCH}
                    GIT_CREDS_ID   : ${env.GIT_CREDS_ID}
                    """
                }
            }
        }

        stage('Code Checkout') {
            steps {
                script {
                    git branch: env.BRANCH,
                        credentialsId: env.GIT_CREDS_ID,
                        url: env.GIT_REPO_URL
                }
            }
        }

        stage('Initialize Terraform') {
            steps {
                dir('terraform') {
                    script {
                        withAWS(roleAccount: env.AWS_ACCOUNT_ID, role: env.AWS_IAM_ROLE, region: env.REGION) {
                            sh 'terraform init'
                            sh "terraform ${env.TF_ACTION} -auto-approve"
                        }
                    }
                }
            }
        }
    }
}
