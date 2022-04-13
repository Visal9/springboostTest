pipeline {
agent any
    environment{
    //Server_Credential = credentials('TEST_CRED')
    registry = "gcr.io"
       tag ="gcr.io/poetic-sentinel-343407/springboost"
    //    registry = "cloud.canister.io:5000/ima/springboot-test"
    registryCredential = "MY First PRoject"
    dckerImage =''
    }
    tools { 
        maven 'maven' 
    }
    
    
stages {
    stage("testing"){
        //we can use this for get credential in step level
           steps {
          echo "this is testing" 
         // withCredentials ([
           //   usernamePassword(credentialsId:'TEST_CRED',usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')
      //    ]) {
            //   echo "this is testing $USERNAME" 
           //    echo "this is from env variable $Server_Credential_USR"
           //   sh 'who'
        //  }

echo "testing"
               sh "who"
        }
    }
    
    
    
      stage("build"){
    
           steps {
               
         sh 'mvn clean package -Dcheckstyle.skip'
           
        }
    }
    
    
    
    stage('Building image') {
        steps{
            script {
            dockerImage = docker.build tag
            }
       }
    }
    
    
    stage('Deploy our image') {
steps{
script {
    docker.withRegistry( registry, 'gcr:MY First PRoject' ) {
app.push("${env.BUILD_NUMBER}")
    app.push("latest")
}
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
