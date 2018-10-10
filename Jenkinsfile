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
               echo 'This is a minimal pipeline.'
               sh 'mvn clean package'
               docker.build("${JOB_NAME}:${env.BUILD_ID}")

            }
        }
        
        stage('Perform Test'){

            steps{
                script{
                    sh 'echo ojsdoa' 
                }
                
            }
        
        }
         stage('Release') {
        
                when {
                expression { params.RELEASE }
            }
            steps {
                //script{
                   // withMaven(maven: 'Maven 3'){
                        withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'password', usernameVariable: 'username')]){
                             sh "git config user.email ecsdigitalpune@gmail.com && git config user.name Jenkins"
                             sh "mvn release:prepare release:perform -Dusername=${username} -Dpassword=${password}"
                        }
                 //       }
                //}
                
            }
             }
        stage('Push image and Artifact Releases to Artifactory') {
            steps{
                script{
                     // Create an Artifactory server instance:
                     def server = Artifactory.server('abhaya-docker-artifactory')
                     def uploadSpec = """{
                      "files": [{
                          "pattern": "**/*.jar",
                           "target": "ext-release-local/"
                        }]
                       }"""
                    server.upload(uploadSpec)

                    // Create an Artifactory Docker instance. The instance stores the Artifactory credentials and the Docker daemon host address:
                    def rtDocker = Artifactory.docker server: server, host: "tcp://localhost:2375"

                    // Push a docker image to Artifactory (here we're pushing hello-world:latest). The push method also expects
                    // Artifactory repository name (<target-artifactory-repository>).
                    def buildInfo = rtDocker.push "digitaldemo-docker-release-images.jfrog.io/sparktodo-${JOB_NAME}:${releasedVersion}", 'docker-release-images'

                    //Publish the build-info to Artifactory:
                    server.publishBuildInfo buildInfo
                }
            }
        }
    }
}
