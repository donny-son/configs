.PHONY: install-zsh
install-zsh:
	curl -fsSL https://raw.githubusercontent.com/donny-son/gh-zsh/main/gh-zsh.sh | bash 

.PHONY: install
install: install-zsh
	bash install-mac-things.sh
	rm -f ${HOME}/.yabairc && ln -s ./macwm/yabairc ${HOME}/.yabairc
	rm -f ${HOME}/.amethyst.yml && ln -s ./macwm/amethyst.yml ${HOME}/.amethyst.yml
	sudo chmod +x ./spacebar/spacebarrc
