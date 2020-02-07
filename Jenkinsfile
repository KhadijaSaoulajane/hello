pipeline {
environment {
    registry = "khadijasaoulajane/jenkins"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
    agent any
    stages {
    
       stage('Clone Repository') {
        // Get some code from a GitHub repository
        git 'https://github.com/KhadijaSaoulajane/hello.git'
    
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