#!groovy​

node {

  agent any

  stage ('Checkout') {
    checkout scm
  }

  stage ('Build') {
    bat 'mkdir build'
    dir 'build'
    bat 'cmake -G\"MinGW Makefiles\" ..'
    bat 'cmake --build .'
  }

  stage ('Tests') {
    junit '*.xml'
  }

  post {
    always {
        cleanWs()
    }
  }

}
