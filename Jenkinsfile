pipeline { 
    agent any  
    stages {
	stage('Prepare'){
	   steps {
	     echo 'Checkout SCM'
	     checkout	
	   }
	} 
        stage('Build') { 
            steps { 
               echo 'This is a minimal pipeline.' 
	       sh 'mvn clean package'
            }
        }
    }
}
