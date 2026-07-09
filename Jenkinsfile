pipeline {
    agent any 

    environment {
        IMAGE_NAME = "durgaprasaduniq/app-1"
        TAG = "V2"
        DOCKER_USER = "durgaprasaduniq"
        DOCKER_PASS = ""
        AWS_DEFAULT_REGION = "ap-south-1"
        CLUSTER_NAME = "my-cluster-1"
    }

    stages {

        stage("Clone Repo") {
            steps {
                git branch: 'main', url: 'https://github.com/durgaprasaduniq/pet_shop-2.git'
            }
        }

        stage("Build Docker Image") {
            steps {
                sh 'docker build -t durgaprasaduniq/app-1:V2 -f Dockerfile .'
            }
        }

        stage("Docker Login & Push") {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'docker-id',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    docker push $IMAGE_NAME:$TAG
                    '''
                }
            }
        }

        stage("Connect to EKS") {
            steps {                                                                                  
                sh '''                                                                                                                           
                aws eks update-kubeconfig --region $AWS_DEFAULT_REGION --name $CLUSTER_NAME                    
                '''
            }                                                                                            
        }                                 

        stage("Deploy to EKS") {
            steps {
                sh '''
                kubectl apply -f /var/lib/jenkins/my-deployment.yml
                kubectl apply -f /var/lib/jenkins/service.yml
                '''
            }
        }
    }
}
}
