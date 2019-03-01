pipeline {
    agent any
    stages {
        stage("Compile") {
            steps {
                 sh "./gradlew clean"
                 sh "./gradlew compileJava"
            }
        }
        stage("Unit test") {
            steps {
                sh "./gradlew test"
            }
        }
        stage("Code coverage") {
            steps {
                sh "./gradlew jacocoTestReport"
                publishHTML (target: [
                    reportDir: 'build/reports/jacoco/test/html',
                    reportFiles: 'index.html',
                    reportName: "JaCoCo Report"
                ])
                sh "./gradlew jacocoTestCoverageVerification"
            }
        }
        stage("Static code analysis") {
            steps {
                sh "./gradlew checkstyleMain"
                publishHTML (target: [
                   reportDir: 'build/reports/checkstyle/',
                   reportFiles: 'main.html',
                   reportName: "Checkstyle Report" ])
            }
        }
        stage("Package") {
            steps {
                sh "./gradlew build"
            }
        }

        stage("Docker build") {
            steps {
                sh "docker build -t 192.168.4.6:5000/calculator ."
            }
        }

        stage("Docker push") {
            steps {
                sh "docker push 192.168.4.6:5000/calculator"
            }
        }

        stage("Deploy to staging") {
            steps {
                sh "docker-compose up -d"
            }
        }

        stage("Acceptance test") {
            steps {
                sh "chmod +x ./acceptance/acceptance_test.sh"
                sh "./acceptance/acceptance_test.sh"
            }
        }
    }
    post {
        always {
            sh "docker-compose down"
        }
    }
}