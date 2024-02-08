#!bin/bash 

# installation 
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

############################## create user ansible on the ubuntu instance ############
## add user 
sudo adduser ansible

## grant user 
sudo usermod -aG sudo ansible 

## to connect to the user 
su - ansible

### write this on /etc/ansible/hosts 
"
ec2-1 ansible_host=13.38.228.126
ec2-2 ansible_host=51.44.19.17
"
"try to connect to the instances and create user inside each of them 
and create user name ansible on each instance  
Exemple 
--------- 
if it is linux ec2 instance use 
sudo useradd <user-name>

To remove the user use 
sudo userdel -r <user name>

" 
