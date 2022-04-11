pipeline {

agent any
    environment{
    Server_Credential = credentials('TEST_CRED')
    registry = "cloud.canister.io:5000/ima/springboot-test"
    registryCredential = 'DOCKER_REGISTERY'
    dckerImage =''
    }
    
    //tools { 
     //#   maven 'maven' 
    //#}
    

stages {
    stage("testing"){
        //we can use this for get credential in step level
           steps {
          echo "this is testing" 
          withCredentials ([
              usernamePassword(credentialsId:'TEST_CRED',usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')

          ]) {
               echo "this is testing $USERNAME" 
               echo "this is from env variable $Server_Credential_USR"
              sh 'who'
          }
           
               
        }
    }
    
    
    
      stage("build"){
    
         withMaven(
        // Maven installation declared in the Jenkins "Global Tool Configuration"
        maven: 'maven-3', // (1)
        // Use `$WORKSPACE/.repository` for local repository folder to avoid shared repositories
        mavenLocalRepo: '.repository', // (2)
        // Maven settings.xml file defined with the Jenkins Config File Provider Plugin
        // We recommend to define Maven settings.xml globally at the folder level using
        // navigating to the folder configuration in the section "Pipeline Maven Configuration / Override global Maven configuration"
        // or globally to the entire master navigating to  "Manage Jenkins / Global Tools Configuration"
        mavenSettingsConfig: 'my-maven-settings' // (3)
    ) {

      // Run the maven build
      sh "mvn clean verify"

    } // 
    }
    
    
    
    stage('Building image') {
        steps{
            script {
            dockerImage = docker.build imagename
            }
       }
    }
stage('env') {
        // Jenkins provides no environment variable view
    steps{
        sh 'printenv|sort'
    }
    }

   
}


post {
    always {
        echo "this execte only fails"
    }

    success {
        echo "this execute only if command success"
    }
}
}

