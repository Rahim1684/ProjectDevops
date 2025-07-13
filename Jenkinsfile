pipeline {
    agent any
    
    stages {
        
        stage('Clone'){
            steps{
                //git credentialsId: 'id_gitlab', url: 'https://repo-dev.efi-academy.com/bah/myapp-j2e-g15'
                checkout scm
            }
        }
        
        stage('Build'){
            steps{
                 
               // withMaven(globalMavenSettingsConfig: '', jdk: 'java', maven: 'maven', mavenSettingsConfig: '', traceability: true) 

                withMaven(globalMavenSettingsConfig: '', jdk: '', maven: 'maven', mavenSettingsConfig: '', traceability: true){
                        sh 'mvn clean install package'
                    }
            }
        }

        stage('Deploy') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'tomcat-auth', path: '', url: 'http://192.168.122.11:8080')], contextPath: null, war: '**/*.war'
            }
        }
  

    }
}