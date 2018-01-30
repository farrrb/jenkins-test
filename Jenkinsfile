#!groovy​

pipeline {

  // deploy on any agent(s)
  agent any

  // declare stages
  stages {

    stage ('Checkout') {
      checkout scm
    }

    stage ('Build') {
      steps {
        bat 'mkdir build'
        dir 'build'
        bat 'cmake -G\"MinGW Makefiles\" ..'
        bat 'cmake --build .'
      }
    }

    stage ('Tests') {
      steps {
        junit '*.xml'
      }
    }
  }

  // post build process
  post {
    always {
      cleanWs()
    }
  }
}
