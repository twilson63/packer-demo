#!/bin/bash

# Update package lists
sudo apt update

# Install prerequisites for adding new repositories
sudo apt install -y software-properties-common

# Add Python 3.8 repository (for older Ubuntu versions like 18.04)
sudo add-apt-repository -y ppa:deadsnakes/ppa

# Install Python 3.8
sudo apt update
sudo apt install -y python3.8 python3.8-venv python3.8-dev

# Install python-apt for Python 3.8
sudo apt install -y python3-apt

# Install pip for Python 3.8
sudo apt install -y python3-pip

# Verify installations
echo "Python version: $(python3.8 --version)"

echo "Installation completed."
