.PHONY: install
install: to-local alacritty
	echo "source ${HOME}/.config/zshconf/zsh_base" >> ${HOME}/.zshrc

.PHONY: alacritty
alacritty:
	sudo add-apt-repository ppa:aslatter/ppa
	sudo apt update && apt upgrade
	sudo apt install -y alacritty


#* Installation
.PHONY: install-yabai
install-yabai:
	brew install koekeishiya/formulae/yabai
	sudo yabai --install-sa
	sudo yabai --load-sa
	brew services start yabai

.PHONY: install-spacebar
install-spacebar:
	brew install cmacrae/formulae/spacebar
	brew services start spacebar

.PHONY: to-local
to-local:
	echo "COPYING CONFIGS TO THIS MACHINE..."
	ln -si ./macwm/amethyst.yml ${HOME}/.amethyst.yml
	ln -si ./macwm/yabairc ${HOME}/.yabairc
	sudo chmod +x ./spacebar/spacebarrc
	echo "Finished!"

