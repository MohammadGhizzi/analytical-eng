#!/bin/bash

# Update package list and upgrade all packages
sudo apt update -y
sudo apt upgrade -y

# Install Docker
sudo apt install -y docker.io

# Add user to Docker group
sudo usermod -aG docker ubuntu

# Install Docker Compose v2
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
docker compose version

# Download and run Airbyte
wget https://s3.amazonaws.com/weclouddata/data/data/run-ab-platform.sh
chmod +x run-ab-platform.sh
./run-ab-platform.sh -b

# Print completion message
echo "Airbyte installation and setup complete."
