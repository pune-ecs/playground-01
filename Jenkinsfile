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
			 def server = Artifactory.server('abhaya-docker-artifactory')
			  def uploadSpec = """{	
			     "files": [
			       {
		           "pattern": "**/*.jar",
		             "target": "ext-snapshot-local/"
             			}
              			]
               			}"""
 server.upload(uploadSpec)

  // Create an Artifactory Docker instance. The instance stores the Artifactory credentials and the Docker daemon host address:
  def rtDocker = Artifactory.docker server: server, host: "tcp://localhost:2375"

  // Push a docker image to Artifactory (here we're pushing hello-world:latest). The push method also expects
  // Artifactory repository name (<target-artifactory-repository>).
  def buildInfo = rtDocker.push "digitaldemo-docker-snapshot-images.jfrog.io/sparktodo-${JOB_NAME}:SNAPSHOT", 'docker-snapshot-images'

  //Publish the build-info to Artifactory:
  server.publishBuildInfo buildInfo
		}
		
            }
        }
/*	stage('Deploy & Test'){
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
        }*/

    }
}
