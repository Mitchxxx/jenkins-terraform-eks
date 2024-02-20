pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentails('mitchel_AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentails('mitchel_AWS_SECRET_ACCESS_KEY_ID')
        AWS_DEFAULT_REGION = 'eu-west-1'

    }
    stages {
        stage ('Checkout'){
            steps {
                git branch: 'main', url: 'https://github.com/Mitchxxx/jenkins-terraform-eks.git'
            }
        }
        stage ('Terraform Initialise'){
            steps {
                sh 'terraform init'
            }

        }

        stage ('Terraform Plan'){
            steps {
                sh 'terraform plan'
            }

        }
        stage ('terraform Apply/Destroy'){
            steps {
                sh 'terraform ${action} --auto-approve'
            }

        }
        stage ('Deploy to Eks'){
            when {
                expression { param.apply }
            }
            steps {
                sh "aws eks update-kubeconfig --name eks cluster"
                sh "kubectl apply -f deployment.yml"
            }

        }
    }
}