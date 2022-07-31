.PHONY: install-zsh
install-zsh:
	curl -fsSL https://raw.githubusercontent.com/donny-son/gh-zsh/main/gh-zsh.sh | bash
	echo "source ${HOME}/.config/zshconf/zsh_base" >> ${HOME}/.zshrc
	p10k configure

.PHONY: install-alacritty
install-alacritty:
	sudo add-apt-repository ppa:aslatter/ppa
	sudo apt update && apt upgrade
	sudo apt install -y alacritty

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

.PHONY: install-mac
install-mac: install-yabai install-spacebar install-zsh

.PHONY: install
install:
	echo "COPYING CONFIGS TO THIS MACHINE..."
	ln -s ./macwm/amethyst.yml ${HOME}/.amethyst.yml
	ln -s ./macwm/yabairc ${HOME}/.yabairc
	sudo chmod +x ./spacebar/spacebarrc
	echo "Finished!"
