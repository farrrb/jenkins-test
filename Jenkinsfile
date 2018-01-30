#!groovy​

pipeline {

  // deploy on any agent(s)
  agent any

  tools {
    tool name: 'cmake', type: 'hudson.plugins.cmake.CmakeTool'
  }

  // declare stages
  stages {

    // Checkout: git clone ...
    stage ('Checkout') {
      steps {
        checkout scm
      }
    }

    // Build: call cmake & stuff
    stage ('Build') {
      steps {
        bat 'mkdir build'
        dir 'build'
        bat 'cmake -G "MinGW Makefiles" ..'
        bat 'cmake --build .'
      }
    }

    // Tests: xml junit reports
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
