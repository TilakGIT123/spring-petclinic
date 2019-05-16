pipeline {
 agent any
  tools { 
        maven 'Maven'       
       } 
  stages {
    stage('Clone repository') {	
      steps{
        checkout scm
        sh 'echo $MYJOB'
       }
      }
      stage('Docker Build'){
      steps{
      sh 'docker build -t 180865749814.dkr.ecr.us-east-1.amazonaws.com/mypet:latest .'
       }
      }
      stage('Docker Push'){
      steps{
      withDockerRegistry(credentialsId: 'ecr:us-east-1:AWS', url: '180865749814.dkr.ecr.us-east-1.amazonaws.com/mypet') {
      sh 'docker push 180865749814.dkr.ecr.us-east-1.amazonaws.com/mypet:latest'
         }
        }
       }
      }
    }
