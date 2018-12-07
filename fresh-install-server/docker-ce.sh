#!/bin/bash

## If you're running this on a cloud (AWS / Azure / GCP etc.) you'll need to relog
## for the permissions to apply to your account, meaning you won't be able to run
## containers because your user won't have the privileges to do so until it logs back in.

echo "running update"
sudo apt-get update
echo "installing dependencies"
sudo apt-get -y -q install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
echo "adding the docker key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "adding the docker fingerprint"
sudo apt-key fingerprint 0EBFCD88
echo "adding the docker repository"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
echo "running update"
sudo apt-get update
echo "installing docker-ce"
sudo apt-get -y install docker-ce
echo "adding group: docker"
sudo groupadd docker
echo "adding current user to group docker"
username="$(whoami)"
sudo usermod -aG docker $username
echo "running test container"
docker run --rm hello-world
echo "docker has been successfully installed"

# the following installs docker compose (newest as of this writing)

echo "installing docker-compose"
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.22.0/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.23.0-rc1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
