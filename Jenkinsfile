pipeline {
    
    agent any 
    
    
    
    stages {
        
        
        stage('Clone'){
            
            steps {
                
                git credentialsId: 'id_gitlab', url: 'https://repo-dev.efi-academy.com/houcem/myapp_j2e_g14.git'
                
                
            }
            
        }


        stage("SonarQube analysis") {
            
            steps {
              withSonarQubeEnv('sonar-server') {
                sh 'mvn clean package sonar:sonar'
              }
            }
          }
          stage("Quality Gate") {
            steps {
              timeout(time: 1, unit: 'HOURS') {
                waitForQualityGate abortPipeline: true
              }
            }
          }
        

                
        stage('Build') {
            
            steps {
                
            withEnv(["JAVA_HOME=${ tool 'java' }", "PATH+MAVEN=${tool 'maven'}/bin:${env.JAVA_HOME}/bin"]) {
     
                sh 'mvn clean install package'
                  }
            }
            
            
        }

  
                 
        
        stage('deploy'){
            
            steps{
                
                deploy adapters: [tomcat9(credentialsId: 'id_tomcat', path: '', url: 'http://172.16.14.10:8080')], contextPath: null, war: '**/*.war'
            }
            
        }
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
}