
## INstall 
sudo yum install docker 

## config
sudo docker login -u='username' -p='pasword'

## Write in Dockerfile  

## build 
sudo docker build -t <username>/<name> .

## run 
sudo docker run -p 8080:8080 -d <username>/<name>
