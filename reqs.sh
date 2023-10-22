#!/bin/bash

# Function to check if a package is installed
is_package_installed() {
  if [ -x "$(command -v $1)" ]; then
    echo "$1 is already installed."
    return 0
  else
    echo "$1 is not installed."
    return 1
  fi
}

# Function to install dependencies using the package manager
install_dependencies() {
  if [ -x "$(command -v apt)" ]; then
    sudo apt update
    sudo apt install -y pandoc texlive-xetex
  elif [ -x "$(command -v yum)" ]; then
    sudo yum update
    sudo yum install -y pandoc texlive-xetex
  elif [ -x "$(command -v pacman)" ]; then
    sudo pacman -Syu --noconfirm pandoc texlive-most
  else
    echo "Unsupported package manager. Please install Pandoc and XeLaTeX manually."
    exit 1
  fi
}

# Check for the presence of Pandoc and XeLaTeX
if is_package_installed pandoc && is_package_installed xelatex; then
  echo "Pandoc and XeLaTeX are already installed. No further action needed."
else
  install_dependencies

  echo "Pandoc and XeLaTeX installed successfully."
fi
