#!/bin/bash

if ollama list | grep -q "llama3.2:1b"; then
    kitty -e ollama run llama3.2:1b
elif ollama list | grep -q "llama3.2"; then
    kitty -e ollama run llama3.2
elif ollama list | grep -q "llama3.1"; then
    kitty -e ollama run llama3.1
else
    notify-send "No Llama 3 model found!"
fi

