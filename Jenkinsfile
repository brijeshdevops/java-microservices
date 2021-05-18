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

    stage('Continuous Code Quality using Sonarqube')
    {
       steps{
                withSonarQubeEnv( 'SonarQube8x' )  //( credentialsId: 'sonarpass', installationName: 'SonarQube8x')
                {
                    sh "mvn sonar:sonar -Dsonar.login=admin -Dsonar.password=admin -Dsonar.host.url=http://sonar.dcdevtesting.com"
                }
       }
    }

    stage("Quality Gate") {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                    waitForQualityGate abortPipeline: true
                }
            }
    }

    stage('Code Build') {

      steps{
		    sh "mvn package -DskipTests"
       }
    }

    stage('Generate & Push Docker Images to Docker Registry') {

      steps{
		    sh "mvn clean package install -P buildDocker -s mvnsettings.xml -DskipTests -Dsettings.security=mvnsettings-security.xml"
       }
    }

    stage('Pull Terraform AWS Infrastructure code for EKS Cluster') {

      steps{
	        checkout([
	            $class: 'GitSCM',
	            branches: [[name: '*/master']],
	            doGenerateSubmoduleConfigurations: false,
	            extensions: [ [$class: 'CleanCheckout'] ],
	            submoduleCfg: [],
	            userRemoteConfigs: [[ url: 'https://github.com/brijeshdevops/terraform-eks-cluster.git', credentialsId: 'github-devops' ]]
	        ])
       }
    }

    stage('Terraform Init') {

      steps{
               sh "chmod +x terraform-provider-kubectl"
               sh "rm terraform-provider-kubectl.exe"
               sh "terraform init"
       }
    }

    stage('Terraform Apply') {

      steps{
		       sh "terraform apply --auto-approve"
       }
    }

    stage('Pull Terraform / Kuberenetes code for common') {

      steps{
	        checkout([
	            $class: 'GitSCM',
	            branches: [[name: '*/master']],
	            doGenerateSubmoduleConfigurations: false,
	            extensions: [ [$class: 'CleanCheckout'] ],
	            submoduleCfg: [],
	            userRemoteConfigs: [[ url: 'https://github.com/brijeshdevops/terrform-k8-core.git', credentialsId: 'github-devops' ]]
	        ])
       }
    }

    stage('Terraform Init (k8 common)') {

      steps{
               sh "chmod +x terraform-provider-kubectl"
               sh "rm terraform-provider-kubectl.exe"
               sh "terraform init"
       }
    }

    stage('Terraform Apply (k8 common)') {

      steps{
		       sh "terraform apply --auto-approve"
       }
    }

    stage('Pull Terraform / Kuberenetes code for Java Microservices') {

      steps{
	        checkout([
	            $class: 'GitSCM',
	            branches: [[name: '*/master']],
	            doGenerateSubmoduleConfigurations: false,
	            extensions: [ [$class: 'CleanCheckout'] ],
	            submoduleCfg: [],
	            userRemoteConfigs: [[ url: 'https://github.com/brijeshdevops/terrform-k8-java-ms.git', credentialsId: 'github-devops' ]]
	        ])
       }
    }

    stage('Terraform Init (k8 Java MS)') {

      steps{
               sh "chmod +x terraform-provider-kubectl"
               sh "rm terraform-provider-kubectl.exe"
               sh "terraform init"
       }
    }

    stage('Terraform Apply (k8 Java MS)') {

      steps{
		       sh "terraform apply --auto-approve"
       }
    }



  }

}
