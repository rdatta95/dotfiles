#!/bin/bash

# bash
ln -fv "$(pwd)/dotfiles/.bashrc" "${HOME}/.bashrc"
ln -fv "$(pwd)/dotfiles/.bash_prompt" "${HOME}/.bash_prompt"

# vim
ln -fv "$(pwd)/dotfiles/.vimrc" "${HOME}/.vimrc"

# tmux
ln -fv "$(pwd)/dotfiles/.tmux.conf" "${HOME}/.tmux.conf"
ln -fv "$(pwd)/dotfiles/.tmux.conf.style" "${HOME}/.tmux.conf.style"
ln -fv "$(pwd)/dotfiles/runtmux.sh" "${HOME}/runtmux.sh"

# git
ln -fv "$(pwd)/dotfiles/.gitconfig" "${HOME}/.gitconfig"
