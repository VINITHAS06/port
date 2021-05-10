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
}
    post {
            always {
               mail to: 'vinitha.92@wipro.com',
                 subject: "mailing",
                 body: "jenkinsfile"
            }
        }
}
