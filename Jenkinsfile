pipeline { 
    agent docker 
    // parameters {
   //	 string(name: releasedVersion, defaultValue: '')
   // }  
    //def releasedVersion = 1.1
    tools {
        maven 'Maven 3'
    //    docker 'docker'
    }
    stages {
	/*stage('Prepare'){
	   steps {
	     echo 'Checkout SCM'
	     checkout scm
	   }
	} */
        stage('Build') {
	    //agent {dockerfile true} 
	   /* agent {
 		 label 'docker'
	    }*/
            steps { 
               echo 'This is a minimal pipeline.' 
	       sh 'mvn clean package'
	       docker build -t ${JOB_NAME}:SNAPSHOT .
		/*script{
			def snapshotImage = docker.build("${JOB_NAME}:${env.BUILD_ID}")
		}*/
            }
        }
        stage('Release') {
            steps {
               echo 'This is a minimal pipeline.'
          withCredentials([usernamePassword(credentialsId: 'github-cred', passwordVariable: 'password', usernameVariable: 'username')]) {
              sh "git config user.email ghatkar.abhaya@gmail.com && git config user.name Jenkins"
              sh "mvn release:prepare release:perform -Dusername=${username} -Dpassword=${password}"
          }
            }
        }

    }
}
