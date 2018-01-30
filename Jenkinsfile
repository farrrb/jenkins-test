#!groovy​

pipeline {

  // deploy on any agent(s)
  agent any

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
        dir('build') {
          bat 'cmake -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Debug ..'
          bat 'cmake --build .'
        }
      }
    }

    // Tests: xml junit reports
    stage ('Tests') {
      steps {
        dir ('build/test')
        {
          bat 'test1.exe > test_out.txt'
          bat 'ruby ../../externals/Unity/auto/parse_output.rb -xml test_out.txt'
          junit '*.xml'
        }
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
