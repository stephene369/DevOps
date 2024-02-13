#!bin/bash

#################### ON AWS EC2 linux 
sudo yum update -y

sudo yum install -y epel-release
sudo yum install -y ansible

ansible — version

sudo nano /etc/ansible/hosts


### on ubuntu 

sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible


# simple way
sudo yum ansible 
sudo yum install git 

###################### Install ansible from repository ################################

## install 
sudo yum install ansible  

## check ansible version 
ansible --version 

############################ installation using python #################################3
## Update system 
sudo dnf update

## Check if pip dans python is installed 
pip --version
pip3 --version
python3 --version 

## install python3 and pip 
sudo dnf install python3.11
sudo dnf install python3-pip ## or sudo dnf install  python3.11-pip

## check if pip is installed 
pip --verison 

## intall ansible using pip 
pip install ansible

## check ansible version ]
ansible --verison 


####################### best installation from python command  ###########################

## install python3 and pip 
sudo dnf install python3.11
sudo dnf install python3-pip ## or sudo dnf install  python3.11-pip

## installation 
python3 -m pip install --user ansible

## You can install the minimal ansible-core package for the current user:
python3 -m pip install --user ansible-core

## Alternately, you can install a specific version of ansible-core:
python3 -m pip install --user ansible-core==2.12.3

## Upgrading Ansible
## To upgrade an existing Ansible installation in this Python environment to the latest released version, simply add --upgrade to the command above:
python3 -m pip install --upgrade --user ansible











