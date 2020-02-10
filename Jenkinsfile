pipeline {
environment {
    registry = "khadijasaoulajane/jenkins"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
    agent any
    stages {
    
   
stage('Cloning Git') {
  steps {
    git 'https://github.com/KhadijaSaoulajane/hello.git'
  }
}
        stage ('Checking java version') {
            steps {
                    sh 'java -version'
            }
        }
        stage ('maven version') {
            steps {               
                    sh 'mvn -version'                
            }
        }
        stage ('build app test') {
            steps {               
                    sh 'mvn clean install'                                    
            }
        }

	stage('SonarQube Analysis'){
	     def mvnHome = tool name: 'maven-3.6.1', type: 'maven'
	     withSonarQubeEnv('sonar'){
		sh "${mvnHome}/bin/mvn sonar:sonar"
}
}
        
       
       stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
       
          
    }
}