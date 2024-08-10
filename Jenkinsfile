pipeline {
  agent any

  tools {
    maven 'MavenTool'
    jdk 'OracleJDK8'
  }

  environment {
    SETTINGS_XML_ID = 'artifactory_settings_xml'
    CREDENTIALS_ID = 'artifactory_admin_credentials'
    SSH_CREDENTIALS_ID = 'ssh_to_gitlab'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    
    stage('Build and Deploy') {
      steps {
        script {
          withCredentials([usernamePassword(credentialsId: "${CREDENTIALS_ID}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
            configFileProvider([configFile(fileId: "${SETTINGS_XML_ID}", variable: 'SETTINGS_XML_FILE')]) {
              sh """
                mvn clean compile -U --batch-mode -s ${SETTINGS_XML_FILE} -Dmaven.test.skip=true -Dusername=${USERNAME} -Dpassword=${PASSWORD}
                mvn dockerfile:build
              """
            }
          }
        }
      }
    }

    stage('Image') {
      steps {
        script {
          sh 'mvn install'
        }
      }
    }
  }
}
