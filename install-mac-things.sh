#!/usr/bin/env bash
OS="$(uname)"
if [[ "$OS" == "Darwin" ]] ; then
	sudo brew update && sudo brew upgrade
	brew install koekeishiya/formulae/yabai
	brew install --cask amethyst
	brew install cmacrae/formulae/spacebar
	brew install ripgrep
	brew install --HEAD neovim
	sudo yabai --install-sa
	sudo yabai --load-sa
	brew services start yabai
	brew services start spacebar
	rm -f ${HOME}/.yabairc && ln -s ./macwm/yabairc ${HOME}/.yabairc
	rm -f ${HOME}/.amethyst.yml && ln -s ./macwm/amethyst.yml ${HOME}/.amethyst.yml
	sudo chmod +x ./spacebar/spacebarrc
else
    echo "This script is only supported on macOS."
    exit 0
fi
