pipeline {

agent any
    environment{
    Server_Credential = credentials('TEST_CRED')
    }

stages {
    stage("build"){
        //we can use this for get credential in step level
           steps {
          echo "this is testing" 
          withCredentials ([
              usernamePassword(credentialsId:'TEST_CRED',usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')

          ]) {
               echo "this is testing $USERNAME" 
               echo "this is from env variable $Server_Credential_USR"
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

