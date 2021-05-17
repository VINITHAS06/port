pipeline {
    agent any
    tools{
        maven 'MAVEN_HOME'
    }
    stages {
        
        stage('Checkout') {
            steps {
             sh 'rm -rf port'
             sh 'git clone https://github.com/VINITHAS06/port.git'
            }
        }
        
        stage ('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage ('sonar') {
            steps {
                sh 'mvn sonar:sonar -Dsonar.host.url=http://3bb83a6af102.ngrok.io'
            }
        }
}
            
    post {
            always {
               sh 'echo "hello"'
            }
        }
}
