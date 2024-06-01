#!/bin/bash

# Update package list and upgrade all packages
sudo apt update -y
sudo apt upgrade -y

# Install Docker
sudo apt install -y docker.io

# Add user to Docker group
sudo usermod -aG docker ubuntu

# Pull the Metabase docker image
docker pull metabase/metabase:latest

# Run the Metabase docker container
docker run -d -p 3000:3000 --name metabase metabase/metabase

# Print completion message
echo "Metabase installation and setup complete."
echo "You can access Metabase at http://<Public_IP>:3000"
