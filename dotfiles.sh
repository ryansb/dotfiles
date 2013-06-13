#!/bin/zsh
export ZDOTDIR=$HOME/.dotfiles/zsh
git clone --recursive Documents/dotfiles .dotfiles
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
