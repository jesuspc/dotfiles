### Vim

Via Neovim. Once extracted link neovim config to vim config by running:

```bash
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
```

Follow the installation instructions for [vim-instant-markdown](https://github.com/suan/vim-instant-markdown)

### External Dependencies

* [Zsh](https://github.com/robbyrussell/oh-my-zsh)
* [iTerm2 (nightly)](https://iterm2.com/downloads/nightly)
* [Base16 Shell](https://github.com/chriskempson/base16-shell)
* [The Silver Seracher](https://github.com/ggreer/the_silver_searcher)

