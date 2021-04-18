pipeline {
  environment {
    registry = "sandeep7894/harbor-dbs"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent {label 'docker-slave'}
  stages {
    stage('Clone') {
      steps {
        git([url: 'https://github.com/Sandy7894/own-public.git', branch: 'main', credentialsId: 'ismailyenigul-github-user-token'])

      }
    }
    stage('Image Build') {
      steps{
        script {
		  sh "cd own-plublic"
		  sh "docker build -t testim ."
		  sh "docker images"
          dockerImage = testim + ":$BUILD_NUMBER"
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
