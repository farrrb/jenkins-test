node {

  stage ('Checkout') {
    checkout scm
  }

  stage ('Tests')
  {
    junit '*.xml'
  }

}
