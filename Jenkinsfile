pipeline {
    agent any

    environment {
        TERRAFORM_CLOUD_TOKEN = 'lRXqp30PGxgsMQ.atlasv1.p18OQ7RynKAg7LZt190VHUlytcvs9c5JyVuAqAusdrDA1EYPWk0dAzk2XRFOYsa7MpA'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout([$class: 'GitSCM', branches: [[name: 'main']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CheckoutOption', timeout: 10, credentialsId: 'github']], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/cosmi22/jenkinsterraformrepo.git']]])
                }
            }
        }

        stage('Terraform Login') {
            steps {
                sh "terraform login -input=false"
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    withEnv(["TF_CLI_TOKEN=${env.TERRAFORM_CLOUD_TOKEN}"]) {
                        sh "terraform init"
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withEnv(["TF_CLI_TOKEN=${env.TERRAFORM_CLOUD_TOKEN}"]) {
                    sh "terraform apply -auto-approve"
                }
            }
        }
    }
}