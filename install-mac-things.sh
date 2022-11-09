#!/usr/bin/env bash
OS="$(uname)"
if [[ "$OS" == "Darwin" ]] ; then
	sudo brew update && sudo brew upgrade
	brew install koekeishiya/formulae/yabai --HEAD
	brew install cmacrae/formulae/spacebar
	brew install ripgrep
	brew install --HEAD neovim
$ brew tap wez/wezterm
$ brew install --cask wez/wezterm/wezterm
	brew install koekeishiya/formulae/skhd
	brew services start yabai
	brew services start spacebar
	brew services start skhd
	sudo chmod +x ./spacebar/spacebarrc
	sudo chmod +x ./yabai/yabairc
	sudo chmod +x ./skhd/skhdrc
else
    echo "This script is only supported on macOS."
    exit 0
fi
