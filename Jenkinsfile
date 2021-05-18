pipeline {

  agent any

  stages {
  
    stage('Pull Java Microservice code') {

      steps{
	        checkout([
	            $class: 'GitSCM',
	            branches: [[name: '*/master']],
	            doGenerateSubmoduleConfigurations: false,
	            extensions: [ [$class: 'CleanCheckout'] ],
	            submoduleCfg: [],
	            userRemoteConfigs: [[ url: 'https://github.com/brijeshdevops/java-microservices.git', credentialsId: 'github-devops' ]]
	        ])
       }
    }

    stage('Code Clean/Install') {

      steps{
		    sh "mvn clean install -DskipTests"
       }
    }

    stage('Run Test') {

      steps{
		    sh "mvn test"
       }
    }

    
    stage('Code Build') {

      steps{
		    sh "mvn package -DskipTests"
       }
    }

 

  }

}
