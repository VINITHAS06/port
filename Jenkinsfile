pipeline {
    
    agent any
    tools{
        maven 'MAVEN_HOME'
    }
    stages {
        
        stage('Checkout') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '2341d34b-9d78-4a02-a757-107f64f5d8a2', url: 'https://github.com/immersive-induction/credit-service.git']]])
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
