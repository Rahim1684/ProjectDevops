pipeline {
    agent any 
    
    stages {
        
        stage("clone"){
            steps{
                
                git credentialsId: 'id_gitlab', url: 'https://repo-dev.efi-academy.com/houcem/myapp-j2e-g13.git'
                
            }
            
        }
        
        stage('build'){
            steps{
                 withEnv(["JAVA_HOME=${ tool 'java' }", "PATH+MAVEN=${tool 'maven'}/bin:${env.JAVA_HOME}/bin"]) {
              
               sh 'mvn clean install package '
             }
            }
        }
        
        stage("Deploy"){
            steps{
                
                deploy adapters: [tomcat9(credentialsId: 'id_tomcat', path: '', url: 'http://172.16.11.10:8080')], contextPath: null, war: '**/*.war'
                
            }
            
            
            
        }
        
     
    }
    
   
}