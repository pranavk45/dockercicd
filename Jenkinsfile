node {
  // def commit_id
 //  def imagename= "httpd"
   def imageTag = "${env.BUILD_NUMBER}"
   stage('Preparation Checkopt SCM') {
     checkout scm
     sh "git rev-parse --short HEAD > .git/commit-id"                        
     commit_id = readFile('.git/commit-id').trim()
   }

   stage('docker build/push') {
     docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
       def app = docker.build("pranavk45/httpd:${imageTag}", '.').push()
     }
   }
//      stage('test') {
 //      sh 'curl localhost:80'

//   }
  stage('Deploying in k8s') {
  sh 'cat /home/kubhttpd/httpdapp.yml | sed "s/imageTag/$imageTag/g" | kubectl apply -f -'
  sh 'kubectl apply -f /home/kubhttpd/httpdservice.yaml'
}
//        stage('test') {
//      sh 'curl localhost:'
//  }
}
