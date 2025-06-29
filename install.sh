#!/usr/bin/env bash
# Sacred Forge Install Script

set -e

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing dependencies..."
sudo apt install -y python3 python3-pip git

echo "Installation conmplete."
