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
                sh 'mvn sonar:sonar \
  -Dsonar.host.url=http://192.168.1.6:9000 \
  -Dsonar.login=df9fac27233a834065dbf20297399dba3459607b'
            }
        }
}
            
    post {
            always {
               sh 'echo "hello"'
            }
        }
}
