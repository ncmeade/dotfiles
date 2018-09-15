#!/bin/bash

cp tmux/.tmux.conf $HOME/.tmux.conf
cp vim/.vimrc ~/.vimrc
cp git/.gitconfig ~/.gitconfig

cat shell/.bashrc >> $HOME/.bashrc

if [[ -d $HOME/.ipython ]]; then
  cp ipython/ipython_config.py $HOME/.ipython/profile_default/ipython_config.py
fi
