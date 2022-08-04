#!/usr/bin/env bash
OS="$(uname)"
if [[ "$OS" == "Darwin" ]] ; then
	sudo brew tap wez/wezterm
	sudo brew update && sudo brew upgrade
	brew install koekeishiya/formulae/yabai
	brew install --cask amethyst
	brew install cmacrae/formulae/spacebar
	brew install ripgrep
	brew install --HEAD neovim
	brew install --cask wez/wezterm/wezterm-nightly
	brew install koekeishiya/formulae/skhd
	sudo yabai --install-sa
	sudo yabai --load-sa
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
