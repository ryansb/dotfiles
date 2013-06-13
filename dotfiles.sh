#!/bin/zsh
export ZDOTDIR=$HOME/.dotfiles/zsh
git clone --recursive Documents/dotfiles .dotfiles
echo "Getting zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "Getting spf13"
sh <(curl http://j.mp/spf13-vim3 -L)

echo "making symlinks"
rcs="tmux.conf tmux gitconfig zpreztorc zshrc zlogin vimrc.local vimrc.bundles.local"
for rcfile in ${=rcs}; do
	ln -s "$HOME/.dotfiles/$rcfile" "$HOME/.$rcfile" 
done
