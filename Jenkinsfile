pipeline {
    
    agent any
    tools{
        maven 'MAVEN_HOME'
    }
    stages {
        
        stage('Checkout') {
            steps {
             sh 'git clone '
            }
        }
        
        stage ('Build') {
            steps {
                sh 'mvn clean install -f credit/pom.xml'
            }
        }
        stage ('Code Quality') {
            steps {
                withSonarQubeEnv('scan') {
                sh 'mvn sonar:sonar -f credit/pom.xml'
                }
            }
        }
        stage ('Building image') {
           steps {
           sh 'cd credit \n docker build -t credit . '
              sh 'docker tag credit localhost:8085/optima/credit:${BUILD_NUMBER}'
              sh 'docker images'
              sh 'docker login -u admin -p admin123 localhost:8085'
              sh 'docker push localhost:8085/optima/credit:${BUILD_NUMBER}'
             
        }
    }
    stage ('Nexus Pull') {
        steps {
            sh 'docker pull localhost:8085/optima/credit:${BUILD_NUMBER}'
        }
    }
}
}
