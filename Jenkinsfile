pipeline { 
    agent any
     parameters {
   	 string(name: VERSION, defaultValue: '')
    }  
    def releasedVersion = 1.1
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
        stage('Release') {
            steps {
               echo 'This is a minimal pipeline.'
          withCredentials([usernamePassword(credentialsId: 'github-cred', passwordVariable: 'password', usernameVariable: 'username')]) {
              sh "git config user.email test@digitaldemo-docker-release-images.jfrog.io.com && git config user.name Jenkins"
              sh "mvn release:prepare release:perform -Dusername=${username} -Dpassword=${password}"
          }
            }
        }

    }
}
