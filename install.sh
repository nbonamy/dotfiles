#!/bin/bash
echo Installing dotfiles
for i in .bashrc .bash_profile .bash_prompt .functions .aliases .exports .vim .vimrc .claude
do
	if [ -f ~/$i ]; then
		rm ~/$i
	fi
	ln -sf ~/dotfiles/$i ~
done

echo Installing config files
mkdir -p ~/.config
mkdir -p ~/.config/ghostty
ln -sf ~/dotfiles/ghostty-config ~/.config/ghostty/config
