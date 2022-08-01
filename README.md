# Collection of my config files

## Shell(ZSH)

```bash
mv ~/.config ~/.config.backup
git clone git@github.com:donny-son/configs.git ~/.config
mv ~/.config.backup/* ~/.config
```

After `make install-zsh`, configure powerline 10k theme with `p10k configure`.

## NVIM Configuration

Install `vim-plug`:

```bash
make install-vimplug
```

Install node 17 with nvm after `make install`.
```bash
nvm install 17
nvm use 17
```

Install yarn.
```bash
npm i -g yarn
```

Install plugins with `:PlugInstall`, `:TSInstall all`, `:CmpTabnineHub`, `:Copilot setup`.

### Go Dev Environment

After installing Go, install delve for debugging.

```bash
go install github.com/go-delve/delve/cmd/dlv@latest
```

### Python Dev Environment

Install Poetry and add `debugpy` as a dev dependency for each virtual environment.
```bash
poetry add --dev debugpy
```
