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
            environment {
        // Replace '/path/to/terraform' with the actual path to Terraform on your Jenkins server
                TERRAFORM_HOME = 'C:\data\jenkins_home\workspace'
            }
            steps {
                sh "${TERRAFORM_HOME}/terraform init"
            }
}


        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
