pipeline {
    agent any 
    tools {
        nodejs 'nodejs'
    }
    stages {
        stage ("Clean") {
            steps {
                deleteDir()
            }
        }
        stage ("Clone Repo") {
            steps {
                sh "git clone https://github.com/MaBouz/jenkinstest.git"
            }
        }
        stage ("Generate Docker image") {
            steps {
                dir ("jenkinstest"){
                    sh "docker build -f dockerfile -t malbouz/angpipe:1.1.1 ."        
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
