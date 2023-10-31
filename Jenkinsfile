pipeline {
    agent any

    environment {
        // Replace '/path/to/terraform' with the actual path to Terraform on your Jenkins server
        TERRAFORM_HOME = 'C:/data/jenkins_home/workspace'
        // Replace 'your-terraform-cloud-token' with your Terraform Cloud token
        TERRAFORM_CLOUD_TOKEN = 'lRXqp30PGxgsMQ.atlasv1.p18OQ7RynKAg7LZt190VHUlytcvs9c5JyVuAqAusdrDA1EYPWk0dAzk2XRFOYsa7MpA'
    }

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
                script {
                    // Use the specified Terraform home directory
                    def tfHome = env.TERRAFORM_HOME

                    // Provide the Terraform Cloud token for authentication
                    sh "terraform login -token=${env.TERRAFORM_CLOUD_TOKEN}"
                    sh "${tfHome}/terraform init"
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Use the specified Terraform home directory
                    def tfHome = env.TERRAFORM_HOME

                    // Execute your Terraform apply command here
                    sh "${tfHome}/terraform apply -auto-approve"
                }
            }
        }
    }
}
