#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
sudo apt-get install python3-pip -y && sudo pip3 install pyyaml
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get -o Dpkg::Options::="--force-confnew" install --force-yes -y docker-ce="${DOCKER_VERSION}"

curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

docker version

docker-compose version
