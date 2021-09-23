
#!/bin/bash

set -x

#git config --global core.editor "vim"
#touch ~/gotmydots.txt
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip -d 
mkdir .ngrok2
touch .ngrok2/ngrok.yml



source .bash_profile
source .zshrc

if [[ -d "/workspaces/github" ]]; then
  export IS_GH_GH=true
  cd "/workspaces/github"
  bin/setup-codespaces
fi
