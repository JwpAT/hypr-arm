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
firefox -CreateProfile "openwebui /home/$USER/.mozilla/firefox/openwebui"
cp -r ~hypr/config/Open-WebUI/chrome ~/.mozilla/firefox/openwebui/
cp -r ~hypr/config/Open-WebUI/applications ~/.local/share/
echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >> ~/.mozilla/firefox/openwebui/user.js

echo "✔️ Setup complete. Please reboot or log out and back in for Docker group changes to take effect."
