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
      sh 'usr/bin/docker build -t 180865749814.dkr.ecr.us-east-1.amazonaws.com/mypet:latest .'
      }
      }
      stage('Docker Push'){
      steps{
      withDockerRegistry(credentialsId: 'ecr:us-east-1:AWS', url: '180865749814.dkr.ecr.us-east-1.amazonaws.com/mypet') {
      sh 'usr/bin/docker push -t 180865749814.dkr.ecr.us-east-1.amazonaws.com/mypet:latest'
      }
      }
      }
      }
    }
