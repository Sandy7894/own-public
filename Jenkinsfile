pipeline {
  environment {
    registry = "sandeep7894/jfrog"
    registryCredential = 'Sanhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Clone') {
      steps {
        git([url: 'https://github.com/Sandy7894/own-public.git', branch: 'main'])
      }
    }
    stage('Image Build') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('PUSH Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')
          }
        }
      }
    }
 } 
}
