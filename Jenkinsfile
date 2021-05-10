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
                sh 'sonar.login.user=admin'
                sh 'sonar.login.password=admin'
                sh 'sonar.projectKey=myproject_new'
                sh 'sonar.projectName=MyProject'
                sh 'sonar.sources=.'
                sh 'sonar.java.binaries=target/classes'
}
    post {
            always {
               mail to: 'vinithashanmugam1998@gmail.com',
                 subject: "mailing",
                 body: "jenkinsfile"
            }
        }
}
