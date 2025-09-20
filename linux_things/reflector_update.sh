#!/bin/bash

# Script to update the Arch Linux mirrorlist using reflector

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (e.g., sudo $0)"
  exit 1
fi

echo "Updating mirrorlist with the 20 latest fastest mirrors..."

# Run reflector
reflector --latest 20 --sort rate --save /etc/pacman.d/mirrorlist

if [ $? -eq 0 ]; then
  echo "Mirrorlist updated successfully!"
else
  echo "Failed to update mirrorlist."
fi
