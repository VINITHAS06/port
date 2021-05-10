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
  -Dsonar.host.url=http://192.168.1.8:9000 \
  -Dsonar.login=caf5dea626dc607061e5aa89e971adb321df2f77'
            }
        }
}
            
    post {
            always {
               mail to: 'vinithashanmugam1998@gmail.com',
                 subject: "mailing",
                 body: "jenkinsfile"
            }
        }
}
