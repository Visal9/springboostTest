pipeline {

agent any


stages {
    stage("build"){
        //we can use this for get credential in step level
           steps {
          echo "this is testing" 
          withCredentials ([
              usernamePassword(credentialsId:'TEST_CRED', usernameVariable: 'User', passwordVariable: 'PWD')

          ]) {
               echo "this is testing $User" 
              
          }

           
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

