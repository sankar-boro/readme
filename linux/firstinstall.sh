#!/bin/bash

# Exit on errors
set -e

# Update and upgrade the system
sudo apt update -y && sudo apt upgrade -y

# Function to check if a package is installed
is_installed() {
    dpkg -l | grep -qw "$1"
}

# Install essential tools
ESSENTIAL_PACKAGES=(
    build-essential \
    curl \
    wget \
    git \
    vim \
    unzip \
    net-tools \
    nginx \
    software-properties-common \
    libxml2-dev libncurses5-dev libsqlite3-dev uuid-dev libjansson-dev libssl-dev
)

sudo apt install -y build-essential wget curl 

for package in "${ESSENTIAL_PACKAGES[@]}"; do
    if ! is_installed "$package"; then
        sudo apt install -y "$package"
    else
        echo "$package is already installed. Skipping."
    fi
done

# Install programming languages and package managers
# Node.js and npm
if ! is_installed "nodejs"; then
    # installs nvm (Node Version Manager)
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

    # download and install Node.js (you may need to restart the terminal)
    nvm install 18

    # verifies the right Node.js version is in the environment
    node -v # should print `v18.20.5`

    # verifies the right npm version is in the environment
    npm -v # should print `10.8.2`

    # verifies the right nvm version is in the environment
    nvm -v # should print `0.40.1`
else
    echo "Node.js is already installed. Skipping."
fi

# Python and pip
if ! is_installed "python3"; then
    sudo apt install -y python3 python3-pip
else
    echo "Python3 and pip are already installed. Skipping."
fi

# Rust
if ! command -v rustc &> /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source $HOME/.cargo/env
else
    echo "Rust is already installed. Skipping."
fi

# Docker
if ! is_installed "docker-ce"; then
    sudo apt install -y apt-transport-https ca-certificates gnupg
    sudo mkdir -m 0755 -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update -y
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
else
    echo "Docker is already installed. Skipping."
fi

# Verify Docker installation
sudo docker --version

# PostgreSQL
if ! is_installed "postgresql"; then
    sudo apt install -y postgresql postgresql-contrib
else
    echo "PostgreSQL is already installed. Skipping."
fi

# MySQL
if ! is_installed "mysql-server"; then
    sudo apt install -y mysql-server
else
    echo "MySQL server is already installed. Skipping."
fi

# Optional: Install other tools
OPTIONAL_PACKAGES=(
    htop \
    tmux \
    neofetch
)
for package in "${OPTIONAL_PACKAGES[@]}"; do
    if ! is_installed "$package"; then
        sudo apt install -y "$package"
    else
        echo "$package is already installed. Skipping."
    fi
done

# Clean up
sudo apt autoremove -y
sudo apt autoclean -y

# Final message
echo "All packages have been installed successfully! Please reboot if necessary."
