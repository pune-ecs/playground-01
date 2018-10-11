pipeline {
   agent any
   tools {
        maven 'Maven 3'
        jdk 'jdk8'
    }
    parameters {
        booleanParam(name: "RELEASE",
                description: "Build a release from current commit.",
                defaultValue: false)
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
               sh 'mvn clean package'
                script{
                  def snap_image =  docker.build("digitaldemo-docker-snapshot-images.jfrog.io/${JOB_NAME}:SNAPSHOT")
                }

            }
        }

        stage('Perform Test'){
  

        }
         stage('Release') {
          
          }
        stage('Push image and Artifact Releases to Artifactory') {
	    
        }
       stage('Deploy'){
	   
    }
    post {
    success {
      slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
    }
     failure{
  	slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
  	}
	}
}
def getReleasedVersion() {
    return (readFile('pom.xml') =~ '<version>(.+)-SNAPSHOT</version>')[0][1]
}
