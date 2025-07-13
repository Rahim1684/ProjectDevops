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
                // withEnv(["JAVA_HOME=${ tool 'java' }", "PATH+MAVEN=${tool 'maven'}/bin:${env.JAVA_HOME}/bin"]) {}
                 
                withMaven(globalMavenSettingsConfig: '', jdk: 'java', maven: 'maven', mavenSettingsConfig: '', traceability: true) {
                    sh 'mvn clean install package'
                }
            }
        }

        stage('Deploy') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'id_tomcat', path: '', url: 'http://172.16.15.60:8080')], contextPath: null, war: '**/*.war'
            }
        }


    }
}