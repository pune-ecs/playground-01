pipeline {
    agent any
   tools { 
        maven 'Maven 3' 
        jdk 'jdk8' 
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                ''' 
            }
        }

        stage('Build') {
            steps {
               echo 'This is a minimal pipeline.'
               sh 'mvn clean package'

            }
        }
         stage('Release') {
             input {
                  message 'Release project for Deployment?'
        }

                steps{

                script{
             withMaven(maven: 'Maven 3') {
          //releasedVersion = getReleasedVersion()
          withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'password', usernameVariable: 'username')]) {
              sh "git config user.email ecsdigitalpune@gmail.com && git config user.name Jenkins"
              sh "mvn release:prepare release:perform -Dusername=${username} -Dpassword=${password}"
          }
          //docker "build --tag digitaldemo-docker-release-images.jfrog.io/sparktodo-${JOB_NAME}:${releasedVersion} ."
      }
  }}}

    }
}

