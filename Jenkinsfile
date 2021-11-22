#!groovy

pipeline {
    agent { docker { image 'maven:3.8.4' } }
    stages {
        stage('setup') {
            steps {
                echo 'setup / prerequisites steps'
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
                echo  'Success'
            }
        }
    }
    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }
}