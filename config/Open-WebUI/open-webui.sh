#!/bin/bash

# Install Ollama
curl -fsSL https://ollama.com/install.sh | sh

# Installing Docker
sudo pacman -S --noconfirm docker
sleep 2
echo "✔️ Starting Docker..."
sudo systemctl start docker.service
sleep 2
echo "✔️ Enabling Docker to start at boot..."
sudo systemctl enable docker.service
sleep 2
echo "✔️ Adding current user to 'docker' group..."
sudo usermod -aG docker $USER
sleep 2
echo "⚠️ You must log out and log back in (or run 'newgrp docker') to apply the group change."
echo "Skipping Docker test until group membership is active."
sleep 3

# Installing Open WebUI
echo "✔️ Installing Open WebUI..."
docker run -d --network=host -v open-webui:/app/backend/data \
  -e OLLAMA_BASE_URL=http://127.0.0.1:11434 \
  --name open-webui --restart always ghcr.io/open-webui/open-webui:main

echo "✔️ Your WebUI should be available at http://localhost:8080"

# Configuring Firefox for Open WebUI
echo "✔️ Configuring Firefox profile for Open WebUI..."
cp -r ~/hypr/config/Open-WebUI/openwebui ~/.mozilla/firefox/
sudo cp ~/hypr/config/Open-WebUI/open-webui.desktop /usr/share/applications/

# Define the profile section
profile_section='
[Profile3]
Name=openwebui
IsRelative=1
Path=openwebui
Default=1
'

# Path to the Firefox profiles.ini file
profiles_ini="$HOME/.mozilla/firefox/profiles.ini"

# Check if the section already exists
if ! grep -q "\[Profile3\]" "$profiles_ini"; then
    echo "$profile_section" >> "$profiles_ini"
    echo "✔️ Profile3 added to profiles.ini"
else
    echo "⚠️ Profile3 already exists. No changes made."
fi

echo "✔️ Setup complete. Please reboot or log out and back in for Docker group changes to take effect."




