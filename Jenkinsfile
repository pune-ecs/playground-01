pipeline { 
    agent {
 	 label 'docker'
	} 
    tools {
        maven 'Maven 3'
    }
    stages {
        stage('Build') {
            steps { 
               echo 'This is a minimal pipeline.' 
	       sh 'mvn clean package'
		script{
			def snapshotImage = docker.build("${JOB_NAME}:${env.BUILD_ID}")
		}
            }
        }
	stage('Deploy & Test'){
	   agent {
                docker {
			args "-p 9999:9999 -t ${JOB_NAME}:${env.BUILD_ID}" 
			image "${JOB_NAME}:${env.BUILD_ID}" 
			//label "${JOB_NAME}:${env.BUILD_ID}"
		}
            }
            steps {
                sh 'echo version'
            }
	}	
        stage('Release') {
            steps {
               echo 'This is a minimal pipeline.'
          withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'password', usernameVariable: 'username')]) {
              sh "git config user.email ecsdigitalpune@gmail.com && git config user.name Jenkins"
              sh "mvn release:prepare release:perform -Dusername=${username} -Dpassword=${password}"
          }
            }
        }

    }
}
