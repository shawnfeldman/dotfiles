#!/bin/bash

set -ex

# Figure out the absolute path of the dotfiles directory
DOTFILESDIRREL="$(dirname "$0")"
cd $DOTFILESDIRREL
DOTFILESDIR="$(pwd -P)"

ln -sf "$DOTFILESDIR" "$HOME/.dotfiles"
cat "$DOTFILESDIR/.zshrc" >> "$HOME/.zshrc"

if [[ -d "/workspaces/github" ]]; then
  export IS_GH_GH=true
  cd "/workspaces/github"
  bin/setup-codespaces
fi