#!/bin/bash

# Configuring Firefox for Open WebUI
echo "✔️ Configuring Firefox profile for Open WebUI..."
firefox -CreateProfile "openwebui /home/$USER/.mozilla/firefox/openwebui"
cp -r ~/hypr/config/Open-WebUI/chrome ~/.mozilla/firefox/openwebui/
cp -r ~/hypr/config/Open-WebUI/applications ~/.local/share/
echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >> ~/.mozilla/firefox/openwebui/user.js

# Configuring Main Firefox Profile
echo "✔️ Configuring main Firefox profile..."
firefox -CreateProfile "default /home/$USER/.mozilla/firefox/default"
cp -r ~/hypr/config/firefox/chrome ~/.mozilla/firefox/default/
echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >> ~/.mozilla/firefox/default/user.js

echo "✅ Firefox has been configured"
sleep 2
