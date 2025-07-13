pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
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

        stage('Transfer WAR') {
            steps {
                sh 'scp -o StrictHostKeyChecking=no target/myapp-g15.war root@192.168.122.11:/tmp/'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                ssh root@192.168.122.11 << EOF
                mv /tmp/myapp-g15.war /opt/tomcat/webapps/
                EOF
                '''
            }
        }

    }
}
