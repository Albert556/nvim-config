# neovim config

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## dependency

* pynvim
```sh 
python3 -m pip install pynvim
```

* npm

```sh
brew install npm
npm install -g neovim
```

* lazygit

```sh
brew install lazygit
```


* neoformat
```sh 
npm install -g clang-format
npm install -g @taplo/cli
npm install -g prettier
npm install -g lua-fmt
rustup component add rustfmt
go install -v golang.org/x/tools/gopls@latest
```

* telescope
```sh 
brew install fd
brew install ripgrep
```

### cmp

* go

```sh 
go install -v github.com/go-delve/delve/cmd/dlv@latest
```
