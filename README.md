# dotfiles

dotfiles that make my life easier. 

Simply clone the repo and symlink each dotfile to ~/ (run from the repo root):

```sh
ln -sv "$PWD/.zshrc" ~
ln -sv "$PWD/.vimrc" ~
```

Note that zsh plugins need to be saved in ~/.zsh/plugins
