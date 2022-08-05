pipeline {
    agent { label 'ec2' }
        environment {
        env = 'dev'
        rds_port = 3306
        RDS_ENDPOINT = 'terraform-20220805035555021600000001.cproge0bfla1.eu-west-1.rds.amazonaws.com'
        RDS_USERNAME = 'ezzat'
        RDS_PASSWORD = '8jc030LpTkS9EW15'
        REDIS_ENDPOINT = 'tf-rep-group-1.5s9tdy.ng.0001.euw1.cache.amazonaws.com'
        }
    stages {
            stage('ci') {
            steps {
                sh "docker build . -t ezzatabonazel7/node-js"
                }
            }  
            stage('login') {
            steps {
                 withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]){
                    sh "docker login -u ${USERNAME} -p ${PASSWORD}"
                        }
                }
            }  
            stage('push') {
            steps {
                sh "docker push ezzatabonazel7/node-js"
                }  
            }
            stage('cd') {
            steps {
                sh "docker run -d -p 3000:3000 --env RDS_HOSTNAME=${RDS_ENDPOINT} --env RDS_USERNAME=${RDS_USERNAME} --env RDS_PASSWORD=${RDS_PASSWORD} --env RDS_PORT=${rds_port} --env REDIS_HOSTNAME=${REDIS_ENDPOINT}  ezzatabonazel7/node-js"
                
            }
            
        }
    }
}  
 