# Dotfiles

## Install
```bash
git clone https://github.com/ncmeade/dotfiles.git
cd dotfiles
```

### Git
To setup `git`, copy the configuration file via
```bash
cp git/.gitconfig $HOME/.gitconfig
```

### IPython
To setup `ipython`, copy the configuration file via
```bash
cp ipython/ipython_config.py $HOME/.ipython/profile_default/ipython_config.py
```

### Tmux
To setup `tmux`, copy the configuration file via
```bash
cp tmux/.tmux.conf $HOME/.tmux.conf
```

### Vim
You will first need to install [`vim-plug`](https://github.com/junegunn/vim-plug).
Once `vim-plug` is installed, you can copy the `.vimrc` file to your home directory via
```bash
cp vim/.vimrc $HOME/.vimrc
```
To install plugins, open `vim` and run `:PlugInstall`.
This should download and install all of the plugins listed in the `.vimrc`.

### Zsh
Many of these configuration options were adapted from [Anish Athalye's](https://github.com/anishathalye/dotfiles) dotfiles.
To setup `zsh`, first copy the configuration file via
```bash
cp zsh/.zshrc $HOME/.zshrc
```
Now, copy the `aliases.sh` and `prompt.sh` via
```bash
mkdir -p $HOME/.zsh
cp zsh/aliases.zsh $HOME/.zsh/aliases.zsh
cp zsh/prompt.zsh $HOME/.zsh/prompt.zsh
```
Syntax highlighting for `zsh` can be installed via [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting).
