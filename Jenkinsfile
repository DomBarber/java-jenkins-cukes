#!groovy

pipeline {
    agent { docker { image 'maven:3.3.3' } }
    stages {
        stage('setup') {
            steps {
                sh 'echo setup / prerequisites steps'
            }
        }
        stage('build') {
            steps {
                sh 'mvn --version'
                sh 'mvn clean install -DskipTests'
                sh '''
                    echo "Multiline shell steps work too"
                    ls -lah
                '''

            }
        }
        stage('test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('end') {
            steps {
                sh  'echo "Success"'
            }
        }
    }
    post {
        always {
            sh 'echo "This will always run"'
        }
        success {
            sh 'echo "This will run only if successful"'
        }
        failure {
            sh 'echo "This will run only if failed"'
        }
        unstable {
            sh 'echo "This will run only if the run was marked as unstable"'
        }
        changed {
            sh 'echo "This will run only if the state of the Pipeline has changed"'
            sh 'echo "For example, if the Pipeline was previously failing but is now successful"'
        }
    }
}