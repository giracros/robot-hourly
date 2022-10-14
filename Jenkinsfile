pipeline {    
agent any

  stages {    

    stage('Prepare Docker') {
      steps {
        sh '''
          which docker
          curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
          chmod +x /usr/bin/docker-compose
          which docker-compose
        '''
      }
    }

    stage('Docker-compose build') {
      steps {
        sh '''
          docker-compose build
        '''
      }
    }

    stage('Run tests') {
      steps {
        sh '''
        docker-compose --env-file ./config/.env.test up
        '''
      }
    }

  stage('Results') {

  steps {
    echo 'Testing...'
    script {
      step(
        [
          $class                    : 'RobotPublisher',
          outputPath                : '.',
          outputFileName            : "reports/output.xml",
          reportFileName            : "reports/report.html",
          logFileName               : "reports/log.html",
          disableArchiveOutput      : false,
          passThreshold             : 80,
          unstableThreshold         : 80,
          otherFiles                : "reports/*.png"
        ]
      )
    }  
  }
}
  }
}