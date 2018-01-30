#!groovy​

node {

  stage ('Checkout') {
    checkout scm
  }

  stage ('Build') {
    sh 'mkdir build'
    dir 'build'
    sh 'cmake -G"MinGW Makefiles" ..'
    sh 'cmake --build .'
  }

  stage ('Tests') {
    junit '*.xml'
  }

}
