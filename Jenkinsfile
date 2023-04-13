node {
def mavenHome = tool name: 'maven_3.9.1'
properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '1', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: '']])
echo "build_number is: ${env.BUILD_NUMBER}"
echo "job_name is: ${env.JOB_NAME}"
echo "node_name is: ${env.NODE_NAME}"
stage ('checkoutcode'){
git credentialsId: 'dca17f04-de8f-42e1-8dd7-46f09b74032d', url: 'https://github.com/MallegowdaKM/maven-web-application.git'
}
stage ('build'){
sh "${mavenHome}/bin/mvn clean package"
}
stage ('executesonarQube'){
sh "${mavenHome}/bin/mvn sonar:sonar"
}
stage ('uploadartifactintonexus'){
sh "${mavenHome}/bin/mvn deploy"
}
stage ('deployappintotomcatserver'){
sshagent(['ebc18b3d-5f5e-4886-9ecc-076bd6edddd9']){
sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.47.139:/opt/tomcat9/webapps/"
}
}
}
