pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                script {
            // Use the PAT credential for authentication directly
                    checkout([$class: 'GitSCM', branches: [[name: 'main']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CheckoutOption', timeout: 10, credentialsId: 'github']], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/cosmi22/jenkinsterraformrepo.git']]])
                }
            }
        }


        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
