#!/bin/bash

# Check if run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Create a Timeshift snapshot
echo "Creating Timeshift snapshot..."
timeshift --create --comments "Pre-update snapshot" --tags D

# Check the result of the snapshot creation
if [ $? -ne 0 ]; then
  echo "Timeshift snapshot creation failed!"
  exit 1
fi

# Update the system
echo "Updating system..."
pacman -Syu

# Uncomment the following line if you use yay for AUR packages
# yay

# Uncomment the following line if you also want to update development packages with yay
# yay --devel

echo "System update completed!"

