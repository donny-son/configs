#!/usr/bin/env bash
OS="$(uname)"
if [[ "$OS" == "Darwin" ]] ; then
	brew install koekeishiya/formulae/yabai
	brew install --cask amethyst
	brew install cmacrae/formulae/spacebar
	sudo yabai --install-sa
	sudo yabai --load-sa
	brew services start yabai
	brew services start spacebar
else
    echo "This script is only supported on macOS."
    exit 0
fi
