#!/bin/zsh
export ZDOTDIR=$HOME/.dotfiles/zsh

setopt EXTENDED_GLOB

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/.zlogin ~/.zlogin

echo "making symlinks"
rcs="tmux gitconfig hgrc screenrc tmux.conf vimrc.bundles.local vimrc.local"
for rcfile in ${=rcs}; do
	ln -s "$HOME/.dotfiles/$rcfile" "$HOME/.$rcfile" 
done
