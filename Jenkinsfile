pipeline { 
    agent any
/* {
 	 label 'docker'
	} */
    tools {
        maven 'Maven 3'
    }
    stages {
        stage('Build') {
            steps { 
               echo 'This is a minimal pipeline.' 
	       sh 'mvn clean package'
/*		script{
			docker.build "my-image:${env.BUILD_ID}"
//			docker.withServer('tcp://127.0.0.1:2375'){
//			docker.build("my-image:${env.BUILD_ID}")
//			}
		}*/
		
            }
        }
	  //stage('Wait for Approval'){
		input {
  message 'Release project for Deployment?'
//}
  
	}
	 stage('Release') {
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
/*	stage('Deploy & Test'){
		agent {
		docker {
		   args "-p 9000:9000  --name 'snapshot' --network='host'"
		   image "${JOB_NAME}:${env.BUILD_ID}"
		}
		}
		steps{
		   script{
			   try{

   echo 'Testing Endpoint'

   sleep(time:10,unit:"SECONDS")
   def get = new URL("http://localhost:9000").openConnection();
   def getRC = get.getResponseCode();
   println(getRC);
   if(getRC.equals(200)) {
     println(get.getInputStream().getText());
   }
   }finally{
    // dockerCmd 'rm -f snapshot'
    	 println(get.getResponseCode());
   }
		   }
		   sh 'curl -v http://localhost:9000'
		}
	}
	stage('Deploy & Test'){
	   agent {
                docker {
			args "-p 9999:9999 -i -t ${JOB_NAME}:${env.BUILD_ID}" 
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
        }*/

    }
}
