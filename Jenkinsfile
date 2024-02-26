parameters {
        choice(
        choices: ['apply', 'destroy'],
        description: 'Please enter your option or action',
        name: 'action'
        )
    }
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('mitchel_AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('mitchel_AWS_SECRET_ACCESS_KEY_ID')
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
                script {
                    if (params.action == 'apply'){
                        sh "terraform apply --auto-approve"
                    } else if (params.action == 'destroy') {
                        sh "terraform destroy --auto-approve"
                    }else {
                        error('Invalid Terrform action selected')
                    }
                }
            }

        }
        stage ('Deploy to Eks'){
            steps {
                script {
                    if(params.action == 'apply'){
                        sh "aws eks update-kubeconfig --name ibt-eks-cluster"
                        sh "kubectl apply -f deployment.yml"
                }
                }
            }
        }
    }
}