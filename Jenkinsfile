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
                sh 'mvn sonar:sonar -Dsonar.host.url=http://5fb116fc5d7a.ngrok.io'
            }
        }
        stage ('nexus') {
            steps {
                sh 'mvn deploy'
            }
        }
}
            
    post {
            always {
               sh 'echo "hello"'
            }
        }
}
