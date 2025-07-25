#!/bin/sh
# One-liner Outline installer for OpenWRT
# Downloads, makes executable, and optionally runs the install script

echo "Downloading Outline installer..."
wget -q https://raw.githubusercontent.com/Rushan4eg/openwrt-quick-outline/main/install_outline.sh -O ./install_outline.sh

if [ $? -eq 0 ]; then
    chmod +x ./install_outline.sh
    echo "Script downloaded successfully to ./install_outline.sh"
    
    # Fix for piped execution: read from /dev/tty instead of stdin
    if [ -t 0 ]; then
        # Running interactively
        read -p "Would you like to run the Outline installer now? (y/n): " RUN_NOW
    else
        # Being piped, read from terminal directly
        echo "Would you like to run the Outline installer now? (y/n): "
        read RUN_NOW < /dev/tty
    fi
    
    if [ "$RUN_NOW" = "y" ] || [ "$RUN_NOW" = "Y" ]; then
        echo "Running installer..."
        ./install_outline.sh
    else
        echo "Script is ready. You can run it later with: ./install_outline.sh"
    fi
else
    echo "Error: Failed to download the script"
    exit 1
fi
