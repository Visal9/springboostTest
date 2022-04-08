pipeline {

agent any


stages {
    stage("build"){
        //we can use this for get credential in step level
           steps {
          echo "this is testing" 
          withCredentials ([
              usernamePassword(credentialsId:'TEST_CRED',usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')

          ]) {
               echo "this is testing $USERNAME" 
              
          }

           
        }
    }
stage('env') {
        // Jenkins provides no environment variable view
        sh 'printenv|sort'
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

