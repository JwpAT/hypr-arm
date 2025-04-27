#!/bin/bash

# Check if a model is already installed, if so, skip the installation prompt
installed_model=$(ollama list)

if [ -z "$installed_model" ]; then
    # If no model is installed, ask the user to download and install the Ollama script
    download_choice=$(GTK_THEME=Catppuccin-Mocha-Standard-Blue-Dark zenity --question --title="Download Install Script" --text="Do you want to download and run the install script for Ollama?" --ok-label="Yes" --cancel-label="No")

    if [ $? -eq 0 ]; then
        # User chose to download and install, open a terminal to show progress
        kitty -e bash -c "echo 'Downloading and installing Ollama...'; curl -fsSL https://ollama.com/install.sh | sh; echo 'Installation completed! Press Enter to continue.'; read"
    else
        echo "Install script not downloaded."
    fi
else
    echo "A model is already installed. Running the model now..."
fi

# Now check for available models and run the installed one
if ollama list | grep -q "llama3.2:1b"; then
    kitty -e ollama run llama3.2:1b
elif ollama list | grep -q "llama3.2"; then
    kitty -e ollama run llama3.2
elif ollama list | grep -q "llama3.1"; then
    kitty -e ollama run llama3.1
else
    # No model installed, so allow the user to choose one.
    chosen=$(GTK_THEME=Catppuccin-Mocha-Standard-Blue-Dark zenity --list --title="Install Llama Model" --text="Choose a model to install:" \
        --column="Model" "llama3.2:1b" "llama3.2" "llama3.1")

    if [ -n "$chosen" ]; then
        kitty -e ollama run "$chosen"
    else
        notify-send "No model selected, canceled."
    fi
fi

