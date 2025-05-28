#!/bin/bash

chmod +x ~/.config/install/scripts/install-complete.sh
if command -v spicetify >/dev/null 2>&1; then
  echo "Installation has completed! Please reboot your system. To install the Catppuccin Mocha theme for Spotify/Spicetify, locate ~/.config/scripts/spicetify.sh and execute the script."
else
  echo "Installation has completed! Reboot your system."
fi