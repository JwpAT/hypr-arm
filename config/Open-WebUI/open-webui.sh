#!/bin/bash

#Install Ollama
curl -fsSL https://ollama.com/install.sh | sh

#Installing Docker
sudo pacman -S docker
sleep 2
echo "starting Docker"
sudo systemctl start docker.service
sleep 2
echo "enabling Docker"
sudo systemctl enable docker.service
sleep 2
echo "creating user"
sudo usermod -aG docker $USER
sleep 2 
echo "creating new group"
newgrp docker
sleep 3
sudo docker run hello-world

#Installing Open WebUI
docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main

echo "your WebUI should be available at http://localhost:8080"

#Configuring Firefox for Open Webui
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




