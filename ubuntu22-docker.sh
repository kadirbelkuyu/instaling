#!/bin/bash

function docker-install {
    sudo apt update

    sudo apt install apt-transport-https ca-certificates curl software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    sudo apt update
    
    apt-cache policy docker-ce
    
    sudo apt install docker-ce
    
    sudo groupadd docker
    
    sudo usermod -aG docker ${USER}  
    
    sudo su - ${USER}
    
    sudo usermod -aG docker ${USER}  
    
    sudo systemctl enable docker && sudo systemctl start docker
    
    mkdir -p ~/.docker/cli-plugins/
    
    curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
    
    chmod +x ~/.docker/cli-plugins/docker-compose

    # Create Docker daemon.json file
    sudo mkdir -p /etc/docker

    # Restart Docker service to apply new settings
    sudo systemctl restart docker
}

docker-install
