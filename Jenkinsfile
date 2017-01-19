node {
  VERSION="1.2.1-SNAPSHOT"
  PROJECT_NAME="basecomposition"

  if (env.UPDATE != null) {
      stage 'git'
      git 'https://github.com/glytoucan/WurcsToBaseCompositionBatch.git'

      stage 'docker rm'
      sh 'docker-compose -f docker-compose.prod.yml rm -f'

      stage 'docker pull'
      sh 'PROJECT_NAME=' + PROJECT_NAME + ' VERSION=' + VERSION + ' docker-compose -f docker-compose.prod.yml pull'
  }

  stage 'run batch'
  sh 'echo PROJECT_FILE=' + PROJECT_NAME + ' PROJECT_NAME=' + PROJECT_NAME + ' VERSION=' + VERSION + ' docker-compose -f docker-compose.prod.yml up --remove-orphans'
  sh 'PROJECT_FILE=' + PROJECT_NAME + ' PROJECT_NAME=' + PROJECT_NAME + ' VERSION=' + VERSION + ' docker-compose -f docker-compose.prod.yml up --remove-orphans'

  stage 'rm batch'
  sh 'echo PROJECT_NAME=' + PROJECT_NAME + ' VERSION=' + VERSION + ' docker-compose -f docker-compose.prod.yml rm -f --all'
  sh 'PROJECT_NAME=' + PROJECT_NAME + ' VERSION=' + VERSION + ' docker-compose -f docker-compose.prod.yml rm -f --all'

  stage 'rm dangling volumes'
  sh 'VERSION=' + VERSION + ' docker volume ls -qf dangling=true | xargs -r docker volume rm'
}