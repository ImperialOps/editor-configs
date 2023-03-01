#!/bin/bash

# WSL open browser
# ~/.scripts/open_browser.sh

# powershell: wsl list
winPath="file://wsl%24/Ubuntu-22.04${1}"

# firefox
#/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe $winPath
# chrome
/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe $winPath
# brave
#/mnt/c/Program\ Files/BraveSoftware/Brave-Browser/Application/brave.exe $winPath
