pipeline { 
    agent any  
    stages {
	stage('Prepare'){
	   steps {
	     echo 'Checkout SCM'
	     checkout scm
	   }
	} 
        stage('Build') { 
            steps { 
               echo 'This is a minimal pipeline.' 
	       sh 'mvn clean package'
            }
        }
        stage('Build') {
            steps {
               echo 'This is a minimal pipeline.'
		releasedVersion = 1.1
          withCredentials([usernamePassword(credentialsId: 'github-cred', passwordVariable: 'password', usernameVariable: 'username')]) {
              sh "git config user.email test@digitaldemo-docker-release-images.jfrog.io.com && git config user.name Jenkins"
              sh "mvn release:prepare release:perform -Dusername=${username} -Dpassword=${password}"
          }
            }
        }

    }
}
