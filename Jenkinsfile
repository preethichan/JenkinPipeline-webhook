pipeline {
    agent any

    triggers {
        githubPush()
    }

    environment {
        RECIPIENT_EMAIL = 'cpreethi31@gmail.com'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out source code from GitHub..."
                checkout scm
            }
        }
        stage('Prepare') {
            steps {
                echo "Setting execute permission on script..."
                sh 'chmod +x hello.sh'
            }
        }
        stage('Run Script') {
            steps {
                echo "Executing hello.sh..."
                sh './hello.sh'
            }
        }
    }

    post {
        success {
            emailext(
                to: "${env.RECIPIENT_EMAIL}",
                subject: "✅ Jenkins Build #${env.BUILD_NUMBER} — SUCCESS [${env.JOB_NAME}]",
                body: """
Build Result   : SUCCESS
Job Name       : ${env.JOB_NAME}
Build Number   : ${env.BUILD_NUMBER}
Git Branch     : ${env.GIT_BRANCH}
Git Commit     : ${env.GIT_COMMIT}
Build URL      : ${env.BUILD_URL}
Console Output : ${env.BUILD_URL}console

All stages completed successfully.
"""
            )
        }
        failure {
            emailext(
                to: "${env.RECIPIENT_EMAIL}",
                subject: "❌ Jenkins Build #${env.BUILD_NUMBER} — FAILED [${env.JOB_NAME}]",
                body: """
Build Result   : FAILED
Job Name       : ${env.JOB_NAME}
Build Number   : ${env.BUILD_NUMBER}
Git Branch     : ${env.GIT_BRANCH}
Git Commit     : ${env.GIT_COMMIT}
Build URL      : ${env.BUILD_URL}
Console Output : ${env.BUILD_URL}console

One or more stages failed. Check the console output for details.
"""
            )
        }
        always {
            echo "Pipeline finished with status: ${currentBuild.currentResult}"
        }
    }
}
