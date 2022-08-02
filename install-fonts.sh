#!/usr/bin/env sh
OS="$(uname)"
if [[ "$OS" == "Linux" ]] || [[ "$OS" == "Darwin" ]]; then
  if [[ "$OS" == "Linux" ]]; then
    echo "Check for font directory for Linux"
    mkdir -p ~/.local/share/fonts
    (cd ~/.local/share/fonts && curl -fLo "FiraCode Retina Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Retina/complete/Fira%20Code%20Retina%20Nerd%20Font%20Complete%20Mono.ttf)
  fi
  if [[ "$OS" == "Darwin" ]]; then
    echo "Brew tap cask-fonts"
    brew tap homebrew/cask-fonts
    brew install font-fira-code-nerd-font
    echo "Installed 'FiraCode Nerd Font'"
  fi
fi
