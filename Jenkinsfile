pipeline {
    agent any 
    tools {
        nodejs 'node'
    }
    stages {
        stage ("Clean") {
            steps {
                deleteDir()
            }
        }
        stage ("Clone Repo") {
            steps {
                sh "git clone https://github.com/Mahdimidi/jenkins-test.git"
            }
        }
        stage ("Generate Docker image") {
            steps {
                dir ("jenkinstest"){
                    sh "docker build -f dockerfile -t jenkins-test ."        
                }
            }
        }
        stage ("execute docker compose") {
            steps {
                dir ("jenkinstest"){
                    sh "docker compose up -d"        
                }
            }
        }
    }
}
