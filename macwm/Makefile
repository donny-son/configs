#* Installation
# .PHONY: install-yabai
# install-yabai:
# 	brew install koekeishiya/formulae/yabai
# 	sudo yabai --install-sa
# 	sudo yabai --load-sa
# 	brew services start yabai

.PHONY: install-spacebar
install-spacebar:
	brew install cmacrae/formulae/spacebar
	brew services start spacebar

.PHONY: install
install: install-spacebar
	echo "Amethyst Beta(0.16.0) from https://github.com/ianyh/Amethyst/releases"

.PHONY: to-local
to-local:
	echo "COPYING CONFIGS TO THIS MACHINE..."
	cp ./amethyst.yml ~/.amethyst.yml
	cp ./yabairc ~/.yabairc
	cp -r ./spacebar ~/.config
	sudo chmod +x ~/.config/spacebar/spacebarrc
	echo "Finished!"

.PHONY: from-local
from-local:
	echo "COPYING CONFIGS FROM LOCAL MACHINE..."
	cp ~/.amethyst.yml ./amethyst.yml
	cp ~/.yabairc ./yabairc
	cp -r ~/.config/spacebar .
	cp ~/.amethyst.yml ./amethyst.yml
	echo "Finished!"
