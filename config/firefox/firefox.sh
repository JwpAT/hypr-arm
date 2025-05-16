#!/bin/bash

# Copying profiles.ini to firefox 
echo "copying profiles.ini"
cp ~/hypr/config/firefox/profiles.ini ~/.mozilla/firefox/
cp ~/hypr/config/firefox/installs.ini ~/.mozilla/firefox/

# Configuring Firefox for Open WebUI
echo "Configuring Firefox profile for Open WebUI..."
firefox -CreateProfile "ai /home/$USER/.mozilla/firefox/ai"
mkdir -p ~/.mozilla/firefox/ai
cp -r ~/hypr/config/Open-WebUI/chrome ~/.mozilla/firefox/ai/
cp -r ~/hypr/config/Open-WebUI/applications ~/.local/share/
echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >> ~/.mozilla/firefox/ai/user.js

# Configuring Main Firefox Profile
echo "✔️ Configuring main Firefox profile..."
firefox -CreateProfile "default /home/$USER/.mozilla/firefox/default"
mkdir -p ~/.mozilla/firefox/default
cp -r ~/hypr/config/firefox/chrome ~/.mozilla/firefox/default/
echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >> ~/.mozilla/firefox/default/user.js

echo "Firefox has been configured"
sleep 2
