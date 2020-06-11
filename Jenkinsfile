pipeline {
    agent any
    stages { 
        stage('pull code') {
            steps {
                echo 'pull code from git'
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'jenkins-github', url: 'https://github.com/rony889/JenkinsApplication.git']]])
            }
        } 
        stage('build project') {
            steps {
                echo 'build project'
                sh label: '', script: 'mvn clean package'
            }
        }
        stage('publish project') { 
            steps { 
                echo "publish project" 
                deploy adapters: [tomcat8(credentialsId: '06e3a490-d581-433e-b607-0aebfd68e318', path: '', url: 'http://127.0.0.1/8080')], contextPath: null, war: 'target/*war'
            } 
        }        
    }
}