.PHONY: install-zsh
install-zsh:
	curl -fsSL https://raw.githubusercontent.com/donny-son/gh-zsh/main/gh-zsh.sh | bash 

.PHONY: install-pyenv
install-pyenv:
	curl https://pyenv.run | bash

.PHONY: install-nvm
install-nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

.PHONY: install-rust
install-rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

.PHONY: install-wezterm
install-wezterm:
	curl -LO  https://github.com/wez/wezterm/releases/download/20220624-141144-bd1b7c5d/wezterm-20220624-141144-bd1b7c5d.Ubuntu22.04.deb && sudo apt install -y ./wezterm-20220624-141144-bd1b7c5d.Ubuntu20.04.deb

.PHONY: install-vimplug
install-vimplug:
	sh install-vimplug.sh

.PHONY: install-fonts
install-fonts:
	mkdir -p ~/.local/share/fonts
	cd ~/.local/share/fonts && curl -fLo "FiraCode Retina Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Retina/complete/Fira%20Code%20Retina%20Nerd%20Font%20Complete%20Mono.ttf

.PHONY: install
install: install-pyenv install-nvm install-rust install-zsh 
	bash install-mac-things.sh

