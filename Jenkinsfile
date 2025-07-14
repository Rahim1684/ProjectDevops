pipeline {
    agent any
    stages {
        stage('clone') {
            steps {
                //git credentialsId: 'id_github', url: 'https://github.com/Rahim1684/ProjectDevops.git'
               checkout scm 
            }
        }
        stage('Build') {
            steps {
                withMaven(globalMavenSettingsConfig: '', jdk: '', maven: 'maven', mavenSettingsConfig: '', traceability: true) {
                 sh 'mvn clean install package'
                }
               
                
            }
        }
        stage('Deploy') {
            steps {
                sh'scp -o StrictHostKeyChecking=no *.war root@192.168.20.178:/opt/tomcat/webapps'
            }
        }
    }
}
