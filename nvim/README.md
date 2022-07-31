# My Neovim Config

```
git clone git@github.com:donny-son/nvim-config.git ~/.config/nvim
```

## Dependencies

### System Dependencies

- Live grep for Telescope : `brew install ripgrep`
- NodeJS, Yarn : install from brew and manage versions of node with nvm
- Rust 
- Go

```bash
# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install 17 # after source

# ripgrep
sudo apt install -y ripgrep # for linux
brew install ripgrep # for mac

# yarn
npm i -g yarn

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Go
# install manually from https://go.dev/doc/install
```

### LSP related

Use `nvim-lsp-installer`. This will automatically install lsp servers with a defined configuration.

- dot language server >> `npm i -g dot-language-server`
- dockerfile language server >> `npm i -g dockerfile-language-server-nodejs`
- go >> `go install golang.org/x/tools/gopls@latest`
- diagnostic >> `npm i -g diagnostic-languageserver`
- json, html, css, eslint >> `npm i -g vscode-langservers-extracted`
- R >> `install.packages("languageserver")`
- sqls >> `go install github.com/lighttiger2505/sqls`
- bash >> `npm i -g bash-language-server`
- markdown >> `cargo install prosemd-lsp`
- typescript >> `npm install -g typescript typescript-language-server`
- solidity >> `npm i -g solidity-language-server`
- mac >> `brew install lua-language-server`
- python(pyright) >> `npm i -g pyright`
- [markdown lsp marksman](https://github.com/artempyanykh/marksman/releases)

### Vim Plugin Manager

Install plugin mananger `vim-plug` with the following command.

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### Neovim Installation

For Ubuntu system

```bash
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install neovim -y
```

### Plugins 

Install all plugins by `:PlugInstall` in nvim.

#### Nvim Treesitter

`:TSInstall all`

#### Tabnine

`:CmpTabnineHub`

#### Copilot
`:Copilot setup`

#### Nvim DAP

- Go Delve

```bash
go install github.com/go-delve/delve/cmd/dlv@latest
```

- Python: for each virtual environment

```bash
poetry add --dev debugpy
```
