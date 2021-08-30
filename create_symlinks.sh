#!/bin/bash

# bash
ln -sfv `pwd`/dotfiles/.bashrc ~/.bashrc
ln -sfv `pwd`/dotfiles/.bash_prompt ~/.bash_prompt

# vim
ln -sfv `pwd`/dotfiles/.vimrc ~/.vimrc

# tmux
ln -sfv `pwd`/dotfiles/.tmux.conf ~/.tmux.conf