#!bin/bash

### Go on jankin server and install docker 
sudo yum install docker 

## enable docker 
systemctl start docker 
systemctl enable docker 

## create group and add docker and jenkins 
sudo groupadd docker 

## add 
sudo usermod -aG docker jenkins 

## restart docker and jenkins 
sudo systemctl restart docker 
sudo systemctl restart jenkins 

