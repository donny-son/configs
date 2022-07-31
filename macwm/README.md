# Window Managing For macOS

A Linux-style tiling window management configuration that works for me in macOS environments.

1. Tiling Window Manager: Amethyst

Note that Amethyst must be 0.16.0 version since prior versions do not support configuration file.

https://github.com/ianyh/Amethyst/releases

**Installation and Configuration**

```bash
brew install --cask amethyst
cp ./amethyst.yml ~/.amethyst.yml
```

2. Active Window Borderline: Yabai

https://github.com/koekeishiya/yabai/releases

**Installation and Configuration**

```bash
brew install koekeishiya/formulae/yabai
# install the scripting addition
sudo yabai --install-sa

# if macOS Big Sur or Monterey, load the scripting addition manually; follow instructions below to automate on startup
sudo yabai --load-sa

# start yabai
brew services start yabai
cp ./yabairc ~/.yabairc
```

Note that Yabai is a tiling window manager. Using Amethyst because I'm too lazy to do the System Integrity Protection setting configuration for macOS.

3. Bottom statusbar for visualizing workspace information: Spacebar

https://github.com/cmacrae/spacebar/releases

**Installation and Configuration**

```bash
brew install cmacrae/formulae/spacebar
brew services start spacebar
cp ./spacebar ~/.config/spacebar
```

## Installation

1. `make to-local` to copy remote settings to local system.
2. `make from-local` to copy local settings to this repository.
